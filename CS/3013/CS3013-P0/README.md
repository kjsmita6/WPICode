## CS 3013 - Operating Systems

Project 0 (20 points)
Assigned: Friday, January 11, 2019
Due: Tuesday, January 15, 2019

# Project 0: Building a Module and Recompiling Linux

In this project, you will build the Linux environment that you will use in a subsequent course project. In
doing so, you will learn how to create, build, install, and remove a Loadable Kernel Module (LKM). You
will also add a few system calls to the Linux kernel source code and recompile it. You will then reboot into
this new kernel and test out the system call with a user application. This project specification provides
significant guidance, making the project a straightforward exercise (and thus worth relatively few points),
but it is vital that you complete this preparation to succeed in future projects.

This is anindividual project. Each student will submit his or her work individually and should not
use resources from other students. However, students are always encouraged to discuss projects and share
high-level information with each other. If you have any questions about the permissible level of collaboration,
please contact the instructor.

Please note:the kernel recompilation process can take several hours to complete; please plan
accordingly. You may want to do something else while that’s churning away. Fortunately, this should be the
only time a full recompile is required in this course.

## “Hello World” Loadable Kernel Module

For this project, we use Ubuntu 16.04.5 (Xenial Xerus), which is an Ubuntu long-term support (LTS)
release. Please use the i386 (x86) version of the OS, even if you have a 64-bit machine, so that you can
follow along with these instructions. If you use the x64 version against our advice, you will be expected to
know what components need to be changed without staff support. If you are on campus, you may find that
[http://cerebro.cs.wpi.edu/ubuntu-16.04.1-desktop-i386.isois](http://cerebro.cs.wpi.edu/ubuntu-16.04.1-desktop-i386.isois) a quick mirror that does not count
against your CCC bandwidth quota. We recommend allocatingat least 25GBof disk space to the guest
VM since a reasonable amount of disk may be used during the kernel compilation process. Some students
have found more disk space to be helpful.

To prepare for the build, let’s make sure we have the latest version of everything:

- `apt-get update`
- `apt-get upgrade`
- `apt-get dist-upgrade`

If your updates caused a newer version of the kernel to be downloaded and installed,you should reboot.
If you do not, you may link against an older version of the kernel and build a module that may not work
once you reboot.

Version Note:Operating systems are always under development, so the file versions in this PDF may
deviate from the version in use on your system. You may need to adjust paths, file names, and commands
to reflect your system’s version numbers.

Next, let’s get everything we will need to build a kernel module. Ubuntu actually helps us out with the
module-assistant package. We also need to make sure we get the current linux-headers using a cute shell
include:

```sh
apt-get install linux-source module-assistant build-essential linux-headers-$(uname -r)
libssl-dev
```

Now, let’s start with an example (based on a tutorial by Mark Loiseau), which is available athttp:
//cerebro.cs.wpi.edu/cs3013_project0.c:

```c
// We need to define __KERNEL__ and MODULE to be in Kernel space
// If they are defined, undefined them and define them again:
#undef __KERNEL__
#undef MODULE

#define __KERNEL__
#define MODULE

// We need to include module.h to get module functions
// while kernel.h gives us the KERN_INFO variable for
// writing to the syslog. Finally, init.h gives us the macros
// for module initialization and destruction (__init and __exit)

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

static int __init hello_init(void) {
// Note the use of ‘‘printk’’ rather than ‘‘printf’’
// This is important for kernel-space code
printk(KERN_INFO "Hello World!\n");

// We now must return. A value of 0 means that
// the module loaded successfully. A non-zero
// value indicates the module did not load.
return 0;
}

static void __exit hello_cleanup(void) {
// We are not going to do much here other than
// print a syslog message.
printk(KERN_INFO "Cleaning up module.\n");
}

// We have to indicate what functions will be run upon
// module initialization and removal.
module_init(hello_init);
module_exit(hello_cleanup);
```

Take the above code and save it to the filehello.c. Now, we need to create aMakefilefor this code,
which is available athttp://cerebro.cs.wpi.edu/cs3013_project0_makefileRemember: Makefiles are
sensitive to whitespace. Make sure your indentations use the tab character and not spaces. Finally, if
copying from the PDF, make sure dash and equal signs are simple dashes in the file and not formatted
special characters.

```
obj-m := hello.o
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
$(MAKE) -C $(KDIR) M=$(PWD) modules


clean:
$(MAKE) -C $(KDIR) M=$(PWD) clean
```

Once your Makefile is ready, runmake. Your output should look something like the following (with
different version numbers):

```sh
drwho@dalek:~/lkm_project> make
make -C /lib/modules/4.4.0-141-generic-pae/build M=/home/drwho/lkm_project modules
make[1]: Entering directory ‘/usr/src/linux-headers-4.4.0-141-generic-pae’
CC [M] /home/drwho/lkm_project/hello.o
Building modules, stage 2.
MODPOST 1 modules
CC /home/drwho/lkm_project/hello.mod.o
LD [M] /home/drwho/lkm_project/hello.ko
make[1]: Leaving directory ‘/usr/src/linux-headers-4.4.0-141-generic-pae’
```

If your output looks similar, yourmakelikely completed successfully.
You are now ready to insert the module usinginsmod(short for “insert module”). Naturally, loading
kernel modules requires root privileges:

`drwho@dalek: /lkmproject> sudo insmod hello.ko`

You should not receive any output (if you receive “-1 Invalid module format,” check to make sure your
kernel and source code versions are the same). However, take a look at the system log to see how it went:

`drwho@dalek:~/lkm_project> sudo insmod hello.ko`
`drwho@dalek:~/lkm_project> tail -n 1 /var/log/syslog`
`Jan 4 19:20:26 dalek kernel: [ 2689.324547] Hello World!`

The syslog line shows us that the module loaded correctly. If the line is something else, another process
could have written to the syslog. You might grep for “Hello World”. If it does not appear, your module did
not load correctly.

Once you have the module loading correctly, you can remove it again usingsudo rmmod hello.ko(short
for “remove module”):

`drwho@dalek:~/lkm_project> sudo rmmod hello.ko`
`drwho@dalek:~/lkm_project> tail -n 1 /var/log/syslog`
`Jan 4 19:20:26 dalek kernel: [ 2706.044371] Cleaning up module.`


Again, the syslog output shows us that the removal was successful.

## LKMs and Adding a New System Call

While LKMs can add kernel functionality, they interestingly cannot add a new system call, which is the
primary mechanism for communicating between user and kernel space. This limitation results from the
static definition of system calls using a static array and a fixed system call count definition. Some people
claim this is an inherent security defense. These people are clearly misguided: an LKM runs in Kernel space
and operates with unchecked power. If you are worried about the security of an LKM, you would be advised
to not include it in your kernel.

LKMs actually have the ability to overwrite an existing system call, which is called “interception.” The
LKM can replace the old system call functionality, augment it, or simply eliminate it. This can certainly be
useful, but it can also break user applications when the system call does not behave as expected.


Rather than take an existing system call and intercept it, possibly causing widespread chaos, we will
instead create three new system calls by recompiling the Linux kernel. These system calls will initially
operate as stubs. We will then alter their functionality by using interception in LKMs. This will allow us to
rapidly test and prototype kernel level code, without continually recompiling the kernel and rebooting. It
also means that if we do something horribly wrong, we can simply reboot the system and the errant module
will not be loaded.

But, before we do that, we must add the system calls to the kernel, recompile, and boot into the modified
kernel. Joy.

## Recompiling the Kernel in Ubuntu

We begin with some preliminaries:


`1.sudo apt-mark hold texlive-*`
`2.sudo apt-get install kernel-package libncurses5-dev fakeroot wget bzip`

Running the `sudo apt-mark hold texlive` command will avoid installing the LaTeX packages, which
are unnecessary and can take a while to install.

Earlier, we installed linux-source, which provides the/usr/src/linux-source-4.4.0directory (again,
your kernel version is likely to be newer; just change the numbers throughout the instructions accordingly).
Upon entering that directory, runsudo tar -jxvf linux-source-4.4.0.tar.bz2, which will take a little
bit and extract all the source you need. For convenience, we’ll create a symbolic link to this extracted source:

sudo ln -s /usr/src/linux-source-4.4.0/linux-source-4.4.0 /usr/src/linux
We now enter/usr/src/linuxand runsudo cp /boot/config-$(uname -r) ./.config. This com-
mand copies the configuration of the currently running kernel to the .config file in the current directory. This
will make it easier for us to create our own kernel variant with the same functionality of the current kernel.

Editing the Kernel Source Code

We are now going to edit the source code for the kernel. Most people make a copy of the source before
making edits, but we’re going to make the edits directly since we’re only making minor changes on a VM.
Naturally, you will want to make backups of any files you will alter before you edit them. If you do not, it
may be exceedingly difficult for you to undo any errors.

To backup each of the files we are going to touch, we’ll do the following:


- `sudo cp /usr/src/linux/kernel/sys.c /usr/src/linux/kernel/sys.cbackup`
- `sudo cp /usr/src/linux/arch/x86/entry/syscalls/syscall32.tbl
    /usr/src/linux/arch/x86/entry/syscalls/syscall32.tblbackup`
- `sudo cp /usr/src/linux/include/linux/syscalls.h
    /usr/src/linux/include/linux/syscalls.hbackup`

We will now edit each of these files in turn to add three system calls. Please follow these instructions
EXACTLY and recognize that line order matters in several places.

Edit/usr/src/linux/kernel/sys.cas root to add the following lines to the end of the file:

```c
SYSCALL_DEFINE0(cs3013_syscall1) {
printk(KERN_EMERG "‘Hello, world!’ -- syscall1\n");
return 0;
}


SYSCALL_DEFINE0(cs3013_syscall2) {
printk(KERN_EMERG "‘Hello, world!’ -- syscall2\n");
return 0;
}
SYSCALL_DEFINE0(cs3013_syscall3) {
printk(KERN_EMERG "‘Hello, world!’ -- syscall3\n");
return 0;
}
```

Be sure to include a newline (‘\n’) character after the last ‘}’ character to avoid compilation errors. Also,
note that there is no comma between KERN_EMERG and Hello in this code.

