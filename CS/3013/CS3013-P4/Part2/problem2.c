#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "problem2.h"

#define TRUE 1
#define FALSE 0
#define MEM_SIZE 64
#define PAGE_SIZE 16

int free_list[MEM_SIZE / PAGE_SIZE];
unsigned char memory[MEM_SIZE + 1];
int pt_reg[4];
int pos;
FILE* fp;

int main(int argc, const char *argv[]) {
	int pid;
	char *inst_type = (char *)calloc(128, sizeof(char));
	int addr;
	int value;
	char buf[128];
	pos = 0;
	fp = fopen("hardDrive.txt", "w+");
	
	if(fp == NULL){
		return EXIT_FAILURE;
	}
	initFile();
	fflush(fp);
	fclose(fp);

	for(int i = 0; i < MEM_SIZE; i++) {
		memory[i] = 255;
	}

	for(int i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		free_list[i] = 5;
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
		/*fp = fopen("hardDrive.txt", "r+"); //only if all input is valid do we open the file
	
		if(fp == NULL){
			return EXIT_FAILURE;
		}*/
		
		if(strcmp(inst_type, "map") == 0) {
			map(pid, addr, value);
		}
		else if(strcmp(inst_type, "store") == 0) {
			store(pid, addr, value);
		}
		else if(strcmp(inst_type, "load") == 0) {
			load(pid, addr);
		} /*else if(strcmp(inst_type, "print") == 0) {
			printPT(pid);
		}*/
		else if(strcmp(inst_type, "quit") == 0){
			break;
		}
		else {
			printf("Invalid instruction\n");
		}
		//fclose(fp); //always close file to update it
	}
	return EXIT_SUCCESS;
}

void printPT(unsigned int pid){
	int ptAddr = pt_reg[pid];
	for(int i = 0; i < 4; i++){
		printf("%d ", memory[i+ptAddr]);
	}
}

void map(unsigned int pid, unsigned int addr, unsigned int value) {
	if(value > 1 || value < 0) {
		printf("Invalid value, must be 0 or 1\n");
		return;
	}
	
	int i = 0;
	unsigned int index = 0;
	if(pt_reg[pid] == -1) { //if pt is unassigned
		for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
				if(free_list[i] == 5) {
					break;
				}
		}
		
		if(i >= 4) { //if no space for pt
			fp = fopen("hardDrive.txt", "r+");
	
			if(fp == NULL){
				printf("Issue with map, abrting\n");
				return;
			}
			i = evict(pid, 0); //evict a page
			fflush(fp);
			fclose(fp);
			if(i < 0){
				printf("Issue with map, aborting\n");
				fflush(stdout);
				return;
			}
 		}
 		
 		if(i < 0){
			printf("Issue with map, aborting\n");
			return;
		}
		
 		free_list[i] = pid; //update free_list
		pt_reg[pid] = i * 16; //update pt_reg
		printf("Put page table for PID %d into physical frame %d\n", pid, i);
		
	} else if (inSwapSpace(pt_reg[pid])){ //if pt is in swapspace, bring it out
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with map, abrting\n");
			return;
		}
		if(swapPT(pt_reg[pid]) < 0){
			printf("Issue with map, aborting\n");
			fflush(fp);
			fclose(fp);
			return;
		}
		fflush(fp);
		fclose(fp);
	}
	
	//we only reach this point once the pt comes back into mem
	if((index = check_page(addr >> 4, pid)) != -1) { //if pte already exists, update
		if (inSwapSpace(memory[index])){ //if page exists and is in swapspace
			fp = fopen("hardDrive.txt", "r+");
	
			if(fp == NULL){
				printf("Issue with map, abrting\n");
				return;
			}
			if(swap(memory[index]) < 0){
				printf("Issue with map, aborting\n");
				fflush(fp);
				fclose(fp);
				return;
			} //bring it back and update pt
			if (inSwapSpace(pt_reg[pid])){ //if pt is in swapspace, bring it out
				fp = fopen("hardDrive.txt", "r+");
	
				if(fp == NULL){
					printf("Issue with map, abrting\n");
					return;
				}
				if(swapPT(pt_reg[pid]) < 0){
					printf("Issue with map, aborting\n");
					fflush(fp);
					fclose(fp);
					return;
				}
				fflush(fp);
				fclose(fp);
			}
		}
		char page = ((memory[index] >> 1) << 1) | value; //delete old value, put new value in
		memory[index] = page; //set pte to addr in mem
		printf("Updated existing page table entry\n");
		return;
	}

	for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) { //if pte does not exist
		if(free_list[i] == 5) { //if any pages free, take them
			free_list[i] = pid;
			break;
		}
	}
	
	if(i >= 4) { //if no free pages, evict and update
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with map, abrting\n");
			return;
		}
		i = evict(pid, 0); //evict a page, i is now the page we are allocating
		fflush(fp);
		fclose(fp);
		if(i < 0){
			printf("Issue with map, aborting\n");
			return;
		}
		free_list[i] = pid; //update freeList with new pid for page
	}

	unsigned int vpn = (addr >> 4) & 0x3; // get 2 most significant bits to correspond to page num (63 >> 4 = 3)
	unsigned char pte = (vpn << 3) | (i << 1) | value;
	int j;
	for(j = 0; j < MEM_SIZE / PAGE_SIZE; j++) {
		if(memory[j + pt_reg[pid]] == 255) {
			break;
		}
	}
	memory[pt_reg[pid] + j] = pte;
	printf("Mapped virtual address %d (page %d) into physical frame %d\n", addr, vpn, i);
}

