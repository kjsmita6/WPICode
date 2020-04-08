Kyle Smith (kjsmith@wpi.edu) 892937055
CS4432 - Project 1

Section 1: How to compile and run
Note: This guide depends on you being in the correct directory as stated. If you are not, then you must adjust your path to compensate for it.

1. Navigate to CS4432-P1/src
2. Run the command to compile:
	$ javac edu/wpi/cs/kjsmith/*.java
3. Run the command to start the program:
	$ java -cp . edu.wpi.cs.kjsmith.Program <# of frames>
4. Now the program is running, and you may enter any commands you like.
5. To exit the program, exit the terminal or use the quit shortcut (Ctrl+C).

The disk files (F1.txt, F2.txt, etc...) must be in CS4432-P1/src, otherwise the program will give a null pointer exception any time you try to load a file into memory. Unless...

If your working directory is not CS4432-P1/src, you will need to change the compilation and running commands to match your directory. Additionally, you will need to move your disk files. Use (pwd) to check what your working directory is.

Section 2: Tests
Using the given test cases (testcase_commands_and_output.txt), all test commands and command outputs from my program match the ones specified.

Section 3: Design Decisions
- For evicting a frame, I decided to use a least recently used (LRU) strategy. The last used time is updated any time a frame is updated or retrieved, so if a frame needs to be updated then the frame that was least recently used will be evicted first.

- For storing frame ids I used a HashMap, with the keys being the block ID (file #) and the values being the frame numbers.

- For storing empty frames, I used a 64-bit bitmap. 0 represents a frame that is in use, and a 1 represents a frame that is empty. Note that since the bitmap is only 64 bits it could be possible that this program cannot hold more than 64 frames, but that is so far untested.

- All important lines in the code are commented. For proper documentation, a javadoc was also created. This can be accessed from javadoc/index.html.