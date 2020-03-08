// @author Kyle Smith (kjsmith@wpi.edu)

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/syscalls.h>
#include <linux/sched.h>
#include <linux/list.h>
#include "ancestry.h"

unsigned long **sys_call_table;

asmlinkage long (*ref_sys_cs3013_syscall2)(void);

asmlinkage long new_sys_cs3013_syscall2(unsigned short *target_pid, struct ancestry *response) {
	struct task_struct *task = pid_task(find_vpid(*target_pid), PIDTYPE_PID);
	struct list_head *list;
	struct ancestry anc;
	pid_t target;
	int children = 0;
	int ancestors = 0;
	int siblings = 0;
	struct task_struct *temp;

	if(copy_from_user(&anc, response, sizeof(anc))) {
		return EFAULT;
	}

	target = task_pid_nr(task);
	printk(KERN_INFO "Target PID: %d\n", (int)target);

	list_for_each(list, &task->children) {
		temp = list_entry(list, struct task_struct, sibling);
		printk(KERN_INFO "Child PID: %d\n", temp->pid);
		anc.children[children] = temp->pid;
		children++;
	}

	while(temp->pid > 1) {
		temp = temp->real_parent;
		if(temp->pid != target) {
			printk(KERN_INFO "Ancestor PID: %d\n", temp->pid);
			anc.ancestors[ancestors] = temp->pid;
			ancestors++;
		}
	}

	list_for_each(list, &task->real_parent->children) {
		temp = list_entry(list, struct task_struct, sibling);
		if(temp->pid != target) {
			printk(KERN_INFO "Sibling PID: %d\n", temp->pid);
			anc.siblings[siblings] = temp->pid;
			siblings++;
		}
	}

	if(copy_to_user(response, &anc, sizeof(anc))) {
		return EFAULT;
	}
	return 0;
}

static unsigned long **find_sys_call_table(void) {
  unsigned long int offset = PAGE_OFFSET;
  unsigned long **sct;

  while (offset < ULLONG_MAX) {
    sct = (unsigned long **)offset;

    if (sct[__NR_close] == (unsigned long *) sys_close) {
      printk(KERN_INFO "Interceptor: Found syscall table at address: 0x%02lX",
	     (unsigned long) sct);
      return sct;
    }

    offset += sizeof(void *);
  }

  return NULL;
}

static void disable_page_protection(void) {
  write_cr0 (read_cr0 () & (~ 0x10000));
}

static void enable_page_protection(void) {
  write_cr0 (read_cr0 () | 0x10000);
}

static int __init interceptor_start(void) {
  if(!(sys_call_table = find_sys_call_table())) {
    return -1;
  }

  /* Store a copy of all the existing functions */
	ref_sys_cs3013_syscall2 = (void *)sys_call_table[__NR_cs3013_syscall2];
  /* Replace the existing system calls */
  disable_page_protection();

	sys_call_table[__NR_cs3013_syscall2] = (unsigned long *)new_sys_cs3013_syscall2;
  enable_page_protection();

  /* And indicate the load was successful */
  printk(KERN_INFO "Loaded interceptor!");

  return 0;
}

static void __exit interceptor_end(void) {
  /* If we don't know what the syscall table is, don't bother. */
  if(!sys_call_table)
    return;
  
  /* Revert all system calls to what they were before we began. */
  disable_page_protection();
	sys_call_table[__NR_cs3013_syscall2] = (unsigned long *)ref_sys_cs3013_syscall2;
	enable_page_protection();

  printk(KERN_INFO "Unloaded interceptor!");
}

MODULE_LICENSE("GPL");
module_init(interceptor_start);
module_exit(interceptor_end);