int check_page(int vpn, int pid) { //returns position in memory where pte for vpn is stored
	int ptAddr = pt_reg[pid];
	for(int i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		if(memory[i+ptAddr] != 255 && ((memory[i + ptAddr] >> 3) & 0x3) == vpn) {
			return i + ptAddr;
		}
	}
	return -1;
}

void store(int pid, int addr, int value) {
	int found = FALSE;
	unsigned int vpn = (addr >> 4) & 0x3;
	//printf("VPN = %d\t", vpn);
	int i;
	
	if(inSwapSpace(pt_reg[pid])){ //if pt for this addr is in swapspace, bring it back
		printf("PT in swapspace\t");
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with file, aborting\n");
			return;
		}
		if(swapPT(pt_reg[pid]) < 0){
			printf("Error with store, aborting\n");
			fflush(fp);
			fclose(fp);
			return;
		}
		fflush(fp);
		fclose(fp);
	}
	int pte = check_page(vpn, pid); //get pte for addr
	if(pte == -1){
		printf("Page does not exist\n");
		return;
	}
	pte = memory[pte]; //set pte to actual addr
	if(inSwapSpace(pte)){ //if this addr is in swapspace, bring it back
		//printf("addr in swapspace\t");
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with file, aborting\n");
			return;
		}
		if(swap(pte) < 0){
			printf("Error with store, aborting\n");
			fflush(fp);
			fclose(fp);
			return;
		}
		fflush(fp);
		fclose(fp);
	}
	if (inSwapSpace(pt_reg[pid])){ //if pt is in swapspace, bring it out
		//printf("PT in swapspace\t");
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with file, aborting\n");
			return;
		}
		if(swapPT(pt_reg[pid]) < 0){
			printf("Error with store, aborting\n");
			fflush(fp);
			fclose(fp);
			return;
		}
		fflush(fp);
		fclose(fp);
	}
	unsigned int temp_page;
	for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		temp_page = memory[i + pt_reg[pid]];
		//printf("Trying %d\t", temp_page >> 3);
		if(/*temp_page != 0 && */((temp_page >> 3) & 0x3) == vpn) {
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
	int page = (temp_page >> 1) & 0x3; //gets physical page
	int offset = addr & 0xf; //gets offset from addr
	int paddr = (page << 4) | offset; //phys addr = page# * 16 + offset
	memory[paddr] = value; //set physical addr to value
	printf("Stored value %d at virtual address %d (physical address %d)\n", value, addr, paddr);
	return;
}