We now edit/usr/src/linux/arch/x86/entry/syscalls/syscall32.tblto define each of these sys-
tem calls. Around line 385, you will see the end of a list of defined system calls. We now add our three,
incrementing the count for each (again, use tabs as delimiters):

```
377 i386 cs3013_syscall1 sys_cs3013_syscall
378 i386 cs3013_syscall2 sys_cs3013_syscall
379 i386 cs3013_syscall3 sys_cs3013_syscall
```

Finally, we edit/usr/src/linux/include/linux/syscalls.h. Go to the end of the file. The last line
is#endif.Beforethat line, add the following three lines:

```c
asmlinkage long sys_cs3013_syscall1(void);
asmlinkage long sys_cs3013_syscall2(void);
asmlinkage long sys_cs3013_syscall3(void);
```

Building the Kernel

We now have to set those configuration settings by runningsudo make menuconfig(or for those who like
GUIs,sudo make xconfig) in/usr/src/linux. You will be greeted with an ncurses menu (or GUI window)
for selecting options to configure the kernel. We could make a bunch of hard decisions ourselves. But, instead,
we’ll use the .config file we saved a couple steps ago by going down to the “Load” option at the bottom and
selecting it. It will automatically fill in the value with “.config”, which is what we want. Select “ok.”

We now have the option to leave our mark in the kernel name. This will help us identify our kernel in
the boot loader, amongst other things. Go under “General setup” and select the “Local version - append
to kernel release” option and put in your WPI username into the box. Be sure NOT to use any characters
other than letters or numbers since they may cause extremely confusing compilation errors. If you have
non-alphanumeric characters in your username, simply omit them. When done, choose “ok” and then “exit”
to the main menu. Once there, choose “exit” again and say “yes” to save the configuration.

