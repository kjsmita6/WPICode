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
    return 0;
}

ssize_t create() {
    return 0;
}

bool wremove(size_t inumber) {
    return false;
}

ssize_t stat(size_t inumber) {
    return 0;
}

ssize_t wfsread(size_t inumber, char *data, size_t length, size_t offset) {
    return 0;
}

ssize_t wfswrite(size_t inumber, char *data, size_t length, size_t offset) {
    return 0;
}