int load(int pid, int addr) {
	int found = FALSE;
	unsigned int vpn = (addr >> 4) & 0x3;
	
	if(inSwapSpace(pt_reg[pid])){ //if pt for this addr is in swapspace, bring it back
		printf("PT in swapspace\t");
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with file, aborting\n");
			return EXIT_FAILURE;
		}
		if(swapPT(pt_reg[pid]) < 0){
			printf("Error with store, aborting\n");
			fflush(fp);
			fclose(fp);
			return -1;
		}
		fflush(fp);
		fclose(fp);
	}
	int pte = check_page(vpn, pid); //get pte for addr
	if(pte == -1){
		printf("Page does not exist\n");
		return -1;
	}
	pte = memory[pte]; //set pte to actual addr
	if(inSwapSpace(pte)){ //if this addr is in swapspace, bring it back
		//printf("addr in swapspace\t");
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with file, aborting\n");
			return EXIT_FAILURE;
		}
		if(swap(pte) < 0){
			printf("Error with store, aborting\n");
			fflush(fp);
			fclose(fp);
			return -1;
		}
		fflush(fp);
		fclose(fp);
	}
	if (inSwapSpace(pt_reg[pid])){ //if pt is in swapspace, bring it out
		printf("PT in swapspace\t");
		fp = fopen("hardDrive.txt", "r+");
	
		if(fp == NULL){
			printf("Issue with file, aborting\n");
			return EXIT_FAILURE;
		}
		if(swapPT(pt_reg[pid]) < 0){
			printf("Error with store, aborting\n");
			fflush(fp);
			fclose(fp);
			return -1;
		}
		fflush(fp);
		fclose(fp);
	}
	
	int i;
	unsigned int temp_page;
	for(i = 0; i < MEM_SIZE / PAGE_SIZE; i++) {
		temp_page = memory[i + pt_reg[pid]];
		if(/*!(temp_page >= 128) && */((temp_page >> 3) & 0x3) == vpn) { //if vpn is in pt
		    	found = TRUE;
			break;
		}
	}
	if(!found) {
		printf("Unable to locate page\n");
		return -1;
	}
	int page = (temp_page >> 1) & 0x3; //extract page number
	int offset = addr & 0xf;
	int paddr = (page << 4) | offset;
	printf("The value %d is virtual address %d (physical address %d)\n", memory[paddr], addr, paddr);
	return memory[paddr];
}

int vpnForPage(int page){ //given a page, returns VPN mapped to it
	int pid = free_list[page];
	unsigned int ptAddr = pt_reg[pid];
	int i = 0;
	for(i = 0; i < 4; i++){
		if((memory[i+ptAddr] & 0x6) == (page << 1)){
			break;
		}
	}
	
	return (memory[i+ptAddr] >> 3) & 0x3;
}

int inSwapSpace(unsigned int pte){ //1 if in swapspace, 0 otherwise
	return pte >> 7;
}

int evict(int thisP, int ptCall){ //evicts a page
	pos++;
	pos %= 4; //global position marker (round robin)
	
	int pfn = pos; //pfn = page in mem we are evicting
	int isPT = FALSE;
	
	int pid = free_list[pos]; //get pid for this page
	unsigned int ptAddr = pt_reg[pid]; //get addr of pt
	
	if(inSwapSpace(ptAddr)){ //if pt in swapspace
		if(ptCall && pid == thisP){ //if pt trying to evict own page
			while(free_list[pos] == thisP){ //swap out page for another process
				pos++;
				pos %= 4;
				pfn = pos;
				//printf("Incoming PT will not evict own pages\t");
			}
		} else {
			if(swapPT(ptAddr) < 0){ //swap pt into mem
				printf("Issue with evict, aborting\n");
				return -1;
			}
			ptAddr = pt_reg[pid];
		}
	}
	if (isaPT(pfn)){ //if this is a pt
		isPT = TRUE;
		//printf("This is a page table\t");
		if(pid == thisP){ //if this is the pt for the page that'll be swapped in, swap next page out. Page CANNOT swap out its own pt
			pos++;
			pos %= 4;
			pfn = pos;
			//printf("This was the page table for the calling process\n");
			isPT = FALSE;
		}
	}
	pid = free_list[pos];
	int index;
	//int prevAddr;
	unsigned char swapPage;
	if(!isPT){ //if not a pt
		//printf("Not a pt\t");
		int mask = (0x80 | (pid << 5)); //1pp00000 where p = pid
		int vpn = vpnForPage(pfn); //gets vpn given this page #
		if((index = check_page(vpn, pid)) != -1) { //get index of vpn's pte
			swapPage = ((memory[index] & 0x19) | mask); //sets swapspace address (1ppvv00v) where p = pid, v = vpn, v = val
			memory[index] = swapPage; //puts swapspace addr in pt
			
		} else {
			printf("Unable to locate page to evict\n");
			return -1;
		}
	} else { //if evicting pt
		swapPage = (0x84 | (pid << 5)); //1pp00100
		pt_reg[pid] = swapPage; //set pt location to pt swapSpace addr
	}
	
	fseek(fp, (swapPage >> 2)*16, SEEK_SET);
	for(int i = 0; i < 16; i++){ //copy mem to disk
		fprintf(fp, "%c", memory[i + (16 * pfn)]);
		//fputc(memory[i + (16 * pfn)], fp);
	}
	fflush(fp);
	printf("Swapped frame %d to swap slot %d\n", pfn, swapPage >> 2);
	
	fflush(fp);
	fclose(fp);
	fp = fopen("hardDrive.txt", "r+"); //open and close file to update it
	
	if(fp == NULL){
		return EXIT_FAILURE;
	}
	return pfn;
}

