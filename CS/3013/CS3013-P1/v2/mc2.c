// @author Kyle Smith (kjsmith@wpi.edu)

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/resource.h>

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

int any_bg = FALSE;
char command[128];

struct command_t {
	int id;
	char title[128];
	char desc[128];
	char argv[16][128];
	int argc;
	int background;
};

void print_commands(struct command_t **cmds, int num) {
	for(int i = 0; i < num; i++) {
		printf("\t%d. %s: %s\n", cmds[i]->id, cmds[i]->title, cmds[i]->desc);
	}
}

void handle_choice_spec(char option, struct command_t **commands, int *num_custom) {
	if(option == 'a') {
		printf("-- Add Command --\n");
		printf("Command to add?: ");
		//char *name = (char *)malloc(128 * sizeof(char));
		char name[128];
        char c;
        int i = 0;
        while(TRUE) {
            if(scanf("%c", &c) == 0) {
                break;
            }
            if(c == '\n' || c == '\0' || c == EOF) {
                break;
            }
            name[i] = c;
            i++;
        }
		int background = FALSE;
		(*num_custom)++; /////////
		if(name[i - 1] == '&') {
			background = TRUE;
		}
		//printf("%s\n", name);
		//printf("%d\n", *num_commands);
		char desc[128] = "User Added Command";
		struct command_t *cmd = (struct command_t *)malloc(sizeof(struct command_t));
		cmd->id = 2 + *num_custom;
		strncpy(cmd->title, name, 128);
		strncpy(cmd->desc, desc, 128);
		char *token = strtok(name, " ");
		i = 0;
		cmd->argc = 0;
		cmd->background = background;
		while(token != NULL) {
			strncpy(cmd->argv[i], token, 128);
			token = strtok(NULL, " ");
			if(strcmp(token, "&") == 0) {
				token = "";
			}
			cmd->argc++;
			i++;
		}
		commands[*num_custom] = cmd;
		printf("Okay, added with ID %d!\n\n", cmd->id);
	}
	else if(option == 'c') {
		printf("-- Change Directory --\n");
		printf("New Directory?: ");
		char *dir = (char *)malloc(128 * sizeof(char));
		char c;
		int i = 0;
		while(TRUE) {
			if(scanf("%c", &c) == 0) {
				break;
			}
			if(c == '\n' || c == '\0' || c == EOF) {
				break;
			}
			dir[i] = c;
			i++;
		}
		chdir(dir);
		printf("\n\n");
	}
	else if(option == 'e') {
		printf("Logging you out, Commander.\n");
		exit(EXIT_SUCCESS);
	}
	else {
		return;
	}
}

void handle_choice(char option, struct command_t **cmds, int num_commands) {
	printf("\n\n");
	char ** argv = (char **)malloc(sizeof(char *) * 4);
	if(option == '0') {
		printf("-- Who Am I? --\n");
		argv[0] = "whoami";
	}
	else if(option == '1') {
		printf("-- Last Logins --\n");
		argv[0] = "last";
	}
	else if(option == '2') {
		printf("-- Directory Listing --\n");
		argv[0] = "ls";
		printf("Arguments?: ");
        char c;
        int i = 0;
        while(TRUE) {
            if(scanf("%c", &c) == 0) {
                break;
            }
            if(c == '\n' || c == '\0' || c == EOF) {
                break;
            }
           	argv[1][i] = c;
            i++;
        }
		printf("Path?: ");
        char c1;
        i = 0;
        while(TRUE) {
            if(scanf("%c", &c1) == 0) {
                break;
            }
            if(c1 == '\n' || c1 == '\0' || c == EOF) {
                break;
            }
            argv[2][i] = c1;
            i++;
        }
		printf("\n");
	}
	else if(option == 'p') {
        printf("-- Current Directory --\n");
        char **argv = (char **)malloc(sizeof(char *) * 3);
        argv[0] = "pwd";
        argv[1] = NULL;
        execvp("pwd", argv);
        printf("\n\n");
    }
	else if((int)option >= 3) {
		int cmd = (int)option - 48;
		struct command_t *custom = (struct command_t *)malloc(sizeof(struct command_t));
		int found = FALSE;
		for(int i = 0; i < num_commands; i++) {
			if(cmds[i]->id == cmd) {
				custom = cmds[i];
				found = TRUE;
				break;
			}
		}
		if(found == FALSE) {
			printf("Unknown option!\n");
			return;
		}
		if(custom->background == TRUE) {
			any_bg = TRUE;
			strncpy(command, custom->title, 32);
		}
		char **argv = (char **)malloc(sizeof(char *) * 16);
		for(int i = 0; i < custom->argc; i++) {
			argv[i] = custom->argv[i];
		}
		execvp(argv[0], argv);
		return;
	}
	else {
		printf("Unknown option!\n");
		return;
	}
	execvp(argv[0], argv);
	printf("\n\n");
}

