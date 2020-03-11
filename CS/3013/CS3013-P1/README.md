### CS 3013 - Operating Systems

Project 1 (100 points)
Assigned: Tuesday, January 15, 2019
Checkpoint: Friday, January 18, 2019
Due: Friday, January 25, 2019

## Project 1: “Midday Commander”

There are many ways you can interact with a computer, including a graphical user interface or a text-based
shellwhere you can type commands at the command line. In this project, we’ll be creating another way to
interact with the system: via text-based menu modeled after theonce popular “Midnight Commander” file
management application. Our program, called “Midday Commander,” will be implemented in three phases
of increasing complexity, with each phase building on the prior one.

This project will allow students to learn about process creation, termination, and resource usage in the
Linux operating system. All coding is to be done in the C programming language. We highly recommend
implementing or testing the project on the Ubuntu virtual machineyou created in Project 0. Projects that
do not compile or run correctly on the Ubuntu virtual machines may be penalized.

## Phase 1: Fixed Commands

Create a directory called “v0” and store your code and Makefile in this directory. The first phase program,
calledmc0, runs a fixed list of commands in a menu-driven manner, as depicted in the transcript below:

```
shepard@normandy:~> ./mc
===== Mid-Day Commander, v0 =====
G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
Option?: 0

-- Who Am I? --
shepard

-- Statistics ---
Elapsed time: 1 milliseconds
Page Faults: 0
Page Faults (reclaimed): 0

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
Option?: 1

-- Last Logins --
shepard pts/1 1.2.3.4 Fri Jan 13 03:14 still logged in

-- Statistics ---
Elapsed time: 2 milliseconds
Page Faults: 0
Page Faults (reclaimed): 0


G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
Option?: 2

-- Directory Listing --
Arguments?: -al
Path?: /home

total 132
drwxr-xr-x 33 root root 4096 Oct 5 13:.
drwxr-xr-x 24 root root 4096 Dec 6 09: ..
drwxr-xr-x 3 shepard root 4096 Aug 31 2016 shepard

-- Statistics ---
Elapsed time: 7 milliseconds
Page Faults: 0
Page Faults (reclaimed): 0

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
Option?: ^C
shepard@normandy:~>
```

Your program should call the appropriate command based on the selected option:whoami,last, orls.
Note, these commands are already built into the system and do not need tobe re-implemented. Specifically,
you must use OS system calls tofork()off a child process and execute the command and its arguments
using theexecsystem call. The parent process should wait for completion and then print statistics about
the child process’s execution. These statistics must include:

- the elapsed “wall-clock” time for the command to execute in milliseconds,
- the number of page faults, and
- the number of page faults that could be satisfied using unreclaimed pages.

For the ls command, the program will execute the command with the indicated arguments (if any are
specified) on the indicated path. Note that the printed output of a command may differ slightly from the
given example. If the command is illegal, an error message must be generated. Finally, you are not allowed
to use the system() system call. Satisfactory completion of this component is worth 20% of the project
score.

### Helpful Hints

One of the purposes of this assignment is for you to learn how to find information in the online documentation
of Unix and Linux (called man pages) and, from that documentation, to learn how to invoke the various system
facilities from your program. For example, to learn about thefork()function, type “man fork” in your
favorite Unix or Linux shell. Manual pages are organized into sections. Section 1 is for commands to the
shell, section 2 is for system calls, and section 3 is for library routines, etc. Some entries are contained in
more than one section. For example, “man wait” will give you the manual page for the wait command
typed to a shell, while “man 2 wait” will give you the manual page for the wait() system call. Executing
“man man” tells you how to use the man command to view and/or print manual pages. For this part of the
assignment, the following systems calls and library functions may be needed:

- fork()- create a new process by cloning an existing one
- execvp()or one of its variants - execute a file. This is a front-end for the system callexecve(), which
    replaces the current process with a new program to execute.
- wait()- wait for a process to terminate.
- getrusage()- get information about resource utilization.
- gettimeofday()- get current time for calculation of wall-clock time.

Note: Thegetrusage()function returns a data structure with a lot of fields in it. However, theman
pages say that only some of these fields are actually populated by the Linux kernel.

## Phase 2: Extendable Commander

Create a directory called “v1” and store your code and Makefile in this directory for the second phase. Make
a copy of yourmc0program and call itmc1.

Themc1command allows users to begin adding their own commands to the menu. By pressing the ‘a’
key, the user will be able to add a new command and parameters to the menu. Your program will prompts
for and read a new line of text fromstdin. It stores this line in a data structure in memory and adds an
option for the command to the menu by incrementing the last available option number and displaying it in
order, as shown in the following transcript:

