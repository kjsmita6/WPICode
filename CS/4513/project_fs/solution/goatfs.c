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
    free_bmp[0] = 0;
    for (i = 1; i < sp->InodeBlocks + 1; i++) {
        Block *blk = (Block *)malloc(BLOCK_SIZE);
        wread(i, blk->Data);
        for (j = 0; j < INODES_PER_BLOCK; j++) {
            Inode in = blk->Inodes[j];
            if (in.Valid) {
                int k;
                for (k = 0; k < POINTERS_PER_INODE; k++) {
                    int direct = in.Direct[k];
                    if (direct) {
                        free_bmp[direct] = 1;
                    } else {
                        free_bmp[direct] = 0;
                    }
                }

                if (in.Indirect) {
                    //Block *indirect = (Block *)malloc(BLOCK_SIZE);
                    //wread(in.Indirect, indirect->Data);
                    free_bmp[in.Indirect] = 1;
                    //int k;
                    //for (k = 0; k < POINTERS_PER_INODE; k++) {
                    //    free_bmp[indirect->Pointers[k]] = 0;
                    //}
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
        Block *blk1 = (Block *)malloc(BLOCK_SIZE);
        wread(in.Indirect, blk1->Data);
        for (i = 0; i < POINTERS_PER_BLOCK; i++) {
            if (blk1->Pointers[i] != 0) {
                free_bmp[blk1->Pointers[i]] = 1;
                blk1->Pointers[i] = 0;
            }
        }
        wwrite(in.Indirect, blk1->Data);
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
    if (_disk->Mounts < 1) {
        return -1;
    }

    ssize_t bytes = 0;
    int block_num = inumber / INODES_PER_BLOCK;
    Block *blk = (Block *)malloc(BLOCK_SIZE);
    wread(block_num + 1, blk->Data);
    int inum = inumber % INODES_PER_BLOCK;
    Inode in = blk->Inodes[inum];
    if (!in.Valid) {
        return -1;
    }

    length = min(length, in.Size - offset);
    Block *indirect = (Block *)malloc(BLOCK_SIZE);
    if (in.Indirect) {
        wread(in.Indirect, indirect->Data);
    }

    int block_idx = offset / BLOCK_SIZE;
    while (bytes < length) {
        if (block_idx < POINTERS_PER_INODE) {
            block_num = in.Direct[block_idx];
        } else {
            block_num = indirect->Pointers[block_idx - POINTERS_PER_INODE];
        }
        if (block_num < 1) {
            return -1;
        }

        blk = (Block *)realloc(blk, BLOCK_SIZE);
        wread(block_num, blk->Data);

        size_t _offset = 0;
        size_t _length = min(length - bytes, BLOCK_SIZE);
        if (bytes == 0) {
            _offset = offset % BLOCK_SIZE;
            _length = min(length, BLOCK_SIZE - _offset);
        }

        memcpy(&data[bytes], &blk->Data[_offset], _length);
        bytes += _length;
        block_idx++;
    }
    return bytes;
}

ssize_t wfswrite(size_t inumber, char *data, size_t length, size_t offset) {
    if (_disk->Mounts < 1) {
        return -1;
    }
    int block_num_origin = inumber / INODES_PER_BLOCK;
    Block *blk = (Block *)malloc(BLOCK_SIZE);
    wread(block_num_origin + 1, blk->Data);
    int inum = inumber % INODES_PER_BLOCK;
    Inode in = blk->Inodes[inum];
    if (!in.Valid || in.Size < offset) {
        return -1;
    }

    Block *indirect = (Block *)malloc(BLOCK_SIZE);

    length = min(length, (BLOCK_SIZE * POINTERS_PER_INODE * POINTERS_PER_BLOCK) - offset);
    ssize_t bytes = 0;

    bool inode_changed = false;
    bool indirect_changed = false;
    bool indirect_read = false;

    int block_num = offset / BLOCK_SIZE;
    int block_idx = block_num;
    while (bytes < length) {
        if (block_idx < POINTERS_PER_INODE) {
            if (in.Direct[block_idx] == 0) {
                int free_blk = free_block();
                if (free_blk == -1) {
                    break;
                }
                in.Direct[block_idx] = free_blk;
                inode_changed = true;
            }
            block_num = in.Direct[block_idx];
        } else {
            int indirect_idx = block_idx - POINTERS_PER_INODE;
            if (in.Indirect == 0) {
                int free_blk = free_block();
                if (free_blk == -1) {
                    break;
                }
                in.Indirect = free_blk;
                indirect_changed = true;
            }

            if (!indirect_read) {
                wread(in.Indirect, indirect->Data);
                indirect_read = true;
            }
            if (indirect->Pointers[indirect_idx] == 0) {
                int free_blk = free_block();
                if (free_blk == -1) {
                    break;
                }
                indirect->Pointers[indirect_idx] = free_blk;
                indirect_changed = true;
            }
            block_num = indirect->Pointers[indirect_idx];
        }

        size_t _offset = 0;
        size_t _length = min(length - bytes, BLOCK_SIZE);
        if (bytes == 0) {
            _offset = offset % BLOCK_SIZE;
            _length = min(length, BLOCK_SIZE - _offset);
        }

        Block *buff = (Block *)malloc(BLOCK_SIZE);

        if (_length < BLOCK_SIZE) {
            wread(block_num, buff->Data);
        }
        memcpy(&buff->Data[_offset], &data[bytes], _length);
        wwrite(block_num, buff->Data);
        bytes += _length;
        block_idx++;
    }

    ssize_t inode_size = max(in.Size, bytes + offset);
    if (inode_size != in.Size) {
        in.Size = inode_size;
        inode_changed = true;
    }

    if (inode_changed) {
        Block *blk1 = (Block *)malloc(BLOCK_SIZE);
        wread(block_num_origin + 1, blk1->Data);
        blk1->Inodes[inum] = in;
        wwrite(block_num_origin + 1, blk1->Data);
    }

    if (indirect_changed) {
        wwrite(in.Indirect, indirect->Data);
    }
    return bytes;

}

int free_block() {
    int block = -1;
    int i;
    for (i = 0; i < _disk->Blocks; i++) {
        if (free_bmp[i] == 1) {
            free_bmp[i] = 0;
            block = i;
            break;
        }
    }
    return block;
}

/*
 * Doesn't work :(
 *
int read_inode(size_t inumber, Block *blk, Inode *inode) {
    int block_num = inumber / INODES_PER_BLOCK;
    wread(block_num + 1, blk->Data);
    int inum = inumber % INODES_PER_BLOCK;
    inode = &(blk->Inodes[inum]);
    return block_num;
}

void write_inode(size_t inumber, Block *blk, Inode *inode) {
    int block_num = inumber / INODES_PER_BLOCK;
    int inum = inumber % INODES_PER_BLOCK;
    blk->Inodes[inum] = *inode;
    wwrite(block_num + 1, blk->Data);
}
 *
 */
