obj-m := part2.o
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	gcc -o procAncestry procAncestry.c -Wall

clean:
	$(MAKE) -C $(KDIR) m=$(PWD) clean