```
shepard@normandy:~> ./mc
===== Mid-Day Commander, v1 =====
G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?: a

-- Add a command --
Command to add?: free -m
Okay, added with ID 3!

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. free -m : User added command
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?: 3


-- Command: free -m --
total used free shared buff/cache available
Mem: 64414 9988 381 54 54044 53564
Swap: 65524 3272 62252

-- Statistics ---
Elapsed time: 4 milliseconds
Page Faults: 0
Page Faults (reclaimed): 0

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. free -m : User added command
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?: p

-- Current Directory --
Directory: /home/shepard/project1/mc1/

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. free -m : User added command
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?: c

-- Change Directory --
New Directory?: /

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. free -m : User added command
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?: p

-- Current Directory --
Directory: /

G’day, Commander! What command would you like to run?


0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. free -m : User added command
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?: e
Logging you out, Commander.
shepard@normandy:~>
```

When processing a user-added command, you will need to tokenize the string into an argument vector.
Under normal conditions,mc1shouldfork()a new child process to execute that command with the accu-
mulated arguments. It should thenwaitfor that child to terminate and print statistics about that child in
the same way thatmc0did.

However, three new “built-in” commands are treated differently. These are:

- a- Add: adds a new command to the menu.
- c- Change Directory: causes your program to change the working directory tothe specified directory
- e- Exit: causes your shell to terminate.
- p- Print Working Directory: prints the directory associated with your process.

These must not be forked and executed in child processes. Instead, they must be executed “in line”
in themc1process itself, because their effects need to persist to subsequent commands. For example, if
you change the working directory, all children processes should runfrom that working directory (e.g., “rm”
should remove files in the current working directory). It is not correct to tracking the variable locally and
use it only for printing out via the ‘p’ option.

A requirement of this assignment (to assist the grader) is that shellmust be capable of accepting its
input from the standard input streamstdin. Normally,stdinis connected to the keyboard input of the
terminal window. However, it is also possible in Linux to pipe a filetostdinas follows:

`shepard@normandy:~> ./mc1 < file.txt`
This exposes the need to handle the end-of-file condition. When theend of file is detected instdin,mc
should act as ifehad been typed.

Note that the Linux man pages explicitly state thatgetrusage()returns the cumulative statistics for
all children of a process, not just the statistics for the most recent child. Therefore, you must keep a record
of the statistics of previous children. When you callgetrusage()after a particular child has terminated,
you must subtract the previous statistics from the most recent ones returned bygetrusage()in order to
find out how many resources that the particular child used.

To keep things simple, you may design your program for lines of input containing not more than 128
characters and not more than 32 distinct arguments. You should print an error if this condition is violated.
Further, you do not need to support stdout redirection and pipes for the user-provided commands, i.e., the
user will not add a command such ascat foo | less.

Helpful hints

You may need the following two functions:

- chdir()- change working directory
- strtok()- search for tokens in the input string


## Phase 3: Commander with Background Execution

Create a directory called “v2” and store your code and Makefile in this directory for the third phase. Make
a copy of yourmc1program and call itmc2.

You must modifyshell2to handle background tasks, which are indicated by ampersand (‘&’) characters
at the ends of input lines when adding new commands. When a task is runin background,mc2should not
block until the child process completes. Instead, it prompts the user for another command. As a result, there
may be multiple child processes active at once, even whilemc2is reading additional commands. Moreover, a
background task can terminate at any time. In this case,mc2should display a message that the particular
task has terminated, and it should follow that message with the statistics about the command of that task.

In addition to the built-in commands ofmc1,shell2must also handle the following built-in command:

- r- Running processes list. Lists all background processes currently active

Note that output from background commands that is directed to the terminalwindow may intermingle
with the output of other commands and with the output from yourmc2.

A sample session with background tasks is given below.
```
shepard@normandy:~> ./mc
===== Mid-Day Commander, v2 =====
G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
r. running processes : Print list of running processes
Option?: r

-- Background Processes --

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
r. running processes : Print list of running processes
Option?: a

Command to add?: make -j4 O=~/kernelDst &
Okay, added with ID 3!

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. make -j4 O=~/kernelDst & : User added command
a. add command : Adds a new command to the menu.


c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
r. running processes : Print list of running processes
Option?: 3

-- Command: make -j4 O=~/kernelDst & --
[1] 12345 /* indicate background task #1 and process id */

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. make -j4 O=~/kernelDst & : User added command
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?: 1

-- Last Logins --
shepard pts/1 1.2.3.4 Fri Jan 13 03:14 still logged in

-- Statistics ---
Elapsed time: 2 milliseconds
Page Faults: 0
Page Faults (reclaimed): 0

G’day, Commander! What command would you like to run?

0. whoami : Prints out the result of the whoamicommand
1. last : Prints out the result of the last command
2. ls : Prints out the result of a listing on a user-specified path
3. free -m : User added command
a. add command : Adds a new command to the menu.
c. change directory : Changes process working directory
e. exit : Leave Mid-Day Commander
p. pwd : Prints working directory
Option?:
-- Job Complete [1] --
Process ID: 12345
[ Output ]

-- Statistics ---
Elapsed time: 2 milliseconds
Page Faults: 0
Page Faults (reclaimed): 0

e
Logging you out, Commander.
shepard@normandy:~>
```

