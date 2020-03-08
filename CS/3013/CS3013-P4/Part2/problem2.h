#ifndef PROBLEM2_H
#define PROBLEM2_H

void map(unsigned int pid, unsigned int addr, unsigned int val);
void printPT(unsigned int pid);
void store(int pid, int addr, int val);
int load(int pid, int addr);
int check_page(int vpn, int start);
int inSwapSpace(unsigned int pte);
int vpnForPage(int page);
int evict(int thisP, int ptCall);
int swap(unsigned int addr);
int swapPT(int ptAddr);
int isaPT(int page);
void initFile();

#endif
