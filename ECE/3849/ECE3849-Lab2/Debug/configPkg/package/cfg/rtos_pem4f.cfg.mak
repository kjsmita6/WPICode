# invoke SourceDir generated makefile for rtos.pem4f
rtos.pem4f: .libraries,rtos.pem4f
.libraries,rtos.pem4f: package/cfg/rtos_pem4f.xdl
	$(MAKE) -f C:\Users\KYLESM~1\Desktop\ece3849_lab2_kjsmith/src/makefile.libs

clean::
	$(MAKE) -f C:\Users\KYLESM~1\Desktop\ece3849_lab2_kjsmith/src/makefile.libs clean

