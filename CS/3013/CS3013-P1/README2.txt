Kyle Smith (kjsmith@wpi.edu)
Project #1 - Midday Commander

This project is a demonstration of how to make a command-line shell in C. Phase 1 is the most basic one,
with 3 build-in commands which can be triggered by simply entering in the number which corrosponds to the command.
One problem I ran into is with getting strings into the input, which can be displayed by the usage of the ls command.
This command will return without actually running the command, since there is most likely a newline in the in buffer 
that i was unable to remove.

Phase 2 is an extension of phase 1, with the addition of some more built-in commands and the ability to add your own
commands. The built-in commands p, e, and c are different as they run on the parent process and are not forked to a child,
since we want those commands to carry through to any childs. On this phase, I ran into a segmentation fault that I was
not able to fix. When adding a new command, it adds fine (as far as I can tell, since I am able to print the information),
however when trying to add to the menu it fails with a segmentation fault that crashes the program. This problem will also exist in 
phase 3, since phase 3 is based on phase 2.

Phase 3 is an extension of phase 2, with one additional built in command and the ability to run commands as a backgroudn process by including
& at the end of the command when it is entered. The background processes are stored in an array of pids and array of command names.
The struct command_t was given another field, called background, which is a boolean value to determine if its a backgroudn process or not.
Using wait3 and wait4, we are able to wait for a process without blocking the other ones, allowing background processes to run. I ran into
the same memory issue as phase 2, so I was unable to fully test the program to see if it works.