Now, compile the kernel. Be sure you are in/usr/src/linuxand then run:

```sh
sudo make-kpkg clean
export CONCURRENCY_LEVEL=
sudo fakeroot make-kpkg --initrd kernel_image kernel_headers
```

The third command, above, is going to take a while. Depending on your CPU, this step could take several
hours. The instructor’s compilation took roughly 4 hours on a 2011 MacBook Pro using the VirtualBox VMM with the guest VM having 1 CPU and 512 MBbytes memory. His host OS was still usable, but one of his cores was pegged. If you have a multi-core system and have assigned multiple cores to your guest VM, you can increase the CONCURRENCYLEVEL variable above to increase your compilation speed (quite
dramatically, in some cases). Using a 16 core server with 64GB RAM, the instructor provided the guest VM with 10 cores and 8GB of RAM and set CONCURRENCYLEVEL=11. That compilation took 40 minutes and 15 seconds.


Now, cd into/usr/src/linux-source-4.4.0. Perform a directory listing to determine your .deb file
names. Then, as root, usedpkgto install the image .deb and then the headers .deb file (in that order). In
my case, I ran:

`sudo dpkg -i linux-image-4.4.162cshue_4.4.162cshue-10.00.Custom_i386.deb
`sudo dpkg -i linux-headers-4.4.162cshue_4.4.162cshue-10.00.Custom_i386.deb

