CS4513: Project 1 Goat File System
==================================

Note, this document includes a number of design questions that can help your implementation. We highly recommend that you answer each design question **before** attempting the corresponding implementation.
These questions will help you design and plan your implementation and guide you towards the resources you need.
Finally, if you are unsure how to start the project, we recommend you visit office hours for some guidance on these questions before attempting to implement this project.


Team members
-----------------

1. Kyle Smith (kjsmith@wpi.edu)

Design Questions
------------------

1. When implementing the `debug()` function, you will need to load the file system via the emulated disk and retrieve the information for superblock and inodes.
1.1 How will you read the superblock?
    Since the superblock is always block 0, you can read it directly into the Block union by         calling wread(0, blk->Data) and accessing it via blk->Super.
1.2 How will you traverse all the inodes?
    Each block has multiple inodes (INODES_PER_BLOCK). First, you can traverse all the blocks
    using a simple loop (you can get the number of blocks from the super block as described 
    before). Then, traverse each inode using INODES_PER_BLOCK.
1.3 How will you determine all the information related to an inode?
    All the information in an Inode is stored in the Inode struct, which you can access by
    reading in the block into the Block union and looping through Block.Inodes to get the
    individual Inode.
1.4 How will you determine all the blocks related to an inode?
    From the superblock you can get the number of InodeBlocks.

Brief response please!

---

2. When implementing the `format()` function, you will need to write the superblock and clear the remaining blocks in the file system.

2.1 What should happen if the the file system is already mounted?
    If the file system is mounted you should return false to indicate that the format failed.
2.2 What information must be written into the superblock?
    You must write the magic number, the number of blocks, the number of inode blocks (i.e. 
    normal blocks that are dedicated to inode info), and the total number of inodes.
2.3 How would you clear all the remaining blocks?
    Starting at the first data block (the block after the last inode block), you can write an
    empty char pointer (size BLOCK_SIZE) to that block.

Brief response please!

---

3. When implementing the `mount()` function, you will need to prepare a filesystem for use by reading the superblock and allocating the free block bitmap.

3.1 What should happen if the file system is already mounted?
    Return !SUCCESS_GOOD_MOUNT if the fs is already mounted.
3.2 What sanity checks must you perform before building up the free block bitmaps?
    First, check if the magic number is not the same. Next, you check if the number of inodes
    differs from the number of inode blocks times the INODES_PER_BLOCK. Finally, check that the
    number of blocks in the superblock differs from the number of blocks in the disk. If any of
    these checks fail, return a failure code.
3.3 How will you determine which blocks are free?
    Checking if !in.Valid means the block is free. Afterwards, create a bitmap of free blocks,
    where a value of 1 means the block is free and 0 means it is not.

Brief response please!

---

4. To implement `create()`, you will need to locate a free inode and save a new inode into the inode table.

4.1 How will you locate a free inode?
    I can go through each block and each inode block and check if it is valid.
4.2 What information would you see in a new inode?
    You should see that valid is set to 0, size is 0, and all direct and indirect pointers are 0.4.3 How will you record this new inode?
    You can write the new inode back to the block you were modifying, then write the block back
    to disk.

Brief response please!

---

5. To implement `remove()`, you will need to locate the inode and then free its associated blocks.

5.1 How will you determine if the specified inode is valid?
    Similar to previous steps, read the Inode in and check whether Inode.Valid.
5.2 How will you free the direct blocks?
    Since they are not memory objects, you can set them to 0 and update the free block bitmap.
5.3 How will you free the indirect blocks?
    Same as previous step.
5.4 How will you update the inode table?
    Same as in 4.3; write the modified inode back to the Block object, then write that block
    object to disk.

Brief response please!

---

6. To implement `stat()`, you will need to locate the inode and return its size.

6.1 How will you determine if the specified inode is valid?
    First, calculate which block the inode is in. Then, read the block and get the Inode object.    Then simply test whether inode.Valid.
6.2 How will you determine the inode's size?
    Following the last step, once you have the Inode struct you can use Inode.Size to get the
    size.

Brief response please!

---

7. To implement `read()`, you will need to locate the inode and copy data from appropriate blocks to the user-specified data buffer.

7.1  How will you determine if the specified inode is valid?
    First, read the block that has the given inode as in the previous two questions. Check if
    !Inode.Valid.
7.2  How will you determine which block to read from?
    With the given Inode number, with a known amount of inode per block, you can calculate the
    block number by calculating inode number / INODES_PER_BLOCK + 1 to get the block number. Then,    do inode number % INODES_PER_BLOCK to get the inode number in that specific block (e.g.,
    inode 129 is inode 1 in block 2 if INODES_PER_BLOCK is 128).
7.3  How will you handle the offset?
    By using pointer arithmetic, you can read the block but only copy the memory (using memcpy)
    starting at a certain point. 
7.4  How will you copy from a block to the data buffer?
    You can use the library function strncpy to copy n bytes of a string into another buffer. I
    chose to use memcpy because I think it is easier with the offset.

Brief response please!

---

8. To implement `write()`, you will need to locate the inode and copy data the user-specified data buffer to data blocks in the file system.

8.1  How will you determine if the specified inode is valid?
    Same as previous questions, calculate the block containing the inode, read it in, and check
    if !Inode.Valid.
8.2  How will you determine which block to write to?
    You can search the free block bitmap that is created when the disk is mounted for a free
    block. Find the first free block and set the direct pointer to this block. Then, for each
    subsequent block, either use the next block after the previous one or search the bitmap again8.3  How will you handle the offset?
    Similarly to how we read the data, this time the offset is applied to the block that is being    written instead of to the data. To be used in the call to memcpy.
8.4  How will you know if you need a new block?
    You will need a new block any time you write to a block but the amount of bytes written is
    less than the requested length. If 5 blocks are written but more are still needed then you
    can allocate the indirect block.
8.5  How will you manage allocating a new block if you need another one?
    You can search the free bitmap and find the first empty block.
8.6  How will you copy to a block from the data buffer?
    Using memcpy with the offset you can copy the data into a temporary buffer. It is the same
    as what was done in read() except the block and data buffer positions are switched in memcpy.8.7  How will you update the inode?
    Similar to previous parts. Read in the block from disk (because data was written to it, we
    don't want to delete those changes), get the inode index and update the object. Finally,
    write it back to disk. This feature is optimized to only write to disk if something is
    changed, as opposed to writing to disk every time the function is called.

Brief response please!

---


Errata
------

Describe any known errors, bugs, or deviations from the requirements.

    - On some functions, the number of reads and writes differs from the solution, causing the
    test to fail.
    - Only able to pass 3/5 test cases for test_copyin.

---

(Optional) Additional Test Cases
--------------------------------

Describe any new test cases that you developed.

