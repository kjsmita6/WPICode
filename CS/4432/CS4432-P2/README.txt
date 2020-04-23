Kyle Smith (kjsmith@wpi.edu) 892937055
CS4432 - Project 2

Section 1: How to compile and run
Note: This guide depends on you being in the correct directory as stated. If you are not, then you must adjust your path to compensate for it.

1. Navigate to CS4432-P2/src
2. Run the command to compile:
	$ javac edu/wpi/cs/kjsmith/*.java
3. Run the command to start the program:
	$ java -cp . edu.wpi.cs.kjsmith.Program
4. Now the program is running, and you may enter any commands you like.
5. To exit the program, exit the terminal or use the quit shortcut (Ctrl+C).

The disk files (F1.txt, F2.txt, etc...) must be in CS4432-P2/src/Project2Dataset, otherwise the program will give a null pointer exception any time you try to load a file into memory. Unless...

If your working directory is not CS4432-P2/src, you will need to change the compilation and running commands to match your directory. Additionally, you will need to move your disk files. Use (pwd) to check what your working directory is.

Section 2: What is Working
Everything seems to be working as described. Since we were given no test inputs or outputs I cannot be sure if it is running as supposed to, but it should be.

For searching != and >/<, I could not figure out how to make the index search more efficient than disk scan. See below.

Section 3: Design Decisions
- For searching for equality (RandomV = x), the program will use the hash-based index if it is available, otherwise it will scan each file.

- For searching inequality (!= and >/<), the program will always do a full scan of all the files and ignore the index. This is because I could not make it more efficient. Table scan would always take around 300 ms, while using the index would take around 11 seconds.
