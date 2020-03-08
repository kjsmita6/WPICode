obj-m := part1.o
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	gcc -o part1-test part1-test.c -Wall

clean:
	$(MAKE) -C $(KDIR) m=$(PWD) clean
