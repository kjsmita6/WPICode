// @author Kyle Smith (kjsmith@wpi.edu)

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/syscall.h>
#include "ancestry.h"

#ifndef __NR_cs3013_syscall2
#define __NR_cs3013_syscall2 378
#endif

long proc_ancestry(int pid) {
	struct ancestry *anc = (struct ancestry *)malloc(sizeof(struct ancestry));
	return (long)syscall(__NR_cs3013_syscall2, &pid, anc);
}

int main(int argc, const char *argv[]) {
	int pid = atoi(argv[1]);
	if(proc_ancestry(pid) != 0) {
		printf("Error getting process ancestry.\n");
		return 1;
	}
	printf("Success. Please view /var/log/syslog for ancestry information.\n");
	return 0;
}
