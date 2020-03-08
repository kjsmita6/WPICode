
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c48 <_init>:
  400c48:	48 83 ec 08          	sub    $0x8,%rsp
  400c4c:	48 8b 05 a5 43 20 00 	mov    0x2043a5(%rip),%rax        # 604ff8 <_DYNAMIC+0x1d0>
  400c53:	48 85 c0             	test   %rax,%rax
  400c56:	74 05                	je     400c5d <_init+0x15>
  400c58:	e8 43 02 00 00       	callq  400ea0 <socket@plt+0x10>
  400c5d:	48 83 c4 08          	add    $0x8,%rsp
  400c61:	c3                   	retq   

Disassembly of section .plt:

0000000000400c70 <strcasecmp@plt-0x10>:
  400c70:	ff 35 92 43 20 00    	pushq  0x204392(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c76:	ff 25 94 43 20 00    	jmpq   *0x204394(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c80 <strcasecmp@plt>:
  400c80:	ff 25 92 43 20 00    	jmpq   *0x204392(%rip)        # 605018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400c86:	68 00 00 00 00       	pushq  $0x0
  400c8b:	e9 e0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400c90 <__errno_location@plt>:
  400c90:	ff 25 8a 43 20 00    	jmpq   *0x20438a(%rip)        # 605020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400c96:	68 01 00 00 00       	pushq  $0x1
  400c9b:	e9 d0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400ca0 <srandom@plt>:
  400ca0:	ff 25 82 43 20 00    	jmpq   *0x204382(%rip)        # 605028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400ca6:	68 02 00 00 00       	pushq  $0x2
  400cab:	e9 c0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cb0 <strncmp@plt>:
  400cb0:	ff 25 7a 43 20 00    	jmpq   *0x20437a(%rip)        # 605030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400cb6:	68 03 00 00 00       	pushq  $0x3
  400cbb:	e9 b0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cc0 <strcpy@plt>:
  400cc0:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 605038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400cc6:	68 04 00 00 00       	pushq  $0x4
  400ccb:	e9 a0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cd0 <puts@plt>:
  400cd0:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 605040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400cd6:	68 05 00 00 00       	pushq  $0x5
  400cdb:	e9 90 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400ce0 <write@plt>:
  400ce0:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 605048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400ce6:	68 06 00 00 00       	pushq  $0x6
  400ceb:	e9 80 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cf0 <__stack_chk_fail@plt>:
  400cf0:	ff 25 5a 43 20 00    	jmpq   *0x20435a(%rip)        # 605050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400cf6:	68 07 00 00 00       	pushq  $0x7
  400cfb:	e9 70 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d00 <mmap@plt>:
  400d00:	ff 25 52 43 20 00    	jmpq   *0x204352(%rip)        # 605058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400d06:	68 08 00 00 00       	pushq  $0x8
  400d0b:	e9 60 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d10 <memset@plt>:
  400d10:	ff 25 4a 43 20 00    	jmpq   *0x20434a(%rip)        # 605060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400d16:	68 09 00 00 00       	pushq  $0x9
  400d1b:	e9 50 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d20 <alarm@plt>:
  400d20:	ff 25 42 43 20 00    	jmpq   *0x204342(%rip)        # 605068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400d26:	68 0a 00 00 00       	pushq  $0xa
  400d2b:	e9 40 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d30 <close@plt>:
  400d30:	ff 25 3a 43 20 00    	jmpq   *0x20433a(%rip)        # 605070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400d36:	68 0b 00 00 00       	pushq  $0xb
  400d3b:	e9 30 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d40 <read@plt>:
  400d40:	ff 25 32 43 20 00    	jmpq   *0x204332(%rip)        # 605078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400d46:	68 0c 00 00 00       	pushq  $0xc
  400d4b:	e9 20 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d50 <__libc_start_main@plt>:
  400d50:	ff 25 2a 43 20 00    	jmpq   *0x20432a(%rip)        # 605080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400d56:	68 0d 00 00 00       	pushq  $0xd
  400d5b:	e9 10 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d60 <signal@plt>:
  400d60:	ff 25 22 43 20 00    	jmpq   *0x204322(%rip)        # 605088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400d66:	68 0e 00 00 00       	pushq  $0xe
  400d6b:	e9 00 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d70 <gethostbyname@plt>:
  400d70:	ff 25 1a 43 20 00    	jmpq   *0x20431a(%rip)        # 605090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400d76:	68 0f 00 00 00       	pushq  $0xf
  400d7b:	e9 f0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d80 <__memmove_chk@plt>:
  400d80:	ff 25 12 43 20 00    	jmpq   *0x204312(%rip)        # 605098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400d86:	68 10 00 00 00       	pushq  $0x10
  400d8b:	e9 e0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d90 <strtol@plt>:
  400d90:	ff 25 0a 43 20 00    	jmpq   *0x20430a(%rip)        # 6050a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400d96:	68 11 00 00 00       	pushq  $0x11
  400d9b:	e9 d0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400da0 <memcpy@plt>:
  400da0:	ff 25 02 43 20 00    	jmpq   *0x204302(%rip)        # 6050a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400da6:	68 12 00 00 00       	pushq  $0x12
  400dab:	e9 c0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400db0 <time@plt>:
  400db0:	ff 25 fa 42 20 00    	jmpq   *0x2042fa(%rip)        # 6050b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400db6:	68 13 00 00 00       	pushq  $0x13
  400dbb:	e9 b0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400dc0 <random@plt>:
  400dc0:	ff 25 f2 42 20 00    	jmpq   *0x2042f2(%rip)        # 6050b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400dc6:	68 14 00 00 00       	pushq  $0x14
  400dcb:	e9 a0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400dd0 <_IO_getc@plt>:
  400dd0:	ff 25 ea 42 20 00    	jmpq   *0x2042ea(%rip)        # 6050c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400dd6:	68 15 00 00 00       	pushq  $0x15
  400ddb:	e9 90 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400de0 <__isoc99_sscanf@plt>:
  400de0:	ff 25 e2 42 20 00    	jmpq   *0x2042e2(%rip)        # 6050c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400de6:	68 16 00 00 00       	pushq  $0x16
  400deb:	e9 80 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400df0 <munmap@plt>:
  400df0:	ff 25 da 42 20 00    	jmpq   *0x2042da(%rip)        # 6050d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400df6:	68 17 00 00 00       	pushq  $0x17
  400dfb:	e9 70 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e00 <__printf_chk@plt>:
  400e00:	ff 25 d2 42 20 00    	jmpq   *0x2042d2(%rip)        # 6050d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400e06:	68 18 00 00 00       	pushq  $0x18
  400e0b:	e9 60 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e10 <fopen@plt>:
  400e10:	ff 25 ca 42 20 00    	jmpq   *0x2042ca(%rip)        # 6050e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400e16:	68 19 00 00 00       	pushq  $0x19
  400e1b:	e9 50 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e20 <getopt@plt>:
  400e20:	ff 25 c2 42 20 00    	jmpq   *0x2042c2(%rip)        # 6050e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400e26:	68 1a 00 00 00       	pushq  $0x1a
  400e2b:	e9 40 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e30 <strtoul@plt>:
  400e30:	ff 25 ba 42 20 00    	jmpq   *0x2042ba(%rip)        # 6050f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400e36:	68 1b 00 00 00       	pushq  $0x1b
  400e3b:	e9 30 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e40 <gethostname@plt>:
  400e40:	ff 25 b2 42 20 00    	jmpq   *0x2042b2(%rip)        # 6050f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400e46:	68 1c 00 00 00       	pushq  $0x1c
  400e4b:	e9 20 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e50 <exit@plt>:
  400e50:	ff 25 aa 42 20 00    	jmpq   *0x2042aa(%rip)        # 605100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400e56:	68 1d 00 00 00       	pushq  $0x1d
  400e5b:	e9 10 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e60 <connect@plt>:
  400e60:	ff 25 a2 42 20 00    	jmpq   *0x2042a2(%rip)        # 605108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400e66:	68 1e 00 00 00       	pushq  $0x1e
  400e6b:	e9 00 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e70 <__fprintf_chk@plt>:
  400e70:	ff 25 9a 42 20 00    	jmpq   *0x20429a(%rip)        # 605110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400e76:	68 1f 00 00 00       	pushq  $0x1f
  400e7b:	e9 f0 fd ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e80 <__sprintf_chk@plt>:
  400e80:	ff 25 92 42 20 00    	jmpq   *0x204292(%rip)        # 605118 <_GLOBAL_OFFSET_TABLE_+0x118>
  400e86:	68 20 00 00 00       	pushq  $0x20
  400e8b:	e9 e0 fd ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e90 <socket@plt>:
  400e90:	ff 25 8a 42 20 00    	jmpq   *0x20428a(%rip)        # 605120 <_GLOBAL_OFFSET_TABLE_+0x120>
  400e96:	68 21 00 00 00       	pushq  $0x21
  400e9b:	e9 d0 fd ff ff       	jmpq   400c70 <_init+0x28>

Disassembly of section .plt.got:

0000000000400ea0 <.plt.got>:
  400ea0:	ff 25 52 41 20 00    	jmpq   *0x204152(%rip)        # 604ff8 <_DYNAMIC+0x1d0>
  400ea6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400eb0 <_start>:
  400eb0:	31 ed                	xor    %ebp,%ebp
  400eb2:	49 89 d1             	mov    %rdx,%r9
  400eb5:	5e                   	pop    %rsi
  400eb6:	48 89 e2             	mov    %rsp,%rdx
  400eb9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400ebd:	50                   	push   %rax
  400ebe:	54                   	push   %rsp
  400ebf:	49 c7 c0 50 2f 40 00 	mov    $0x402f50,%r8
  400ec6:	48 c7 c1 e0 2e 40 00 	mov    $0x402ee0,%rcx
  400ecd:	48 c7 c7 b5 11 40 00 	mov    $0x4011b5,%rdi
  400ed4:	e8 77 fe ff ff       	callq  400d50 <__libc_start_main@plt>
  400ed9:	f4                   	hlt    
  400eda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400ee0 <deregister_tm_clones>:
  400ee0:	b8 b7 54 60 00       	mov    $0x6054b7,%eax
  400ee5:	55                   	push   %rbp
  400ee6:	48 2d b0 54 60 00    	sub    $0x6054b0,%rax
  400eec:	48 83 f8 0e          	cmp    $0xe,%rax
  400ef0:	48 89 e5             	mov    %rsp,%rbp
  400ef3:	76 1b                	jbe    400f10 <deregister_tm_clones+0x30>
  400ef5:	b8 00 00 00 00       	mov    $0x0,%eax
  400efa:	48 85 c0             	test   %rax,%rax
  400efd:	74 11                	je     400f10 <deregister_tm_clones+0x30>
  400eff:	5d                   	pop    %rbp
  400f00:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f05:	ff e0                	jmpq   *%rax
  400f07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400f0e:	00 00 
  400f10:	5d                   	pop    %rbp
  400f11:	c3                   	retq   
  400f12:	0f 1f 40 00          	nopl   0x0(%rax)
  400f16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f1d:	00 00 00 

0000000000400f20 <register_tm_clones>:
  400f20:	be b0 54 60 00       	mov    $0x6054b0,%esi
  400f25:	55                   	push   %rbp
  400f26:	48 81 ee b0 54 60 00 	sub    $0x6054b0,%rsi
  400f2d:	48 c1 fe 03          	sar    $0x3,%rsi
  400f31:	48 89 e5             	mov    %rsp,%rbp
  400f34:	48 89 f0             	mov    %rsi,%rax
  400f37:	48 c1 e8 3f          	shr    $0x3f,%rax
  400f3b:	48 01 c6             	add    %rax,%rsi
  400f3e:	48 d1 fe             	sar    %rsi
  400f41:	74 15                	je     400f58 <register_tm_clones+0x38>
  400f43:	b8 00 00 00 00       	mov    $0x0,%eax
  400f48:	48 85 c0             	test   %rax,%rax
  400f4b:	74 0b                	je     400f58 <register_tm_clones+0x38>
  400f4d:	5d                   	pop    %rbp
  400f4e:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f53:	ff e0                	jmpq   *%rax
  400f55:	0f 1f 00             	nopl   (%rax)
  400f58:	5d                   	pop    %rbp
  400f59:	c3                   	retq   
  400f5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400f60 <__do_global_dtors_aux>:
  400f60:	80 3d 81 45 20 00 00 	cmpb   $0x0,0x204581(%rip)        # 6054e8 <completed.7594>
  400f67:	75 11                	jne    400f7a <__do_global_dtors_aux+0x1a>
  400f69:	55                   	push   %rbp
  400f6a:	48 89 e5             	mov    %rsp,%rbp
  400f6d:	e8 6e ff ff ff       	callq  400ee0 <deregister_tm_clones>
  400f72:	5d                   	pop    %rbp
  400f73:	c6 05 6e 45 20 00 01 	movb   $0x1,0x20456e(%rip)        # 6054e8 <completed.7594>
  400f7a:	f3 c3                	repz retq 
  400f7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f80 <frame_dummy>:
  400f80:	bf 20 4e 60 00       	mov    $0x604e20,%edi
  400f85:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400f89:	75 05                	jne    400f90 <frame_dummy+0x10>
  400f8b:	eb 93                	jmp    400f20 <register_tm_clones>
  400f8d:	0f 1f 00             	nopl   (%rax)
  400f90:	b8 00 00 00 00       	mov    $0x0,%eax
  400f95:	48 85 c0             	test   %rax,%rax
  400f98:	74 f1                	je     400f8b <frame_dummy+0xb>
  400f9a:	55                   	push   %rbp
  400f9b:	48 89 e5             	mov    %rsp,%rbp
  400f9e:	ff d0                	callq  *%rax
  400fa0:	5d                   	pop    %rbp
  400fa1:	e9 7a ff ff ff       	jmpq   400f20 <register_tm_clones>

0000000000400fa6 <usage>:
  400fa6:	48 83 ec 08          	sub    $0x8,%rsp
  400faa:	48 89 fa             	mov    %rdi,%rdx
  400fad:	83 3d 74 45 20 00 00 	cmpl   $0x0,0x204574(%rip)        # 605528 <is_checker>
  400fb4:	74 3e                	je     400ff4 <usage+0x4e>
  400fb6:	be 68 2f 40 00       	mov    $0x402f68,%esi
  400fbb:	bf 01 00 00 00       	mov    $0x1,%edi
  400fc0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fc5:	e8 36 fe ff ff       	callq  400e00 <__printf_chk@plt>
  400fca:	bf a0 2f 40 00       	mov    $0x402fa0,%edi
  400fcf:	e8 fc fc ff ff       	callq  400cd0 <puts@plt>
  400fd4:	bf 18 31 40 00       	mov    $0x403118,%edi
  400fd9:	e8 f2 fc ff ff       	callq  400cd0 <puts@plt>
  400fde:	bf c8 2f 40 00       	mov    $0x402fc8,%edi
  400fe3:	e8 e8 fc ff ff       	callq  400cd0 <puts@plt>
  400fe8:	bf 32 31 40 00       	mov    $0x403132,%edi
  400fed:	e8 de fc ff ff       	callq  400cd0 <puts@plt>
  400ff2:	eb 32                	jmp    401026 <usage+0x80>
  400ff4:	be 4e 31 40 00       	mov    $0x40314e,%esi
  400ff9:	bf 01 00 00 00       	mov    $0x1,%edi
  400ffe:	b8 00 00 00 00       	mov    $0x0,%eax
  401003:	e8 f8 fd ff ff       	callq  400e00 <__printf_chk@plt>
  401008:	bf f0 2f 40 00       	mov    $0x402ff0,%edi
  40100d:	e8 be fc ff ff       	callq  400cd0 <puts@plt>
  401012:	bf 18 30 40 00       	mov    $0x403018,%edi
  401017:	e8 b4 fc ff ff       	callq  400cd0 <puts@plt>
  40101c:	bf 6c 31 40 00       	mov    $0x40316c,%edi
  401021:	e8 aa fc ff ff       	callq  400cd0 <puts@plt>
  401026:	bf 00 00 00 00       	mov    $0x0,%edi
  40102b:	e8 20 fe ff ff       	callq  400e50 <exit@plt>

0000000000401030 <initialize_target>:
  401030:	55                   	push   %rbp
  401031:	53                   	push   %rbx
  401032:	48 81 ec 18 21 00 00 	sub    $0x2118,%rsp
  401039:	89 f5                	mov    %esi,%ebp
  40103b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401042:	00 00 
  401044:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
  40104b:	00 
  40104c:	31 c0                	xor    %eax,%eax
  40104e:	89 3d c4 44 20 00    	mov    %edi,0x2044c4(%rip)        # 605518 <check_level>
  401054:	8b 3d 0e 41 20 00    	mov    0x20410e(%rip),%edi        # 605168 <target_id>
  40105a:	e8 55 1e 00 00       	callq  402eb4 <gencookie>
  40105f:	89 05 bf 44 20 00    	mov    %eax,0x2044bf(%rip)        # 605524 <cookie>
  401065:	89 c7                	mov    %eax,%edi
  401067:	e8 48 1e 00 00       	callq  402eb4 <gencookie>
  40106c:	89 05 ae 44 20 00    	mov    %eax,0x2044ae(%rip)        # 605520 <authkey>
  401072:	8b 05 f0 40 20 00    	mov    0x2040f0(%rip),%eax        # 605168 <target_id>
  401078:	8d 78 01             	lea    0x1(%rax),%edi
  40107b:	e8 20 fc ff ff       	callq  400ca0 <srandom@plt>
  401080:	e8 3b fd ff ff       	callq  400dc0 <random@plt>
  401085:	89 c7                	mov    %eax,%edi
  401087:	e8 0d 03 00 00       	callq  401399 <scramble>
  40108c:	89 c3                	mov    %eax,%ebx
  40108e:	85 ed                	test   %ebp,%ebp
  401090:	74 18                	je     4010aa <initialize_target+0x7a>
  401092:	bf 00 00 00 00       	mov    $0x0,%edi
  401097:	e8 14 fd ff ff       	callq  400db0 <time@plt>
  40109c:	89 c7                	mov    %eax,%edi
  40109e:	e8 fd fb ff ff       	callq  400ca0 <srandom@plt>
  4010a3:	e8 18 fd ff ff       	callq  400dc0 <random@plt>
  4010a8:	eb 05                	jmp    4010af <initialize_target+0x7f>
  4010aa:	b8 00 00 00 00       	mov    $0x0,%eax
  4010af:	01 c3                	add    %eax,%ebx
  4010b1:	0f b7 db             	movzwl %bx,%ebx
  4010b4:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  4010bb:	89 c0                	mov    %eax,%eax
  4010bd:	48 89 05 dc 43 20 00 	mov    %rax,0x2043dc(%rip)        # 6054a0 <buf_offset>
  4010c4:	c6 05 7d 50 20 00 72 	movb   $0x72,0x20507d(%rip)        # 606148 <target_prefix>
  4010cb:	83 3d d6 43 20 00 00 	cmpl   $0x0,0x2043d6(%rip)        # 6054a8 <notify>
  4010d2:	0f 84 bb 00 00 00    	je     401193 <initialize_target+0x163>
  4010d8:	83 3d 49 44 20 00 00 	cmpl   $0x0,0x204449(%rip)        # 605528 <is_checker>
  4010df:	0f 85 ae 00 00 00    	jne    401193 <initialize_target+0x163>
  4010e5:	be 00 01 00 00       	mov    $0x100,%esi
  4010ea:	48 89 e7             	mov    %rsp,%rdi
  4010ed:	e8 4e fd ff ff       	callq  400e40 <gethostname@plt>
  4010f2:	85 c0                	test   %eax,%eax
  4010f4:	74 25                	je     40111b <initialize_target+0xeb>
  4010f6:	bf 48 30 40 00       	mov    $0x403048,%edi
  4010fb:	e8 d0 fb ff ff       	callq  400cd0 <puts@plt>
  401100:	bf 08 00 00 00       	mov    $0x8,%edi
  401105:	e8 46 fd ff ff       	callq  400e50 <exit@plt>
  40110a:	48 89 e6             	mov    %rsp,%rsi
  40110d:	e8 6e fb ff ff       	callq  400c80 <strcasecmp@plt>
  401112:	85 c0                	test   %eax,%eax
  401114:	74 21                	je     401137 <initialize_target+0x107>
  401116:	83 c3 01             	add    $0x1,%ebx
  401119:	eb 05                	jmp    401120 <initialize_target+0xf0>
  40111b:	bb 00 00 00 00       	mov    $0x0,%ebx
  401120:	48 63 c3             	movslq %ebx,%rax
  401123:	48 8b 3c c5 80 51 60 	mov    0x605180(,%rax,8),%rdi
  40112a:	00 
  40112b:	48 85 ff             	test   %rdi,%rdi
  40112e:	75 da                	jne    40110a <initialize_target+0xda>
  401130:	b8 00 00 00 00       	mov    $0x0,%eax
  401135:	eb 05                	jmp    40113c <initialize_target+0x10c>
  401137:	b8 01 00 00 00       	mov    $0x1,%eax
  40113c:	85 c0                	test   %eax,%eax
  40113e:	75 1c                	jne    40115c <initialize_target+0x12c>
  401140:	48 89 e2             	mov    %rsp,%rdx
  401143:	be 80 30 40 00       	mov    $0x403080,%esi
  401148:	bf 01 00 00 00       	mov    $0x1,%edi
  40114d:	e8 ae fc ff ff       	callq  400e00 <__printf_chk@plt>
  401152:	bf 08 00 00 00       	mov    $0x8,%edi
  401157:	e8 f4 fc ff ff       	callq  400e50 <exit@plt>
  40115c:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401163:	00 
  401164:	e8 b5 1a 00 00       	callq  402c1e <init_driver>
  401169:	85 c0                	test   %eax,%eax
  40116b:	79 26                	jns    401193 <initialize_target+0x163>
  40116d:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  401174:	00 
  401175:	be c0 30 40 00       	mov    $0x4030c0,%esi
  40117a:	bf 01 00 00 00       	mov    $0x1,%edi
  40117f:	b8 00 00 00 00       	mov    $0x0,%eax
  401184:	e8 77 fc ff ff       	callq  400e00 <__printf_chk@plt>
  401189:	bf 08 00 00 00       	mov    $0x8,%edi
  40118e:	e8 bd fc ff ff       	callq  400e50 <exit@plt>
  401193:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
  40119a:	00 
  40119b:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4011a2:	00 00 
  4011a4:	74 05                	je     4011ab <initialize_target+0x17b>
  4011a6:	e8 45 fb ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  4011ab:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
  4011b2:	5b                   	pop    %rbx
  4011b3:	5d                   	pop    %rbp
  4011b4:	c3                   	retq   

00000000004011b5 <main>:
  4011b5:	41 56                	push   %r14
  4011b7:	41 55                	push   %r13
  4011b9:	41 54                	push   %r12
  4011bb:	55                   	push   %rbp
  4011bc:	53                   	push   %rbx
  4011bd:	41 89 fc             	mov    %edi,%r12d
  4011c0:	48 89 f3             	mov    %rsi,%rbx
  4011c3:	be 59 1f 40 00       	mov    $0x401f59,%esi
  4011c8:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011cd:	e8 8e fb ff ff       	callq  400d60 <signal@plt>
  4011d2:	be 0b 1f 40 00       	mov    $0x401f0b,%esi
  4011d7:	bf 07 00 00 00       	mov    $0x7,%edi
  4011dc:	e8 7f fb ff ff       	callq  400d60 <signal@plt>
  4011e1:	be a7 1f 40 00       	mov    $0x401fa7,%esi
  4011e6:	bf 04 00 00 00       	mov    $0x4,%edi
  4011eb:	e8 70 fb ff ff       	callq  400d60 <signal@plt>
  4011f0:	83 3d 31 43 20 00 00 	cmpl   $0x0,0x204331(%rip)        # 605528 <is_checker>
  4011f7:	74 20                	je     401219 <main+0x64>
  4011f9:	be f5 1f 40 00       	mov    $0x401ff5,%esi
  4011fe:	bf 0e 00 00 00       	mov    $0xe,%edi
  401203:	e8 58 fb ff ff       	callq  400d60 <signal@plt>
  401208:	bf 05 00 00 00       	mov    $0x5,%edi
  40120d:	e8 0e fb ff ff       	callq  400d20 <alarm@plt>
  401212:	bd 8a 31 40 00       	mov    $0x40318a,%ebp
  401217:	eb 05                	jmp    40121e <main+0x69>
  401219:	bd 85 31 40 00       	mov    $0x403185,%ebp
  40121e:	48 8b 05 9b 42 20 00 	mov    0x20429b(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401225:	48 89 05 e4 42 20 00 	mov    %rax,0x2042e4(%rip)        # 605510 <infile>
  40122c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401232:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401238:	e9 c6 00 00 00       	jmpq   401303 <main+0x14e>
  40123d:	83 e8 61             	sub    $0x61,%eax
  401240:	3c 10                	cmp    $0x10,%al
  401242:	0f 87 9c 00 00 00    	ja     4012e4 <main+0x12f>
  401248:	0f b6 c0             	movzbl %al,%eax
  40124b:	ff 24 c5 d8 31 40 00 	jmpq   *0x4031d8(,%rax,8)
  401252:	48 8b 3b             	mov    (%rbx),%rdi
  401255:	e8 4c fd ff ff       	callq  400fa6 <usage>
  40125a:	be 5d 34 40 00       	mov    $0x40345d,%esi
  40125f:	48 8b 3d 62 42 20 00 	mov    0x204262(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  401266:	e8 a5 fb ff ff       	callq  400e10 <fopen@plt>
  40126b:	48 89 05 9e 42 20 00 	mov    %rax,0x20429e(%rip)        # 605510 <infile>
  401272:	48 85 c0             	test   %rax,%rax
  401275:	0f 85 88 00 00 00    	jne    401303 <main+0x14e>
  40127b:	48 8b 0d 46 42 20 00 	mov    0x204246(%rip),%rcx        # 6054c8 <optarg@@GLIBC_2.2.5>
  401282:	ba 92 31 40 00       	mov    $0x403192,%edx
  401287:	be 01 00 00 00       	mov    $0x1,%esi
  40128c:	48 8b 3d 4d 42 20 00 	mov    0x20424d(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  401293:	e8 d8 fb ff ff       	callq  400e70 <__fprintf_chk@plt>
  401298:	b8 01 00 00 00       	mov    $0x1,%eax
  40129d:	e9 ee 00 00 00       	jmpq   401390 <main+0x1db>
  4012a2:	ba 10 00 00 00       	mov    $0x10,%edx
  4012a7:	be 00 00 00 00       	mov    $0x0,%esi
  4012ac:	48 8b 3d 15 42 20 00 	mov    0x204215(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012b3:	e8 78 fb ff ff       	callq  400e30 <strtoul@plt>
  4012b8:	41 89 c6             	mov    %eax,%r14d
  4012bb:	eb 46                	jmp    401303 <main+0x14e>
  4012bd:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012c2:	be 00 00 00 00       	mov    $0x0,%esi
  4012c7:	48 8b 3d fa 41 20 00 	mov    0x2041fa(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012ce:	e8 bd fa ff ff       	callq  400d90 <strtol@plt>
  4012d3:	41 89 c5             	mov    %eax,%r13d
  4012d6:	eb 2b                	jmp    401303 <main+0x14e>
  4012d8:	c7 05 c6 41 20 00 00 	movl   $0x0,0x2041c6(%rip)        # 6054a8 <notify>
  4012df:	00 00 00 
  4012e2:	eb 1f                	jmp    401303 <main+0x14e>
  4012e4:	0f be d2             	movsbl %dl,%edx
  4012e7:	be af 31 40 00       	mov    $0x4031af,%esi
  4012ec:	bf 01 00 00 00       	mov    $0x1,%edi
  4012f1:	b8 00 00 00 00       	mov    $0x0,%eax
  4012f6:	e8 05 fb ff ff       	callq  400e00 <__printf_chk@plt>
  4012fb:	48 8b 3b             	mov    (%rbx),%rdi
  4012fe:	e8 a3 fc ff ff       	callq  400fa6 <usage>
  401303:	48 89 ea             	mov    %rbp,%rdx
  401306:	48 89 de             	mov    %rbx,%rsi
  401309:	44 89 e7             	mov    %r12d,%edi
  40130c:	e8 0f fb ff ff       	callq  400e20 <getopt@plt>
  401311:	89 c2                	mov    %eax,%edx
  401313:	3c ff                	cmp    $0xff,%al
  401315:	0f 85 22 ff ff ff    	jne    40123d <main+0x88>
  40131b:	be 01 00 00 00       	mov    $0x1,%esi
  401320:	44 89 ef             	mov    %r13d,%edi
  401323:	e8 08 fd ff ff       	callq  401030 <initialize_target>
  401328:	83 3d f9 41 20 00 00 	cmpl   $0x0,0x2041f9(%rip)        # 605528 <is_checker>
  40132f:	74 2a                	je     40135b <main+0x1a6>
  401331:	44 3b 35 e8 41 20 00 	cmp    0x2041e8(%rip),%r14d        # 605520 <authkey>
  401338:	74 21                	je     40135b <main+0x1a6>
  40133a:	44 89 f2             	mov    %r14d,%edx
  40133d:	be e8 30 40 00       	mov    $0x4030e8,%esi
  401342:	bf 01 00 00 00       	mov    $0x1,%edi
  401347:	b8 00 00 00 00       	mov    $0x0,%eax
  40134c:	e8 af fa ff ff       	callq  400e00 <__printf_chk@plt>
  401351:	b8 00 00 00 00       	mov    $0x0,%eax
  401356:	e8 4c 08 00 00       	callq  401ba7 <check_fail>
  40135b:	8b 15 c3 41 20 00    	mov    0x2041c3(%rip),%edx        # 605524 <cookie>
  401361:	be c2 31 40 00       	mov    $0x4031c2,%esi
  401366:	bf 01 00 00 00       	mov    $0x1,%edi
  40136b:	b8 00 00 00 00       	mov    $0x0,%eax
  401370:	e8 8b fa ff ff       	callq  400e00 <__printf_chk@plt>
  401375:	bf d0 31 40 00       	mov    $0x4031d0,%edi
  40137a:	e8 51 f9 ff ff       	callq  400cd0 <puts@plt>
  40137f:	48 8b 3d 1a 41 20 00 	mov    0x20411a(%rip),%rdi        # 6054a0 <buf_offset>
  401386:	e8 bd 0c 00 00       	callq  402048 <launch>
  40138b:	b8 00 00 00 00       	mov    $0x0,%eax
  401390:	5b                   	pop    %rbx
  401391:	5d                   	pop    %rbp
  401392:	41 5c                	pop    %r12
  401394:	41 5d                	pop    %r13
  401396:	41 5e                	pop    %r14
  401398:	c3                   	retq   

0000000000401399 <scramble>:
  401399:	48 83 ec 38          	sub    $0x38,%rsp
  40139d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4013a4:	00 00 
  4013a6:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4013ab:	31 c0                	xor    %eax,%eax
  4013ad:	eb 10                	jmp    4013bf <scramble+0x26>
  4013af:	69 d0 3f f2 00 00    	imul   $0xf23f,%eax,%edx
  4013b5:	01 fa                	add    %edi,%edx
  4013b7:	89 c1                	mov    %eax,%ecx
  4013b9:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
  4013bc:	83 c0 01             	add    $0x1,%eax
  4013bf:	83 f8 09             	cmp    $0x9,%eax
  4013c2:	76 eb                	jbe    4013af <scramble+0x16>
  4013c4:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4013c8:	69 c0 7a c2 00 00    	imul   $0xc27a,%eax,%eax
  4013ce:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4013d2:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4013d6:	69 c0 bc c5 00 00    	imul   $0xc5bc,%eax,%eax
  4013dc:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4013e0:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4013e4:	69 c0 c4 8b 00 00    	imul   $0x8bc4,%eax,%eax
  4013ea:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4013ee:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4013f2:	69 c0 22 46 00 00    	imul   $0x4622,%eax,%eax
  4013f8:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4013fc:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401400:	69 c0 4f a7 00 00    	imul   $0xa74f,%eax,%eax
  401406:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40140a:	8b 44 24 20          	mov    0x20(%rsp),%eax
  40140e:	69 c0 e7 71 00 00    	imul   $0x71e7,%eax,%eax
  401414:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401418:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40141c:	69 c0 14 0e 00 00    	imul   $0xe14,%eax,%eax
  401422:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401426:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40142a:	69 c0 9b 14 00 00    	imul   $0x149b,%eax,%eax
  401430:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401434:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401438:	69 c0 e2 a1 00 00    	imul   $0xa1e2,%eax,%eax
  40143e:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401442:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401446:	69 c0 b8 18 00 00    	imul   $0x18b8,%eax,%eax
  40144c:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401450:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401454:	69 c0 4b 93 00 00    	imul   $0x934b,%eax,%eax
  40145a:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40145e:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401462:	69 c0 50 cc 00 00    	imul   $0xcc50,%eax,%eax
  401468:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40146c:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401470:	69 c0 1b 8d 00 00    	imul   $0x8d1b,%eax,%eax
  401476:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40147a:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40147e:	69 c0 ce 62 00 00    	imul   $0x62ce,%eax,%eax
  401484:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401488:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40148c:	69 c0 4a 1b 00 00    	imul   $0x1b4a,%eax,%eax
  401492:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401496:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40149a:	69 c0 de 60 00 00    	imul   $0x60de,%eax,%eax
  4014a0:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4014a4:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4014a8:	69 c0 3a 7a 00 00    	imul   $0x7a3a,%eax,%eax
  4014ae:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4014b2:	8b 04 24             	mov    (%rsp),%eax
  4014b5:	69 c0 c8 08 00 00    	imul   $0x8c8,%eax,%eax
  4014bb:	89 04 24             	mov    %eax,(%rsp)
  4014be:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4014c2:	69 c0 1f 86 00 00    	imul   $0x861f,%eax,%eax
  4014c8:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4014cc:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4014d0:	69 c0 75 59 00 00    	imul   $0x5975,%eax,%eax
  4014d6:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4014da:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4014de:	69 c0 ce 36 00 00    	imul   $0x36ce,%eax,%eax
  4014e4:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4014e8:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4014ec:	69 c0 09 e7 00 00    	imul   $0xe709,%eax,%eax
  4014f2:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4014f6:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4014fa:	69 c0 ae f1 00 00    	imul   $0xf1ae,%eax,%eax
  401500:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401504:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401508:	6b c0 6e             	imul   $0x6e,%eax,%eax
  40150b:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40150f:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401513:	69 c0 0b 06 00 00    	imul   $0x60b,%eax,%eax
  401519:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40151d:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401521:	69 c0 11 25 00 00    	imul   $0x2511,%eax,%eax
  401527:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40152b:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40152f:	69 c0 16 97 00 00    	imul   $0x9716,%eax,%eax
  401535:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401539:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40153d:	69 c0 e7 d9 00 00    	imul   $0xd9e7,%eax,%eax
  401543:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401547:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40154b:	69 c0 f3 f5 00 00    	imul   $0xf5f3,%eax,%eax
  401551:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401555:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401559:	69 c0 d0 92 00 00    	imul   $0x92d0,%eax,%eax
  40155f:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401563:	8b 04 24             	mov    (%rsp),%eax
  401566:	69 c0 56 3f 00 00    	imul   $0x3f56,%eax,%eax
  40156c:	89 04 24             	mov    %eax,(%rsp)
  40156f:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401573:	69 c0 01 ef 00 00    	imul   $0xef01,%eax,%eax
  401579:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40157d:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401581:	69 c0 48 1a 00 00    	imul   $0x1a48,%eax,%eax
  401587:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40158b:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40158f:	69 c0 8f bf 00 00    	imul   $0xbf8f,%eax,%eax
  401595:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401599:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40159d:	69 c0 b4 46 00 00    	imul   $0x46b4,%eax,%eax
  4015a3:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4015a7:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4015ab:	69 c0 d5 cd 00 00    	imul   $0xcdd5,%eax,%eax
  4015b1:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4015b5:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4015b9:	69 c0 61 e4 00 00    	imul   $0xe461,%eax,%eax
  4015bf:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4015c3:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4015c7:	69 c0 64 c2 00 00    	imul   $0xc264,%eax,%eax
  4015cd:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4015d1:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4015d5:	69 c0 82 b0 00 00    	imul   $0xb082,%eax,%eax
  4015db:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4015df:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4015e3:	69 c0 a0 69 00 00    	imul   $0x69a0,%eax,%eax
  4015e9:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4015ed:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4015f1:	69 c0 f9 db 00 00    	imul   $0xdbf9,%eax,%eax
  4015f7:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4015fb:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4015ff:	69 c0 e4 4f 00 00    	imul   $0x4fe4,%eax,%eax
  401605:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401609:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40160d:	69 c0 14 80 00 00    	imul   $0x8014,%eax,%eax
  401613:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401617:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40161b:	69 c0 40 97 00 00    	imul   $0x9740,%eax,%eax
  401621:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401625:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401629:	69 c0 80 66 00 00    	imul   $0x6680,%eax,%eax
  40162f:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401633:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401637:	69 c0 45 87 00 00    	imul   $0x8745,%eax,%eax
  40163d:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401641:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401645:	69 c0 be 1d 00 00    	imul   $0x1dbe,%eax,%eax
  40164b:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40164f:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401653:	69 c0 68 5f 00 00    	imul   $0x5f68,%eax,%eax
  401659:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40165d:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401661:	69 c0 10 6e 00 00    	imul   $0x6e10,%eax,%eax
  401667:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40166b:	8b 44 24 20          	mov    0x20(%rsp),%eax
  40166f:	69 c0 6d d8 00 00    	imul   $0xd86d,%eax,%eax
  401675:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401679:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40167d:	69 c0 fc 37 00 00    	imul   $0x37fc,%eax,%eax
  401683:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401687:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40168b:	69 c0 46 32 00 00    	imul   $0x3246,%eax,%eax
  401691:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401695:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401699:	69 c0 21 5b 00 00    	imul   $0x5b21,%eax,%eax
  40169f:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4016a3:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4016a7:	69 c0 6e f2 00 00    	imul   $0xf26e,%eax,%eax
  4016ad:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4016b1:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4016b5:	69 c0 7d b7 00 00    	imul   $0xb77d,%eax,%eax
  4016bb:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4016bf:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4016c3:	69 c0 31 c2 00 00    	imul   $0xc231,%eax,%eax
  4016c9:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4016cd:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4016d1:	69 c0 c0 ea 00 00    	imul   $0xeac0,%eax,%eax
  4016d7:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4016db:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4016df:	69 c0 85 06 00 00    	imul   $0x685,%eax,%eax
  4016e5:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4016e9:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4016ed:	69 c0 e1 3b 00 00    	imul   $0x3be1,%eax,%eax
  4016f3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4016f7:	8b 04 24             	mov    (%rsp),%eax
  4016fa:	69 c0 dc e0 00 00    	imul   $0xe0dc,%eax,%eax
  401700:	89 04 24             	mov    %eax,(%rsp)
  401703:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401707:	69 c0 d5 c7 00 00    	imul   $0xc7d5,%eax,%eax
  40170d:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401711:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401715:	69 c0 39 48 00 00    	imul   $0x4839,%eax,%eax
  40171b:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40171f:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401723:	69 c0 67 de 00 00    	imul   $0xde67,%eax,%eax
  401729:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40172d:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401731:	69 c0 99 1d 00 00    	imul   $0x1d99,%eax,%eax
  401737:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40173b:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40173f:	69 c0 98 c6 00 00    	imul   $0xc698,%eax,%eax
  401745:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401749:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40174d:	69 c0 3b 01 00 00    	imul   $0x13b,%eax,%eax
  401753:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401757:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40175b:	69 c0 48 9c 00 00    	imul   $0x9c48,%eax,%eax
  401761:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401765:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401769:	69 c0 f3 1a 00 00    	imul   $0x1af3,%eax,%eax
  40176f:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401773:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401777:	69 c0 2c 28 00 00    	imul   $0x282c,%eax,%eax
  40177d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401781:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401785:	69 c0 0d 03 00 00    	imul   $0x30d,%eax,%eax
  40178b:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40178f:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401793:	69 c0 6f 69 00 00    	imul   $0x696f,%eax,%eax
  401799:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40179d:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4017a1:	69 c0 1f 73 00 00    	imul   $0x731f,%eax,%eax
  4017a7:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4017ab:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4017af:	69 c0 54 d7 00 00    	imul   $0xd754,%eax,%eax
  4017b5:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4017b9:	8b 04 24             	mov    (%rsp),%eax
  4017bc:	69 c0 04 bf 00 00    	imul   $0xbf04,%eax,%eax
  4017c2:	89 04 24             	mov    %eax,(%rsp)
  4017c5:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4017c9:	69 c0 69 17 00 00    	imul   $0x1769,%eax,%eax
  4017cf:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4017d3:	8b 04 24             	mov    (%rsp),%eax
  4017d6:	69 c0 98 b5 00 00    	imul   $0xb598,%eax,%eax
  4017dc:	89 04 24             	mov    %eax,(%rsp)
  4017df:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4017e3:	89 c2                	mov    %eax,%edx
  4017e5:	c1 e2 0b             	shl    $0xb,%edx
  4017e8:	01 d0                	add    %edx,%eax
  4017ea:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4017ee:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4017f2:	69 c0 d1 c4 00 00    	imul   $0xc4d1,%eax,%eax
  4017f8:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4017fc:	ba 00 00 00 00       	mov    $0x0,%edx
  401801:	b8 00 00 00 00       	mov    $0x0,%eax
  401806:	eb 0a                	jmp    401812 <scramble+0x479>
  401808:	89 d1                	mov    %edx,%ecx
  40180a:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
  40180d:	01 c8                	add    %ecx,%eax
  40180f:	83 c2 01             	add    $0x1,%edx
  401812:	83 fa 09             	cmp    $0x9,%edx
  401815:	76 f1                	jbe    401808 <scramble+0x46f>
  401817:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  40181c:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  401823:	00 00 
  401825:	74 05                	je     40182c <scramble+0x493>
  401827:	e8 c4 f4 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  40182c:	48 83 c4 38          	add    $0x38,%rsp
  401830:	c3                   	retq   

0000000000401831 <getbuf>:
  401831:	48 83 ec 38          	sub    $0x38,%rsp
  401835:	48 89 e7             	mov    %rsp,%rdi
  401838:	e8 9f 03 00 00       	callq  401bdc <Gets>
  40183d:	b8 01 00 00 00       	mov    $0x1,%eax
  401842:	48 83 c4 38          	add    $0x38,%rsp
  401846:	c3                   	retq   

0000000000401847 <touch1>:
  401847:	48 83 ec 08          	sub    $0x8,%rsp
  40184b:	c7 05 c7 3c 20 00 01 	movl   $0x1,0x203cc7(%rip)        # 60551c <vlevel>
  401852:	00 00 00 
  401855:	bf b2 32 40 00       	mov    $0x4032b2,%edi
  40185a:	e8 71 f4 ff ff       	callq  400cd0 <puts@plt>
  40185f:	bf 01 00 00 00       	mov    $0x1,%edi
  401864:	e8 b8 05 00 00       	callq  401e21 <validate>
  401869:	bf 00 00 00 00       	mov    $0x0,%edi
  40186e:	e8 dd f5 ff ff       	callq  400e50 <exit@plt>

0000000000401873 <touch2>:
  401873:	48 83 ec 08          	sub    $0x8,%rsp
  401877:	89 fa                	mov    %edi,%edx
  401879:	c7 05 99 3c 20 00 02 	movl   $0x2,0x203c99(%rip)        # 60551c <vlevel>
  401880:	00 00 00 
  401883:	39 3d 9b 3c 20 00    	cmp    %edi,0x203c9b(%rip)        # 605524 <cookie>
  401889:	75 20                	jne    4018ab <touch2+0x38>
  40188b:	be d8 32 40 00       	mov    $0x4032d8,%esi
  401890:	bf 01 00 00 00       	mov    $0x1,%edi
  401895:	b8 00 00 00 00       	mov    $0x0,%eax
  40189a:	e8 61 f5 ff ff       	callq  400e00 <__printf_chk@plt>
  40189f:	bf 02 00 00 00       	mov    $0x2,%edi
  4018a4:	e8 78 05 00 00       	callq  401e21 <validate>
  4018a9:	eb 1e                	jmp    4018c9 <touch2+0x56>
  4018ab:	be 00 33 40 00       	mov    $0x403300,%esi
  4018b0:	bf 01 00 00 00       	mov    $0x1,%edi
  4018b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4018ba:	e8 41 f5 ff ff       	callq  400e00 <__printf_chk@plt>
  4018bf:	bf 02 00 00 00       	mov    $0x2,%edi
  4018c4:	e8 1a 06 00 00       	callq  401ee3 <fail>
  4018c9:	bf 00 00 00 00       	mov    $0x0,%edi
  4018ce:	e8 7d f5 ff ff       	callq  400e50 <exit@plt>

00000000004018d3 <hexmatch>:
  4018d3:	41 54                	push   %r12
  4018d5:	55                   	push   %rbp
  4018d6:	53                   	push   %rbx
  4018d7:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  4018db:	89 fd                	mov    %edi,%ebp
  4018dd:	48 89 f3             	mov    %rsi,%rbx
  4018e0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4018e7:	00 00 
  4018e9:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  4018ee:	31 c0                	xor    %eax,%eax
  4018f0:	e8 cb f4 ff ff       	callq  400dc0 <random@plt>
  4018f5:	48 89 c1             	mov    %rax,%rcx
  4018f8:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  4018ff:	0a d7 a3 
  401902:	48 f7 ea             	imul   %rdx
  401905:	48 01 ca             	add    %rcx,%rdx
  401908:	48 c1 fa 06          	sar    $0x6,%rdx
  40190c:	48 89 c8             	mov    %rcx,%rax
  40190f:	48 c1 f8 3f          	sar    $0x3f,%rax
  401913:	48 29 c2             	sub    %rax,%rdx
  401916:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  40191a:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  40191e:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  401925:	00 
  401926:	48 29 c1             	sub    %rax,%rcx
  401929:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  40192d:	41 89 e8             	mov    %ebp,%r8d
  401930:	b9 cf 32 40 00       	mov    $0x4032cf,%ecx
  401935:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40193c:	be 01 00 00 00       	mov    $0x1,%esi
  401941:	4c 89 e7             	mov    %r12,%rdi
  401944:	b8 00 00 00 00       	mov    $0x0,%eax
  401949:	e8 32 f5 ff ff       	callq  400e80 <__sprintf_chk@plt>
  40194e:	ba 09 00 00 00       	mov    $0x9,%edx
  401953:	4c 89 e6             	mov    %r12,%rsi
  401956:	48 89 df             	mov    %rbx,%rdi
  401959:	e8 52 f3 ff ff       	callq  400cb0 <strncmp@plt>
  40195e:	85 c0                	test   %eax,%eax
  401960:	0f 94 c0             	sete   %al
  401963:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
  401968:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  40196f:	00 00 
  401971:	74 05                	je     401978 <hexmatch+0xa5>
  401973:	e8 78 f3 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  401978:	0f b6 c0             	movzbl %al,%eax
  40197b:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  40197f:	5b                   	pop    %rbx
  401980:	5d                   	pop    %rbp
  401981:	41 5c                	pop    %r12
  401983:	c3                   	retq   

0000000000401984 <touch3>:
  401984:	53                   	push   %rbx
  401985:	48 89 fb             	mov    %rdi,%rbx
  401988:	c7 05 8a 3b 20 00 03 	movl   $0x3,0x203b8a(%rip)        # 60551c <vlevel>
  40198f:	00 00 00 
  401992:	48 89 fe             	mov    %rdi,%rsi
  401995:	8b 3d 89 3b 20 00    	mov    0x203b89(%rip),%edi        # 605524 <cookie>
  40199b:	e8 33 ff ff ff       	callq  4018d3 <hexmatch>
  4019a0:	85 c0                	test   %eax,%eax
  4019a2:	74 23                	je     4019c7 <touch3+0x43>
  4019a4:	48 89 da             	mov    %rbx,%rdx
  4019a7:	be 28 33 40 00       	mov    $0x403328,%esi
  4019ac:	bf 01 00 00 00       	mov    $0x1,%edi
  4019b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4019b6:	e8 45 f4 ff ff       	callq  400e00 <__printf_chk@plt>
  4019bb:	bf 03 00 00 00       	mov    $0x3,%edi
  4019c0:	e8 5c 04 00 00       	callq  401e21 <validate>
  4019c5:	eb 21                	jmp    4019e8 <touch3+0x64>
  4019c7:	48 89 da             	mov    %rbx,%rdx
  4019ca:	be 50 33 40 00       	mov    $0x403350,%esi
  4019cf:	bf 01 00 00 00       	mov    $0x1,%edi
  4019d4:	b8 00 00 00 00       	mov    $0x0,%eax
  4019d9:	e8 22 f4 ff ff       	callq  400e00 <__printf_chk@plt>
  4019de:	bf 03 00 00 00       	mov    $0x3,%edi
  4019e3:	e8 fb 04 00 00       	callq  401ee3 <fail>
  4019e8:	bf 00 00 00 00       	mov    $0x0,%edi
  4019ed:	e8 5e f4 ff ff       	callq  400e50 <exit@plt>

00000000004019f2 <test>:
  4019f2:	48 83 ec 08          	sub    $0x8,%rsp
  4019f6:	b8 00 00 00 00       	mov    $0x0,%eax
  4019fb:	e8 31 fe ff ff       	callq  401831 <getbuf>
  401a00:	89 c2                	mov    %eax,%edx
  401a02:	be 78 33 40 00       	mov    $0x403378,%esi
  401a07:	bf 01 00 00 00       	mov    $0x1,%edi
  401a0c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a11:	e8 ea f3 ff ff       	callq  400e00 <__printf_chk@plt>
  401a16:	48 83 c4 08          	add    $0x8,%rsp
  401a1a:	c3                   	retq   

0000000000401a1b <start_farm>:
  401a1b:	b8 01 00 00 00       	mov    $0x1,%eax
  401a20:	c3                   	retq   

0000000000401a21 <addval_481>:
  401a21:	8d 87 48 8b c7 c3    	lea    -0x3c3874b8(%rdi),%eax
  401a27:	c3                   	retq   

0000000000401a28 <addval_336>:
  401a28:	8d 87 48 89 c7 c2    	lea    -0x3d3876b8(%rdi),%eax
  401a2e:	c3                   	retq   

0000000000401a2f <addval_372>:
  401a2f:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  401a35:	c3                   	retq   

0000000000401a36 <addval_464>:
  401a36:	8d 87 dd 58 c3 4d    	lea    0x4dc358dd(%rdi),%eax
  401a3c:	c3                   	retq   

0000000000401a3d <addval_444>:
  401a3d:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  401a43:	c3                   	retq   

0000000000401a44 <addval_441>:
  401a44:	8d 87 81 fa 18 90    	lea    -0x6fe7057f(%rdi),%eax
  401a4a:	c3                   	retq   

0000000000401a4b <getval_466>:
  401a4b:	b8 58 c1 1e fb       	mov    $0xfb1ec158,%eax
  401a50:	c3                   	retq   

0000000000401a51 <getval_211>:
  401a51:	b8 00 58 90 c3       	mov    $0xc3905800,%eax
  401a56:	c3                   	retq   

0000000000401a57 <mid_farm>:
  401a57:	b8 01 00 00 00       	mov    $0x1,%eax
  401a5c:	c3                   	retq   

0000000000401a5d <add_xy>:
  401a5d:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401a61:	c3                   	retq   

0000000000401a62 <setval_174>:
  401a62:	c7 07 48 89 e0 92    	movl   $0x92e08948,(%rdi)
  401a68:	c3                   	retq   

0000000000401a69 <setval_496>:
  401a69:	c7 07 89 d6 84 c0    	movl   $0xc084d689,(%rdi)
  401a6f:	c3                   	retq   

0000000000401a70 <addval_475>:
  401a70:	8d 87 89 c1 84 d2    	lea    -0x2d7b3e77(%rdi),%eax
  401a76:	c3                   	retq   

0000000000401a77 <addval_448>:
  401a77:	8d 87 48 8b e0 c3    	lea    -0x3c1f74b8(%rdi),%eax
  401a7d:	c3                   	retq   

0000000000401a7e <setval_313>:
  401a7e:	c7 07 89 c1 38 c9    	movl   $0xc938c189,(%rdi)
  401a84:	c3                   	retq   

0000000000401a85 <addval_391>:
  401a85:	8d 87 89 d6 18 c0    	lea    -0x3fe72977(%rdi),%eax
  401a8b:	c3                   	retq   

0000000000401a8c <setval_440>:
  401a8c:	c7 07 89 ca 90 c3    	movl   $0xc390ca89,(%rdi)
  401a92:	c3                   	retq   

0000000000401a93 <setval_377>:
  401a93:	c7 07 89 ca 94 90    	movl   $0x9094ca89,(%rdi)
  401a99:	c3                   	retq   

0000000000401a9a <addval_331>:
  401a9a:	8d 87 89 d6 84 d2    	lea    -0x2d7b2977(%rdi),%eax
  401aa0:	c3                   	retq   

0000000000401aa1 <addval_468>:
  401aa1:	8d 87 89 ca 18 c9    	lea    -0x36e73577(%rdi),%eax
  401aa7:	c3                   	retq   

0000000000401aa8 <setval_439>:
  401aa8:	c7 07 89 d6 30 d2    	movl   $0xd230d689,(%rdi)
  401aae:	c3                   	retq   

0000000000401aaf <getval_486>:
  401aaf:	b8 6f 88 c1 90       	mov    $0x90c1886f,%eax
  401ab4:	c3                   	retq   

0000000000401ab5 <setval_135>:
  401ab5:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  401abb:	c3                   	retq   

0000000000401abc <addval_222>:
  401abc:	8d 87 6a ee a9 c1    	lea    -0x3e561196(%rdi),%eax
  401ac2:	c3                   	retq   

0000000000401ac3 <getval_489>:
  401ac3:	b8 89 c1 c2 20       	mov    $0x20c2c189,%eax
  401ac8:	c3                   	retq   

0000000000401ac9 <getval_197>:
  401ac9:	b8 c9 c1 20 c0       	mov    $0xc020c1c9,%eax
  401ace:	c3                   	retq   

0000000000401acf <addval_203>:
  401acf:	8d 87 c8 89 e0 c3    	lea    -0x3c1f7638(%rdi),%eax
  401ad5:	c3                   	retq   

0000000000401ad6 <getval_364>:
  401ad6:	b8 48 88 e0 90       	mov    $0x90e08848,%eax
  401adb:	c3                   	retq   

0000000000401adc <getval_461>:
  401adc:	b8 09 d6 08 c0       	mov    $0xc008d609,%eax
  401ae1:	c3                   	retq   

0000000000401ae2 <addval_138>:
  401ae2:	8d 87 8b c1 c3 ad    	lea    -0x523c3e75(%rdi),%eax
  401ae8:	c3                   	retq   

0000000000401ae9 <getval_207>:
  401ae9:	b8 89 d6 a4 db       	mov    $0xdba4d689,%eax
  401aee:	c3                   	retq   

0000000000401aef <getval_254>:
  401aef:	b8 88 d6 08 db       	mov    $0xdb08d688,%eax
  401af4:	c3                   	retq   

0000000000401af5 <setval_167>:
  401af5:	c7 07 89 d6 18 db    	movl   $0xdb18d689,(%rdi)
  401afb:	c3                   	retq   

0000000000401afc <getval_268>:
  401afc:	b8 89 ca 78 d2       	mov    $0xd278ca89,%eax
  401b01:	c3                   	retq   

0000000000401b02 <getval_446>:
  401b02:	b8 48 89 e0 91       	mov    $0x91e08948,%eax
  401b07:	c3                   	retq   

0000000000401b08 <addval_410>:
  401b08:	8d 87 48 89 e0 90    	lea    -0x6f1f76b8(%rdi),%eax
  401b0e:	c3                   	retq   

0000000000401b0f <getval_412>:
  401b0f:	b8 88 ca 84 c9       	mov    $0xc984ca88,%eax
  401b14:	c3                   	retq   

0000000000401b15 <getval_422>:
  401b15:	b8 48 89 e0 c1       	mov    $0xc1e08948,%eax
  401b1a:	c3                   	retq   

0000000000401b1b <getval_397>:
  401b1b:	b8 40 89 c1 c7       	mov    $0xc7c18940,%eax
  401b20:	c3                   	retq   

0000000000401b21 <setval_194>:
  401b21:	c7 07 99 ca 38 db    	movl   $0xdb38ca99,(%rdi)
  401b27:	c3                   	retq   

0000000000401b28 <addval_131>:
  401b28:	8d 87 89 ca 38 c0    	lea    -0x3fc73577(%rdi),%eax
  401b2e:	c3                   	retq   

0000000000401b2f <setval_385>:
  401b2f:	c7 07 8b ca 08 c9    	movl   $0xc908ca8b,(%rdi)
  401b35:	c3                   	retq   

0000000000401b36 <end_farm>:
  401b36:	b8 01 00 00 00       	mov    $0x1,%eax
  401b3b:	c3                   	retq   

0000000000401b3c <save_char>:
  401b3c:	8b 05 02 46 20 00    	mov    0x204602(%rip),%eax        # 606144 <gets_cnt>
  401b42:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401b47:	7f 49                	jg     401b92 <save_char+0x56>
  401b49:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401b4c:	89 f9                	mov    %edi,%ecx
  401b4e:	c0 e9 04             	shr    $0x4,%cl
  401b51:	83 e1 0f             	and    $0xf,%ecx
  401b54:	0f b6 b1 a0 36 40 00 	movzbl 0x4036a0(%rcx),%esi
  401b5b:	48 63 ca             	movslq %edx,%rcx
  401b5e:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401b65:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401b68:	83 e7 0f             	and    $0xf,%edi
  401b6b:	0f b6 b7 a0 36 40 00 	movzbl 0x4036a0(%rdi),%esi
  401b72:	48 63 c9             	movslq %ecx,%rcx
  401b75:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401b7c:	83 c2 02             	add    $0x2,%edx
  401b7f:	48 63 d2             	movslq %edx,%rdx
  401b82:	c6 82 40 55 60 00 20 	movb   $0x20,0x605540(%rdx)
  401b89:	83 c0 01             	add    $0x1,%eax
  401b8c:	89 05 b2 45 20 00    	mov    %eax,0x2045b2(%rip)        # 606144 <gets_cnt>
  401b92:	f3 c3                	repz retq 

0000000000401b94 <save_term>:
  401b94:	8b 05 aa 45 20 00    	mov    0x2045aa(%rip),%eax        # 606144 <gets_cnt>
  401b9a:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401b9d:	48 98                	cltq   
  401b9f:	c6 80 40 55 60 00 00 	movb   $0x0,0x605540(%rax)
  401ba6:	c3                   	retq   

0000000000401ba7 <check_fail>:
  401ba7:	48 83 ec 08          	sub    $0x8,%rsp
  401bab:	0f be 15 96 45 20 00 	movsbl 0x204596(%rip),%edx        # 606148 <target_prefix>
  401bb2:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401bb8:	8b 0d 5a 39 20 00    	mov    0x20395a(%rip),%ecx        # 605518 <check_level>
  401bbe:	be 9b 33 40 00       	mov    $0x40339b,%esi
  401bc3:	bf 01 00 00 00       	mov    $0x1,%edi
  401bc8:	b8 00 00 00 00       	mov    $0x0,%eax
  401bcd:	e8 2e f2 ff ff       	callq  400e00 <__printf_chk@plt>
  401bd2:	bf 01 00 00 00       	mov    $0x1,%edi
  401bd7:	e8 74 f2 ff ff       	callq  400e50 <exit@plt>

0000000000401bdc <Gets>:
  401bdc:	41 54                	push   %r12
  401bde:	55                   	push   %rbp
  401bdf:	53                   	push   %rbx
  401be0:	49 89 fc             	mov    %rdi,%r12
  401be3:	c7 05 57 45 20 00 00 	movl   $0x0,0x204557(%rip)        # 606144 <gets_cnt>
  401bea:	00 00 00 
  401bed:	48 89 fb             	mov    %rdi,%rbx
  401bf0:	eb 11                	jmp    401c03 <Gets+0x27>
  401bf2:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401bf6:	88 03                	mov    %al,(%rbx)
  401bf8:	0f b6 f8             	movzbl %al,%edi
  401bfb:	e8 3c ff ff ff       	callq  401b3c <save_char>
  401c00:	48 89 eb             	mov    %rbp,%rbx
  401c03:	48 8b 3d 06 39 20 00 	mov    0x203906(%rip),%rdi        # 605510 <infile>
  401c0a:	e8 c1 f1 ff ff       	callq  400dd0 <_IO_getc@plt>
  401c0f:	83 f8 ff             	cmp    $0xffffffff,%eax
  401c12:	74 05                	je     401c19 <Gets+0x3d>
  401c14:	83 f8 0a             	cmp    $0xa,%eax
  401c17:	75 d9                	jne    401bf2 <Gets+0x16>
  401c19:	c6 03 00             	movb   $0x0,(%rbx)
  401c1c:	b8 00 00 00 00       	mov    $0x0,%eax
  401c21:	e8 6e ff ff ff       	callq  401b94 <save_term>
  401c26:	4c 89 e0             	mov    %r12,%rax
  401c29:	5b                   	pop    %rbx
  401c2a:	5d                   	pop    %rbp
  401c2b:	41 5c                	pop    %r12
  401c2d:	c3                   	retq   

0000000000401c2e <notify_server>:
  401c2e:	53                   	push   %rbx
  401c2f:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401c36:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401c3d:	00 00 
  401c3f:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401c46:	00 
  401c47:	31 c0                	xor    %eax,%eax
  401c49:	83 3d d8 38 20 00 00 	cmpl   $0x0,0x2038d8(%rip)        # 605528 <is_checker>
  401c50:	0f 85 aa 01 00 00    	jne    401e00 <notify_server+0x1d2>
  401c56:	89 fb                	mov    %edi,%ebx
  401c58:	8b 05 e6 44 20 00    	mov    0x2044e6(%rip),%eax        # 606144 <gets_cnt>
  401c5e:	83 c0 64             	add    $0x64,%eax
  401c61:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401c66:	7e 1e                	jle    401c86 <notify_server+0x58>
  401c68:	be d0 34 40 00       	mov    $0x4034d0,%esi
  401c6d:	bf 01 00 00 00       	mov    $0x1,%edi
  401c72:	b8 00 00 00 00       	mov    $0x0,%eax
  401c77:	e8 84 f1 ff ff       	callq  400e00 <__printf_chk@plt>
  401c7c:	bf 01 00 00 00       	mov    $0x1,%edi
  401c81:	e8 ca f1 ff ff       	callq  400e50 <exit@plt>
  401c86:	0f be 05 bb 44 20 00 	movsbl 0x2044bb(%rip),%eax        # 606148 <target_prefix>
  401c8d:	83 3d 14 38 20 00 00 	cmpl   $0x0,0x203814(%rip)        # 6054a8 <notify>
  401c94:	74 08                	je     401c9e <notify_server+0x70>
  401c96:	8b 15 84 38 20 00    	mov    0x203884(%rip),%edx        # 605520 <authkey>
  401c9c:	eb 05                	jmp    401ca3 <notify_server+0x75>
  401c9e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401ca3:	85 db                	test   %ebx,%ebx
  401ca5:	74 08                	je     401caf <notify_server+0x81>
  401ca7:	41 b9 b1 33 40 00    	mov    $0x4033b1,%r9d
  401cad:	eb 06                	jmp    401cb5 <notify_server+0x87>
  401caf:	41 b9 b6 33 40 00    	mov    $0x4033b6,%r9d
  401cb5:	68 40 55 60 00       	pushq  $0x605540
  401cba:	56                   	push   %rsi
  401cbb:	50                   	push   %rax
  401cbc:	52                   	push   %rdx
  401cbd:	44 8b 05 a4 34 20 00 	mov    0x2034a4(%rip),%r8d        # 605168 <target_id>
  401cc4:	b9 bb 33 40 00       	mov    $0x4033bb,%ecx
  401cc9:	ba 00 20 00 00       	mov    $0x2000,%edx
  401cce:	be 01 00 00 00       	mov    $0x1,%esi
  401cd3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401cd8:	b8 00 00 00 00       	mov    $0x0,%eax
  401cdd:	e8 9e f1 ff ff       	callq  400e80 <__sprintf_chk@plt>
  401ce2:	48 83 c4 20          	add    $0x20,%rsp
  401ce6:	83 3d bb 37 20 00 00 	cmpl   $0x0,0x2037bb(%rip)        # 6054a8 <notify>
  401ced:	0f 84 81 00 00 00    	je     401d74 <notify_server+0x146>
  401cf3:	85 db                	test   %ebx,%ebx
  401cf5:	74 6e                	je     401d65 <notify_server+0x137>
  401cf7:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401cfe:	00 
  401cff:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401d05:	48 89 e1             	mov    %rsp,%rcx
  401d08:	48 8b 15 61 34 20 00 	mov    0x203461(%rip),%rdx        # 605170 <lab>
  401d0f:	48 8b 35 62 34 20 00 	mov    0x203462(%rip),%rsi        # 605178 <course>
  401d16:	48 8b 3d 43 34 20 00 	mov    0x203443(%rip),%rdi        # 605160 <user_id>
  401d1d:	e8 ef 10 00 00       	callq  402e11 <driver_post>
  401d22:	85 c0                	test   %eax,%eax
  401d24:	79 26                	jns    401d4c <notify_server+0x11e>
  401d26:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401d2d:	00 
  401d2e:	be d7 33 40 00       	mov    $0x4033d7,%esi
  401d33:	bf 01 00 00 00       	mov    $0x1,%edi
  401d38:	b8 00 00 00 00       	mov    $0x0,%eax
  401d3d:	e8 be f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401d42:	bf 01 00 00 00       	mov    $0x1,%edi
  401d47:	e8 04 f1 ff ff       	callq  400e50 <exit@plt>
  401d4c:	bf 00 35 40 00       	mov    $0x403500,%edi
  401d51:	e8 7a ef ff ff       	callq  400cd0 <puts@plt>
  401d56:	bf e3 33 40 00       	mov    $0x4033e3,%edi
  401d5b:	e8 70 ef ff ff       	callq  400cd0 <puts@plt>
  401d60:	e9 9b 00 00 00       	jmpq   401e00 <notify_server+0x1d2>
  401d65:	bf ed 33 40 00       	mov    $0x4033ed,%edi
  401d6a:	e8 61 ef ff ff       	callq  400cd0 <puts@plt>
  401d6f:	e9 8c 00 00 00       	jmpq   401e00 <notify_server+0x1d2>
  401d74:	85 db                	test   %ebx,%ebx
  401d76:	74 07                	je     401d7f <notify_server+0x151>
  401d78:	ba b1 33 40 00       	mov    $0x4033b1,%edx
  401d7d:	eb 05                	jmp    401d84 <notify_server+0x156>
  401d7f:	ba b6 33 40 00       	mov    $0x4033b6,%edx
  401d84:	be 38 35 40 00       	mov    $0x403538,%esi
  401d89:	bf 01 00 00 00       	mov    $0x1,%edi
  401d8e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d93:	e8 68 f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401d98:	48 8b 15 c1 33 20 00 	mov    0x2033c1(%rip),%rdx        # 605160 <user_id>
  401d9f:	be f4 33 40 00       	mov    $0x4033f4,%esi
  401da4:	bf 01 00 00 00       	mov    $0x1,%edi
  401da9:	b8 00 00 00 00       	mov    $0x0,%eax
  401dae:	e8 4d f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401db3:	48 8b 15 be 33 20 00 	mov    0x2033be(%rip),%rdx        # 605178 <course>
  401dba:	be 01 34 40 00       	mov    $0x403401,%esi
  401dbf:	bf 01 00 00 00       	mov    $0x1,%edi
  401dc4:	b8 00 00 00 00       	mov    $0x0,%eax
  401dc9:	e8 32 f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401dce:	48 8b 15 9b 33 20 00 	mov    0x20339b(%rip),%rdx        # 605170 <lab>
  401dd5:	be 0d 34 40 00       	mov    $0x40340d,%esi
  401dda:	bf 01 00 00 00       	mov    $0x1,%edi
  401ddf:	b8 00 00 00 00       	mov    $0x0,%eax
  401de4:	e8 17 f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401de9:	48 89 e2             	mov    %rsp,%rdx
  401dec:	be 16 34 40 00       	mov    $0x403416,%esi
  401df1:	bf 01 00 00 00       	mov    $0x1,%edi
  401df6:	b8 00 00 00 00       	mov    $0x0,%eax
  401dfb:	e8 00 f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401e00:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401e07:	00 
  401e08:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401e0f:	00 00 
  401e11:	74 05                	je     401e18 <notify_server+0x1ea>
  401e13:	e8 d8 ee ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  401e18:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401e1f:	5b                   	pop    %rbx
  401e20:	c3                   	retq   

0000000000401e21 <validate>:
  401e21:	53                   	push   %rbx
  401e22:	89 fb                	mov    %edi,%ebx
  401e24:	83 3d fd 36 20 00 00 	cmpl   $0x0,0x2036fd(%rip)        # 605528 <is_checker>
  401e2b:	74 6b                	je     401e98 <validate+0x77>
  401e2d:	39 3d e9 36 20 00    	cmp    %edi,0x2036e9(%rip)        # 60551c <vlevel>
  401e33:	74 14                	je     401e49 <validate+0x28>
  401e35:	bf 22 34 40 00       	mov    $0x403422,%edi
  401e3a:	e8 91 ee ff ff       	callq  400cd0 <puts@plt>
  401e3f:	b8 00 00 00 00       	mov    $0x0,%eax
  401e44:	e8 5e fd ff ff       	callq  401ba7 <check_fail>
  401e49:	8b 15 c9 36 20 00    	mov    0x2036c9(%rip),%edx        # 605518 <check_level>
  401e4f:	39 d7                	cmp    %edx,%edi
  401e51:	74 20                	je     401e73 <validate+0x52>
  401e53:	89 f9                	mov    %edi,%ecx
  401e55:	be 60 35 40 00       	mov    $0x403560,%esi
  401e5a:	bf 01 00 00 00       	mov    $0x1,%edi
  401e5f:	b8 00 00 00 00       	mov    $0x0,%eax
  401e64:	e8 97 ef ff ff       	callq  400e00 <__printf_chk@plt>
  401e69:	b8 00 00 00 00       	mov    $0x0,%eax
  401e6e:	e8 34 fd ff ff       	callq  401ba7 <check_fail>
  401e73:	0f be 15 ce 42 20 00 	movsbl 0x2042ce(%rip),%edx        # 606148 <target_prefix>
  401e7a:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401e80:	89 f9                	mov    %edi,%ecx
  401e82:	be 40 34 40 00       	mov    $0x403440,%esi
  401e87:	bf 01 00 00 00       	mov    $0x1,%edi
  401e8c:	b8 00 00 00 00       	mov    $0x0,%eax
  401e91:	e8 6a ef ff ff       	callq  400e00 <__printf_chk@plt>
  401e96:	eb 49                	jmp    401ee1 <validate+0xc0>
  401e98:	3b 3d 7e 36 20 00    	cmp    0x20367e(%rip),%edi        # 60551c <vlevel>
  401e9e:	74 18                	je     401eb8 <validate+0x97>
  401ea0:	bf 22 34 40 00       	mov    $0x403422,%edi
  401ea5:	e8 26 ee ff ff       	callq  400cd0 <puts@plt>
  401eaa:	89 de                	mov    %ebx,%esi
  401eac:	bf 00 00 00 00       	mov    $0x0,%edi
  401eb1:	e8 78 fd ff ff       	callq  401c2e <notify_server>
  401eb6:	eb 29                	jmp    401ee1 <validate+0xc0>
  401eb8:	0f be 0d 89 42 20 00 	movsbl 0x204289(%rip),%ecx        # 606148 <target_prefix>
  401ebf:	89 fa                	mov    %edi,%edx
  401ec1:	be 88 35 40 00       	mov    $0x403588,%esi
  401ec6:	bf 01 00 00 00       	mov    $0x1,%edi
  401ecb:	b8 00 00 00 00       	mov    $0x0,%eax
  401ed0:	e8 2b ef ff ff       	callq  400e00 <__printf_chk@plt>
  401ed5:	89 de                	mov    %ebx,%esi
  401ed7:	bf 01 00 00 00       	mov    $0x1,%edi
  401edc:	e8 4d fd ff ff       	callq  401c2e <notify_server>
  401ee1:	5b                   	pop    %rbx
  401ee2:	c3                   	retq   

0000000000401ee3 <fail>:
  401ee3:	48 83 ec 08          	sub    $0x8,%rsp
  401ee7:	83 3d 3a 36 20 00 00 	cmpl   $0x0,0x20363a(%rip)        # 605528 <is_checker>
  401eee:	74 0a                	je     401efa <fail+0x17>
  401ef0:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef5:	e8 ad fc ff ff       	callq  401ba7 <check_fail>
  401efa:	89 fe                	mov    %edi,%esi
  401efc:	bf 00 00 00 00       	mov    $0x0,%edi
  401f01:	e8 28 fd ff ff       	callq  401c2e <notify_server>
  401f06:	48 83 c4 08          	add    $0x8,%rsp
  401f0a:	c3                   	retq   

0000000000401f0b <bushandler>:
  401f0b:	48 83 ec 08          	sub    $0x8,%rsp
  401f0f:	83 3d 12 36 20 00 00 	cmpl   $0x0,0x203612(%rip)        # 605528 <is_checker>
  401f16:	74 14                	je     401f2c <bushandler+0x21>
  401f18:	bf 55 34 40 00       	mov    $0x403455,%edi
  401f1d:	e8 ae ed ff ff       	callq  400cd0 <puts@plt>
  401f22:	b8 00 00 00 00       	mov    $0x0,%eax
  401f27:	e8 7b fc ff ff       	callq  401ba7 <check_fail>
  401f2c:	bf c0 35 40 00       	mov    $0x4035c0,%edi
  401f31:	e8 9a ed ff ff       	callq  400cd0 <puts@plt>
  401f36:	bf 5f 34 40 00       	mov    $0x40345f,%edi
  401f3b:	e8 90 ed ff ff       	callq  400cd0 <puts@plt>
  401f40:	be 00 00 00 00       	mov    $0x0,%esi
  401f45:	bf 00 00 00 00       	mov    $0x0,%edi
  401f4a:	e8 df fc ff ff       	callq  401c2e <notify_server>
  401f4f:	bf 01 00 00 00       	mov    $0x1,%edi
  401f54:	e8 f7 ee ff ff       	callq  400e50 <exit@plt>

0000000000401f59 <seghandler>:
  401f59:	48 83 ec 08          	sub    $0x8,%rsp
  401f5d:	83 3d c4 35 20 00 00 	cmpl   $0x0,0x2035c4(%rip)        # 605528 <is_checker>
  401f64:	74 14                	je     401f7a <seghandler+0x21>
  401f66:	bf 75 34 40 00       	mov    $0x403475,%edi
  401f6b:	e8 60 ed ff ff       	callq  400cd0 <puts@plt>
  401f70:	b8 00 00 00 00       	mov    $0x0,%eax
  401f75:	e8 2d fc ff ff       	callq  401ba7 <check_fail>
  401f7a:	bf e0 35 40 00       	mov    $0x4035e0,%edi
  401f7f:	e8 4c ed ff ff       	callq  400cd0 <puts@plt>
  401f84:	bf 5f 34 40 00       	mov    $0x40345f,%edi
  401f89:	e8 42 ed ff ff       	callq  400cd0 <puts@plt>
  401f8e:	be 00 00 00 00       	mov    $0x0,%esi
  401f93:	bf 00 00 00 00       	mov    $0x0,%edi
  401f98:	e8 91 fc ff ff       	callq  401c2e <notify_server>
  401f9d:	bf 01 00 00 00       	mov    $0x1,%edi
  401fa2:	e8 a9 ee ff ff       	callq  400e50 <exit@plt>

0000000000401fa7 <illegalhandler>:
  401fa7:	48 83 ec 08          	sub    $0x8,%rsp
  401fab:	83 3d 76 35 20 00 00 	cmpl   $0x0,0x203576(%rip)        # 605528 <is_checker>
  401fb2:	74 14                	je     401fc8 <illegalhandler+0x21>
  401fb4:	bf 88 34 40 00       	mov    $0x403488,%edi
  401fb9:	e8 12 ed ff ff       	callq  400cd0 <puts@plt>
  401fbe:	b8 00 00 00 00       	mov    $0x0,%eax
  401fc3:	e8 df fb ff ff       	callq  401ba7 <check_fail>
  401fc8:	bf 08 36 40 00       	mov    $0x403608,%edi
  401fcd:	e8 fe ec ff ff       	callq  400cd0 <puts@plt>
  401fd2:	bf 5f 34 40 00       	mov    $0x40345f,%edi
  401fd7:	e8 f4 ec ff ff       	callq  400cd0 <puts@plt>
  401fdc:	be 00 00 00 00       	mov    $0x0,%esi
  401fe1:	bf 00 00 00 00       	mov    $0x0,%edi
  401fe6:	e8 43 fc ff ff       	callq  401c2e <notify_server>
  401feb:	bf 01 00 00 00       	mov    $0x1,%edi
  401ff0:	e8 5b ee ff ff       	callq  400e50 <exit@plt>

0000000000401ff5 <sigalrmhandler>:
  401ff5:	48 83 ec 08          	sub    $0x8,%rsp
  401ff9:	83 3d 28 35 20 00 00 	cmpl   $0x0,0x203528(%rip)        # 605528 <is_checker>
  402000:	74 14                	je     402016 <sigalrmhandler+0x21>
  402002:	bf 9c 34 40 00       	mov    $0x40349c,%edi
  402007:	e8 c4 ec ff ff       	callq  400cd0 <puts@plt>
  40200c:	b8 00 00 00 00       	mov    $0x0,%eax
  402011:	e8 91 fb ff ff       	callq  401ba7 <check_fail>
  402016:	ba 05 00 00 00       	mov    $0x5,%edx
  40201b:	be 38 36 40 00       	mov    $0x403638,%esi
  402020:	bf 01 00 00 00       	mov    $0x1,%edi
  402025:	b8 00 00 00 00       	mov    $0x0,%eax
  40202a:	e8 d1 ed ff ff       	callq  400e00 <__printf_chk@plt>
  40202f:	be 00 00 00 00       	mov    $0x0,%esi
  402034:	bf 00 00 00 00       	mov    $0x0,%edi
  402039:	e8 f0 fb ff ff       	callq  401c2e <notify_server>
  40203e:	bf 01 00 00 00       	mov    $0x1,%edi
  402043:	e8 08 ee ff ff       	callq  400e50 <exit@plt>

0000000000402048 <launch>:
  402048:	55                   	push   %rbp
  402049:	48 89 e5             	mov    %rsp,%rbp
  40204c:	48 83 ec 10          	sub    $0x10,%rsp
  402050:	48 89 fa             	mov    %rdi,%rdx
  402053:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40205a:	00 00 
  40205c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402060:	31 c0                	xor    %eax,%eax
  402062:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  402066:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  40206a:	48 29 c4             	sub    %rax,%rsp
  40206d:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  402072:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  402076:	be f4 00 00 00       	mov    $0xf4,%esi
  40207b:	e8 90 ec ff ff       	callq  400d10 <memset@plt>
  402080:	48 8b 05 39 34 20 00 	mov    0x203439(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  402087:	48 39 05 82 34 20 00 	cmp    %rax,0x203482(%rip)        # 605510 <infile>
  40208e:	75 14                	jne    4020a4 <launch+0x5c>
  402090:	be a4 34 40 00       	mov    $0x4034a4,%esi
  402095:	bf 01 00 00 00       	mov    $0x1,%edi
  40209a:	b8 00 00 00 00       	mov    $0x0,%eax
  40209f:	e8 5c ed ff ff       	callq  400e00 <__printf_chk@plt>
  4020a4:	c7 05 6e 34 20 00 00 	movl   $0x0,0x20346e(%rip)        # 60551c <vlevel>
  4020ab:	00 00 00 
  4020ae:	b8 00 00 00 00       	mov    $0x0,%eax
  4020b3:	e8 3a f9 ff ff       	callq  4019f2 <test>
  4020b8:	83 3d 69 34 20 00 00 	cmpl   $0x0,0x203469(%rip)        # 605528 <is_checker>
  4020bf:	74 14                	je     4020d5 <launch+0x8d>
  4020c1:	bf b1 34 40 00       	mov    $0x4034b1,%edi
  4020c6:	e8 05 ec ff ff       	callq  400cd0 <puts@plt>
  4020cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4020d0:	e8 d2 fa ff ff       	callq  401ba7 <check_fail>
  4020d5:	bf bc 34 40 00       	mov    $0x4034bc,%edi
  4020da:	e8 f1 eb ff ff       	callq  400cd0 <puts@plt>
  4020df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4020e3:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4020ea:	00 00 
  4020ec:	74 05                	je     4020f3 <launch+0xab>
  4020ee:	e8 fd eb ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  4020f3:	c9                   	leaveq 
  4020f4:	c3                   	retq   

00000000004020f5 <stable_launch>:
  4020f5:	53                   	push   %rbx
  4020f6:	48 89 3d 0b 34 20 00 	mov    %rdi,0x20340b(%rip)        # 605508 <global_offset>
  4020fd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402103:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  402109:	b9 32 01 00 00       	mov    $0x132,%ecx
  40210e:	ba 07 00 00 00       	mov    $0x7,%edx
  402113:	be 00 00 10 00       	mov    $0x100000,%esi
  402118:	bf 00 60 58 55       	mov    $0x55586000,%edi
  40211d:	e8 de eb ff ff       	callq  400d00 <mmap@plt>
  402122:	48 89 c3             	mov    %rax,%rbx
  402125:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  40212b:	74 37                	je     402164 <stable_launch+0x6f>
  40212d:	be 00 00 10 00       	mov    $0x100000,%esi
  402132:	48 89 c7             	mov    %rax,%rdi
  402135:	e8 b6 ec ff ff       	callq  400df0 <munmap@plt>
  40213a:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  40213f:	ba 70 36 40 00       	mov    $0x403670,%edx
  402144:	be 01 00 00 00       	mov    $0x1,%esi
  402149:	48 8b 3d 90 33 20 00 	mov    0x203390(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  402150:	b8 00 00 00 00       	mov    $0x0,%eax
  402155:	e8 16 ed ff ff       	callq  400e70 <__fprintf_chk@plt>
  40215a:	bf 01 00 00 00       	mov    $0x1,%edi
  40215f:	e8 ec ec ff ff       	callq  400e50 <exit@plt>
  402164:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  40216b:	48 89 15 de 3f 20 00 	mov    %rdx,0x203fde(%rip)        # 606150 <stack_top>
  402172:	48 89 e0             	mov    %rsp,%rax
  402175:	48 89 d4             	mov    %rdx,%rsp
  402178:	48 89 c2             	mov    %rax,%rdx
  40217b:	48 89 15 7e 33 20 00 	mov    %rdx,0x20337e(%rip)        # 605500 <global_save_stack>
  402182:	48 8b 3d 7f 33 20 00 	mov    0x20337f(%rip),%rdi        # 605508 <global_offset>
  402189:	e8 ba fe ff ff       	callq  402048 <launch>
  40218e:	48 8b 05 6b 33 20 00 	mov    0x20336b(%rip),%rax        # 605500 <global_save_stack>
  402195:	48 89 c4             	mov    %rax,%rsp
  402198:	be 00 00 10 00       	mov    $0x100000,%esi
  40219d:	48 89 df             	mov    %rbx,%rdi
  4021a0:	e8 4b ec ff ff       	callq  400df0 <munmap@plt>
  4021a5:	5b                   	pop    %rbx
  4021a6:	c3                   	retq   

00000000004021a7 <rio_readinitb>:
  4021a7:	89 37                	mov    %esi,(%rdi)
  4021a9:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  4021b0:	48 8d 47 10          	lea    0x10(%rdi),%rax
  4021b4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4021b8:	c3                   	retq   

00000000004021b9 <sigalrm_handler>:
  4021b9:	48 83 ec 08          	sub    $0x8,%rsp
  4021bd:	b9 00 00 00 00       	mov    $0x0,%ecx
  4021c2:	ba b0 36 40 00       	mov    $0x4036b0,%edx
  4021c7:	be 01 00 00 00       	mov    $0x1,%esi
  4021cc:	48 8b 3d 0d 33 20 00 	mov    0x20330d(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  4021d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4021d8:	e8 93 ec ff ff       	callq  400e70 <__fprintf_chk@plt>
  4021dd:	bf 01 00 00 00       	mov    $0x1,%edi
  4021e2:	e8 69 ec ff ff       	callq  400e50 <exit@plt>

00000000004021e7 <rio_writen>:
  4021e7:	41 55                	push   %r13
  4021e9:	41 54                	push   %r12
  4021eb:	55                   	push   %rbp
  4021ec:	53                   	push   %rbx
  4021ed:	48 83 ec 08          	sub    $0x8,%rsp
  4021f1:	41 89 fc             	mov    %edi,%r12d
  4021f4:	48 89 f5             	mov    %rsi,%rbp
  4021f7:	49 89 d5             	mov    %rdx,%r13
  4021fa:	48 89 d3             	mov    %rdx,%rbx
  4021fd:	eb 28                	jmp    402227 <rio_writen+0x40>
  4021ff:	48 89 da             	mov    %rbx,%rdx
  402202:	48 89 ee             	mov    %rbp,%rsi
  402205:	44 89 e7             	mov    %r12d,%edi
  402208:	e8 d3 ea ff ff       	callq  400ce0 <write@plt>
  40220d:	48 85 c0             	test   %rax,%rax
  402210:	7f 0f                	jg     402221 <rio_writen+0x3a>
  402212:	e8 79 ea ff ff       	callq  400c90 <__errno_location@plt>
  402217:	83 38 04             	cmpl   $0x4,(%rax)
  40221a:	75 15                	jne    402231 <rio_writen+0x4a>
  40221c:	b8 00 00 00 00       	mov    $0x0,%eax
  402221:	48 29 c3             	sub    %rax,%rbx
  402224:	48 01 c5             	add    %rax,%rbp
  402227:	48 85 db             	test   %rbx,%rbx
  40222a:	75 d3                	jne    4021ff <rio_writen+0x18>
  40222c:	4c 89 e8             	mov    %r13,%rax
  40222f:	eb 07                	jmp    402238 <rio_writen+0x51>
  402231:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402238:	48 83 c4 08          	add    $0x8,%rsp
  40223c:	5b                   	pop    %rbx
  40223d:	5d                   	pop    %rbp
  40223e:	41 5c                	pop    %r12
  402240:	41 5d                	pop    %r13
  402242:	c3                   	retq   

0000000000402243 <rio_read>:
  402243:	41 55                	push   %r13
  402245:	41 54                	push   %r12
  402247:	55                   	push   %rbp
  402248:	53                   	push   %rbx
  402249:	48 83 ec 08          	sub    $0x8,%rsp
  40224d:	48 89 fb             	mov    %rdi,%rbx
  402250:	49 89 f5             	mov    %rsi,%r13
  402253:	49 89 d4             	mov    %rdx,%r12
  402256:	eb 2e                	jmp    402286 <rio_read+0x43>
  402258:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40225c:	8b 3b                	mov    (%rbx),%edi
  40225e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402263:	48 89 ee             	mov    %rbp,%rsi
  402266:	e8 d5 ea ff ff       	callq  400d40 <read@plt>
  40226b:	89 43 04             	mov    %eax,0x4(%rbx)
  40226e:	85 c0                	test   %eax,%eax
  402270:	79 0c                	jns    40227e <rio_read+0x3b>
  402272:	e8 19 ea ff ff       	callq  400c90 <__errno_location@plt>
  402277:	83 38 04             	cmpl   $0x4,(%rax)
  40227a:	74 0a                	je     402286 <rio_read+0x43>
  40227c:	eb 37                	jmp    4022b5 <rio_read+0x72>
  40227e:	85 c0                	test   %eax,%eax
  402280:	74 3c                	je     4022be <rio_read+0x7b>
  402282:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402286:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402289:	85 ed                	test   %ebp,%ebp
  40228b:	7e cb                	jle    402258 <rio_read+0x15>
  40228d:	89 e8                	mov    %ebp,%eax
  40228f:	49 39 c4             	cmp    %rax,%r12
  402292:	77 03                	ja     402297 <rio_read+0x54>
  402294:	44 89 e5             	mov    %r12d,%ebp
  402297:	4c 63 e5             	movslq %ebp,%r12
  40229a:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  40229e:	4c 89 e2             	mov    %r12,%rdx
  4022a1:	4c 89 ef             	mov    %r13,%rdi
  4022a4:	e8 f7 ea ff ff       	callq  400da0 <memcpy@plt>
  4022a9:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4022ad:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4022b0:	4c 89 e0             	mov    %r12,%rax
  4022b3:	eb 0e                	jmp    4022c3 <rio_read+0x80>
  4022b5:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4022bc:	eb 05                	jmp    4022c3 <rio_read+0x80>
  4022be:	b8 00 00 00 00       	mov    $0x0,%eax
  4022c3:	48 83 c4 08          	add    $0x8,%rsp
  4022c7:	5b                   	pop    %rbx
  4022c8:	5d                   	pop    %rbp
  4022c9:	41 5c                	pop    %r12
  4022cb:	41 5d                	pop    %r13
  4022cd:	c3                   	retq   

00000000004022ce <rio_readlineb>:
  4022ce:	41 55                	push   %r13
  4022d0:	41 54                	push   %r12
  4022d2:	55                   	push   %rbp
  4022d3:	53                   	push   %rbx
  4022d4:	48 83 ec 18          	sub    $0x18,%rsp
  4022d8:	49 89 fd             	mov    %rdi,%r13
  4022db:	48 89 f5             	mov    %rsi,%rbp
  4022de:	49 89 d4             	mov    %rdx,%r12
  4022e1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022e8:	00 00 
  4022ea:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4022ef:	31 c0                	xor    %eax,%eax
  4022f1:	bb 01 00 00 00       	mov    $0x1,%ebx
  4022f6:	eb 3f                	jmp    402337 <rio_readlineb+0x69>
  4022f8:	ba 01 00 00 00       	mov    $0x1,%edx
  4022fd:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  402302:	4c 89 ef             	mov    %r13,%rdi
  402305:	e8 39 ff ff ff       	callq  402243 <rio_read>
  40230a:	83 f8 01             	cmp    $0x1,%eax
  40230d:	75 15                	jne    402324 <rio_readlineb+0x56>
  40230f:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402313:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  402318:	88 55 00             	mov    %dl,0x0(%rbp)
  40231b:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  402320:	75 0e                	jne    402330 <rio_readlineb+0x62>
  402322:	eb 1a                	jmp    40233e <rio_readlineb+0x70>
  402324:	85 c0                	test   %eax,%eax
  402326:	75 22                	jne    40234a <rio_readlineb+0x7c>
  402328:	48 83 fb 01          	cmp    $0x1,%rbx
  40232c:	75 13                	jne    402341 <rio_readlineb+0x73>
  40232e:	eb 23                	jmp    402353 <rio_readlineb+0x85>
  402330:	48 83 c3 01          	add    $0x1,%rbx
  402334:	48 89 c5             	mov    %rax,%rbp
  402337:	4c 39 e3             	cmp    %r12,%rbx
  40233a:	72 bc                	jb     4022f8 <rio_readlineb+0x2a>
  40233c:	eb 03                	jmp    402341 <rio_readlineb+0x73>
  40233e:	48 89 c5             	mov    %rax,%rbp
  402341:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402345:	48 89 d8             	mov    %rbx,%rax
  402348:	eb 0e                	jmp    402358 <rio_readlineb+0x8a>
  40234a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402351:	eb 05                	jmp    402358 <rio_readlineb+0x8a>
  402353:	b8 00 00 00 00       	mov    $0x0,%eax
  402358:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  40235d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402364:	00 00 
  402366:	74 05                	je     40236d <rio_readlineb+0x9f>
  402368:	e8 83 e9 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  40236d:	48 83 c4 18          	add    $0x18,%rsp
  402371:	5b                   	pop    %rbx
  402372:	5d                   	pop    %rbp
  402373:	41 5c                	pop    %r12
  402375:	41 5d                	pop    %r13
  402377:	c3                   	retq   

0000000000402378 <urlencode>:
  402378:	41 54                	push   %r12
  40237a:	55                   	push   %rbp
  40237b:	53                   	push   %rbx
  40237c:	48 83 ec 10          	sub    $0x10,%rsp
  402380:	48 89 fb             	mov    %rdi,%rbx
  402383:	48 89 f5             	mov    %rsi,%rbp
  402386:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40238d:	00 00 
  40238f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402394:	31 c0                	xor    %eax,%eax
  402396:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40239d:	f2 ae                	repnz scas %es:(%rdi),%al
  40239f:	48 f7 d1             	not    %rcx
  4023a2:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4023a5:	e9 aa 00 00 00       	jmpq   402454 <urlencode+0xdc>
  4023aa:	44 0f b6 03          	movzbl (%rbx),%r8d
  4023ae:	41 80 f8 2a          	cmp    $0x2a,%r8b
  4023b2:	0f 94 c2             	sete   %dl
  4023b5:	41 80 f8 2d          	cmp    $0x2d,%r8b
  4023b9:	0f 94 c0             	sete   %al
  4023bc:	08 c2                	or     %al,%dl
  4023be:	75 24                	jne    4023e4 <urlencode+0x6c>
  4023c0:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4023c4:	74 1e                	je     4023e4 <urlencode+0x6c>
  4023c6:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4023ca:	74 18                	je     4023e4 <urlencode+0x6c>
  4023cc:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4023d0:	3c 09                	cmp    $0x9,%al
  4023d2:	76 10                	jbe    4023e4 <urlencode+0x6c>
  4023d4:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4023d8:	3c 19                	cmp    $0x19,%al
  4023da:	76 08                	jbe    4023e4 <urlencode+0x6c>
  4023dc:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  4023e0:	3c 19                	cmp    $0x19,%al
  4023e2:	77 0a                	ja     4023ee <urlencode+0x76>
  4023e4:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  4023e8:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4023ec:	eb 5f                	jmp    40244d <urlencode+0xd5>
  4023ee:	41 80 f8 20          	cmp    $0x20,%r8b
  4023f2:	75 0a                	jne    4023fe <urlencode+0x86>
  4023f4:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4023f8:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4023fc:	eb 4f                	jmp    40244d <urlencode+0xd5>
  4023fe:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402402:	3c 5f                	cmp    $0x5f,%al
  402404:	0f 96 c2             	setbe  %dl
  402407:	41 80 f8 09          	cmp    $0x9,%r8b
  40240b:	0f 94 c0             	sete   %al
  40240e:	08 c2                	or     %al,%dl
  402410:	74 50                	je     402462 <urlencode+0xea>
  402412:	45 0f b6 c0          	movzbl %r8b,%r8d
  402416:	b9 48 37 40 00       	mov    $0x403748,%ecx
  40241b:	ba 08 00 00 00       	mov    $0x8,%edx
  402420:	be 01 00 00 00       	mov    $0x1,%esi
  402425:	48 89 e7             	mov    %rsp,%rdi
  402428:	b8 00 00 00 00       	mov    $0x0,%eax
  40242d:	e8 4e ea ff ff       	callq  400e80 <__sprintf_chk@plt>
  402432:	0f b6 04 24          	movzbl (%rsp),%eax
  402436:	88 45 00             	mov    %al,0x0(%rbp)
  402439:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40243e:	88 45 01             	mov    %al,0x1(%rbp)
  402441:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402446:	88 45 02             	mov    %al,0x2(%rbp)
  402449:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40244d:	48 83 c3 01          	add    $0x1,%rbx
  402451:	44 89 e0             	mov    %r12d,%eax
  402454:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402458:	85 c0                	test   %eax,%eax
  40245a:	0f 85 4a ff ff ff    	jne    4023aa <urlencode+0x32>
  402460:	eb 05                	jmp    402467 <urlencode+0xef>
  402462:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402467:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  40246c:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  402473:	00 00 
  402475:	74 05                	je     40247c <urlencode+0x104>
  402477:	e8 74 e8 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  40247c:	48 83 c4 10          	add    $0x10,%rsp
  402480:	5b                   	pop    %rbx
  402481:	5d                   	pop    %rbp
  402482:	41 5c                	pop    %r12
  402484:	c3                   	retq   

0000000000402485 <submitr>:
  402485:	41 57                	push   %r15
  402487:	41 56                	push   %r14
  402489:	41 55                	push   %r13
  40248b:	41 54                	push   %r12
  40248d:	55                   	push   %rbp
  40248e:	53                   	push   %rbx
  40248f:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  402496:	49 89 fc             	mov    %rdi,%r12
  402499:	89 74 24 04          	mov    %esi,0x4(%rsp)
  40249d:	49 89 d7             	mov    %rdx,%r15
  4024a0:	49 89 ce             	mov    %rcx,%r14
  4024a3:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4024a8:	4d 89 cd             	mov    %r9,%r13
  4024ab:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4024b2:	00 
  4024b3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4024ba:	00 00 
  4024bc:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4024c3:	00 
  4024c4:	31 c0                	xor    %eax,%eax
  4024c6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4024cd:	00 
  4024ce:	ba 00 00 00 00       	mov    $0x0,%edx
  4024d3:	be 01 00 00 00       	mov    $0x1,%esi
  4024d8:	bf 02 00 00 00       	mov    $0x2,%edi
  4024dd:	e8 ae e9 ff ff       	callq  400e90 <socket@plt>
  4024e2:	85 c0                	test   %eax,%eax
  4024e4:	79 4e                	jns    402534 <submitr+0xaf>
  4024e6:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4024ed:	3a 20 43 
  4024f0:	48 89 03             	mov    %rax,(%rbx)
  4024f3:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4024fa:	20 75 6e 
  4024fd:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402501:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402508:	74 6f 20 
  40250b:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40250f:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402516:	65 20 73 
  402519:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40251d:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402524:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40252a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40252f:	e9 97 06 00 00       	jmpq   402bcb <submitr+0x746>
  402534:	89 c5                	mov    %eax,%ebp
  402536:	4c 89 e7             	mov    %r12,%rdi
  402539:	e8 32 e8 ff ff       	callq  400d70 <gethostbyname@plt>
  40253e:	48 85 c0             	test   %rax,%rax
  402541:	75 67                	jne    4025aa <submitr+0x125>
  402543:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40254a:	3a 20 44 
  40254d:	48 89 03             	mov    %rax,(%rbx)
  402550:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402557:	20 75 6e 
  40255a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40255e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402565:	74 6f 20 
  402568:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40256c:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402573:	76 65 20 
  402576:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40257a:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402581:	72 20 61 
  402584:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402588:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  40258f:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  402595:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  402599:	89 ef                	mov    %ebp,%edi
  40259b:	e8 90 e7 ff ff       	callq  400d30 <close@plt>
  4025a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025a5:	e9 21 06 00 00       	jmpq   402bcb <submitr+0x746>
  4025aa:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  4025b1:	00 00 
  4025b3:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  4025ba:	00 00 
  4025bc:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  4025c3:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4025c7:	48 8b 40 18          	mov    0x18(%rax),%rax
  4025cb:	48 8b 30             	mov    (%rax),%rsi
  4025ce:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  4025d3:	b9 0c 00 00 00       	mov    $0xc,%ecx
  4025d8:	e8 a3 e7 ff ff       	callq  400d80 <__memmove_chk@plt>
  4025dd:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  4025e2:	66 c1 c8 08          	ror    $0x8,%ax
  4025e6:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  4025eb:	ba 10 00 00 00       	mov    $0x10,%edx
  4025f0:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  4025f5:	89 ef                	mov    %ebp,%edi
  4025f7:	e8 64 e8 ff ff       	callq  400e60 <connect@plt>
  4025fc:	85 c0                	test   %eax,%eax
  4025fe:	79 59                	jns    402659 <submitr+0x1d4>
  402600:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402607:	3a 20 55 
  40260a:	48 89 03             	mov    %rax,(%rbx)
  40260d:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402614:	20 74 6f 
  402617:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40261b:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402622:	65 63 74 
  402625:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402629:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  402630:	68 65 20 
  402633:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402637:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40263e:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402644:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402648:	89 ef                	mov    %ebp,%edi
  40264a:	e8 e1 e6 ff ff       	callq  400d30 <close@plt>
  40264f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402654:	e9 72 05 00 00       	jmpq   402bcb <submitr+0x746>
  402659:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  402660:	b8 00 00 00 00       	mov    $0x0,%eax
  402665:	48 89 f1             	mov    %rsi,%rcx
  402668:	4c 89 ef             	mov    %r13,%rdi
  40266b:	f2 ae                	repnz scas %es:(%rdi),%al
  40266d:	48 f7 d1             	not    %rcx
  402670:	48 89 ca             	mov    %rcx,%rdx
  402673:	48 89 f1             	mov    %rsi,%rcx
  402676:	4c 89 ff             	mov    %r15,%rdi
  402679:	f2 ae                	repnz scas %es:(%rdi),%al
  40267b:	48 f7 d1             	not    %rcx
  40267e:	49 89 c8             	mov    %rcx,%r8
  402681:	48 89 f1             	mov    %rsi,%rcx
  402684:	4c 89 f7             	mov    %r14,%rdi
  402687:	f2 ae                	repnz scas %es:(%rdi),%al
  402689:	48 f7 d1             	not    %rcx
  40268c:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  402691:	48 89 f1             	mov    %rsi,%rcx
  402694:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402699:	f2 ae                	repnz scas %es:(%rdi),%al
  40269b:	48 89 c8             	mov    %rcx,%rax
  40269e:	48 f7 d0             	not    %rax
  4026a1:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  4026a6:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  4026ab:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  4026b2:	00 
  4026b3:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4026b9:	76 72                	jbe    40272d <submitr+0x2a8>
  4026bb:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4026c2:	3a 20 52 
  4026c5:	48 89 03             	mov    %rax,(%rbx)
  4026c8:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4026cf:	20 73 74 
  4026d2:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026d6:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  4026dd:	74 6f 6f 
  4026e0:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026e4:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  4026eb:	65 2e 20 
  4026ee:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026f2:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  4026f9:	61 73 65 
  4026fc:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402700:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402707:	49 54 52 
  40270a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40270e:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402715:	55 46 00 
  402718:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40271c:	89 ef                	mov    %ebp,%edi
  40271e:	e8 0d e6 ff ff       	callq  400d30 <close@plt>
  402723:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402728:	e9 9e 04 00 00       	jmpq   402bcb <submitr+0x746>
  40272d:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  402734:	00 
  402735:	b9 00 04 00 00       	mov    $0x400,%ecx
  40273a:	b8 00 00 00 00       	mov    $0x0,%eax
  40273f:	48 89 f7             	mov    %rsi,%rdi
  402742:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402745:	4c 89 ef             	mov    %r13,%rdi
  402748:	e8 2b fc ff ff       	callq  402378 <urlencode>
  40274d:	85 c0                	test   %eax,%eax
  40274f:	0f 89 8a 00 00 00    	jns    4027df <submitr+0x35a>
  402755:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40275c:	3a 20 52 
  40275f:	48 89 03             	mov    %rax,(%rbx)
  402762:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402769:	20 73 74 
  40276c:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402770:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402777:	63 6f 6e 
  40277a:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40277e:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402785:	20 61 6e 
  402788:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40278c:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  402793:	67 61 6c 
  402796:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40279a:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4027a1:	6e 70 72 
  4027a4:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027a8:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4027af:	6c 65 20 
  4027b2:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4027b6:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4027bd:	63 74 65 
  4027c0:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4027c4:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  4027ca:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  4027ce:	89 ef                	mov    %ebp,%edi
  4027d0:	e8 5b e5 ff ff       	callq  400d30 <close@plt>
  4027d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027da:	e9 ec 03 00 00       	jmpq   402bcb <submitr+0x746>
  4027df:	4c 8d ac 24 40 20 00 	lea    0x2040(%rsp),%r13
  4027e6:	00 
  4027e7:	41 54                	push   %r12
  4027e9:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
  4027f0:	00 
  4027f1:	50                   	push   %rax
  4027f2:	4d 89 f9             	mov    %r15,%r9
  4027f5:	4d 89 f0             	mov    %r14,%r8
  4027f8:	b9 d8 36 40 00       	mov    $0x4036d8,%ecx
  4027fd:	ba 00 20 00 00       	mov    $0x2000,%edx
  402802:	be 01 00 00 00       	mov    $0x1,%esi
  402807:	4c 89 ef             	mov    %r13,%rdi
  40280a:	b8 00 00 00 00       	mov    $0x0,%eax
  40280f:	e8 6c e6 ff ff       	callq  400e80 <__sprintf_chk@plt>
  402814:	b8 00 00 00 00       	mov    $0x0,%eax
  402819:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402820:	4c 89 ef             	mov    %r13,%rdi
  402823:	f2 ae                	repnz scas %es:(%rdi),%al
  402825:	48 f7 d1             	not    %rcx
  402828:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40282c:	4c 89 ee             	mov    %r13,%rsi
  40282f:	89 ef                	mov    %ebp,%edi
  402831:	e8 b1 f9 ff ff       	callq  4021e7 <rio_writen>
  402836:	48 83 c4 10          	add    $0x10,%rsp
  40283a:	48 85 c0             	test   %rax,%rax
  40283d:	79 6e                	jns    4028ad <submitr+0x428>
  40283f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402846:	3a 20 43 
  402849:	48 89 03             	mov    %rax,(%rbx)
  40284c:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402853:	20 75 6e 
  402856:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40285a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402861:	74 6f 20 
  402864:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402868:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  40286f:	20 74 6f 
  402872:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402876:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  40287d:	72 65 73 
  402880:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402884:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  40288b:	65 72 76 
  40288e:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402892:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  402898:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  40289c:	89 ef                	mov    %ebp,%edi
  40289e:	e8 8d e4 ff ff       	callq  400d30 <close@plt>
  4028a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028a8:	e9 1e 03 00 00       	jmpq   402bcb <submitr+0x746>
  4028ad:	89 ee                	mov    %ebp,%esi
  4028af:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4028b4:	e8 ee f8 ff ff       	callq  4021a7 <rio_readinitb>
  4028b9:	ba 00 20 00 00       	mov    $0x2000,%edx
  4028be:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4028c5:	00 
  4028c6:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4028cb:	e8 fe f9 ff ff       	callq  4022ce <rio_readlineb>
  4028d0:	48 85 c0             	test   %rax,%rax
  4028d3:	7f 7d                	jg     402952 <submitr+0x4cd>
  4028d5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028dc:	3a 20 43 
  4028df:	48 89 03             	mov    %rax,(%rbx)
  4028e2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4028e9:	20 75 6e 
  4028ec:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028f0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028f7:	74 6f 20 
  4028fa:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028fe:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402905:	66 69 72 
  402908:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40290c:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402913:	61 64 65 
  402916:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40291a:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402921:	6d 20 72 
  402924:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402928:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  40292f:	20 73 65 
  402932:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402936:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40293d:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402941:	89 ef                	mov    %ebp,%edi
  402943:	e8 e8 e3 ff ff       	callq  400d30 <close@plt>
  402948:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40294d:	e9 79 02 00 00       	jmpq   402bcb <submitr+0x746>
  402952:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  402959:	00 
  40295a:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  40295f:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  402966:	00 
  402967:	be 4f 37 40 00       	mov    $0x40374f,%esi
  40296c:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  402973:	00 
  402974:	b8 00 00 00 00       	mov    $0x0,%eax
  402979:	e8 62 e4 ff ff       	callq  400de0 <__isoc99_sscanf@plt>
  40297e:	e9 95 00 00 00       	jmpq   402a18 <submitr+0x593>
  402983:	ba 00 20 00 00       	mov    $0x2000,%edx
  402988:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  40298f:	00 
  402990:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402995:	e8 34 f9 ff ff       	callq  4022ce <rio_readlineb>
  40299a:	48 85 c0             	test   %rax,%rax
  40299d:	7f 79                	jg     402a18 <submitr+0x593>
  40299f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029a6:	3a 20 43 
  4029a9:	48 89 03             	mov    %rax,(%rbx)
  4029ac:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4029b3:	20 75 6e 
  4029b6:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4029ba:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029c1:	74 6f 20 
  4029c4:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4029c8:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  4029cf:	68 65 61 
  4029d2:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4029d6:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4029dd:	66 72 6f 
  4029e0:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4029e4:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  4029eb:	20 72 65 
  4029ee:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4029f2:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  4029f9:	73 65 72 
  4029fc:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a00:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402a07:	89 ef                	mov    %ebp,%edi
  402a09:	e8 22 e3 ff ff       	callq  400d30 <close@plt>
  402a0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a13:	e9 b3 01 00 00       	jmpq   402bcb <submitr+0x746>
  402a18:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  402a1f:	00 
  402a20:	b8 0d 00 00 00       	mov    $0xd,%eax
  402a25:	29 d0                	sub    %edx,%eax
  402a27:	75 1b                	jne    402a44 <submitr+0x5bf>
  402a29:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  402a30:	00 
  402a31:	b8 0a 00 00 00       	mov    $0xa,%eax
  402a36:	29 d0                	sub    %edx,%eax
  402a38:	75 0a                	jne    402a44 <submitr+0x5bf>
  402a3a:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  402a41:	00 
  402a42:	f7 d8                	neg    %eax
  402a44:	85 c0                	test   %eax,%eax
  402a46:	0f 85 37 ff ff ff    	jne    402983 <submitr+0x4fe>
  402a4c:	ba 00 20 00 00       	mov    $0x2000,%edx
  402a51:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402a58:	00 
  402a59:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402a5e:	e8 6b f8 ff ff       	callq  4022ce <rio_readlineb>
  402a63:	48 85 c0             	test   %rax,%rax
  402a66:	0f 8f 83 00 00 00    	jg     402aef <submitr+0x66a>
  402a6c:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a73:	3a 20 43 
  402a76:	48 89 03             	mov    %rax,(%rbx)
  402a79:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402a80:	20 75 6e 
  402a83:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402a87:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a8e:	74 6f 20 
  402a91:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402a95:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402a9c:	73 74 61 
  402a9f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402aa3:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402aaa:	65 73 73 
  402aad:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402ab1:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402ab8:	72 6f 6d 
  402abb:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402abf:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402ac6:	6c 74 20 
  402ac9:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402acd:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402ad4:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402ada:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402ade:	89 ef                	mov    %ebp,%edi
  402ae0:	e8 4b e2 ff ff       	callq  400d30 <close@plt>
  402ae5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402aea:	e9 dc 00 00 00       	jmpq   402bcb <submitr+0x746>
  402aef:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  402af4:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402afb:	74 37                	je     402b34 <submitr+0x6af>
  402afd:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  402b04:	00 
  402b05:	b9 18 37 40 00       	mov    $0x403718,%ecx
  402b0a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402b11:	be 01 00 00 00       	mov    $0x1,%esi
  402b16:	48 89 df             	mov    %rbx,%rdi
  402b19:	b8 00 00 00 00       	mov    $0x0,%eax
  402b1e:	e8 5d e3 ff ff       	callq  400e80 <__sprintf_chk@plt>
  402b23:	89 ef                	mov    %ebp,%edi
  402b25:	e8 06 e2 ff ff       	callq  400d30 <close@plt>
  402b2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b2f:	e9 97 00 00 00       	jmpq   402bcb <submitr+0x746>
  402b34:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402b3b:	00 
  402b3c:	48 89 df             	mov    %rbx,%rdi
  402b3f:	e8 7c e1 ff ff       	callq  400cc0 <strcpy@plt>
  402b44:	89 ef                	mov    %ebp,%edi
  402b46:	e8 e5 e1 ff ff       	callq  400d30 <close@plt>
  402b4b:	0f b6 03             	movzbl (%rbx),%eax
  402b4e:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402b53:	29 c2                	sub    %eax,%edx
  402b55:	75 22                	jne    402b79 <submitr+0x6f4>
  402b57:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402b5b:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402b60:	29 c8                	sub    %ecx,%eax
  402b62:	75 17                	jne    402b7b <submitr+0x6f6>
  402b64:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402b68:	b8 0a 00 00 00       	mov    $0xa,%eax
  402b6d:	29 c8                	sub    %ecx,%eax
  402b6f:	75 0a                	jne    402b7b <submitr+0x6f6>
  402b71:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402b75:	f7 d8                	neg    %eax
  402b77:	eb 02                	jmp    402b7b <submitr+0x6f6>
  402b79:	89 d0                	mov    %edx,%eax
  402b7b:	85 c0                	test   %eax,%eax
  402b7d:	74 40                	je     402bbf <submitr+0x73a>
  402b7f:	bf 60 37 40 00       	mov    $0x403760,%edi
  402b84:	b9 05 00 00 00       	mov    $0x5,%ecx
  402b89:	48 89 de             	mov    %rbx,%rsi
  402b8c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402b8e:	0f 97 c0             	seta   %al
  402b91:	0f 92 c1             	setb   %cl
  402b94:	29 c8                	sub    %ecx,%eax
  402b96:	0f be c0             	movsbl %al,%eax
  402b99:	85 c0                	test   %eax,%eax
  402b9b:	74 2e                	je     402bcb <submitr+0x746>
  402b9d:	85 d2                	test   %edx,%edx
  402b9f:	75 13                	jne    402bb4 <submitr+0x72f>
  402ba1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402ba5:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402baa:	29 c2                	sub    %eax,%edx
  402bac:	75 06                	jne    402bb4 <submitr+0x72f>
  402bae:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402bb2:	f7 da                	neg    %edx
  402bb4:	85 d2                	test   %edx,%edx
  402bb6:	75 0e                	jne    402bc6 <submitr+0x741>
  402bb8:	b8 00 00 00 00       	mov    $0x0,%eax
  402bbd:	eb 0c                	jmp    402bcb <submitr+0x746>
  402bbf:	b8 00 00 00 00       	mov    $0x0,%eax
  402bc4:	eb 05                	jmp    402bcb <submitr+0x746>
  402bc6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bcb:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402bd2:	00 
  402bd3:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402bda:	00 00 
  402bdc:	74 05                	je     402be3 <submitr+0x75e>
  402bde:	e8 0d e1 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  402be3:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402bea:	5b                   	pop    %rbx
  402beb:	5d                   	pop    %rbp
  402bec:	41 5c                	pop    %r12
  402bee:	41 5d                	pop    %r13
  402bf0:	41 5e                	pop    %r14
  402bf2:	41 5f                	pop    %r15
  402bf4:	c3                   	retq   

0000000000402bf5 <init_timeout>:
  402bf5:	85 ff                	test   %edi,%edi
  402bf7:	74 23                	je     402c1c <init_timeout+0x27>
  402bf9:	53                   	push   %rbx
  402bfa:	89 fb                	mov    %edi,%ebx
  402bfc:	85 ff                	test   %edi,%edi
  402bfe:	79 05                	jns    402c05 <init_timeout+0x10>
  402c00:	bb 00 00 00 00       	mov    $0x0,%ebx
  402c05:	be b9 21 40 00       	mov    $0x4021b9,%esi
  402c0a:	bf 0e 00 00 00       	mov    $0xe,%edi
  402c0f:	e8 4c e1 ff ff       	callq  400d60 <signal@plt>
  402c14:	89 df                	mov    %ebx,%edi
  402c16:	e8 05 e1 ff ff       	callq  400d20 <alarm@plt>
  402c1b:	5b                   	pop    %rbx
  402c1c:	f3 c3                	repz retq 

0000000000402c1e <init_driver>:
  402c1e:	55                   	push   %rbp
  402c1f:	53                   	push   %rbx
  402c20:	48 83 ec 28          	sub    $0x28,%rsp
  402c24:	48 89 fd             	mov    %rdi,%rbp
  402c27:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402c2e:	00 00 
  402c30:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402c35:	31 c0                	xor    %eax,%eax
  402c37:	be 01 00 00 00       	mov    $0x1,%esi
  402c3c:	bf 0d 00 00 00       	mov    $0xd,%edi
  402c41:	e8 1a e1 ff ff       	callq  400d60 <signal@plt>
  402c46:	be 01 00 00 00       	mov    $0x1,%esi
  402c4b:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402c50:	e8 0b e1 ff ff       	callq  400d60 <signal@plt>
  402c55:	be 01 00 00 00       	mov    $0x1,%esi
  402c5a:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402c5f:	e8 fc e0 ff ff       	callq  400d60 <signal@plt>
  402c64:	ba 00 00 00 00       	mov    $0x0,%edx
  402c69:	be 01 00 00 00       	mov    $0x1,%esi
  402c6e:	bf 02 00 00 00       	mov    $0x2,%edi
  402c73:	e8 18 e2 ff ff       	callq  400e90 <socket@plt>
  402c78:	85 c0                	test   %eax,%eax
  402c7a:	79 4f                	jns    402ccb <init_driver+0xad>
  402c7c:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402c83:	3a 20 43 
  402c86:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c8a:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402c91:	20 75 6e 
  402c94:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402c98:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c9f:	74 6f 20 
  402ca2:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ca6:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402cad:	65 20 73 
  402cb0:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402cb4:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402cbb:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402cc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402cc6:	e9 2a 01 00 00       	jmpq   402df5 <init_driver+0x1d7>
  402ccb:	89 c3                	mov    %eax,%ebx
  402ccd:	bf 7f 32 40 00       	mov    $0x40327f,%edi
  402cd2:	e8 99 e0 ff ff       	callq  400d70 <gethostbyname@plt>
  402cd7:	48 85 c0             	test   %rax,%rax
  402cda:	75 68                	jne    402d44 <init_driver+0x126>
  402cdc:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402ce3:	3a 20 44 
  402ce6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402cea:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402cf1:	20 75 6e 
  402cf4:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402cf8:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402cff:	74 6f 20 
  402d02:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d06:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402d0d:	76 65 20 
  402d10:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d14:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402d1b:	72 20 61 
  402d1e:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402d22:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402d29:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402d2f:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402d33:	89 df                	mov    %ebx,%edi
  402d35:	e8 f6 df ff ff       	callq  400d30 <close@plt>
  402d3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d3f:	e9 b1 00 00 00       	jmpq   402df5 <init_driver+0x1d7>
  402d44:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402d4b:	00 
  402d4c:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402d53:	00 00 
  402d55:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402d5b:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402d5f:	48 8b 40 18          	mov    0x18(%rax),%rax
  402d63:	48 8b 30             	mov    (%rax),%rsi
  402d66:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402d6b:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402d70:	e8 0b e0 ff ff       	callq  400d80 <__memmove_chk@plt>
  402d75:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402d7c:	ba 10 00 00 00       	mov    $0x10,%edx
  402d81:	48 89 e6             	mov    %rsp,%rsi
  402d84:	89 df                	mov    %ebx,%edi
  402d86:	e8 d5 e0 ff ff       	callq  400e60 <connect@plt>
  402d8b:	85 c0                	test   %eax,%eax
  402d8d:	79 50                	jns    402ddf <init_driver+0x1c1>
  402d8f:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402d96:	3a 20 55 
  402d99:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d9d:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402da4:	20 74 6f 
  402da7:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402dab:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402db2:	65 63 74 
  402db5:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402db9:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402dc0:	65 72 76 
  402dc3:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402dc7:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402dcd:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402dd1:	89 df                	mov    %ebx,%edi
  402dd3:	e8 58 df ff ff       	callq  400d30 <close@plt>
  402dd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ddd:	eb 16                	jmp    402df5 <init_driver+0x1d7>
  402ddf:	89 df                	mov    %ebx,%edi
  402de1:	e8 4a df ff ff       	callq  400d30 <close@plt>
  402de6:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402dec:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402df0:	b8 00 00 00 00       	mov    $0x0,%eax
  402df5:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402dfa:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402e01:	00 00 
  402e03:	74 05                	je     402e0a <init_driver+0x1ec>
  402e05:	e8 e6 de ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  402e0a:	48 83 c4 28          	add    $0x28,%rsp
  402e0e:	5b                   	pop    %rbx
  402e0f:	5d                   	pop    %rbp
  402e10:	c3                   	retq   

0000000000402e11 <driver_post>:
  402e11:	53                   	push   %rbx
  402e12:	4c 89 cb             	mov    %r9,%rbx
  402e15:	45 85 c0             	test   %r8d,%r8d
  402e18:	74 27                	je     402e41 <driver_post+0x30>
  402e1a:	48 89 ca             	mov    %rcx,%rdx
  402e1d:	be 65 37 40 00       	mov    $0x403765,%esi
  402e22:	bf 01 00 00 00       	mov    $0x1,%edi
  402e27:	b8 00 00 00 00       	mov    $0x0,%eax
  402e2c:	e8 cf df ff ff       	callq  400e00 <__printf_chk@plt>
  402e31:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402e36:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402e3a:	b8 00 00 00 00       	mov    $0x0,%eax
  402e3f:	eb 3f                	jmp    402e80 <driver_post+0x6f>
  402e41:	48 85 ff             	test   %rdi,%rdi
  402e44:	74 2c                	je     402e72 <driver_post+0x61>
  402e46:	80 3f 00             	cmpb   $0x0,(%rdi)
  402e49:	74 27                	je     402e72 <driver_post+0x61>
  402e4b:	48 83 ec 08          	sub    $0x8,%rsp
  402e4f:	41 51                	push   %r9
  402e51:	49 89 c9             	mov    %rcx,%r9
  402e54:	49 89 d0             	mov    %rdx,%r8
  402e57:	48 89 f9             	mov    %rdi,%rcx
  402e5a:	48 89 f2             	mov    %rsi,%rdx
  402e5d:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402e62:	bf 7f 32 40 00       	mov    $0x40327f,%edi
  402e67:	e8 19 f6 ff ff       	callq  402485 <submitr>
  402e6c:	48 83 c4 10          	add    $0x10,%rsp
  402e70:	eb 0e                	jmp    402e80 <driver_post+0x6f>
  402e72:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402e77:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402e7b:	b8 00 00 00 00       	mov    $0x0,%eax
  402e80:	5b                   	pop    %rbx
  402e81:	c3                   	retq   

0000000000402e82 <check>:
  402e82:	89 f8                	mov    %edi,%eax
  402e84:	c1 e8 1c             	shr    $0x1c,%eax
  402e87:	85 c0                	test   %eax,%eax
  402e89:	74 1d                	je     402ea8 <check+0x26>
  402e8b:	b9 00 00 00 00       	mov    $0x0,%ecx
  402e90:	eb 0b                	jmp    402e9d <check+0x1b>
  402e92:	89 f8                	mov    %edi,%eax
  402e94:	d3 e8                	shr    %cl,%eax
  402e96:	3c 0a                	cmp    $0xa,%al
  402e98:	74 14                	je     402eae <check+0x2c>
  402e9a:	83 c1 08             	add    $0x8,%ecx
  402e9d:	83 f9 1f             	cmp    $0x1f,%ecx
  402ea0:	7e f0                	jle    402e92 <check+0x10>
  402ea2:	b8 01 00 00 00       	mov    $0x1,%eax
  402ea7:	c3                   	retq   
  402ea8:	b8 00 00 00 00       	mov    $0x0,%eax
  402ead:	c3                   	retq   
  402eae:	b8 00 00 00 00       	mov    $0x0,%eax
  402eb3:	c3                   	retq   

0000000000402eb4 <gencookie>:
  402eb4:	53                   	push   %rbx
  402eb5:	83 c7 01             	add    $0x1,%edi
  402eb8:	e8 e3 dd ff ff       	callq  400ca0 <srandom@plt>
  402ebd:	e8 fe de ff ff       	callq  400dc0 <random@plt>
  402ec2:	89 c3                	mov    %eax,%ebx
  402ec4:	89 c7                	mov    %eax,%edi
  402ec6:	e8 b7 ff ff ff       	callq  402e82 <check>
  402ecb:	85 c0                	test   %eax,%eax
  402ecd:	74 ee                	je     402ebd <gencookie+0x9>
  402ecf:	89 d8                	mov    %ebx,%eax
  402ed1:	5b                   	pop    %rbx
  402ed2:	c3                   	retq   
  402ed3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402eda:	00 00 00 
  402edd:	0f 1f 00             	nopl   (%rax)

0000000000402ee0 <__libc_csu_init>:
  402ee0:	41 57                	push   %r15
  402ee2:	41 56                	push   %r14
  402ee4:	41 89 ff             	mov    %edi,%r15d
  402ee7:	41 55                	push   %r13
  402ee9:	41 54                	push   %r12
  402eeb:	4c 8d 25 1e 1f 20 00 	lea    0x201f1e(%rip),%r12        # 604e10 <__frame_dummy_init_array_entry>
  402ef2:	55                   	push   %rbp
  402ef3:	48 8d 2d 1e 1f 20 00 	lea    0x201f1e(%rip),%rbp        # 604e18 <__init_array_end>
  402efa:	53                   	push   %rbx
  402efb:	49 89 f6             	mov    %rsi,%r14
  402efe:	49 89 d5             	mov    %rdx,%r13
  402f01:	4c 29 e5             	sub    %r12,%rbp
  402f04:	48 83 ec 08          	sub    $0x8,%rsp
  402f08:	48 c1 fd 03          	sar    $0x3,%rbp
  402f0c:	e8 37 dd ff ff       	callq  400c48 <_init>
  402f11:	48 85 ed             	test   %rbp,%rbp
  402f14:	74 20                	je     402f36 <__libc_csu_init+0x56>
  402f16:	31 db                	xor    %ebx,%ebx
  402f18:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402f1f:	00 
  402f20:	4c 89 ea             	mov    %r13,%rdx
  402f23:	4c 89 f6             	mov    %r14,%rsi
  402f26:	44 89 ff             	mov    %r15d,%edi
  402f29:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402f2d:	48 83 c3 01          	add    $0x1,%rbx
  402f31:	48 39 eb             	cmp    %rbp,%rbx
  402f34:	75 ea                	jne    402f20 <__libc_csu_init+0x40>
  402f36:	48 83 c4 08          	add    $0x8,%rsp
  402f3a:	5b                   	pop    %rbx
  402f3b:	5d                   	pop    %rbp
  402f3c:	41 5c                	pop    %r12
  402f3e:	41 5d                	pop    %r13
  402f40:	41 5e                	pop    %r14
  402f42:	41 5f                	pop    %r15
  402f44:	c3                   	retq   
  402f45:	90                   	nop
  402f46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f4d:	00 00 00 

0000000000402f50 <__libc_csu_fini>:
  402f50:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402f54 <_fini>:
  402f54:	48 83 ec 08          	sub    $0x8,%rsp
  402f58:	48 83 c4 08          	add    $0x8,%rsp
  402f5c:	c3                   	retq   
