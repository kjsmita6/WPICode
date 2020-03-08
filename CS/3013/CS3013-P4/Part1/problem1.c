#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "problem1.h"

#define TRUE 1
#define FALSE 0
#define MEM_SIZE 64
#define PAGE_SIZE 16

int free_list[MEM_SIZE / PAGE_SIZE];
unsigned char memory[MEM_SIZE];
int pt_reg[4];

int main(int argc, const char *argv[]) {
	int pid;
	char *inst_type = (char *)calloc(128, sizeof(char));
	int addr;
	int value;
	char buf[128];

	for(int i = 0; i < MEM_SIZE; i++) {
		memory[i] = 0;
	}

	for(int i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		free_list[i] = TRUE;
		pt_reg[i] = -1;
	}

	while(TRUE) {
		printf("Instruction? ");
		fgets(buf, 128, stdin);
        pid = atoi(strtok(buf, ","));
        inst_type = strtok(NULL, ",");
        addr = atoi(strtok(NULL, ","));
        value = atoi(strtok(NULL, ","));

		if(addr > 63 || addr < 0) {
			printf("Address must be between 0 and 63\n");
			continue;
		}
		if(pid < 0 || pid > 3) {
			printf("PID must be between 0 and 3\n");
			continue;
		}
		if(value < 0 || value > 255) {
			printf("Value must be between 0 and 255\n");
			continue;
		}

		if(strcmp(inst_type, "map") == 0) {
			map(pid, addr, value);
		}
		else if(strcmp(inst_type, "store") == 0) {
			store(pid, addr, value);
		}
		else if(strcmp(inst_type, "load") == 0) {
			load(pid, addr);
		}
		else if(strcmp(inst_type, "quit") == 0) {
			break;
		}
		else {
			printf("Invalid instruction\n");
		}
	}
	return EXIT_SUCCESS;
}

void map(int pid, int addr, int value) {
	if(value > 1 || value < 0) {
		printf("Invalid value, must be 0 or 1\n");
		return;
	}
	unsigned int i = 0;
	int index = 0;
	if(pt_reg[pid] == -1) {
        for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
			if(free_list[i] == TRUE) {
				free_list[i] = FALSE;
				pt_reg[pid] = i * 16;
				printf("Put page table for PID %d into physical frame %d\n", pid, i);
				break;
			}
        }
    }
	else if((index = check_page(addr >> 4, pt_reg[pid])) != -1) {
		char page = ((memory[index] >> 1) << 1) | value;
		memory[index] = page;
		printf("Updated existing page table entry\n");
		return;
	}

	if(i >= 4) {
        printf("Unable to allocate page table\n");
        return;
    }

	for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		if(free_list[i] == TRUE) {
			free_list[i] = FALSE;
			break;
		}
	}

	if(i >= 4) {
		printf("Unable to allocate page\n");
		return;
	}

	unsigned int vpn = addr >> 4; // get 2 most significant bits to correspond to page num (63 >> 4 = 3)
	char page = (vpn << 3) | (i << 1) | value;
	int j;
	for(j = 0; j < MEM_SIZE / PAGE_SIZE; j++) {
		if(memory[j + pt_reg[pid]] == 0) {
			break;
		}
	}
	memory[pt_reg[pid] + j] = page;
	printf("Mapped virtual address %d (page %d) into physical frame %d\n", addr, vpn, i);
}

int check_page(int vpn, int start) {
	for(int i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		if(memory[i + start] >> 3 == vpn && memory[i + start] != 0) {
			return i + start;
		}
	}
	return -1;
}

void store(int pid, int addr, int value) {
	int found = FALSE;
	unsigned int vpn = addr >> 4;
	int i;
	int temp_page;
	for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		temp_page = memory[i + pt_reg[pid]];
		if(temp_page != 0 && temp_page >> 3 == vpn) {
			found = TRUE;
			break;
		}
	}
	if(!found) {
		printf("Unable to locate page\n");
		return;
	}
	if(!(temp_page & 0x1)){ //if read only
		printf("Error: Writes are not allowed to this page\n");
		return;
	}
	int page = (memory[i + pt_reg[pid]] >> 1) & 0x3;
	int offset = addr & 0xf;
	int paddr = (page << 4) | offset;
	memory[paddr] = value;
	printf("Stored value %d at virtual address %d (physical address %d)\n", value, addr, paddr);
}

int load(int pid, int addr) {
	int found = FALSE;
	unsigned int vpn = addr >> 4;
    int i;
    for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
        int temp_page = memory[i + pt_reg[pid]];
        if(temp_page != 0 && temp_page >> 3 == vpn) {
            found = TRUE;
			break;
        }
    }
	if(!found) {
		printf("Unable to locate page\n");
		return -1;
	}
    int page = (memory[i + pt_reg[pid]] >> 1) & 0x3;
    int offset = addr & 0xf;
    int paddr = (page << 4) | offset;
	printf("The value %d is virtual address %d (physical address %d)\n", memory[paddr], addr, paddr);
	return memory[paddr];
}
