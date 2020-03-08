// @author Kyle Smith (kjsmith@wpi.edu)

#ifndef ANCESTRY_H
#define ANCESTRY_H

#include <linux/types.h>

struct ancestry {
	pid_t ancestors[10];
	pid_t siblings[100];
	pid_t children[100];
};

#endif
