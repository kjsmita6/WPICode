//@author Kyle Smith (kjsmith@wpi.edu)

#include <stdio.h>
#include <unistd.h>
#include <sys/syscall.h>

#ifndef __NR_cs3013_syscall1
#define __NR_cs3013_syscall1 377
#endif

long test(void) {
	return (long)syscall(__NR_cs3013_syscall1);
}

int main(int argc, const char *argv[]) {
	printf("New syscall1 test: %ld\n", test());
	return 0;
}
