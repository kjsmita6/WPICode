#ifndef PROBLEM1_H
#define PROBLEM1_H

void map(int pid, int addr, int val);
void store(int pid, int addr, int val);
int load(int pid, int addr);
int check_page(int vpn, int start);

#endif
