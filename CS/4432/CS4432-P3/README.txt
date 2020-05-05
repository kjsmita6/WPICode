Kyle Smith (kjsmith@wpi.edu) 892937055
CS4432 - Project 3

Section 1: How to compile and run
Note: This guide depends on you being in the correct directory as stated. If you are not, then you must adjust your path to compensate for it.

1. Navigate to CS4432-P3/src
2. Run the command to compile:
	$ javac edu/wpi/cs/kjsmith/*.java
3. Run the command to start the program:
	$ java -cp . edu.wpi.cs.kjsmith.Program
4. Now the program is running, and you may enter any commands you like.
5. To exit the program, exit the terminal or use the quit shortcut (Ctrl+C).

If your working directory is not CS4432-P3/src, you will need to change the compilation and running commands to match your directory. Additionally, you will need to move your disk files. Use (pwd) to check what your working directory is.

Section 2: What is Working
Everything seems to be working as described. Since we were given no test inputs or outputs I cannot be sure if it is running as supposed to, but it should be.

For searching != and >/<, I could not figure out how to make the index search more efficient than disk scan. See below.

Section 3: Design Decisions
- Created a class called Record for storing records. This makes retreiving each field easier so I don't have to keep doing string manipulation.
- In Dataset class, store all A records and B records in a Hashtable (indexed with the file number), which in itself contains another Hashtable, indexed by the record number. This Hashtable makes it easy to retrieve a Record given a file and record number.