If the user tries to exitmc2before all background tasks have completed, thenmc2should refuse to exit,
print a message, andwait()for those tasks to be completed. As part of the write-up describing your
program, you must explain how you keep track of outstanding processes inmc2- i.e., the data structures


and algorithms for maintain information about outstanding commands that have not been completed.

Helpful hints

The following two functions may be useful:

- wait3()- lets you wait for any child process; returnsrusagestatistics
- wait4()- lets you wait for a specific child process; returnsrusagestatistics

Either of these functions can be called with theWNOHANGoption, which causes thewait()function to
not block but rather return with an error code (e.g., “nobody is ready to be waited on yet”).

A suggested approach to handling background tasks is as follows. After forking a child process to invoke
a background command (i.e., with a ‘&’ character at the end), go into a loop usingwait3(WNOHANG)to wait
for any child to finish. Ifwait3()returns information about a child process that has finished, print its
statistics and repeat the loop. However, ifwait3()indicates that no child process has finished lately, exit
the loop and prompt for the next command. In the case that a command is not a background process (i.e.,
does not end with a ‘&’ character), then you should use await3()loop without theWNOHANGargument. This
will pick up any previous background commands that may have completed.Once the non-background task
has been waited for, loop again usingwait3(WNOHANG)to pick up any remaining tasks that have finished.
Whenwait3(WNOHANG)returns with an error, then prompt for the next command.

## Checkpoint Contributions

Students must submit work that demonstrates substantial progress towards completing the project on the
checkpoint date. Substantial progress is judged at the discretion of the grader to allow students flexibility
in prioritizing their efforts. However, as an example, any assignment in which the first phase is completed
and has a partial implementation of the second phase will be considered asmaking substantial progress.
Projects that fail to submit a checkpoint demonstrating significantprogress will incur a 10%
penalty during final project grading.

## Deliverables and Grading

When submitting your project, please include the following:

- All of the files containing the code for all parts of the assignment.
- One file calledMakefilethat can be used by themakecommand for building the three executable
    programs. It should support the “make clean” command, “make all” and make each of the three
    programs individually.
- The test files or input that you use to convince yourself (and others) that your programs actually work.
- Output from your tests.
- A document calledREADME.txtexplaining your project and anything that you feel the instructor should
    know when grading the project. In particular, describe the data structure and algorithm you used to
    keep track of background jobs. Also, explain how you tested your programs. Only plaintext write-ups
    are accepted.

Please compress all the files together as a single .zip archive for submission. As with all projects, please
only standard zip filesfor compression; .rar, .7z, and other custom file formats will not be
accepted.


The project programming is only a portion of the project. Students should use the following checklist in
turning in their projects to avoid forgetting any deliverables:

1. Sign up for a project partner or have one assigned (URL:https://ia.wpi.edu/cs3013/request_
    teammate.php),
2. Submit the project code and documentation via InstructAssist (URL:https://ia.wpi.edu/cs3013/
    files.php),
3. Complete your Partner Evaluation (URL:https://ia.wpi.edu/cs3013/evals.php), and
4. Schedule your Project Demonstration (URL:https://ia.wpi.edu/cs3013/demos.php), which may
    be posted slightly after the submission deadline.

A grading rubric has been provided at the end of this specification to give you a guide for how the project
will be graded. No points can be earned for a task that has a prerequisite unless that prerequisite is working
well enough to support the dependent task. Students will receivea scanned markup of this rubric as part of
their project grading feedback.

Groupsmustschedule an appointment to demonstrate their project to the teaching assistants. Groups
that fail to demonstrate their project will not receive credit for the project. If a group member fails to attend
his or her scheduled demonstration time slot, he or she will receivea 10 point reduction on his or her project
grade.

During the demonstrations, the TAs will be evaluating the contributions of group members. We will use
this evaluation, along with partner evaluations, to determine contributions. If contributions are not equal,
under-contributing students may be penalized.