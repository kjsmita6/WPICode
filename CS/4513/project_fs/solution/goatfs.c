// Goat File System Implementation
#include "goatfs.h"

void debug() {
    int i;
    int j;
    int k;
    int l;
    SuperBlock *sb = (SuperBlock *)malloc(BLOCK_SIZE);
    wread(0, (char *)sb);

    printf("SuperBlock:\n    %s\n    %d blocks\n    %d inode blocks\n    %d inodes\n", sb->MagicNumber == MAGIC_NUMBER ? "magic number is valid" : "magic number is not valid", sb->Blocks, sb->InodeBlocks, sb->Inodes);

    for (i = 1; i < sb->InodeBlocks + 1; i++) {
        Block *blk = (Block *)malloc(BLOCK_SIZE);
        wread(i, blk->Data);
        for (j = 0; j < INODES_PER_BLOCK; j++) {
            Inode in = blk->Inodes[j];
            if (in.Valid) {
                printf("Inode %d:\n    size: %u bytes\n    direct blocks:", j, in.Size);
                for (k = 0; k < POINTERS_PER_INODE; k++) {
                    if (in.Direct[k] == 0) {
                        break;
                    }
                    printf(" %d", in.Direct[k]);
                }
                printf("\n");
                if (in.Indirect) {
                    printf("    indirect block: %d\n", in.Indirect);
                    Block *indirect = (Block *)malloc(BLOCK_SIZE);
                    wread(in.Indirect, indirect->Data);
                    printf("    indirect data blocks:");
                    for (l = 0; l < POINTERS_PER_BLOCK; l++) {
                        if (indirect->Pointers[l] == 0) {
                            break;
                        }
                        printf(" %d", indirect->Pointers[l]);
                    }
                    printf("\n");
                }
            }
        }
    }
//    printf("%lu disk block reads\n%lu disk block writes\n", _disk->Reads, _disk->Writes);
}

bool format() {
    if (_disk->Mounts > 0) {
        return false;
    } else {
        SuperBlock *sp = (SuperBlock *)malloc(BLOCK_SIZE);
        sp->MagicNumber = MAGIC_NUMBER;
        sp->Blocks = _disk->Blocks;
        sp->InodeBlocks = ceil(sp->Blocks / 10.0);
        sp->Inodes = sp->InodeBlocks * INODES_PER_BLOCK;
        wwrite(0, (char *)sp);
        int i;
        for (i = 1; i < sp->InodeBlocks + 1; i++) {
            Inode *in = (Inode *)malloc(sizeof(Inode));
            in->Valid = 0;
            wwrite(i, (char *)in);
        }
        for (i = sp->InodeBlocks + 1; i < sp->Blocks; i++) {
            char *data = (char *)malloc(BLOCK_SIZE);
            wwrite(i, data);
        }
        return true;
    }
}

int mount() {
    if (_disk->Mounts > 0) {
        return !SUCCESS_GOOD_MOUNT;
    }
    SuperBlock *sp = (SuperBlock *)malloc(BLOCK_SIZE);
    wread(0, (char *)sp);
    if (sp->MagicNumber != MAGIC_NUMBER) {
        return ERR_BAD_MAGIC_NUMBER;
    }
    if (sp->InodeBlocks * INODES_PER_BLOCK != sp->Inodes) {
        return !SUCCESS_GOOD_MOUNT;

    }
    if (sp->Blocks != _disk->Blocks) {
        return !SUCCESS_GOOD_MOUNT;
    }
    int i;
    int j;
    free_bmp = (char *)malloc(sp->Blocks * sizeof(char));
    for (i = 1; i < sp->InodeBlocks + 1; i++) {
        Block *blk = (Block *)malloc(BLOCK_SIZE);
        wread(i, blk->Data);
        for (j = 0; j < INODES_PER_BLOCK; j++) {
            Inode in = blk->Inodes[j];
            if (in.Valid) {
                int k;
                for (k = 0; k < POINTERS_PER_INODE; k++) {
                    unsigned int direct = in.Direct[k];
                    if (direct) {
                        free_bmp[direct] = 1;
                    } else {
                        free_bmp[direct] = 0;
                    }
                }
                if (in.Indirect) {
                    free_bmp[in.Indirect] = 1;
                }
            }
        }
    }
    _disk->Mounts++;
    return SUCCESS_GOOD_MOUNT;
}

ssize_t create() {
    if (_disk->Mounts < 1) {
        return -1;
    }
    SuperBlock *sp = (SuperBlock *)malloc(BLOCK_SIZE);
    wread(0, (char *)sp);
    int i;
    int j;
    for (i = 1; i < sp->InodeBlocks + 1; i++) {
        Block *blk = (Block *)malloc(BLOCK_SIZE);
        wread(1, blk->Data);
        for (j = 0; j < INODES_PER_BLOCK; j++) {
            Inode in = blk->Inodes[j];
            if (!in.Valid) {
                in.Valid = 1;
                in.Size = 0;
                in.Direct[0] = 0;
                in.Direct[1] = 0;
                in.Direct[2] = 0;
                in.Direct[3] = 0;
                in.Direct[4] = 0;
                in.Indirect = 0;
                blk->Inodes[j] = in;
                wwrite(i, (char *)blk);
                return j;
            }
        }
    }
    return -1;
}

bool wremove(size_t inumber) {
    if (_disk->Mounts < 1) {
        return false;
    }
    int block_num = inumber / INODES_PER_BLOCK;
    Block *blk = (Block *)malloc(BLOCK_SIZE);
    wread(block_num + 1, blk->Data);
    int inum = inumber % INODES_PER_BLOCK;
    Inode in = blk->Inodes[inum];
    if (!in.Valid) {
        return false;
    }
    int i;
    for (i = 0; i < POINTERS_PER_INODE; i++) {
        free_bmp[in.Direct[i]] = 1;
        in.Direct[i] = 0;
    }
    if (in.Indirect != 0) {
        free_bmp[in.Indirect] = 1;
        in.Indirect = 0;
    }
    in.Size = 0;
    in.Valid = 0;
    blk->Inodes[inum] = in;
    wwrite(block_num + 1, blk->Data);
    return true;
}

ssize_t stat(size_t inumber) {
    if (_disk->Mounts < 1) {
        return -1;
    }
    int block_num = inumber / INODES_PER_BLOCK;
    Block *blk = (Block *)malloc(BLOCK_SIZE);
    wread(block_num + 1, blk->Data);
    int inum = inumber % INODES_PER_BLOCK;
    Inode in = blk->Inodes[inum];
    if (!in.Valid) {
        return -1;
    }
    return in.Size;
}

ssize_t wfsread(size_t inumber, char *data, size_t length, size_t offset) {
    return 0;
}

ssize_t wfswrite(size_t inumber, char *data, size_t length, size_t offset) {
    return 0;
}