int swap(unsigned int addr){ //swap addr in swapspace to mem
	unsigned int offset = addr >> 2; //offset for fseek
	int pid = ((addr << 1) >> 6) & 0x3; //pid of this p
	if(inSwapSpace(pt_reg[pid])){ //if pt for this is in swapspace, bring it back
		if(swapPT(pt_reg[pid]) < 0){
			printf("Issue with swap, abrting\n");
			return -1;
		}
	}
	int vpn = (addr >> 3) & 0x3; //vpn for addr
	int page = evict(pid, 0); //evict page
	if(page < 0){
		printf("Issue with swap, aborting\n");
		return -1;
	}
	int start = pt_reg[pid]; //ptAddr for this pid (after evict in case pt is evicted)

	int index = check_page(vpn, pid); //get index of vpn's pte
	memory[index] = (addr & 0x19) | (page << 1); //set pte to vpn's location in mem
		
	fseek(fp, offset * 16, SEEK_SET);
	
	for(int i = 0; i < 16; i++){
		memory[i + (16*page)] = fgetc(fp);
	}
	
	fflush(fp);
	fclose(fp);
	fp = fopen("hardDrive.txt", "r+"); //open and close file to update it
	
	if(fp == NULL){
		return EXIT_FAILURE;
	}
	
	printf("Swapped disk slot %d into frame %d\n", offset, page);
	free_list[page] = pid;
	return page;
}

void initFile(){
	for(int i = 0; i < 16*256; i++){
		//printf("Adding Q #%d\n", i);
		//fputc('Q', fp);
		fprintf(fp, "Q");
	}
}

int swapPT(int ptAddr){ //bring pt in swapspace back to mem
	unsigned int offset = ptAddr >> 2; //offset for fseek
	int pid = (ptAddr >> 5) & 0x3; //pid of this p
	//printf("SwapPT called with %d\t", pid);
	int page = evict(pid, 1); //evict page
	if(page < 0){
		printf("Issue with swapPT, aborting\n");
		return -1;
	}
	pt_reg[pid] = page * 16; //update pt_reg
		
	fseek(fp, offset * 16, SEEK_SET);
	
	for(int i = 0; i < 16; i++){
		memory[i + (16*page)] = fgetc(fp);
	}
	
	fflush(fp);
	fclose(fp);
	fp = fopen("hardDrive.txt", "r+"); //open and close file to update it
	
	if(fp == NULL){
		return EXIT_FAILURE;
	}
	
	printf("Swapped PT disk slot %d into frame %d\n", offset, page);
	free_list[page] = pid;
	return page;
}

int isaPT(int page){
	for(int i = 0; i < 4; i++){
		if(pt_reg[i] == page*16){
			return TRUE;
		}
	}
	return FALSE;
}

























