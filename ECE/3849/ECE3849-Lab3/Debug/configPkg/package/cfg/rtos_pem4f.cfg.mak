# invoke SourceDir generated makefile for rtos.pem4f
rtos.pem4f: .libraries,rtos.pem4f
.libraries,rtos.pem4f: package/cfg/rtos_pem4f.xdl
	$(MAKE) -f R:\ECE3849_WorkSpace\ece3849_lab3_kjsmith/src/makefile.libs

clean::
	$(MAKE) -f R:\ECE3849_WorkSpace\ece3849_lab3_kjsmith/src/makefile.libs clean

