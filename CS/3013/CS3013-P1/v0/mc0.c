// @author Kyle Smith (kjsmith@wpi.edu)

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/resource.h>

#ifndef true
#define true 1
#endif

#ifndef false
#define false 0
#endif

void handle_choice(int option) {
	printf("\n\n");
	char ** argv = (char **)malloc(sizeof(char *) * 4);
	if(option == 0) {
		printf("-- Who Am I? --\n");
		argv[0] = "whoami";
	}
	else if(option == 1) {
		printf("-- Last Logins --\n");
		argv[0] = "last";
	}
	else if(option == 2) {
		printf("-- Directory Listing --\n");
		argv[0] = "ls";
		int c;
		printf("Arguments?: ");
		//scanf(" %s", argv[1]);
		//getchar();
		/*
		int acc = 0;
		while((c = getchar()) != '\n' && c != EOF) {
			argv[1][acc] = c;
			acc++;
		}
		*/
		int chars = getline(&argv[1], NULL, stdin);
		if(argv[1][chars - 1] == '\n') {
			argv[1][chars - 1] = '\0';
		}

		printf("%s\n", argv[1]);
		printf("Path?: ");
		int acc = 0;
		while((c = getchar()) != '\n' && c != EOF) {
            argv[2][acc] = c;
            acc++;
        }
		printf("\n");
	}
	else {
		printf("Unknown option!\n");
		return;
	}
	execvp(argv[0], argv);
	printf("\n\n");
}

void print_statistics(suseconds_t start) {
	printf("\n\n-- Statistics --\n");
	struct rusage usage;
	struct timeval tv;
	getrusage(RUSAGE_CHILDREN, &usage);
	gettimeofday(&tv, NULL);
	printf("Elapsed time: %ld ms\n", (tv.tv_usec - start) / 1000);
	printf("Page faults: %ld\n", usage.ru_majflt);
	printf("Page faults (reclaimed): %ld\n\n\n", usage.ru_minflt);
}

int main(int argc, const char *argv[]) {
	printf("===== Mid-Day Commander, v0 =====\n");
	struct timeval *tv = (struct timeval *)malloc(sizeof(struct timeval));
	pid_t pid;
	suseconds_t start;
	while(true) {
		printf("G'day, Commander! What command would you like to run?\n");
		printf("\t0. whoami\t: Prints out the result of the woami command\n");
		printf("\t1. last\t: Prints out the result of the last command\n");
		printf("\t2. ls\t: Prints out the result of a listing on a user-specified path\n");
		printf("Option?: ");

		char input = getchar();
		while(getchar() != '\n');
		int option = (int)input - 48;
		pid = fork();
		if(pid < 0) {
			return EXIT_FAILURE;
		}
		else if(pid == 0) {
			//gettimeofday(tv, NULL);
			//start = tv->tv_usec;
			handle_choice(option);
		}
		else {
			gettimeofday(tv, NULL);
			start = tv->tv_usec;
			wait(NULL);
			print_statistics(start);
		}
	}
	return EXIT_SUCCESS;
}