int main(int argc, const char *argv[]) {
	printf("===== Mid-Day Commander, v1 =====\n");
	pid_t pid;
	suseconds_t start;
	//struct command_t *cmds = (struct command_t *)malloc(sizeof(struct command_t) * 32);
	struct command_t **cmds = (struct command_t **)malloc(sizeof(struct command_t *));;
	int num_commands_custom = 0;
	int process[32];
	char *pnames[32];
	int pids = 0;
	int j = 0;

	long r_utime1 = 0;
	long r_utime2 = 0;
	long r_ustime1 = 0;
	long r_ustime2 = 0;
	long r_majflt = 0;
	long r_minflt = 0;
	struct timeval wc_start;
	struct timeval wc_end;
	struct rusage usage;
	int rusage = 1;

	while(TRUE) {
		printf("G'day, Commander! What command would you like to run?\n");
		printf("\t0. whoami\t: Prints out the result of the woami command\n");
		printf("\t1. last\t: Prints out the result of the last command\n");
		printf("\t2. ls\t: Prints out the result of a listing on a user-specified path\n");
		print_commands(cmds, num_commands_custom);
		printf("\ta. add command\t: Adds a new command to the menu\n");
		printf("\tc. change directory\t: Changes process working directory\n");
		printf("\te. exit\t: Leaves Mid-Day Commander\n");
		printf("\tp. pwd\t: Prints working directory\n");
		printf("\tr. Running processes\t: Prints list of running processes\n");
		printf("Option?: ");

		char input = getchar();
		while(getchar() != '\n');
		if(input == 'a' || input == 'c' || input == 'e') {
			handle_choice_spec(input, cmds, &num_commands_custom);
			continue;
		}

		if(input == 'r') {
			printf("\n-- Background Processes --\n");
			for(int i = 0; i < j; i++) {
				printf("%d %s: %d\n", i, pnames[i], process[i]);
			}
			printf("\n\n");
			continue;
		}

		pid = fork();
		if(pid < 0) {
			return EXIT_FAILURE;
		}
		else if(pid == 0) {
			//gettimeofday(tv, NULL);
			//start = tv->tv_usec;
			handle_choice(input, cmds, num_commands_custom);
		}
		else {
			if(any_bg) {
				process[pids] = pid;
				pnames[j] = malloc(128);
				strncpy(pnames[j], command, 128);
			}
			if(!any_bg) {
				gettimeofday(&wc_start, NULL);
				wait4(pid, NULL, 0, &usage);
				gettimeofday(&wc_end, NULL);
				rusage = 1;
				printf("\n");
			}
			else {
				while(wait3(0, WNOHANG, &usage) >= 0) {
					rusage = 1;
				}
			}

			if(rusage) {
				rusage = 0;
				getrusage(RUSAGE_CHILDREN, &usage);
				wc_start = usage.ru_utime;
				wc_end = usage.ru_stime;

				printf("Elapsed time: %ld ms\n", (((wc_end.tv_sec - r_utime1) * 1000 + ((wc_end.tv_usec - r_utime2) / 1000) + ((wc_start.tv_sec - r_utime1) * 1000 + (wc_start.tv_usec - r_ustime2) / 1000))));
				printf("Page faults: %ld\n", usage.ru_majflt - r_majflt);
				printf("Page faults (reclaimed): %ld\n\n\n", usage.ru_minflt - r_minflt);

				r_utime1 = wc_end.tv_sec;
				r_utime2 = wc_end.tv_usec;
				r_ustime1 = wc_start.tv_sec;
				r_ustime2 = wc_start.tv_usec;
				r_majflt = usage.ru_majflt;
				r_minflt = usage.ru_minflt;
			}
		}
	}
	return EXIT_SUCCESS;
}