These packages will update your grub2 boot loader files, amongst other things. You will be rebooting
the system shortly and may want to update a grub2 setting to make it easier to boot your modified kernel.
To do so, edit/etc/default/grubto comment out the lineGRUBHIDDENTIMEOUT=0by prepending it with
a#character. Then, dosudo update-grubto update the boot loader. Alternatively, when booting your
kernel, you can get the Grub2 boot menu by holding down the right shift key (though the timing is hard to
master). Once you’ve made your preparations, or practiced your typing reflexes, reboot the VM by running
sudo rebootorsudo shutdown -r now.

Once you get to the Grub2 screen, select “Advanced Ubuntu Options” and then select your version of
the kernel (the one with your username in it).

Once your boot process has completed, you can test to see whether the added systems call work by using
the following code:

```c
#include <sys/syscall.h>
#include <stdio.h>
#include <unistd.h>

// These values MUST match the unistd_32.h modifications:
#define __NR_cs3013_syscall1 377
#define __NR_cs3013_syscall2 378
#define __NR_cs3013_syscall3 379

long testCall1 ( void) {
return (long) syscall(__NR_cs3013_syscall1);
}
long testCall2 ( void) {
return (long) syscall(__NR_cs3013_syscall2);
}
long testCall3 ( void) {
return (long) syscall(__NR_cs3013_syscall3);
}
int main () {
printf("The return values of the system calls are:\n");
printf("\tcs3013_syscall1: %ld\n", testCall1());
printf("\tcs3013_syscall2: %ld\n", testCall2());
printf("\tcs3013_syscall3: %ld\n", testCall3());
return 0;
}
```

Save that file astestcalls.c. Then compile it (e.g., viagcc testcalls.c -o testcalls). Once you
run the code, you should receive return values of 0. However, you should also see greetings from each of the
system calls in/var/log/syslog. If you see your hello world messages, you know that you have properly
created your system calls and invoked them. We’ll then be able to modify these system calls in future
projects without having to recompile the kernel.


# Checkpoint Contributions

Project 0 does not have a checkpoint deliverable.

# Assignment Submission and Deliverables

Be sure to put your name at the top of each of the files that you create or edit. When submitting your
project, please include the following:

- Yourhello.cand yourMakefileprograms for the LKM portion of the project.
- A text file containing the output of the shell commanduname -aon your modified kernel.
- The contents of your modifiedsys.c,syscall32.tbl, andsyscalls.hfiles.
- The contents of yourtestcalls.cfile used to evaluate the program.
- The contents of your/var/log/syslogfile.

Please upload your .zip archive via InstructAssist (https://ia.wpi.edu/cs3013/files.php) in the
“Project 0” folder.

# References

- Mark Loiseau, “‘Hello World’ Loadable Kernel Module,”http://blog.markloiseau.com/2012/04/
    hello-world-loadable-kernel-module-tutorial/, April 2012.
- Bryan Henderson, “Linux Loadable Kernel Module HOWTO,”http://www.tldp.org/HOWTO/html_
    single/Module-HOWTO/, September 2006.
- nixCraft, “HowTo: Ubuntu Linux Install Kernel Source Code And Headers,”http://www.howtoforge.
    com/kernel_compilation_ubuntu, July 2009.


