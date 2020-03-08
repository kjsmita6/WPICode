
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c48 <_init>:
  400c48:	48 83 ec 08          	sub    $0x8,%rsp
  400c4c:	48 8b 05 a5 33 20 00 	mov    0x2033a5(%rip),%rax        # 603ff8 <_DYNAMIC+0x1d0>
  400c53:	48 85 c0             	test   %rax,%rax
  400c56:	74 05                	je     400c5d <_init+0x15>
  400c58:	e8 43 02 00 00       	callq  400ea0 <socket@plt+0x10>
  400c5d:	48 83 c4 08          	add    $0x8,%rsp
  400c61:	c3                   	retq   

Disassembly of section .plt:

0000000000400c70 <strcasecmp@plt-0x10>:
  400c70:	ff 35 92 33 20 00    	pushq  0x203392(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c76:	ff 25 94 33 20 00    	jmpq   *0x203394(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c80 <strcasecmp@plt>:
  400c80:	ff 25 92 33 20 00    	jmpq   *0x203392(%rip)        # 604018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400c86:	68 00 00 00 00       	pushq  $0x0
  400c8b:	e9 e0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400c90 <__errno_location@plt>:
  400c90:	ff 25 8a 33 20 00    	jmpq   *0x20338a(%rip)        # 604020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400c96:	68 01 00 00 00       	pushq  $0x1
  400c9b:	e9 d0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400ca0 <srandom@plt>:
  400ca0:	ff 25 82 33 20 00    	jmpq   *0x203382(%rip)        # 604028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400ca6:	68 02 00 00 00       	pushq  $0x2
  400cab:	e9 c0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cb0 <strncmp@plt>:
  400cb0:	ff 25 7a 33 20 00    	jmpq   *0x20337a(%rip)        # 604030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400cb6:	68 03 00 00 00       	pushq  $0x3
  400cbb:	e9 b0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cc0 <strcpy@plt>:
  400cc0:	ff 25 72 33 20 00    	jmpq   *0x203372(%rip)        # 604038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400cc6:	68 04 00 00 00       	pushq  $0x4
  400ccb:	e9 a0 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cd0 <puts@plt>:
  400cd0:	ff 25 6a 33 20 00    	jmpq   *0x20336a(%rip)        # 604040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400cd6:	68 05 00 00 00       	pushq  $0x5
  400cdb:	e9 90 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400ce0 <write@plt>:
  400ce0:	ff 25 62 33 20 00    	jmpq   *0x203362(%rip)        # 604048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400ce6:	68 06 00 00 00       	pushq  $0x6
  400ceb:	e9 80 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400cf0 <__stack_chk_fail@plt>:
  400cf0:	ff 25 5a 33 20 00    	jmpq   *0x20335a(%rip)        # 604050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400cf6:	68 07 00 00 00       	pushq  $0x7
  400cfb:	e9 70 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d00 <mmap@plt>:
  400d00:	ff 25 52 33 20 00    	jmpq   *0x203352(%rip)        # 604058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400d06:	68 08 00 00 00       	pushq  $0x8
  400d0b:	e9 60 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d10 <memset@plt>:
  400d10:	ff 25 4a 33 20 00    	jmpq   *0x20334a(%rip)        # 604060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400d16:	68 09 00 00 00       	pushq  $0x9
  400d1b:	e9 50 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d20 <alarm@plt>:
  400d20:	ff 25 42 33 20 00    	jmpq   *0x203342(%rip)        # 604068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400d26:	68 0a 00 00 00       	pushq  $0xa
  400d2b:	e9 40 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d30 <close@plt>:
  400d30:	ff 25 3a 33 20 00    	jmpq   *0x20333a(%rip)        # 604070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400d36:	68 0b 00 00 00       	pushq  $0xb
  400d3b:	e9 30 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d40 <read@plt>:
  400d40:	ff 25 32 33 20 00    	jmpq   *0x203332(%rip)        # 604078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400d46:	68 0c 00 00 00       	pushq  $0xc
  400d4b:	e9 20 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d50 <__libc_start_main@plt>:
  400d50:	ff 25 2a 33 20 00    	jmpq   *0x20332a(%rip)        # 604080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400d56:	68 0d 00 00 00       	pushq  $0xd
  400d5b:	e9 10 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d60 <signal@plt>:
  400d60:	ff 25 22 33 20 00    	jmpq   *0x203322(%rip)        # 604088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400d66:	68 0e 00 00 00       	pushq  $0xe
  400d6b:	e9 00 ff ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d70 <gethostbyname@plt>:
  400d70:	ff 25 1a 33 20 00    	jmpq   *0x20331a(%rip)        # 604090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400d76:	68 0f 00 00 00       	pushq  $0xf
  400d7b:	e9 f0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d80 <__memmove_chk@plt>:
  400d80:	ff 25 12 33 20 00    	jmpq   *0x203312(%rip)        # 604098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400d86:	68 10 00 00 00       	pushq  $0x10
  400d8b:	e9 e0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400d90 <strtol@plt>:
  400d90:	ff 25 0a 33 20 00    	jmpq   *0x20330a(%rip)        # 6040a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400d96:	68 11 00 00 00       	pushq  $0x11
  400d9b:	e9 d0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400da0 <memcpy@plt>:
  400da0:	ff 25 02 33 20 00    	jmpq   *0x203302(%rip)        # 6040a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400da6:	68 12 00 00 00       	pushq  $0x12
  400dab:	e9 c0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400db0 <time@plt>:
  400db0:	ff 25 fa 32 20 00    	jmpq   *0x2032fa(%rip)        # 6040b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400db6:	68 13 00 00 00       	pushq  $0x13
  400dbb:	e9 b0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400dc0 <random@plt>:
  400dc0:	ff 25 f2 32 20 00    	jmpq   *0x2032f2(%rip)        # 6040b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400dc6:	68 14 00 00 00       	pushq  $0x14
  400dcb:	e9 a0 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400dd0 <_IO_getc@plt>:
  400dd0:	ff 25 ea 32 20 00    	jmpq   *0x2032ea(%rip)        # 6040c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400dd6:	68 15 00 00 00       	pushq  $0x15
  400ddb:	e9 90 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400de0 <__isoc99_sscanf@plt>:
  400de0:	ff 25 e2 32 20 00    	jmpq   *0x2032e2(%rip)        # 6040c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400de6:	68 16 00 00 00       	pushq  $0x16
  400deb:	e9 80 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400df0 <munmap@plt>:
  400df0:	ff 25 da 32 20 00    	jmpq   *0x2032da(%rip)        # 6040d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400df6:	68 17 00 00 00       	pushq  $0x17
  400dfb:	e9 70 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e00 <__printf_chk@plt>:
  400e00:	ff 25 d2 32 20 00    	jmpq   *0x2032d2(%rip)        # 6040d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400e06:	68 18 00 00 00       	pushq  $0x18
  400e0b:	e9 60 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e10 <fopen@plt>:
  400e10:	ff 25 ca 32 20 00    	jmpq   *0x2032ca(%rip)        # 6040e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400e16:	68 19 00 00 00       	pushq  $0x19
  400e1b:	e9 50 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e20 <getopt@plt>:
  400e20:	ff 25 c2 32 20 00    	jmpq   *0x2032c2(%rip)        # 6040e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400e26:	68 1a 00 00 00       	pushq  $0x1a
  400e2b:	e9 40 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e30 <strtoul@plt>:
  400e30:	ff 25 ba 32 20 00    	jmpq   *0x2032ba(%rip)        # 6040f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400e36:	68 1b 00 00 00       	pushq  $0x1b
  400e3b:	e9 30 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e40 <gethostname@plt>:
  400e40:	ff 25 b2 32 20 00    	jmpq   *0x2032b2(%rip)        # 6040f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400e46:	68 1c 00 00 00       	pushq  $0x1c
  400e4b:	e9 20 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e50 <exit@plt>:
  400e50:	ff 25 aa 32 20 00    	jmpq   *0x2032aa(%rip)        # 604100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400e56:	68 1d 00 00 00       	pushq  $0x1d
  400e5b:	e9 10 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e60 <connect@plt>:
  400e60:	ff 25 a2 32 20 00    	jmpq   *0x2032a2(%rip)        # 604108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400e66:	68 1e 00 00 00       	pushq  $0x1e
  400e6b:	e9 00 fe ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e70 <__fprintf_chk@plt>:
  400e70:	ff 25 9a 32 20 00    	jmpq   *0x20329a(%rip)        # 604110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400e76:	68 1f 00 00 00       	pushq  $0x1f
  400e7b:	e9 f0 fd ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e80 <__sprintf_chk@plt>:
  400e80:	ff 25 92 32 20 00    	jmpq   *0x203292(%rip)        # 604118 <_GLOBAL_OFFSET_TABLE_+0x118>
  400e86:	68 20 00 00 00       	pushq  $0x20
  400e8b:	e9 e0 fd ff ff       	jmpq   400c70 <_init+0x28>

0000000000400e90 <socket@plt>:
  400e90:	ff 25 8a 32 20 00    	jmpq   *0x20328a(%rip)        # 604120 <_GLOBAL_OFFSET_TABLE_+0x120>
  400e96:	68 21 00 00 00       	pushq  $0x21
  400e9b:	e9 d0 fd ff ff       	jmpq   400c70 <_init+0x28>

Disassembly of section .plt.got:

0000000000400ea0 <.plt.got>:
  400ea0:	ff 25 52 31 20 00    	jmpq   *0x203152(%rip)        # 603ff8 <_DYNAMIC+0x1d0>
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
  400ebf:	49 c7 c0 30 2e 40 00 	mov    $0x402e30,%r8
  400ec6:	48 c7 c1 c0 2d 40 00 	mov    $0x402dc0,%rcx
  400ecd:	48 c7 c7 b5 11 40 00 	mov    $0x4011b5,%rdi
  400ed4:	e8 77 fe ff ff       	callq  400d50 <__libc_start_main@plt>
  400ed9:	f4                   	hlt    
  400eda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400ee0 <deregister_tm_clones>:
  400ee0:	b8 b7 44 60 00       	mov    $0x6044b7,%eax
  400ee5:	55                   	push   %rbp
  400ee6:	48 2d b0 44 60 00    	sub    $0x6044b0,%rax
  400eec:	48 83 f8 0e          	cmp    $0xe,%rax
  400ef0:	48 89 e5             	mov    %rsp,%rbp
  400ef3:	76 1b                	jbe    400f10 <deregister_tm_clones+0x30>
  400ef5:	b8 00 00 00 00       	mov    $0x0,%eax
  400efa:	48 85 c0             	test   %rax,%rax
  400efd:	74 11                	je     400f10 <deregister_tm_clones+0x30>
  400eff:	5d                   	pop    %rbp
  400f00:	bf b0 44 60 00       	mov    $0x6044b0,%edi
  400f05:	ff e0                	jmpq   *%rax
  400f07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400f0e:	00 00 
  400f10:	5d                   	pop    %rbp
  400f11:	c3                   	retq   
  400f12:	0f 1f 40 00          	nopl   0x0(%rax)
  400f16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f1d:	00 00 00 

0000000000400f20 <register_tm_clones>:
  400f20:	be b0 44 60 00       	mov    $0x6044b0,%esi
  400f25:	55                   	push   %rbp
  400f26:	48 81 ee b0 44 60 00 	sub    $0x6044b0,%rsi
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
  400f4e:	bf b0 44 60 00       	mov    $0x6044b0,%edi
  400f53:	ff e0                	jmpq   *%rax
  400f55:	0f 1f 00             	nopl   (%rax)
  400f58:	5d                   	pop    %rbp
  400f59:	c3                   	retq   
  400f5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400f60 <__do_global_dtors_aux>:
  400f60:	80 3d 81 35 20 00 00 	cmpb   $0x0,0x203581(%rip)        # 6044e8 <completed.7594>
  400f67:	75 11                	jne    400f7a <__do_global_dtors_aux+0x1a>
  400f69:	55                   	push   %rbp
  400f6a:	48 89 e5             	mov    %rsp,%rbp
  400f6d:	e8 6e ff ff ff       	callq  400ee0 <deregister_tm_clones>
  400f72:	5d                   	pop    %rbp
  400f73:	c6 05 6e 35 20 00 01 	movb   $0x1,0x20356e(%rip)        # 6044e8 <completed.7594>
  400f7a:	f3 c3                	repz retq 
  400f7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f80 <frame_dummy>:
  400f80:	bf 20 3e 60 00       	mov    $0x603e20,%edi
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
  400fad:	83 3d 74 35 20 00 00 	cmpl   $0x0,0x203574(%rip)        # 604528 <is_checker>
  400fb4:	74 3e                	je     400ff4 <usage+0x4e>
  400fb6:	be 48 2e 40 00       	mov    $0x402e48,%esi
  400fbb:	bf 01 00 00 00       	mov    $0x1,%edi
  400fc0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fc5:	e8 36 fe ff ff       	callq  400e00 <__printf_chk@plt>
  400fca:	bf 80 2e 40 00       	mov    $0x402e80,%edi
  400fcf:	e8 fc fc ff ff       	callq  400cd0 <puts@plt>
  400fd4:	bf f8 2f 40 00       	mov    $0x402ff8,%edi
  400fd9:	e8 f2 fc ff ff       	callq  400cd0 <puts@plt>
  400fde:	bf a8 2e 40 00       	mov    $0x402ea8,%edi
  400fe3:	e8 e8 fc ff ff       	callq  400cd0 <puts@plt>
  400fe8:	bf 12 30 40 00       	mov    $0x403012,%edi
  400fed:	e8 de fc ff ff       	callq  400cd0 <puts@plt>
  400ff2:	eb 32                	jmp    401026 <usage+0x80>
  400ff4:	be 2e 30 40 00       	mov    $0x40302e,%esi
  400ff9:	bf 01 00 00 00       	mov    $0x1,%edi
  400ffe:	b8 00 00 00 00       	mov    $0x0,%eax
  401003:	e8 f8 fd ff ff       	callq  400e00 <__printf_chk@plt>
  401008:	bf d0 2e 40 00       	mov    $0x402ed0,%edi
  40100d:	e8 be fc ff ff       	callq  400cd0 <puts@plt>
  401012:	bf f8 2e 40 00       	mov    $0x402ef8,%edi
  401017:	e8 b4 fc ff ff       	callq  400cd0 <puts@plt>
  40101c:	bf 4c 30 40 00       	mov    $0x40304c,%edi
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
  40104e:	89 3d c4 34 20 00    	mov    %edi,0x2034c4(%rip)        # 604518 <check_level>
  401054:	8b 3d 0e 31 20 00    	mov    0x20310e(%rip),%edi        # 604168 <target_id>
  40105a:	e8 34 1d 00 00       	callq  402d93 <gencookie>
  40105f:	89 05 bf 34 20 00    	mov    %eax,0x2034bf(%rip)        # 604524 <cookie>
  401065:	89 c7                	mov    %eax,%edi
  401067:	e8 27 1d 00 00       	callq  402d93 <gencookie>
  40106c:	89 05 ae 34 20 00    	mov    %eax,0x2034ae(%rip)        # 604520 <authkey>
  401072:	8b 05 f0 30 20 00    	mov    0x2030f0(%rip),%eax        # 604168 <target_id>
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
  4010bd:	48 89 05 dc 33 20 00 	mov    %rax,0x2033dc(%rip)        # 6044a0 <buf_offset>
  4010c4:	c6 05 7d 40 20 00 63 	movb   $0x63,0x20407d(%rip)        # 605148 <target_prefix>
  4010cb:	83 3d d6 33 20 00 00 	cmpl   $0x0,0x2033d6(%rip)        # 6044a8 <notify>
  4010d2:	0f 84 bb 00 00 00    	je     401193 <initialize_target+0x163>
  4010d8:	83 3d 49 34 20 00 00 	cmpl   $0x0,0x203449(%rip)        # 604528 <is_checker>
  4010df:	0f 85 ae 00 00 00    	jne    401193 <initialize_target+0x163>
  4010e5:	be 00 01 00 00       	mov    $0x100,%esi
  4010ea:	48 89 e7             	mov    %rsp,%rdi
  4010ed:	e8 4e fd ff ff       	callq  400e40 <gethostname@plt>
  4010f2:	85 c0                	test   %eax,%eax
  4010f4:	74 25                	je     40111b <initialize_target+0xeb>
  4010f6:	bf 28 2f 40 00       	mov    $0x402f28,%edi
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
  401123:	48 8b 3c c5 80 41 60 	mov    0x604180(,%rax,8),%rdi
  40112a:	00 
  40112b:	48 85 ff             	test   %rdi,%rdi
  40112e:	75 da                	jne    40110a <initialize_target+0xda>
  401130:	b8 00 00 00 00       	mov    $0x0,%eax
  401135:	eb 05                	jmp    40113c <initialize_target+0x10c>
  401137:	b8 01 00 00 00       	mov    $0x1,%eax
  40113c:	85 c0                	test   %eax,%eax
  40113e:	75 1c                	jne    40115c <initialize_target+0x12c>
  401140:	48 89 e2             	mov    %rsp,%rdx
  401143:	be 60 2f 40 00       	mov    $0x402f60,%esi
  401148:	bf 01 00 00 00       	mov    $0x1,%edi
  40114d:	e8 ae fc ff ff       	callq  400e00 <__printf_chk@plt>
  401152:	bf 08 00 00 00       	mov    $0x8,%edi
  401157:	e8 f4 fc ff ff       	callq  400e50 <exit@plt>
  40115c:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401163:	00 
  401164:	e8 94 19 00 00       	callq  402afd <init_driver>
  401169:	85 c0                	test   %eax,%eax
  40116b:	79 26                	jns    401193 <initialize_target+0x163>
  40116d:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  401174:	00 
  401175:	be a0 2f 40 00       	mov    $0x402fa0,%esi
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
  4011c3:	be 38 1e 40 00       	mov    $0x401e38,%esi
  4011c8:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011cd:	e8 8e fb ff ff       	callq  400d60 <signal@plt>
  4011d2:	be ea 1d 40 00       	mov    $0x401dea,%esi
  4011d7:	bf 07 00 00 00       	mov    $0x7,%edi
  4011dc:	e8 7f fb ff ff       	callq  400d60 <signal@plt>
  4011e1:	be 86 1e 40 00       	mov    $0x401e86,%esi
  4011e6:	bf 04 00 00 00       	mov    $0x4,%edi
  4011eb:	e8 70 fb ff ff       	callq  400d60 <signal@plt>
  4011f0:	83 3d 31 33 20 00 00 	cmpl   $0x0,0x203331(%rip)        # 604528 <is_checker>
  4011f7:	74 20                	je     401219 <main+0x64>
  4011f9:	be d4 1e 40 00       	mov    $0x401ed4,%esi
  4011fe:	bf 0e 00 00 00       	mov    $0xe,%edi
  401203:	e8 58 fb ff ff       	callq  400d60 <signal@plt>
  401208:	bf 05 00 00 00       	mov    $0x5,%edi
  40120d:	e8 0e fb ff ff       	callq  400d20 <alarm@plt>
  401212:	bd 6a 30 40 00       	mov    $0x40306a,%ebp
  401217:	eb 05                	jmp    40121e <main+0x69>
  401219:	bd 65 30 40 00       	mov    $0x403065,%ebp
  40121e:	48 8b 05 9b 32 20 00 	mov    0x20329b(%rip),%rax        # 6044c0 <stdin@@GLIBC_2.2.5>
  401225:	48 89 05 e4 32 20 00 	mov    %rax,0x2032e4(%rip)        # 604510 <infile>
  40122c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401232:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401238:	e9 c6 00 00 00       	jmpq   401303 <main+0x14e>
  40123d:	83 e8 61             	sub    $0x61,%eax
  401240:	3c 10                	cmp    $0x10,%al
  401242:	0f 87 9c 00 00 00    	ja     4012e4 <main+0x12f>
  401248:	0f b6 c0             	movzbl %al,%eax
  40124b:	ff 24 c5 b8 30 40 00 	jmpq   *0x4030b8(,%rax,8)
  401252:	48 8b 3b             	mov    (%rbx),%rdi
  401255:	e8 4c fd ff ff       	callq  400fa6 <usage>
  40125a:	be 3d 33 40 00       	mov    $0x40333d,%esi
  40125f:	48 8b 3d 62 32 20 00 	mov    0x203262(%rip),%rdi        # 6044c8 <optarg@@GLIBC_2.2.5>
  401266:	e8 a5 fb ff ff       	callq  400e10 <fopen@plt>
  40126b:	48 89 05 9e 32 20 00 	mov    %rax,0x20329e(%rip)        # 604510 <infile>
  401272:	48 85 c0             	test   %rax,%rax
  401275:	0f 85 88 00 00 00    	jne    401303 <main+0x14e>
  40127b:	48 8b 0d 46 32 20 00 	mov    0x203246(%rip),%rcx        # 6044c8 <optarg@@GLIBC_2.2.5>
  401282:	ba 72 30 40 00       	mov    $0x403072,%edx
  401287:	be 01 00 00 00       	mov    $0x1,%esi
  40128c:	48 8b 3d 4d 32 20 00 	mov    0x20324d(%rip),%rdi        # 6044e0 <stderr@@GLIBC_2.2.5>
  401293:	e8 d8 fb ff ff       	callq  400e70 <__fprintf_chk@plt>
  401298:	b8 01 00 00 00       	mov    $0x1,%eax
  40129d:	e9 ee 00 00 00       	jmpq   401390 <main+0x1db>
  4012a2:	ba 10 00 00 00       	mov    $0x10,%edx
  4012a7:	be 00 00 00 00       	mov    $0x0,%esi
  4012ac:	48 8b 3d 15 32 20 00 	mov    0x203215(%rip),%rdi        # 6044c8 <optarg@@GLIBC_2.2.5>
  4012b3:	e8 78 fb ff ff       	callq  400e30 <strtoul@plt>
  4012b8:	41 89 c6             	mov    %eax,%r14d
  4012bb:	eb 46                	jmp    401303 <main+0x14e>
  4012bd:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012c2:	be 00 00 00 00       	mov    $0x0,%esi
  4012c7:	48 8b 3d fa 31 20 00 	mov    0x2031fa(%rip),%rdi        # 6044c8 <optarg@@GLIBC_2.2.5>
  4012ce:	e8 bd fa ff ff       	callq  400d90 <strtol@plt>
  4012d3:	41 89 c5             	mov    %eax,%r13d
  4012d6:	eb 2b                	jmp    401303 <main+0x14e>
  4012d8:	c7 05 c6 31 20 00 00 	movl   $0x0,0x2031c6(%rip)        # 6044a8 <notify>
  4012df:	00 00 00 
  4012e2:	eb 1f                	jmp    401303 <main+0x14e>
  4012e4:	0f be d2             	movsbl %dl,%edx
  4012e7:	be 8f 30 40 00       	mov    $0x40308f,%esi
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
  40131b:	be 00 00 00 00       	mov    $0x0,%esi
  401320:	44 89 ef             	mov    %r13d,%edi
  401323:	e8 08 fd ff ff       	callq  401030 <initialize_target>
  401328:	83 3d f9 31 20 00 00 	cmpl   $0x0,0x2031f9(%rip)        # 604528 <is_checker>
  40132f:	74 2a                	je     40135b <main+0x1a6>
  401331:	44 3b 35 e8 31 20 00 	cmp    0x2031e8(%rip),%r14d        # 604520 <authkey>
  401338:	74 21                	je     40135b <main+0x1a6>
  40133a:	44 89 f2             	mov    %r14d,%edx
  40133d:	be c8 2f 40 00       	mov    $0x402fc8,%esi
  401342:	bf 01 00 00 00       	mov    $0x1,%edi
  401347:	b8 00 00 00 00       	mov    $0x0,%eax
  40134c:	e8 af fa ff ff       	callq  400e00 <__printf_chk@plt>
  401351:	b8 00 00 00 00       	mov    $0x0,%eax
  401356:	e8 2b 07 00 00       	callq  401a86 <check_fail>
  40135b:	8b 15 c3 31 20 00    	mov    0x2031c3(%rip),%edx        # 604524 <cookie>
  401361:	be a2 30 40 00       	mov    $0x4030a2,%esi
  401366:	bf 01 00 00 00       	mov    $0x1,%edi
  40136b:	b8 00 00 00 00       	mov    $0x0,%eax
  401370:	e8 8b fa ff ff       	callq  400e00 <__printf_chk@plt>
  401375:	bf b0 30 40 00       	mov    $0x4030b0,%edi
  40137a:	e8 51 f9 ff ff       	callq  400cd0 <puts@plt>
  40137f:	48 8b 3d 1a 31 20 00 	mov    0x20311a(%rip),%rdi        # 6044a0 <buf_offset>
  401386:	e8 49 0c 00 00       	callq  401fd4 <stable_launch>
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
  401838:	e8 7e 02 00 00       	callq  401abb <Gets>
  40183d:	b8 01 00 00 00       	mov    $0x1,%eax
  401842:	48 83 c4 38          	add    $0x38,%rsp
  401846:	c3                   	retq   

0000000000401847 <touch1>:
  401847:	48 83 ec 08          	sub    $0x8,%rsp
  40184b:	c7 05 c7 2c 20 00 01 	movl   $0x1,0x202cc7(%rip)        # 60451c <vlevel>
  401852:	00 00 00 
  401855:	bf 92 31 40 00       	mov    $0x403192,%edi
  40185a:	e8 71 f4 ff ff       	callq  400cd0 <puts@plt>
  40185f:	bf 01 00 00 00       	mov    $0x1,%edi
  401864:	e8 97 04 00 00       	callq  401d00 <validate>
  401869:	bf 00 00 00 00       	mov    $0x0,%edi
  40186e:	e8 dd f5 ff ff       	callq  400e50 <exit@plt>

0000000000401873 <touch2>:
  401873:	48 83 ec 08          	sub    $0x8,%rsp
  401877:	89 fa                	mov    %edi,%edx
  401879:	c7 05 99 2c 20 00 02 	movl   $0x2,0x202c99(%rip)        # 60451c <vlevel>
  401880:	00 00 00 
  401883:	39 3d 9b 2c 20 00    	cmp    %edi,0x202c9b(%rip)        # 604524 <cookie>
  401889:	75 20                	jne    4018ab <touch2+0x38>
  40188b:	be b8 31 40 00       	mov    $0x4031b8,%esi
  401890:	bf 01 00 00 00       	mov    $0x1,%edi
  401895:	b8 00 00 00 00       	mov    $0x0,%eax
  40189a:	e8 61 f5 ff ff       	callq  400e00 <__printf_chk@plt>
  40189f:	bf 02 00 00 00       	mov    $0x2,%edi
  4018a4:	e8 57 04 00 00       	callq  401d00 <validate>
  4018a9:	eb 1e                	jmp    4018c9 <touch2+0x56>
  4018ab:	be e0 31 40 00       	mov    $0x4031e0,%esi
  4018b0:	bf 01 00 00 00       	mov    $0x1,%edi
  4018b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4018ba:	e8 41 f5 ff ff       	callq  400e00 <__printf_chk@plt>
  4018bf:	bf 02 00 00 00       	mov    $0x2,%edi
  4018c4:	e8 f9 04 00 00       	callq  401dc2 <fail>
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
  401930:	b9 af 31 40 00       	mov    $0x4031af,%ecx
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
  401988:	c7 05 8a 2b 20 00 03 	movl   $0x3,0x202b8a(%rip)        # 60451c <vlevel>
  40198f:	00 00 00 
  401992:	48 89 fe             	mov    %rdi,%rsi
  401995:	8b 3d 89 2b 20 00    	mov    0x202b89(%rip),%edi        # 604524 <cookie>
  40199b:	e8 33 ff ff ff       	callq  4018d3 <hexmatch>
  4019a0:	85 c0                	test   %eax,%eax
  4019a2:	74 23                	je     4019c7 <touch3+0x43>
  4019a4:	48 89 da             	mov    %rbx,%rdx
  4019a7:	be 08 32 40 00       	mov    $0x403208,%esi
  4019ac:	bf 01 00 00 00       	mov    $0x1,%edi
  4019b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4019b6:	e8 45 f4 ff ff       	callq  400e00 <__printf_chk@plt>
  4019bb:	bf 03 00 00 00       	mov    $0x3,%edi
  4019c0:	e8 3b 03 00 00       	callq  401d00 <validate>
  4019c5:	eb 21                	jmp    4019e8 <touch3+0x64>
  4019c7:	48 89 da             	mov    %rbx,%rdx
  4019ca:	be 30 32 40 00       	mov    $0x403230,%esi
  4019cf:	bf 01 00 00 00       	mov    $0x1,%edi
  4019d4:	b8 00 00 00 00       	mov    $0x0,%eax
  4019d9:	e8 22 f4 ff ff       	callq  400e00 <__printf_chk@plt>
  4019de:	bf 03 00 00 00       	mov    $0x3,%edi
  4019e3:	e8 da 03 00 00       	callq  401dc2 <fail>
  4019e8:	bf 00 00 00 00       	mov    $0x0,%edi
  4019ed:	e8 5e f4 ff ff       	callq  400e50 <exit@plt>

00000000004019f2 <test>:
  4019f2:	48 83 ec 08          	sub    $0x8,%rsp
  4019f6:	b8 00 00 00 00       	mov    $0x0,%eax
  4019fb:	e8 31 fe ff ff       	callq  401831 <getbuf>
  401a00:	89 c2                	mov    %eax,%edx
  401a02:	be 58 32 40 00       	mov    $0x403258,%esi
  401a07:	bf 01 00 00 00       	mov    $0x1,%edi
  401a0c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a11:	e8 ea f3 ff ff       	callq  400e00 <__printf_chk@plt>
  401a16:	48 83 c4 08          	add    $0x8,%rsp
  401a1a:	c3                   	retq   

0000000000401a1b <save_char>:
  401a1b:	8b 05 23 37 20 00    	mov    0x203723(%rip),%eax        # 605144 <gets_cnt>
  401a21:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401a26:	7f 49                	jg     401a71 <save_char+0x56>
  401a28:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401a2b:	89 f9                	mov    %edi,%ecx
  401a2d:	c0 e9 04             	shr    $0x4,%cl
  401a30:	83 e1 0f             	and    $0xf,%ecx
  401a33:	0f b6 b1 80 35 40 00 	movzbl 0x403580(%rcx),%esi
  401a3a:	48 63 ca             	movslq %edx,%rcx
  401a3d:	40 88 b1 40 45 60 00 	mov    %sil,0x604540(%rcx)
  401a44:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401a47:	83 e7 0f             	and    $0xf,%edi
  401a4a:	0f b6 b7 80 35 40 00 	movzbl 0x403580(%rdi),%esi
  401a51:	48 63 c9             	movslq %ecx,%rcx
  401a54:	40 88 b1 40 45 60 00 	mov    %sil,0x604540(%rcx)
  401a5b:	83 c2 02             	add    $0x2,%edx
  401a5e:	48 63 d2             	movslq %edx,%rdx
  401a61:	c6 82 40 45 60 00 20 	movb   $0x20,0x604540(%rdx)
  401a68:	83 c0 01             	add    $0x1,%eax
  401a6b:	89 05 d3 36 20 00    	mov    %eax,0x2036d3(%rip)        # 605144 <gets_cnt>
  401a71:	f3 c3                	repz retq 

0000000000401a73 <save_term>:
  401a73:	8b 05 cb 36 20 00    	mov    0x2036cb(%rip),%eax        # 605144 <gets_cnt>
  401a79:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401a7c:	48 98                	cltq   
  401a7e:	c6 80 40 45 60 00 00 	movb   $0x0,0x604540(%rax)
  401a85:	c3                   	retq   

0000000000401a86 <check_fail>:
  401a86:	48 83 ec 08          	sub    $0x8,%rsp
  401a8a:	0f be 15 b7 36 20 00 	movsbl 0x2036b7(%rip),%edx        # 605148 <target_prefix>
  401a91:	41 b8 40 45 60 00    	mov    $0x604540,%r8d
  401a97:	8b 0d 7b 2a 20 00    	mov    0x202a7b(%rip),%ecx        # 604518 <check_level>
  401a9d:	be 7b 32 40 00       	mov    $0x40327b,%esi
  401aa2:	bf 01 00 00 00       	mov    $0x1,%edi
  401aa7:	b8 00 00 00 00       	mov    $0x0,%eax
  401aac:	e8 4f f3 ff ff       	callq  400e00 <__printf_chk@plt>
  401ab1:	bf 01 00 00 00       	mov    $0x1,%edi
  401ab6:	e8 95 f3 ff ff       	callq  400e50 <exit@plt>

0000000000401abb <Gets>:
  401abb:	41 54                	push   %r12
  401abd:	55                   	push   %rbp
  401abe:	53                   	push   %rbx
  401abf:	49 89 fc             	mov    %rdi,%r12
  401ac2:	c7 05 78 36 20 00 00 	movl   $0x0,0x203678(%rip)        # 605144 <gets_cnt>
  401ac9:	00 00 00 
  401acc:	48 89 fb             	mov    %rdi,%rbx
  401acf:	eb 11                	jmp    401ae2 <Gets+0x27>
  401ad1:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401ad5:	88 03                	mov    %al,(%rbx)
  401ad7:	0f b6 f8             	movzbl %al,%edi
  401ada:	e8 3c ff ff ff       	callq  401a1b <save_char>
  401adf:	48 89 eb             	mov    %rbp,%rbx
  401ae2:	48 8b 3d 27 2a 20 00 	mov    0x202a27(%rip),%rdi        # 604510 <infile>
  401ae9:	e8 e2 f2 ff ff       	callq  400dd0 <_IO_getc@plt>
  401aee:	83 f8 ff             	cmp    $0xffffffff,%eax
  401af1:	74 05                	je     401af8 <Gets+0x3d>
  401af3:	83 f8 0a             	cmp    $0xa,%eax
  401af6:	75 d9                	jne    401ad1 <Gets+0x16>
  401af8:	c6 03 00             	movb   $0x0,(%rbx)
  401afb:	b8 00 00 00 00       	mov    $0x0,%eax
  401b00:	e8 6e ff ff ff       	callq  401a73 <save_term>
  401b05:	4c 89 e0             	mov    %r12,%rax
  401b08:	5b                   	pop    %rbx
  401b09:	5d                   	pop    %rbp
  401b0a:	41 5c                	pop    %r12
  401b0c:	c3                   	retq   

0000000000401b0d <notify_server>:
  401b0d:	53                   	push   %rbx
  401b0e:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401b15:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401b1c:	00 00 
  401b1e:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401b25:	00 
  401b26:	31 c0                	xor    %eax,%eax
  401b28:	83 3d f9 29 20 00 00 	cmpl   $0x0,0x2029f9(%rip)        # 604528 <is_checker>
  401b2f:	0f 85 aa 01 00 00    	jne    401cdf <notify_server+0x1d2>
  401b35:	89 fb                	mov    %edi,%ebx
  401b37:	8b 05 07 36 20 00    	mov    0x203607(%rip),%eax        # 605144 <gets_cnt>
  401b3d:	83 c0 64             	add    $0x64,%eax
  401b40:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401b45:	7e 1e                	jle    401b65 <notify_server+0x58>
  401b47:	be b0 33 40 00       	mov    $0x4033b0,%esi
  401b4c:	bf 01 00 00 00       	mov    $0x1,%edi
  401b51:	b8 00 00 00 00       	mov    $0x0,%eax
  401b56:	e8 a5 f2 ff ff       	callq  400e00 <__printf_chk@plt>
  401b5b:	bf 01 00 00 00       	mov    $0x1,%edi
  401b60:	e8 eb f2 ff ff       	callq  400e50 <exit@plt>
  401b65:	0f be 05 dc 35 20 00 	movsbl 0x2035dc(%rip),%eax        # 605148 <target_prefix>
  401b6c:	83 3d 35 29 20 00 00 	cmpl   $0x0,0x202935(%rip)        # 6044a8 <notify>
  401b73:	74 08                	je     401b7d <notify_server+0x70>
  401b75:	8b 15 a5 29 20 00    	mov    0x2029a5(%rip),%edx        # 604520 <authkey>
  401b7b:	eb 05                	jmp    401b82 <notify_server+0x75>
  401b7d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401b82:	85 db                	test   %ebx,%ebx
  401b84:	74 08                	je     401b8e <notify_server+0x81>
  401b86:	41 b9 91 32 40 00    	mov    $0x403291,%r9d
  401b8c:	eb 06                	jmp    401b94 <notify_server+0x87>
  401b8e:	41 b9 96 32 40 00    	mov    $0x403296,%r9d
  401b94:	68 40 45 60 00       	pushq  $0x604540
  401b99:	56                   	push   %rsi
  401b9a:	50                   	push   %rax
  401b9b:	52                   	push   %rdx
  401b9c:	44 8b 05 c5 25 20 00 	mov    0x2025c5(%rip),%r8d        # 604168 <target_id>
  401ba3:	b9 9b 32 40 00       	mov    $0x40329b,%ecx
  401ba8:	ba 00 20 00 00       	mov    $0x2000,%edx
  401bad:	be 01 00 00 00       	mov    $0x1,%esi
  401bb2:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401bb7:	b8 00 00 00 00       	mov    $0x0,%eax
  401bbc:	e8 bf f2 ff ff       	callq  400e80 <__sprintf_chk@plt>
  401bc1:	48 83 c4 20          	add    $0x20,%rsp
  401bc5:	83 3d dc 28 20 00 00 	cmpl   $0x0,0x2028dc(%rip)        # 6044a8 <notify>
  401bcc:	0f 84 81 00 00 00    	je     401c53 <notify_server+0x146>
  401bd2:	85 db                	test   %ebx,%ebx
  401bd4:	74 6e                	je     401c44 <notify_server+0x137>
  401bd6:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401bdd:	00 
  401bde:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401be4:	48 89 e1             	mov    %rsp,%rcx
  401be7:	48 8b 15 82 25 20 00 	mov    0x202582(%rip),%rdx        # 604170 <lab>
  401bee:	48 8b 35 83 25 20 00 	mov    0x202583(%rip),%rsi        # 604178 <course>
  401bf5:	48 8b 3d 64 25 20 00 	mov    0x202564(%rip),%rdi        # 604160 <user_id>
  401bfc:	e8 ef 10 00 00       	callq  402cf0 <driver_post>
  401c01:	85 c0                	test   %eax,%eax
  401c03:	79 26                	jns    401c2b <notify_server+0x11e>
  401c05:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401c0c:	00 
  401c0d:	be b7 32 40 00       	mov    $0x4032b7,%esi
  401c12:	bf 01 00 00 00       	mov    $0x1,%edi
  401c17:	b8 00 00 00 00       	mov    $0x0,%eax
  401c1c:	e8 df f1 ff ff       	callq  400e00 <__printf_chk@plt>
  401c21:	bf 01 00 00 00       	mov    $0x1,%edi
  401c26:	e8 25 f2 ff ff       	callq  400e50 <exit@plt>
  401c2b:	bf e0 33 40 00       	mov    $0x4033e0,%edi
  401c30:	e8 9b f0 ff ff       	callq  400cd0 <puts@plt>
  401c35:	bf c3 32 40 00       	mov    $0x4032c3,%edi
  401c3a:	e8 91 f0 ff ff       	callq  400cd0 <puts@plt>
  401c3f:	e9 9b 00 00 00       	jmpq   401cdf <notify_server+0x1d2>
  401c44:	bf cd 32 40 00       	mov    $0x4032cd,%edi
  401c49:	e8 82 f0 ff ff       	callq  400cd0 <puts@plt>
  401c4e:	e9 8c 00 00 00       	jmpq   401cdf <notify_server+0x1d2>
  401c53:	85 db                	test   %ebx,%ebx
  401c55:	74 07                	je     401c5e <notify_server+0x151>
  401c57:	ba 91 32 40 00       	mov    $0x403291,%edx
  401c5c:	eb 05                	jmp    401c63 <notify_server+0x156>
  401c5e:	ba 96 32 40 00       	mov    $0x403296,%edx
  401c63:	be 18 34 40 00       	mov    $0x403418,%esi
  401c68:	bf 01 00 00 00       	mov    $0x1,%edi
  401c6d:	b8 00 00 00 00       	mov    $0x0,%eax
  401c72:	e8 89 f1 ff ff       	callq  400e00 <__printf_chk@plt>
  401c77:	48 8b 15 e2 24 20 00 	mov    0x2024e2(%rip),%rdx        # 604160 <user_id>
  401c7e:	be d4 32 40 00       	mov    $0x4032d4,%esi
  401c83:	bf 01 00 00 00       	mov    $0x1,%edi
  401c88:	b8 00 00 00 00       	mov    $0x0,%eax
  401c8d:	e8 6e f1 ff ff       	callq  400e00 <__printf_chk@plt>
  401c92:	48 8b 15 df 24 20 00 	mov    0x2024df(%rip),%rdx        # 604178 <course>
  401c99:	be e1 32 40 00       	mov    $0x4032e1,%esi
  401c9e:	bf 01 00 00 00       	mov    $0x1,%edi
  401ca3:	b8 00 00 00 00       	mov    $0x0,%eax
  401ca8:	e8 53 f1 ff ff       	callq  400e00 <__printf_chk@plt>
  401cad:	48 8b 15 bc 24 20 00 	mov    0x2024bc(%rip),%rdx        # 604170 <lab>
  401cb4:	be ed 32 40 00       	mov    $0x4032ed,%esi
  401cb9:	bf 01 00 00 00       	mov    $0x1,%edi
  401cbe:	b8 00 00 00 00       	mov    $0x0,%eax
  401cc3:	e8 38 f1 ff ff       	callq  400e00 <__printf_chk@plt>
  401cc8:	48 89 e2             	mov    %rsp,%rdx
  401ccb:	be f6 32 40 00       	mov    $0x4032f6,%esi
  401cd0:	bf 01 00 00 00       	mov    $0x1,%edi
  401cd5:	b8 00 00 00 00       	mov    $0x0,%eax
  401cda:	e8 21 f1 ff ff       	callq  400e00 <__printf_chk@plt>
  401cdf:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401ce6:	00 
  401ce7:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401cee:	00 00 
  401cf0:	74 05                	je     401cf7 <notify_server+0x1ea>
  401cf2:	e8 f9 ef ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  401cf7:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401cfe:	5b                   	pop    %rbx
  401cff:	c3                   	retq   

0000000000401d00 <validate>:
  401d00:	53                   	push   %rbx
  401d01:	89 fb                	mov    %edi,%ebx
  401d03:	83 3d 1e 28 20 00 00 	cmpl   $0x0,0x20281e(%rip)        # 604528 <is_checker>
  401d0a:	74 6b                	je     401d77 <validate+0x77>
  401d0c:	39 3d 0a 28 20 00    	cmp    %edi,0x20280a(%rip)        # 60451c <vlevel>
  401d12:	74 14                	je     401d28 <validate+0x28>
  401d14:	bf 02 33 40 00       	mov    $0x403302,%edi
  401d19:	e8 b2 ef ff ff       	callq  400cd0 <puts@plt>
  401d1e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d23:	e8 5e fd ff ff       	callq  401a86 <check_fail>
  401d28:	8b 15 ea 27 20 00    	mov    0x2027ea(%rip),%edx        # 604518 <check_level>
  401d2e:	39 d7                	cmp    %edx,%edi
  401d30:	74 20                	je     401d52 <validate+0x52>
  401d32:	89 f9                	mov    %edi,%ecx
  401d34:	be 40 34 40 00       	mov    $0x403440,%esi
  401d39:	bf 01 00 00 00       	mov    $0x1,%edi
  401d3e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d43:	e8 b8 f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401d48:	b8 00 00 00 00       	mov    $0x0,%eax
  401d4d:	e8 34 fd ff ff       	callq  401a86 <check_fail>
  401d52:	0f be 15 ef 33 20 00 	movsbl 0x2033ef(%rip),%edx        # 605148 <target_prefix>
  401d59:	41 b8 40 45 60 00    	mov    $0x604540,%r8d
  401d5f:	89 f9                	mov    %edi,%ecx
  401d61:	be 20 33 40 00       	mov    $0x403320,%esi
  401d66:	bf 01 00 00 00       	mov    $0x1,%edi
  401d6b:	b8 00 00 00 00       	mov    $0x0,%eax
  401d70:	e8 8b f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401d75:	eb 49                	jmp    401dc0 <validate+0xc0>
  401d77:	3b 3d 9f 27 20 00    	cmp    0x20279f(%rip),%edi        # 60451c <vlevel>
  401d7d:	74 18                	je     401d97 <validate+0x97>
  401d7f:	bf 02 33 40 00       	mov    $0x403302,%edi
  401d84:	e8 47 ef ff ff       	callq  400cd0 <puts@plt>
  401d89:	89 de                	mov    %ebx,%esi
  401d8b:	bf 00 00 00 00       	mov    $0x0,%edi
  401d90:	e8 78 fd ff ff       	callq  401b0d <notify_server>
  401d95:	eb 29                	jmp    401dc0 <validate+0xc0>
  401d97:	0f be 0d aa 33 20 00 	movsbl 0x2033aa(%rip),%ecx        # 605148 <target_prefix>
  401d9e:	89 fa                	mov    %edi,%edx
  401da0:	be 68 34 40 00       	mov    $0x403468,%esi
  401da5:	bf 01 00 00 00       	mov    $0x1,%edi
  401daa:	b8 00 00 00 00       	mov    $0x0,%eax
  401daf:	e8 4c f0 ff ff       	callq  400e00 <__printf_chk@plt>
  401db4:	89 de                	mov    %ebx,%esi
  401db6:	bf 01 00 00 00       	mov    $0x1,%edi
  401dbb:	e8 4d fd ff ff       	callq  401b0d <notify_server>
  401dc0:	5b                   	pop    %rbx
  401dc1:	c3                   	retq   

0000000000401dc2 <fail>:
  401dc2:	48 83 ec 08          	sub    $0x8,%rsp
  401dc6:	83 3d 5b 27 20 00 00 	cmpl   $0x0,0x20275b(%rip)        # 604528 <is_checker>
  401dcd:	74 0a                	je     401dd9 <fail+0x17>
  401dcf:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd4:	e8 ad fc ff ff       	callq  401a86 <check_fail>
  401dd9:	89 fe                	mov    %edi,%esi
  401ddb:	bf 00 00 00 00       	mov    $0x0,%edi
  401de0:	e8 28 fd ff ff       	callq  401b0d <notify_server>
  401de5:	48 83 c4 08          	add    $0x8,%rsp
  401de9:	c3                   	retq   

0000000000401dea <bushandler>:
  401dea:	48 83 ec 08          	sub    $0x8,%rsp
  401dee:	83 3d 33 27 20 00 00 	cmpl   $0x0,0x202733(%rip)        # 604528 <is_checker>
  401df5:	74 14                	je     401e0b <bushandler+0x21>
  401df7:	bf 35 33 40 00       	mov    $0x403335,%edi
  401dfc:	e8 cf ee ff ff       	callq  400cd0 <puts@plt>
  401e01:	b8 00 00 00 00       	mov    $0x0,%eax
  401e06:	e8 7b fc ff ff       	callq  401a86 <check_fail>
  401e0b:	bf a0 34 40 00       	mov    $0x4034a0,%edi
  401e10:	e8 bb ee ff ff       	callq  400cd0 <puts@plt>
  401e15:	bf 3f 33 40 00       	mov    $0x40333f,%edi
  401e1a:	e8 b1 ee ff ff       	callq  400cd0 <puts@plt>
  401e1f:	be 00 00 00 00       	mov    $0x0,%esi
  401e24:	bf 00 00 00 00       	mov    $0x0,%edi
  401e29:	e8 df fc ff ff       	callq  401b0d <notify_server>
  401e2e:	bf 01 00 00 00       	mov    $0x1,%edi
  401e33:	e8 18 f0 ff ff       	callq  400e50 <exit@plt>

0000000000401e38 <seghandler>:
  401e38:	48 83 ec 08          	sub    $0x8,%rsp
  401e3c:	83 3d e5 26 20 00 00 	cmpl   $0x0,0x2026e5(%rip)        # 604528 <is_checker>
  401e43:	74 14                	je     401e59 <seghandler+0x21>
  401e45:	bf 55 33 40 00       	mov    $0x403355,%edi
  401e4a:	e8 81 ee ff ff       	callq  400cd0 <puts@plt>
  401e4f:	b8 00 00 00 00       	mov    $0x0,%eax
  401e54:	e8 2d fc ff ff       	callq  401a86 <check_fail>
  401e59:	bf c0 34 40 00       	mov    $0x4034c0,%edi
  401e5e:	e8 6d ee ff ff       	callq  400cd0 <puts@plt>
  401e63:	bf 3f 33 40 00       	mov    $0x40333f,%edi
  401e68:	e8 63 ee ff ff       	callq  400cd0 <puts@plt>
  401e6d:	be 00 00 00 00       	mov    $0x0,%esi
  401e72:	bf 00 00 00 00       	mov    $0x0,%edi
  401e77:	e8 91 fc ff ff       	callq  401b0d <notify_server>
  401e7c:	bf 01 00 00 00       	mov    $0x1,%edi
  401e81:	e8 ca ef ff ff       	callq  400e50 <exit@plt>

0000000000401e86 <illegalhandler>:
  401e86:	48 83 ec 08          	sub    $0x8,%rsp
  401e8a:	83 3d 97 26 20 00 00 	cmpl   $0x0,0x202697(%rip)        # 604528 <is_checker>
  401e91:	74 14                	je     401ea7 <illegalhandler+0x21>
  401e93:	bf 68 33 40 00       	mov    $0x403368,%edi
  401e98:	e8 33 ee ff ff       	callq  400cd0 <puts@plt>
  401e9d:	b8 00 00 00 00       	mov    $0x0,%eax
  401ea2:	e8 df fb ff ff       	callq  401a86 <check_fail>
  401ea7:	bf e8 34 40 00       	mov    $0x4034e8,%edi
  401eac:	e8 1f ee ff ff       	callq  400cd0 <puts@plt>
  401eb1:	bf 3f 33 40 00       	mov    $0x40333f,%edi
  401eb6:	e8 15 ee ff ff       	callq  400cd0 <puts@plt>
  401ebb:	be 00 00 00 00       	mov    $0x0,%esi
  401ec0:	bf 00 00 00 00       	mov    $0x0,%edi
  401ec5:	e8 43 fc ff ff       	callq  401b0d <notify_server>
  401eca:	bf 01 00 00 00       	mov    $0x1,%edi
  401ecf:	e8 7c ef ff ff       	callq  400e50 <exit@plt>

0000000000401ed4 <sigalrmhandler>:
  401ed4:	48 83 ec 08          	sub    $0x8,%rsp
  401ed8:	83 3d 49 26 20 00 00 	cmpl   $0x0,0x202649(%rip)        # 604528 <is_checker>
  401edf:	74 14                	je     401ef5 <sigalrmhandler+0x21>
  401ee1:	bf 7c 33 40 00       	mov    $0x40337c,%edi
  401ee6:	e8 e5 ed ff ff       	callq  400cd0 <puts@plt>
  401eeb:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef0:	e8 91 fb ff ff       	callq  401a86 <check_fail>
  401ef5:	ba 05 00 00 00       	mov    $0x5,%edx
  401efa:	be 18 35 40 00       	mov    $0x403518,%esi
  401eff:	bf 01 00 00 00       	mov    $0x1,%edi
  401f04:	b8 00 00 00 00       	mov    $0x0,%eax
  401f09:	e8 f2 ee ff ff       	callq  400e00 <__printf_chk@plt>
  401f0e:	be 00 00 00 00       	mov    $0x0,%esi
  401f13:	bf 00 00 00 00       	mov    $0x0,%edi
  401f18:	e8 f0 fb ff ff       	callq  401b0d <notify_server>
  401f1d:	bf 01 00 00 00       	mov    $0x1,%edi
  401f22:	e8 29 ef ff ff       	callq  400e50 <exit@plt>

0000000000401f27 <launch>:
  401f27:	55                   	push   %rbp
  401f28:	48 89 e5             	mov    %rsp,%rbp
  401f2b:	48 83 ec 10          	sub    $0x10,%rsp
  401f2f:	48 89 fa             	mov    %rdi,%rdx
  401f32:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401f39:	00 00 
  401f3b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401f3f:	31 c0                	xor    %eax,%eax
  401f41:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401f45:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401f49:	48 29 c4             	sub    %rax,%rsp
  401f4c:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401f51:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401f55:	be f4 00 00 00       	mov    $0xf4,%esi
  401f5a:	e8 b1 ed ff ff       	callq  400d10 <memset@plt>
  401f5f:	48 8b 05 5a 25 20 00 	mov    0x20255a(%rip),%rax        # 6044c0 <stdin@@GLIBC_2.2.5>
  401f66:	48 39 05 a3 25 20 00 	cmp    %rax,0x2025a3(%rip)        # 604510 <infile>
  401f6d:	75 14                	jne    401f83 <launch+0x5c>
  401f6f:	be 84 33 40 00       	mov    $0x403384,%esi
  401f74:	bf 01 00 00 00       	mov    $0x1,%edi
  401f79:	b8 00 00 00 00       	mov    $0x0,%eax
  401f7e:	e8 7d ee ff ff       	callq  400e00 <__printf_chk@plt>
  401f83:	c7 05 8f 25 20 00 00 	movl   $0x0,0x20258f(%rip)        # 60451c <vlevel>
  401f8a:	00 00 00 
  401f8d:	b8 00 00 00 00       	mov    $0x0,%eax
  401f92:	e8 5b fa ff ff       	callq  4019f2 <test>
  401f97:	83 3d 8a 25 20 00 00 	cmpl   $0x0,0x20258a(%rip)        # 604528 <is_checker>
  401f9e:	74 14                	je     401fb4 <launch+0x8d>
  401fa0:	bf 91 33 40 00       	mov    $0x403391,%edi
  401fa5:	e8 26 ed ff ff       	callq  400cd0 <puts@plt>
  401faa:	b8 00 00 00 00       	mov    $0x0,%eax
  401faf:	e8 d2 fa ff ff       	callq  401a86 <check_fail>
  401fb4:	bf 9c 33 40 00       	mov    $0x40339c,%edi
  401fb9:	e8 12 ed ff ff       	callq  400cd0 <puts@plt>
  401fbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401fc2:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401fc9:	00 00 
  401fcb:	74 05                	je     401fd2 <launch+0xab>
  401fcd:	e8 1e ed ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  401fd2:	c9                   	leaveq 
  401fd3:	c3                   	retq   

0000000000401fd4 <stable_launch>:
  401fd4:	53                   	push   %rbx
  401fd5:	48 89 3d 2c 25 20 00 	mov    %rdi,0x20252c(%rip)        # 604508 <global_offset>
  401fdc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401fe2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401fe8:	b9 32 01 00 00       	mov    $0x132,%ecx
  401fed:	ba 07 00 00 00       	mov    $0x7,%edx
  401ff2:	be 00 00 10 00       	mov    $0x100000,%esi
  401ff7:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401ffc:	e8 ff ec ff ff       	callq  400d00 <mmap@plt>
  402001:	48 89 c3             	mov    %rax,%rbx
  402004:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  40200a:	74 37                	je     402043 <stable_launch+0x6f>
  40200c:	be 00 00 10 00       	mov    $0x100000,%esi
  402011:	48 89 c7             	mov    %rax,%rdi
  402014:	e8 d7 ed ff ff       	callq  400df0 <munmap@plt>
  402019:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  40201e:	ba 50 35 40 00       	mov    $0x403550,%edx
  402023:	be 01 00 00 00       	mov    $0x1,%esi
  402028:	48 8b 3d b1 24 20 00 	mov    0x2024b1(%rip),%rdi        # 6044e0 <stderr@@GLIBC_2.2.5>
  40202f:	b8 00 00 00 00       	mov    $0x0,%eax
  402034:	e8 37 ee ff ff       	callq  400e70 <__fprintf_chk@plt>
  402039:	bf 01 00 00 00       	mov    $0x1,%edi
  40203e:	e8 0d ee ff ff       	callq  400e50 <exit@plt>
  402043:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  40204a:	48 89 15 ff 30 20 00 	mov    %rdx,0x2030ff(%rip)        # 605150 <stack_top>
  402051:	48 89 e0             	mov    %rsp,%rax
  402054:	48 89 d4             	mov    %rdx,%rsp
  402057:	48 89 c2             	mov    %rax,%rdx
  40205a:	48 89 15 9f 24 20 00 	mov    %rdx,0x20249f(%rip)        # 604500 <global_save_stack>
  402061:	48 8b 3d a0 24 20 00 	mov    0x2024a0(%rip),%rdi        # 604508 <global_offset>
  402068:	e8 ba fe ff ff       	callq  401f27 <launch>
  40206d:	48 8b 05 8c 24 20 00 	mov    0x20248c(%rip),%rax        # 604500 <global_save_stack>
  402074:	48 89 c4             	mov    %rax,%rsp
  402077:	be 00 00 10 00       	mov    $0x100000,%esi
  40207c:	48 89 df             	mov    %rbx,%rdi
  40207f:	e8 6c ed ff ff       	callq  400df0 <munmap@plt>
  402084:	5b                   	pop    %rbx
  402085:	c3                   	retq   

0000000000402086 <rio_readinitb>:
  402086:	89 37                	mov    %esi,(%rdi)
  402088:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  40208f:	48 8d 47 10          	lea    0x10(%rdi),%rax
  402093:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402097:	c3                   	retq   

0000000000402098 <sigalrm_handler>:
  402098:	48 83 ec 08          	sub    $0x8,%rsp
  40209c:	b9 00 00 00 00       	mov    $0x0,%ecx
  4020a1:	ba 90 35 40 00       	mov    $0x403590,%edx
  4020a6:	be 01 00 00 00       	mov    $0x1,%esi
  4020ab:	48 8b 3d 2e 24 20 00 	mov    0x20242e(%rip),%rdi        # 6044e0 <stderr@@GLIBC_2.2.5>
  4020b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4020b7:	e8 b4 ed ff ff       	callq  400e70 <__fprintf_chk@plt>
  4020bc:	bf 01 00 00 00       	mov    $0x1,%edi
  4020c1:	e8 8a ed ff ff       	callq  400e50 <exit@plt>

00000000004020c6 <rio_writen>:
  4020c6:	41 55                	push   %r13
  4020c8:	41 54                	push   %r12
  4020ca:	55                   	push   %rbp
  4020cb:	53                   	push   %rbx
  4020cc:	48 83 ec 08          	sub    $0x8,%rsp
  4020d0:	41 89 fc             	mov    %edi,%r12d
  4020d3:	48 89 f5             	mov    %rsi,%rbp
  4020d6:	49 89 d5             	mov    %rdx,%r13
  4020d9:	48 89 d3             	mov    %rdx,%rbx
  4020dc:	eb 28                	jmp    402106 <rio_writen+0x40>
  4020de:	48 89 da             	mov    %rbx,%rdx
  4020e1:	48 89 ee             	mov    %rbp,%rsi
  4020e4:	44 89 e7             	mov    %r12d,%edi
  4020e7:	e8 f4 eb ff ff       	callq  400ce0 <write@plt>
  4020ec:	48 85 c0             	test   %rax,%rax
  4020ef:	7f 0f                	jg     402100 <rio_writen+0x3a>
  4020f1:	e8 9a eb ff ff       	callq  400c90 <__errno_location@plt>
  4020f6:	83 38 04             	cmpl   $0x4,(%rax)
  4020f9:	75 15                	jne    402110 <rio_writen+0x4a>
  4020fb:	b8 00 00 00 00       	mov    $0x0,%eax
  402100:	48 29 c3             	sub    %rax,%rbx
  402103:	48 01 c5             	add    %rax,%rbp
  402106:	48 85 db             	test   %rbx,%rbx
  402109:	75 d3                	jne    4020de <rio_writen+0x18>
  40210b:	4c 89 e8             	mov    %r13,%rax
  40210e:	eb 07                	jmp    402117 <rio_writen+0x51>
  402110:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402117:	48 83 c4 08          	add    $0x8,%rsp
  40211b:	5b                   	pop    %rbx
  40211c:	5d                   	pop    %rbp
  40211d:	41 5c                	pop    %r12
  40211f:	41 5d                	pop    %r13
  402121:	c3                   	retq   

0000000000402122 <rio_read>:
  402122:	41 55                	push   %r13
  402124:	41 54                	push   %r12
  402126:	55                   	push   %rbp
  402127:	53                   	push   %rbx
  402128:	48 83 ec 08          	sub    $0x8,%rsp
  40212c:	48 89 fb             	mov    %rdi,%rbx
  40212f:	49 89 f5             	mov    %rsi,%r13
  402132:	49 89 d4             	mov    %rdx,%r12
  402135:	eb 2e                	jmp    402165 <rio_read+0x43>
  402137:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40213b:	8b 3b                	mov    (%rbx),%edi
  40213d:	ba 00 20 00 00       	mov    $0x2000,%edx
  402142:	48 89 ee             	mov    %rbp,%rsi
  402145:	e8 f6 eb ff ff       	callq  400d40 <read@plt>
  40214a:	89 43 04             	mov    %eax,0x4(%rbx)
  40214d:	85 c0                	test   %eax,%eax
  40214f:	79 0c                	jns    40215d <rio_read+0x3b>
  402151:	e8 3a eb ff ff       	callq  400c90 <__errno_location@plt>
  402156:	83 38 04             	cmpl   $0x4,(%rax)
  402159:	74 0a                	je     402165 <rio_read+0x43>
  40215b:	eb 37                	jmp    402194 <rio_read+0x72>
  40215d:	85 c0                	test   %eax,%eax
  40215f:	74 3c                	je     40219d <rio_read+0x7b>
  402161:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402165:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402168:	85 ed                	test   %ebp,%ebp
  40216a:	7e cb                	jle    402137 <rio_read+0x15>
  40216c:	89 e8                	mov    %ebp,%eax
  40216e:	49 39 c4             	cmp    %rax,%r12
  402171:	77 03                	ja     402176 <rio_read+0x54>
  402173:	44 89 e5             	mov    %r12d,%ebp
  402176:	4c 63 e5             	movslq %ebp,%r12
  402179:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  40217d:	4c 89 e2             	mov    %r12,%rdx
  402180:	4c 89 ef             	mov    %r13,%rdi
  402183:	e8 18 ec ff ff       	callq  400da0 <memcpy@plt>
  402188:	4c 01 63 08          	add    %r12,0x8(%rbx)
  40218c:	29 6b 04             	sub    %ebp,0x4(%rbx)
  40218f:	4c 89 e0             	mov    %r12,%rax
  402192:	eb 0e                	jmp    4021a2 <rio_read+0x80>
  402194:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40219b:	eb 05                	jmp    4021a2 <rio_read+0x80>
  40219d:	b8 00 00 00 00       	mov    $0x0,%eax
  4021a2:	48 83 c4 08          	add    $0x8,%rsp
  4021a6:	5b                   	pop    %rbx
  4021a7:	5d                   	pop    %rbp
  4021a8:	41 5c                	pop    %r12
  4021aa:	41 5d                	pop    %r13
  4021ac:	c3                   	retq   

00000000004021ad <rio_readlineb>:
  4021ad:	41 55                	push   %r13
  4021af:	41 54                	push   %r12
  4021b1:	55                   	push   %rbp
  4021b2:	53                   	push   %rbx
  4021b3:	48 83 ec 18          	sub    $0x18,%rsp
  4021b7:	49 89 fd             	mov    %rdi,%r13
  4021ba:	48 89 f5             	mov    %rsi,%rbp
  4021bd:	49 89 d4             	mov    %rdx,%r12
  4021c0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021c7:	00 00 
  4021c9:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4021ce:	31 c0                	xor    %eax,%eax
  4021d0:	bb 01 00 00 00       	mov    $0x1,%ebx
  4021d5:	eb 3f                	jmp    402216 <rio_readlineb+0x69>
  4021d7:	ba 01 00 00 00       	mov    $0x1,%edx
  4021dc:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  4021e1:	4c 89 ef             	mov    %r13,%rdi
  4021e4:	e8 39 ff ff ff       	callq  402122 <rio_read>
  4021e9:	83 f8 01             	cmp    $0x1,%eax
  4021ec:	75 15                	jne    402203 <rio_readlineb+0x56>
  4021ee:	48 8d 45 01          	lea    0x1(%rbp),%rax
  4021f2:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  4021f7:	88 55 00             	mov    %dl,0x0(%rbp)
  4021fa:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  4021ff:	75 0e                	jne    40220f <rio_readlineb+0x62>
  402201:	eb 1a                	jmp    40221d <rio_readlineb+0x70>
  402203:	85 c0                	test   %eax,%eax
  402205:	75 22                	jne    402229 <rio_readlineb+0x7c>
  402207:	48 83 fb 01          	cmp    $0x1,%rbx
  40220b:	75 13                	jne    402220 <rio_readlineb+0x73>
  40220d:	eb 23                	jmp    402232 <rio_readlineb+0x85>
  40220f:	48 83 c3 01          	add    $0x1,%rbx
  402213:	48 89 c5             	mov    %rax,%rbp
  402216:	4c 39 e3             	cmp    %r12,%rbx
  402219:	72 bc                	jb     4021d7 <rio_readlineb+0x2a>
  40221b:	eb 03                	jmp    402220 <rio_readlineb+0x73>
  40221d:	48 89 c5             	mov    %rax,%rbp
  402220:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402224:	48 89 d8             	mov    %rbx,%rax
  402227:	eb 0e                	jmp    402237 <rio_readlineb+0x8a>
  402229:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402230:	eb 05                	jmp    402237 <rio_readlineb+0x8a>
  402232:	b8 00 00 00 00       	mov    $0x0,%eax
  402237:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  40223c:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402243:	00 00 
  402245:	74 05                	je     40224c <rio_readlineb+0x9f>
  402247:	e8 a4 ea ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  40224c:	48 83 c4 18          	add    $0x18,%rsp
  402250:	5b                   	pop    %rbx
  402251:	5d                   	pop    %rbp
  402252:	41 5c                	pop    %r12
  402254:	41 5d                	pop    %r13
  402256:	c3                   	retq   

0000000000402257 <urlencode>:
  402257:	41 54                	push   %r12
  402259:	55                   	push   %rbp
  40225a:	53                   	push   %rbx
  40225b:	48 83 ec 10          	sub    $0x10,%rsp
  40225f:	48 89 fb             	mov    %rdi,%rbx
  402262:	48 89 f5             	mov    %rsi,%rbp
  402265:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40226c:	00 00 
  40226e:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402273:	31 c0                	xor    %eax,%eax
  402275:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40227c:	f2 ae                	repnz scas %es:(%rdi),%al
  40227e:	48 f7 d1             	not    %rcx
  402281:	8d 41 ff             	lea    -0x1(%rcx),%eax
  402284:	e9 aa 00 00 00       	jmpq   402333 <urlencode+0xdc>
  402289:	44 0f b6 03          	movzbl (%rbx),%r8d
  40228d:	41 80 f8 2a          	cmp    $0x2a,%r8b
  402291:	0f 94 c2             	sete   %dl
  402294:	41 80 f8 2d          	cmp    $0x2d,%r8b
  402298:	0f 94 c0             	sete   %al
  40229b:	08 c2                	or     %al,%dl
  40229d:	75 24                	jne    4022c3 <urlencode+0x6c>
  40229f:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4022a3:	74 1e                	je     4022c3 <urlencode+0x6c>
  4022a5:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4022a9:	74 18                	je     4022c3 <urlencode+0x6c>
  4022ab:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4022af:	3c 09                	cmp    $0x9,%al
  4022b1:	76 10                	jbe    4022c3 <urlencode+0x6c>
  4022b3:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4022b7:	3c 19                	cmp    $0x19,%al
  4022b9:	76 08                	jbe    4022c3 <urlencode+0x6c>
  4022bb:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  4022bf:	3c 19                	cmp    $0x19,%al
  4022c1:	77 0a                	ja     4022cd <urlencode+0x76>
  4022c3:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  4022c7:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4022cb:	eb 5f                	jmp    40232c <urlencode+0xd5>
  4022cd:	41 80 f8 20          	cmp    $0x20,%r8b
  4022d1:	75 0a                	jne    4022dd <urlencode+0x86>
  4022d3:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4022d7:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4022db:	eb 4f                	jmp    40232c <urlencode+0xd5>
  4022dd:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  4022e1:	3c 5f                	cmp    $0x5f,%al
  4022e3:	0f 96 c2             	setbe  %dl
  4022e6:	41 80 f8 09          	cmp    $0x9,%r8b
  4022ea:	0f 94 c0             	sete   %al
  4022ed:	08 c2                	or     %al,%dl
  4022ef:	74 50                	je     402341 <urlencode+0xea>
  4022f1:	45 0f b6 c0          	movzbl %r8b,%r8d
  4022f5:	b9 28 36 40 00       	mov    $0x403628,%ecx
  4022fa:	ba 08 00 00 00       	mov    $0x8,%edx
  4022ff:	be 01 00 00 00       	mov    $0x1,%esi
  402304:	48 89 e7             	mov    %rsp,%rdi
  402307:	b8 00 00 00 00       	mov    $0x0,%eax
  40230c:	e8 6f eb ff ff       	callq  400e80 <__sprintf_chk@plt>
  402311:	0f b6 04 24          	movzbl (%rsp),%eax
  402315:	88 45 00             	mov    %al,0x0(%rbp)
  402318:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40231d:	88 45 01             	mov    %al,0x1(%rbp)
  402320:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402325:	88 45 02             	mov    %al,0x2(%rbp)
  402328:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40232c:	48 83 c3 01          	add    $0x1,%rbx
  402330:	44 89 e0             	mov    %r12d,%eax
  402333:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402337:	85 c0                	test   %eax,%eax
  402339:	0f 85 4a ff ff ff    	jne    402289 <urlencode+0x32>
  40233f:	eb 05                	jmp    402346 <urlencode+0xef>
  402341:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402346:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  40234b:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  402352:	00 00 
  402354:	74 05                	je     40235b <urlencode+0x104>
  402356:	e8 95 e9 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  40235b:	48 83 c4 10          	add    $0x10,%rsp
  40235f:	5b                   	pop    %rbx
  402360:	5d                   	pop    %rbp
  402361:	41 5c                	pop    %r12
  402363:	c3                   	retq   

0000000000402364 <submitr>:
  402364:	41 57                	push   %r15
  402366:	41 56                	push   %r14
  402368:	41 55                	push   %r13
  40236a:	41 54                	push   %r12
  40236c:	55                   	push   %rbp
  40236d:	53                   	push   %rbx
  40236e:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  402375:	49 89 fc             	mov    %rdi,%r12
  402378:	89 74 24 04          	mov    %esi,0x4(%rsp)
  40237c:	49 89 d7             	mov    %rdx,%r15
  40237f:	49 89 ce             	mov    %rcx,%r14
  402382:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  402387:	4d 89 cd             	mov    %r9,%r13
  40238a:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  402391:	00 
  402392:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402399:	00 00 
  40239b:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4023a2:	00 
  4023a3:	31 c0                	xor    %eax,%eax
  4023a5:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4023ac:	00 
  4023ad:	ba 00 00 00 00       	mov    $0x0,%edx
  4023b2:	be 01 00 00 00       	mov    $0x1,%esi
  4023b7:	bf 02 00 00 00       	mov    $0x2,%edi
  4023bc:	e8 cf ea ff ff       	callq  400e90 <socket@plt>
  4023c1:	85 c0                	test   %eax,%eax
  4023c3:	79 4e                	jns    402413 <submitr+0xaf>
  4023c5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4023cc:	3a 20 43 
  4023cf:	48 89 03             	mov    %rax,(%rbx)
  4023d2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4023d9:	20 75 6e 
  4023dc:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4023e0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4023e7:	74 6f 20 
  4023ea:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023ee:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  4023f5:	65 20 73 
  4023f8:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4023fc:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402403:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402409:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40240e:	e9 97 06 00 00       	jmpq   402aaa <submitr+0x746>
  402413:	89 c5                	mov    %eax,%ebp
  402415:	4c 89 e7             	mov    %r12,%rdi
  402418:	e8 53 e9 ff ff       	callq  400d70 <gethostbyname@plt>
  40241d:	48 85 c0             	test   %rax,%rax
  402420:	75 67                	jne    402489 <submitr+0x125>
  402422:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402429:	3a 20 44 
  40242c:	48 89 03             	mov    %rax,(%rbx)
  40242f:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402436:	20 75 6e 
  402439:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40243d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402444:	74 6f 20 
  402447:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40244b:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402452:	76 65 20 
  402455:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402459:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402460:	72 20 61 
  402463:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402467:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  40246e:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  402474:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  402478:	89 ef                	mov    %ebp,%edi
  40247a:	e8 b1 e8 ff ff       	callq  400d30 <close@plt>
  40247f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402484:	e9 21 06 00 00       	jmpq   402aaa <submitr+0x746>
  402489:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  402490:	00 00 
  402492:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  402499:	00 00 
  40249b:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  4024a2:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4024a6:	48 8b 40 18          	mov    0x18(%rax),%rax
  4024aa:	48 8b 30             	mov    (%rax),%rsi
  4024ad:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  4024b2:	b9 0c 00 00 00       	mov    $0xc,%ecx
  4024b7:	e8 c4 e8 ff ff       	callq  400d80 <__memmove_chk@plt>
  4024bc:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  4024c1:	66 c1 c8 08          	ror    $0x8,%ax
  4024c5:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  4024ca:	ba 10 00 00 00       	mov    $0x10,%edx
  4024cf:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  4024d4:	89 ef                	mov    %ebp,%edi
  4024d6:	e8 85 e9 ff ff       	callq  400e60 <connect@plt>
  4024db:	85 c0                	test   %eax,%eax
  4024dd:	79 59                	jns    402538 <submitr+0x1d4>
  4024df:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4024e6:	3a 20 55 
  4024e9:	48 89 03             	mov    %rax,(%rbx)
  4024ec:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  4024f3:	20 74 6f 
  4024f6:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024fa:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402501:	65 63 74 
  402504:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402508:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40250f:	68 65 20 
  402512:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402516:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40251d:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402523:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402527:	89 ef                	mov    %ebp,%edi
  402529:	e8 02 e8 ff ff       	callq  400d30 <close@plt>
  40252e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402533:	e9 72 05 00 00       	jmpq   402aaa <submitr+0x746>
  402538:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  40253f:	b8 00 00 00 00       	mov    $0x0,%eax
  402544:	48 89 f1             	mov    %rsi,%rcx
  402547:	4c 89 ef             	mov    %r13,%rdi
  40254a:	f2 ae                	repnz scas %es:(%rdi),%al
  40254c:	48 f7 d1             	not    %rcx
  40254f:	48 89 ca             	mov    %rcx,%rdx
  402552:	48 89 f1             	mov    %rsi,%rcx
  402555:	4c 89 ff             	mov    %r15,%rdi
  402558:	f2 ae                	repnz scas %es:(%rdi),%al
  40255a:	48 f7 d1             	not    %rcx
  40255d:	49 89 c8             	mov    %rcx,%r8
  402560:	48 89 f1             	mov    %rsi,%rcx
  402563:	4c 89 f7             	mov    %r14,%rdi
  402566:	f2 ae                	repnz scas %es:(%rdi),%al
  402568:	48 f7 d1             	not    %rcx
  40256b:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  402570:	48 89 f1             	mov    %rsi,%rcx
  402573:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402578:	f2 ae                	repnz scas %es:(%rdi),%al
  40257a:	48 89 c8             	mov    %rcx,%rax
  40257d:	48 f7 d0             	not    %rax
  402580:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  402585:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  40258a:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  402591:	00 
  402592:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402598:	76 72                	jbe    40260c <submitr+0x2a8>
  40259a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4025a1:	3a 20 52 
  4025a4:	48 89 03             	mov    %rax,(%rbx)
  4025a7:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4025ae:	20 73 74 
  4025b1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025b5:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  4025bc:	74 6f 6f 
  4025bf:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025c3:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  4025ca:	65 2e 20 
  4025cd:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025d1:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  4025d8:	61 73 65 
  4025db:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025df:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  4025e6:	49 54 52 
  4025e9:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025ed:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  4025f4:	55 46 00 
  4025f7:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4025fb:	89 ef                	mov    %ebp,%edi
  4025fd:	e8 2e e7 ff ff       	callq  400d30 <close@plt>
  402602:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402607:	e9 9e 04 00 00       	jmpq   402aaa <submitr+0x746>
  40260c:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  402613:	00 
  402614:	b9 00 04 00 00       	mov    $0x400,%ecx
  402619:	b8 00 00 00 00       	mov    $0x0,%eax
  40261e:	48 89 f7             	mov    %rsi,%rdi
  402621:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402624:	4c 89 ef             	mov    %r13,%rdi
  402627:	e8 2b fc ff ff       	callq  402257 <urlencode>
  40262c:	85 c0                	test   %eax,%eax
  40262e:	0f 89 8a 00 00 00    	jns    4026be <submitr+0x35a>
  402634:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40263b:	3a 20 52 
  40263e:	48 89 03             	mov    %rax,(%rbx)
  402641:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402648:	20 73 74 
  40264b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40264f:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402656:	63 6f 6e 
  402659:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40265d:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402664:	20 61 6e 
  402667:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40266b:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  402672:	67 61 6c 
  402675:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402679:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402680:	6e 70 72 
  402683:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402687:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  40268e:	6c 65 20 
  402691:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402695:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  40269c:	63 74 65 
  40269f:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4026a3:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  4026a9:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  4026ad:	89 ef                	mov    %ebp,%edi
  4026af:	e8 7c e6 ff ff       	callq  400d30 <close@plt>
  4026b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026b9:	e9 ec 03 00 00       	jmpq   402aaa <submitr+0x746>
  4026be:	4c 8d ac 24 40 20 00 	lea    0x2040(%rsp),%r13
  4026c5:	00 
  4026c6:	41 54                	push   %r12
  4026c8:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
  4026cf:	00 
  4026d0:	50                   	push   %rax
  4026d1:	4d 89 f9             	mov    %r15,%r9
  4026d4:	4d 89 f0             	mov    %r14,%r8
  4026d7:	b9 b8 35 40 00       	mov    $0x4035b8,%ecx
  4026dc:	ba 00 20 00 00       	mov    $0x2000,%edx
  4026e1:	be 01 00 00 00       	mov    $0x1,%esi
  4026e6:	4c 89 ef             	mov    %r13,%rdi
  4026e9:	b8 00 00 00 00       	mov    $0x0,%eax
  4026ee:	e8 8d e7 ff ff       	callq  400e80 <__sprintf_chk@plt>
  4026f3:	b8 00 00 00 00       	mov    $0x0,%eax
  4026f8:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4026ff:	4c 89 ef             	mov    %r13,%rdi
  402702:	f2 ae                	repnz scas %es:(%rdi),%al
  402704:	48 f7 d1             	not    %rcx
  402707:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40270b:	4c 89 ee             	mov    %r13,%rsi
  40270e:	89 ef                	mov    %ebp,%edi
  402710:	e8 b1 f9 ff ff       	callq  4020c6 <rio_writen>
  402715:	48 83 c4 10          	add    $0x10,%rsp
  402719:	48 85 c0             	test   %rax,%rax
  40271c:	79 6e                	jns    40278c <submitr+0x428>
  40271e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402725:	3a 20 43 
  402728:	48 89 03             	mov    %rax,(%rbx)
  40272b:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402732:	20 75 6e 
  402735:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402739:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402740:	74 6f 20 
  402743:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402747:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  40274e:	20 74 6f 
  402751:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402755:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  40275c:	72 65 73 
  40275f:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402763:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  40276a:	65 72 76 
  40276d:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402771:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  402777:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  40277b:	89 ef                	mov    %ebp,%edi
  40277d:	e8 ae e5 ff ff       	callq  400d30 <close@plt>
  402782:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402787:	e9 1e 03 00 00       	jmpq   402aaa <submitr+0x746>
  40278c:	89 ee                	mov    %ebp,%esi
  40278e:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402793:	e8 ee f8 ff ff       	callq  402086 <rio_readinitb>
  402798:	ba 00 20 00 00       	mov    $0x2000,%edx
  40279d:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4027a4:	00 
  4027a5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4027aa:	e8 fe f9 ff ff       	callq  4021ad <rio_readlineb>
  4027af:	48 85 c0             	test   %rax,%rax
  4027b2:	7f 7d                	jg     402831 <submitr+0x4cd>
  4027b4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027bb:	3a 20 43 
  4027be:	48 89 03             	mov    %rax,(%rbx)
  4027c1:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027c8:	20 75 6e 
  4027cb:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027cf:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027d6:	74 6f 20 
  4027d9:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027dd:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  4027e4:	66 69 72 
  4027e7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027eb:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  4027f2:	61 64 65 
  4027f5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027f9:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402800:	6d 20 72 
  402803:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402807:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  40280e:	20 73 65 
  402811:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402815:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40281c:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402820:	89 ef                	mov    %ebp,%edi
  402822:	e8 09 e5 ff ff       	callq  400d30 <close@plt>
  402827:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40282c:	e9 79 02 00 00       	jmpq   402aaa <submitr+0x746>
  402831:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  402838:	00 
  402839:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  40283e:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  402845:	00 
  402846:	be 2f 36 40 00       	mov    $0x40362f,%esi
  40284b:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  402852:	00 
  402853:	b8 00 00 00 00       	mov    $0x0,%eax
  402858:	e8 83 e5 ff ff       	callq  400de0 <__isoc99_sscanf@plt>
  40285d:	e9 95 00 00 00       	jmpq   4028f7 <submitr+0x593>
  402862:	ba 00 20 00 00       	mov    $0x2000,%edx
  402867:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  40286e:	00 
  40286f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402874:	e8 34 f9 ff ff       	callq  4021ad <rio_readlineb>
  402879:	48 85 c0             	test   %rax,%rax
  40287c:	7f 79                	jg     4028f7 <submitr+0x593>
  40287e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402885:	3a 20 43 
  402888:	48 89 03             	mov    %rax,(%rbx)
  40288b:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402892:	20 75 6e 
  402895:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402899:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028a0:	74 6f 20 
  4028a3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028a7:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  4028ae:	68 65 61 
  4028b1:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028b5:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4028bc:	66 72 6f 
  4028bf:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028c3:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  4028ca:	20 72 65 
  4028cd:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4028d1:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  4028d8:	73 65 72 
  4028db:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4028df:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  4028e6:	89 ef                	mov    %ebp,%edi
  4028e8:	e8 43 e4 ff ff       	callq  400d30 <close@plt>
  4028ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028f2:	e9 b3 01 00 00       	jmpq   402aaa <submitr+0x746>
  4028f7:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  4028fe:	00 
  4028ff:	b8 0d 00 00 00       	mov    $0xd,%eax
  402904:	29 d0                	sub    %edx,%eax
  402906:	75 1b                	jne    402923 <submitr+0x5bf>
  402908:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  40290f:	00 
  402910:	b8 0a 00 00 00       	mov    $0xa,%eax
  402915:	29 d0                	sub    %edx,%eax
  402917:	75 0a                	jne    402923 <submitr+0x5bf>
  402919:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  402920:	00 
  402921:	f7 d8                	neg    %eax
  402923:	85 c0                	test   %eax,%eax
  402925:	0f 85 37 ff ff ff    	jne    402862 <submitr+0x4fe>
  40292b:	ba 00 20 00 00       	mov    $0x2000,%edx
  402930:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402937:	00 
  402938:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40293d:	e8 6b f8 ff ff       	callq  4021ad <rio_readlineb>
  402942:	48 85 c0             	test   %rax,%rax
  402945:	0f 8f 83 00 00 00    	jg     4029ce <submitr+0x66a>
  40294b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402952:	3a 20 43 
  402955:	48 89 03             	mov    %rax,(%rbx)
  402958:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40295f:	20 75 6e 
  402962:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402966:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40296d:	74 6f 20 
  402970:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402974:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  40297b:	73 74 61 
  40297e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402982:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402989:	65 73 73 
  40298c:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402990:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402997:	72 6f 6d 
  40299a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40299e:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  4029a5:	6c 74 20 
  4029a8:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4029ac:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  4029b3:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  4029b9:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  4029bd:	89 ef                	mov    %ebp,%edi
  4029bf:	e8 6c e3 ff ff       	callq  400d30 <close@plt>
  4029c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029c9:	e9 dc 00 00 00       	jmpq   402aaa <submitr+0x746>
  4029ce:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  4029d3:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  4029da:	74 37                	je     402a13 <submitr+0x6af>
  4029dc:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  4029e3:	00 
  4029e4:	b9 f8 35 40 00       	mov    $0x4035f8,%ecx
  4029e9:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4029f0:	be 01 00 00 00       	mov    $0x1,%esi
  4029f5:	48 89 df             	mov    %rbx,%rdi
  4029f8:	b8 00 00 00 00       	mov    $0x0,%eax
  4029fd:	e8 7e e4 ff ff       	callq  400e80 <__sprintf_chk@plt>
  402a02:	89 ef                	mov    %ebp,%edi
  402a04:	e8 27 e3 ff ff       	callq  400d30 <close@plt>
  402a09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a0e:	e9 97 00 00 00       	jmpq   402aaa <submitr+0x746>
  402a13:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402a1a:	00 
  402a1b:	48 89 df             	mov    %rbx,%rdi
  402a1e:	e8 9d e2 ff ff       	callq  400cc0 <strcpy@plt>
  402a23:	89 ef                	mov    %ebp,%edi
  402a25:	e8 06 e3 ff ff       	callq  400d30 <close@plt>
  402a2a:	0f b6 03             	movzbl (%rbx),%eax
  402a2d:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402a32:	29 c2                	sub    %eax,%edx
  402a34:	75 22                	jne    402a58 <submitr+0x6f4>
  402a36:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402a3a:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402a3f:	29 c8                	sub    %ecx,%eax
  402a41:	75 17                	jne    402a5a <submitr+0x6f6>
  402a43:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402a47:	b8 0a 00 00 00       	mov    $0xa,%eax
  402a4c:	29 c8                	sub    %ecx,%eax
  402a4e:	75 0a                	jne    402a5a <submitr+0x6f6>
  402a50:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402a54:	f7 d8                	neg    %eax
  402a56:	eb 02                	jmp    402a5a <submitr+0x6f6>
  402a58:	89 d0                	mov    %edx,%eax
  402a5a:	85 c0                	test   %eax,%eax
  402a5c:	74 40                	je     402a9e <submitr+0x73a>
  402a5e:	bf 40 36 40 00       	mov    $0x403640,%edi
  402a63:	b9 05 00 00 00       	mov    $0x5,%ecx
  402a68:	48 89 de             	mov    %rbx,%rsi
  402a6b:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402a6d:	0f 97 c0             	seta   %al
  402a70:	0f 92 c1             	setb   %cl
  402a73:	29 c8                	sub    %ecx,%eax
  402a75:	0f be c0             	movsbl %al,%eax
  402a78:	85 c0                	test   %eax,%eax
  402a7a:	74 2e                	je     402aaa <submitr+0x746>
  402a7c:	85 d2                	test   %edx,%edx
  402a7e:	75 13                	jne    402a93 <submitr+0x72f>
  402a80:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402a84:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402a89:	29 c2                	sub    %eax,%edx
  402a8b:	75 06                	jne    402a93 <submitr+0x72f>
  402a8d:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402a91:	f7 da                	neg    %edx
  402a93:	85 d2                	test   %edx,%edx
  402a95:	75 0e                	jne    402aa5 <submitr+0x741>
  402a97:	b8 00 00 00 00       	mov    $0x0,%eax
  402a9c:	eb 0c                	jmp    402aaa <submitr+0x746>
  402a9e:	b8 00 00 00 00       	mov    $0x0,%eax
  402aa3:	eb 05                	jmp    402aaa <submitr+0x746>
  402aa5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402aaa:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402ab1:	00 
  402ab2:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402ab9:	00 00 
  402abb:	74 05                	je     402ac2 <submitr+0x75e>
  402abd:	e8 2e e2 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  402ac2:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402ac9:	5b                   	pop    %rbx
  402aca:	5d                   	pop    %rbp
  402acb:	41 5c                	pop    %r12
  402acd:	41 5d                	pop    %r13
  402acf:	41 5e                	pop    %r14
  402ad1:	41 5f                	pop    %r15
  402ad3:	c3                   	retq   

0000000000402ad4 <init_timeout>:
  402ad4:	85 ff                	test   %edi,%edi
  402ad6:	74 23                	je     402afb <init_timeout+0x27>
  402ad8:	53                   	push   %rbx
  402ad9:	89 fb                	mov    %edi,%ebx
  402adb:	85 ff                	test   %edi,%edi
  402add:	79 05                	jns    402ae4 <init_timeout+0x10>
  402adf:	bb 00 00 00 00       	mov    $0x0,%ebx
  402ae4:	be 98 20 40 00       	mov    $0x402098,%esi
  402ae9:	bf 0e 00 00 00       	mov    $0xe,%edi
  402aee:	e8 6d e2 ff ff       	callq  400d60 <signal@plt>
  402af3:	89 df                	mov    %ebx,%edi
  402af5:	e8 26 e2 ff ff       	callq  400d20 <alarm@plt>
  402afa:	5b                   	pop    %rbx
  402afb:	f3 c3                	repz retq 

0000000000402afd <init_driver>:
  402afd:	55                   	push   %rbp
  402afe:	53                   	push   %rbx
  402aff:	48 83 ec 28          	sub    $0x28,%rsp
  402b03:	48 89 fd             	mov    %rdi,%rbp
  402b06:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b0d:	00 00 
  402b0f:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402b14:	31 c0                	xor    %eax,%eax
  402b16:	be 01 00 00 00       	mov    $0x1,%esi
  402b1b:	bf 0d 00 00 00       	mov    $0xd,%edi
  402b20:	e8 3b e2 ff ff       	callq  400d60 <signal@plt>
  402b25:	be 01 00 00 00       	mov    $0x1,%esi
  402b2a:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b2f:	e8 2c e2 ff ff       	callq  400d60 <signal@plt>
  402b34:	be 01 00 00 00       	mov    $0x1,%esi
  402b39:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b3e:	e8 1d e2 ff ff       	callq  400d60 <signal@plt>
  402b43:	ba 00 00 00 00       	mov    $0x0,%edx
  402b48:	be 01 00 00 00       	mov    $0x1,%esi
  402b4d:	bf 02 00 00 00       	mov    $0x2,%edi
  402b52:	e8 39 e3 ff ff       	callq  400e90 <socket@plt>
  402b57:	85 c0                	test   %eax,%eax
  402b59:	79 4f                	jns    402baa <init_driver+0xad>
  402b5b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402b62:	3a 20 43 
  402b65:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b69:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402b70:	20 75 6e 
  402b73:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402b77:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b7e:	74 6f 20 
  402b81:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b85:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402b8c:	65 20 73 
  402b8f:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402b93:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402b9a:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ba5:	e9 2a 01 00 00       	jmpq   402cd4 <init_driver+0x1d7>
  402baa:	89 c3                	mov    %eax,%ebx
  402bac:	bf 5f 31 40 00       	mov    $0x40315f,%edi
  402bb1:	e8 ba e1 ff ff       	callq  400d70 <gethostbyname@plt>
  402bb6:	48 85 c0             	test   %rax,%rax
  402bb9:	75 68                	jne    402c23 <init_driver+0x126>
  402bbb:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402bc2:	3a 20 44 
  402bc5:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402bc9:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402bd0:	20 75 6e 
  402bd3:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bd7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402bde:	74 6f 20 
  402be1:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402be5:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402bec:	76 65 20 
  402bef:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402bf3:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402bfa:	72 20 61 
  402bfd:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402c01:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402c08:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402c0e:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402c12:	89 df                	mov    %ebx,%edi
  402c14:	e8 17 e1 ff ff       	callq  400d30 <close@plt>
  402c19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c1e:	e9 b1 00 00 00       	jmpq   402cd4 <init_driver+0x1d7>
  402c23:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402c2a:	00 
  402c2b:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402c32:	00 00 
  402c34:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402c3a:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402c3e:	48 8b 40 18          	mov    0x18(%rax),%rax
  402c42:	48 8b 30             	mov    (%rax),%rsi
  402c45:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402c4a:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402c4f:	e8 2c e1 ff ff       	callq  400d80 <__memmove_chk@plt>
  402c54:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402c5b:	ba 10 00 00 00       	mov    $0x10,%edx
  402c60:	48 89 e6             	mov    %rsp,%rsi
  402c63:	89 df                	mov    %ebx,%edi
  402c65:	e8 f6 e1 ff ff       	callq  400e60 <connect@plt>
  402c6a:	85 c0                	test   %eax,%eax
  402c6c:	79 50                	jns    402cbe <init_driver+0x1c1>
  402c6e:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402c75:	3a 20 55 
  402c78:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c7c:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402c83:	20 74 6f 
  402c86:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402c8a:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402c91:	65 63 74 
  402c94:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c98:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402c9f:	65 72 76 
  402ca2:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402ca6:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402cac:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402cb0:	89 df                	mov    %ebx,%edi
  402cb2:	e8 79 e0 ff ff       	callq  400d30 <close@plt>
  402cb7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402cbc:	eb 16                	jmp    402cd4 <init_driver+0x1d7>
  402cbe:	89 df                	mov    %ebx,%edi
  402cc0:	e8 6b e0 ff ff       	callq  400d30 <close@plt>
  402cc5:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402ccb:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402ccf:	b8 00 00 00 00       	mov    $0x0,%eax
  402cd4:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402cd9:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402ce0:	00 00 
  402ce2:	74 05                	je     402ce9 <init_driver+0x1ec>
  402ce4:	e8 07 e0 ff ff       	callq  400cf0 <__stack_chk_fail@plt>
  402ce9:	48 83 c4 28          	add    $0x28,%rsp
  402ced:	5b                   	pop    %rbx
  402cee:	5d                   	pop    %rbp
  402cef:	c3                   	retq   

0000000000402cf0 <driver_post>:
  402cf0:	53                   	push   %rbx
  402cf1:	4c 89 cb             	mov    %r9,%rbx
  402cf4:	45 85 c0             	test   %r8d,%r8d
  402cf7:	74 27                	je     402d20 <driver_post+0x30>
  402cf9:	48 89 ca             	mov    %rcx,%rdx
  402cfc:	be 45 36 40 00       	mov    $0x403645,%esi
  402d01:	bf 01 00 00 00       	mov    $0x1,%edi
  402d06:	b8 00 00 00 00       	mov    $0x0,%eax
  402d0b:	e8 f0 e0 ff ff       	callq  400e00 <__printf_chk@plt>
  402d10:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d15:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d19:	b8 00 00 00 00       	mov    $0x0,%eax
  402d1e:	eb 3f                	jmp    402d5f <driver_post+0x6f>
  402d20:	48 85 ff             	test   %rdi,%rdi
  402d23:	74 2c                	je     402d51 <driver_post+0x61>
  402d25:	80 3f 00             	cmpb   $0x0,(%rdi)
  402d28:	74 27                	je     402d51 <driver_post+0x61>
  402d2a:	48 83 ec 08          	sub    $0x8,%rsp
  402d2e:	41 51                	push   %r9
  402d30:	49 89 c9             	mov    %rcx,%r9
  402d33:	49 89 d0             	mov    %rdx,%r8
  402d36:	48 89 f9             	mov    %rdi,%rcx
  402d39:	48 89 f2             	mov    %rsi,%rdx
  402d3c:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402d41:	bf 5f 31 40 00       	mov    $0x40315f,%edi
  402d46:	e8 19 f6 ff ff       	callq  402364 <submitr>
  402d4b:	48 83 c4 10          	add    $0x10,%rsp
  402d4f:	eb 0e                	jmp    402d5f <driver_post+0x6f>
  402d51:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d56:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d5a:	b8 00 00 00 00       	mov    $0x0,%eax
  402d5f:	5b                   	pop    %rbx
  402d60:	c3                   	retq   

0000000000402d61 <check>:
  402d61:	89 f8                	mov    %edi,%eax
  402d63:	c1 e8 1c             	shr    $0x1c,%eax
  402d66:	85 c0                	test   %eax,%eax
  402d68:	74 1d                	je     402d87 <check+0x26>
  402d6a:	b9 00 00 00 00       	mov    $0x0,%ecx
  402d6f:	eb 0b                	jmp    402d7c <check+0x1b>
  402d71:	89 f8                	mov    %edi,%eax
  402d73:	d3 e8                	shr    %cl,%eax
  402d75:	3c 0a                	cmp    $0xa,%al
  402d77:	74 14                	je     402d8d <check+0x2c>
  402d79:	83 c1 08             	add    $0x8,%ecx
  402d7c:	83 f9 1f             	cmp    $0x1f,%ecx
  402d7f:	7e f0                	jle    402d71 <check+0x10>
  402d81:	b8 01 00 00 00       	mov    $0x1,%eax
  402d86:	c3                   	retq   
  402d87:	b8 00 00 00 00       	mov    $0x0,%eax
  402d8c:	c3                   	retq   
  402d8d:	b8 00 00 00 00       	mov    $0x0,%eax
  402d92:	c3                   	retq   

0000000000402d93 <gencookie>:
  402d93:	53                   	push   %rbx
  402d94:	83 c7 01             	add    $0x1,%edi
  402d97:	e8 04 df ff ff       	callq  400ca0 <srandom@plt>
  402d9c:	e8 1f e0 ff ff       	callq  400dc0 <random@plt>
  402da1:	89 c3                	mov    %eax,%ebx
  402da3:	89 c7                	mov    %eax,%edi
  402da5:	e8 b7 ff ff ff       	callq  402d61 <check>
  402daa:	85 c0                	test   %eax,%eax
  402dac:	74 ee                	je     402d9c <gencookie+0x9>
  402dae:	89 d8                	mov    %ebx,%eax
  402db0:	5b                   	pop    %rbx
  402db1:	c3                   	retq   
  402db2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402db9:	00 00 00 
  402dbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402dc0 <__libc_csu_init>:
  402dc0:	41 57                	push   %r15
  402dc2:	41 56                	push   %r14
  402dc4:	41 89 ff             	mov    %edi,%r15d
  402dc7:	41 55                	push   %r13
  402dc9:	41 54                	push   %r12
  402dcb:	4c 8d 25 3e 10 20 00 	lea    0x20103e(%rip),%r12        # 603e10 <__frame_dummy_init_array_entry>
  402dd2:	55                   	push   %rbp
  402dd3:	48 8d 2d 3e 10 20 00 	lea    0x20103e(%rip),%rbp        # 603e18 <__init_array_end>
  402dda:	53                   	push   %rbx
  402ddb:	49 89 f6             	mov    %rsi,%r14
  402dde:	49 89 d5             	mov    %rdx,%r13
  402de1:	4c 29 e5             	sub    %r12,%rbp
  402de4:	48 83 ec 08          	sub    $0x8,%rsp
  402de8:	48 c1 fd 03          	sar    $0x3,%rbp
  402dec:	e8 57 de ff ff       	callq  400c48 <_init>
  402df1:	48 85 ed             	test   %rbp,%rbp
  402df4:	74 20                	je     402e16 <__libc_csu_init+0x56>
  402df6:	31 db                	xor    %ebx,%ebx
  402df8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402dff:	00 
  402e00:	4c 89 ea             	mov    %r13,%rdx
  402e03:	4c 89 f6             	mov    %r14,%rsi
  402e06:	44 89 ff             	mov    %r15d,%edi
  402e09:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402e0d:	48 83 c3 01          	add    $0x1,%rbx
  402e11:	48 39 eb             	cmp    %rbp,%rbx
  402e14:	75 ea                	jne    402e00 <__libc_csu_init+0x40>
  402e16:	48 83 c4 08          	add    $0x8,%rsp
  402e1a:	5b                   	pop    %rbx
  402e1b:	5d                   	pop    %rbp
  402e1c:	41 5c                	pop    %r12
  402e1e:	41 5d                	pop    %r13
  402e20:	41 5e                	pop    %r14
  402e22:	41 5f                	pop    %r15
  402e24:	c3                   	retq   
  402e25:	90                   	nop
  402e26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e2d:	00 00 00 

0000000000402e30 <__libc_csu_fini>:
  402e30:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402e34 <_fini>:
  402e34:	48 83 ec 08          	sub    $0x8,%rsp
  402e38:	48 83 c4 08          	add    $0x8,%rsp
  402e3c:	c3                   	retq   
