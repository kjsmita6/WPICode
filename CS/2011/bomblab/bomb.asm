
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400df8 <_init>:
  400df8:	48 83 ec 08          	sub    $0x8,%rsp
  400dfc:	48 8b 05 f5 51 20 00 	mov    0x2051f5(%rip),%rax        # 605ff8 <_DYNAMIC+0x1d0>
  400e03:	48 85 c0             	test   %rax,%rax
  400e06:	74 05                	je     400e0d <_init+0x15>
  400e08:	e8 c3 02 00 00       	callq  4010d0 <socket@plt+0x10>
  400e0d:	48 83 c4 08          	add    $0x8,%rsp
  400e11:	c3                   	retq   

Disassembly of section .plt:

0000000000400e20 <free@plt-0x10>:
  400e20:	ff 35 e2 51 20 00    	pushq  0x2051e2(%rip)        # 606008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400e26:	ff 25 e4 51 20 00    	jmpq   *0x2051e4(%rip)        # 606010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400e2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e30 <free@plt>:
  400e30:	ff 25 e2 51 20 00    	jmpq   *0x2051e2(%rip)        # 606018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400e36:	68 00 00 00 00       	pushq  $0x0
  400e3b:	e9 e0 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400e40 <__read_chk@plt>:
  400e40:	ff 25 da 51 20 00    	jmpq   *0x2051da(%rip)        # 606020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400e46:	68 01 00 00 00       	pushq  $0x1
  400e4b:	e9 d0 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400e50 <puts@plt>:
  400e50:	ff 25 d2 51 20 00    	jmpq   *0x2051d2(%rip)        # 606028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400e56:	68 02 00 00 00       	pushq  $0x2
  400e5b:	e9 c0 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400e60 <fread@plt>:
  400e60:	ff 25 ca 51 20 00    	jmpq   *0x2051ca(%rip)        # 606030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400e66:	68 03 00 00 00       	pushq  $0x3
  400e6b:	e9 b0 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400e70 <write@plt>:
  400e70:	ff 25 c2 51 20 00    	jmpq   *0x2051c2(%rip)        # 606038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400e76:	68 04 00 00 00       	pushq  $0x4
  400e7b:	e9 a0 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400e80 <fclose@plt>:
  400e80:	ff 25 ba 51 20 00    	jmpq   *0x2051ba(%rip)        # 606040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400e86:	68 05 00 00 00       	pushq  $0x5
  400e8b:	e9 90 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400e90 <strlen@plt>:
  400e90:	ff 25 b2 51 20 00    	jmpq   *0x2051b2(%rip)        # 606048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400e96:	68 06 00 00 00       	pushq  $0x6
  400e9b:	e9 80 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400ea0 <__stack_chk_fail@plt>:
  400ea0:	ff 25 aa 51 20 00    	jmpq   *0x2051aa(%rip)        # 606050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ea6:	68 07 00 00 00       	pushq  $0x7
  400eab:	e9 70 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400eb0 <strchr@plt>:
  400eb0:	ff 25 a2 51 20 00    	jmpq   *0x2051a2(%rip)        # 606058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400eb6:	68 08 00 00 00       	pushq  $0x8
  400ebb:	e9 60 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400ec0 <gai_strerror@plt>:
  400ec0:	ff 25 9a 51 20 00    	jmpq   *0x20519a(%rip)        # 606060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400ec6:	68 09 00 00 00       	pushq  $0x9
  400ecb:	e9 50 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400ed0 <memset@plt>:
  400ed0:	ff 25 92 51 20 00    	jmpq   *0x205192(%rip)        # 606068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400ed6:	68 0a 00 00 00       	pushq  $0xa
  400edb:	e9 40 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400ee0 <close@plt>:
  400ee0:	ff 25 8a 51 20 00    	jmpq   *0x20518a(%rip)        # 606070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400ee6:	68 0b 00 00 00       	pushq  $0xb
  400eeb:	e9 30 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400ef0 <read@plt>:
  400ef0:	ff 25 82 51 20 00    	jmpq   *0x205182(%rip)        # 606078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400ef6:	68 0c 00 00 00       	pushq  $0xc
  400efb:	e9 20 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f00 <__libc_start_main@plt>:
  400f00:	ff 25 7a 51 20 00    	jmpq   *0x20517a(%rip)        # 606080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400f06:	68 0d 00 00 00       	pushq  $0xd
  400f0b:	e9 10 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f10 <srand@plt>:
  400f10:	ff 25 72 51 20 00    	jmpq   *0x205172(%rip)        # 606088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400f16:	68 0e 00 00 00       	pushq  $0xe
  400f1b:	e9 00 ff ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f20 <memcmp@plt>:
  400f20:	ff 25 6a 51 20 00    	jmpq   *0x20516a(%rip)        # 606090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400f26:	68 0f 00 00 00       	pushq  $0xf
  400f2b:	e9 f0 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f30 <fgets@plt>:
  400f30:	ff 25 62 51 20 00    	jmpq   *0x205162(%rip)        # 606098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400f36:	68 10 00 00 00       	pushq  $0x10
  400f3b:	e9 e0 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f40 <signal@plt>:
  400f40:	ff 25 5a 51 20 00    	jmpq   *0x20515a(%rip)        # 6060a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400f46:	68 11 00 00 00       	pushq  $0x11
  400f4b:	e9 d0 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f50 <strtol@plt>:
  400f50:	ff 25 52 51 20 00    	jmpq   *0x205152(%rip)        # 6060a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400f56:	68 12 00 00 00       	pushq  $0x12
  400f5b:	e9 c0 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f60 <malloc@plt>:
  400f60:	ff 25 4a 51 20 00    	jmpq   *0x20514a(%rip)        # 6060b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400f66:	68 13 00 00 00       	pushq  $0x13
  400f6b:	e9 b0 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f70 <fflush@plt>:
  400f70:	ff 25 42 51 20 00    	jmpq   *0x205142(%rip)        # 6060b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400f76:	68 14 00 00 00       	pushq  $0x14
  400f7b:	e9 a0 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f80 <__isoc99_sscanf@plt>:
  400f80:	ff 25 3a 51 20 00    	jmpq   *0x20513a(%rip)        # 6060c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400f86:	68 15 00 00 00       	pushq  $0x15
  400f8b:	e9 90 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400f90 <__strcpy_chk@plt>:
  400f90:	ff 25 32 51 20 00    	jmpq   *0x205132(%rip)        # 6060c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400f96:	68 16 00 00 00       	pushq  $0x16
  400f9b:	e9 80 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400fa0 <__printf_chk@plt>:
  400fa0:	ff 25 2a 51 20 00    	jmpq   *0x20512a(%rip)        # 6060d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400fa6:	68 17 00 00 00       	pushq  $0x17
  400fab:	e9 70 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400fb0 <fopen@plt>:
  400fb0:	ff 25 22 51 20 00    	jmpq   *0x205122(%rip)        # 6060d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400fb6:	68 18 00 00 00       	pushq  $0x18
  400fbb:	e9 60 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400fc0 <perror@plt>:
  400fc0:	ff 25 1a 51 20 00    	jmpq   *0x20511a(%rip)        # 6060e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400fc6:	68 19 00 00 00       	pushq  $0x19
  400fcb:	e9 50 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400fd0 <strtoul@plt>:
  400fd0:	ff 25 12 51 20 00    	jmpq   *0x205112(%rip)        # 6060e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400fd6:	68 1a 00 00 00       	pushq  $0x1a
  400fdb:	e9 40 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400fe0 <atoi@plt>:
  400fe0:	ff 25 0a 51 20 00    	jmpq   *0x20510a(%rip)        # 6060f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400fe6:	68 1b 00 00 00       	pushq  $0x1b
  400feb:	e9 30 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000400ff0 <sprintf@plt>:
  400ff0:	ff 25 02 51 20 00    	jmpq   *0x205102(%rip)        # 6060f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400ff6:	68 1c 00 00 00       	pushq  $0x1c
  400ffb:	e9 20 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000401000 <exit@plt>:
  401000:	ff 25 fa 50 20 00    	jmpq   *0x2050fa(%rip)        # 606100 <_GLOBAL_OFFSET_TABLE_+0x100>
  401006:	68 1d 00 00 00       	pushq  $0x1d
  40100b:	e9 10 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000401010 <connect@plt>:
  401010:	ff 25 f2 50 20 00    	jmpq   *0x2050f2(%rip)        # 606108 <_GLOBAL_OFFSET_TABLE_+0x108>
  401016:	68 1e 00 00 00       	pushq  $0x1e
  40101b:	e9 00 fe ff ff       	jmpq   400e20 <_init+0x28>

0000000000401020 <fwrite@plt>:
  401020:	ff 25 ea 50 20 00    	jmpq   *0x2050ea(%rip)        # 606110 <_GLOBAL_OFFSET_TABLE_+0x110>
  401026:	68 1f 00 00 00       	pushq  $0x1f
  40102b:	e9 f0 fd ff ff       	jmpq   400e20 <_init+0x28>

0000000000401030 <__fprintf_chk@plt>:
  401030:	ff 25 e2 50 20 00    	jmpq   *0x2050e2(%rip)        # 606118 <_GLOBAL_OFFSET_TABLE_+0x118>
  401036:	68 20 00 00 00       	pushq  $0x20
  40103b:	e9 e0 fd ff ff       	jmpq   400e20 <_init+0x28>

0000000000401040 <getaddrinfo@plt>:
  401040:	ff 25 da 50 20 00    	jmpq   *0x2050da(%rip)        # 606120 <_GLOBAL_OFFSET_TABLE_+0x120>
  401046:	68 21 00 00 00       	pushq  $0x21
  40104b:	e9 d0 fd ff ff       	jmpq   400e20 <_init+0x28>

0000000000401050 <strdup@plt>:
  401050:	ff 25 d2 50 20 00    	jmpq   *0x2050d2(%rip)        # 606128 <_GLOBAL_OFFSET_TABLE_+0x128>
  401056:	68 22 00 00 00       	pushq  $0x22
  40105b:	e9 c0 fd ff ff       	jmpq   400e20 <_init+0x28>

0000000000401060 <sleep@plt>:
  401060:	ff 25 ca 50 20 00    	jmpq   *0x2050ca(%rip)        # 606130 <_GLOBAL_OFFSET_TABLE_+0x130>
  401066:	68 23 00 00 00       	pushq  $0x23
  40106b:	e9 b0 fd ff ff       	jmpq   400e20 <_init+0x28>

0000000000401070 <strstr@plt>:
  401070:	ff 25 c2 50 20 00    	jmpq   *0x2050c2(%rip)        # 606138 <_GLOBAL_OFFSET_TABLE_+0x138>
  401076:	68 24 00 00 00       	pushq  $0x24
  40107b:	e9 a0 fd ff ff       	jmpq   400e20 <_init+0x28>

0000000000401080 <rand@plt>:
  401080:	ff 25 ba 50 20 00    	jmpq   *0x2050ba(%rip)        # 606140 <_GLOBAL_OFFSET_TABLE_+0x140>
  401086:	68 25 00 00 00       	pushq  $0x25
  40108b:	e9 90 fd ff ff       	jmpq   400e20 <_init+0x28>

0000000000401090 <__ctype_b_loc@plt>:
  401090:	ff 25 b2 50 20 00    	jmpq   *0x2050b2(%rip)        # 606148 <_GLOBAL_OFFSET_TABLE_+0x148>
  401096:	68 26 00 00 00       	pushq  $0x26
  40109b:	e9 80 fd ff ff       	jmpq   400e20 <_init+0x28>

00000000004010a0 <freeaddrinfo@plt>:
  4010a0:	ff 25 aa 50 20 00    	jmpq   *0x2050aa(%rip)        # 606150 <_GLOBAL_OFFSET_TABLE_+0x150>
  4010a6:	68 27 00 00 00       	pushq  $0x27
  4010ab:	e9 70 fd ff ff       	jmpq   400e20 <_init+0x28>

00000000004010b0 <__sprintf_chk@plt>:
  4010b0:	ff 25 a2 50 20 00    	jmpq   *0x2050a2(%rip)        # 606158 <_GLOBAL_OFFSET_TABLE_+0x158>
  4010b6:	68 28 00 00 00       	pushq  $0x28
  4010bb:	e9 60 fd ff ff       	jmpq   400e20 <_init+0x28>

00000000004010c0 <socket@plt>:
  4010c0:	ff 25 9a 50 20 00    	jmpq   *0x20509a(%rip)        # 606160 <_GLOBAL_OFFSET_TABLE_+0x160>
  4010c6:	68 29 00 00 00       	pushq  $0x29
  4010cb:	e9 50 fd ff ff       	jmpq   400e20 <_init+0x28>

Disassembly of section .plt.got:

00000000004010d0 <.plt.got>:
  4010d0:	ff 25 22 4f 20 00    	jmpq   *0x204f22(%rip)        # 605ff8 <_DYNAMIC+0x1d0>
  4010d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000004010e0 <_start>:
  4010e0:	31 ed                	xor    %ebp,%ebp
  4010e2:	49 89 d1             	mov    %rdx,%r9
  4010e5:	5e                   	pop    %rsi
  4010e6:	48 89 e2             	mov    %rsp,%rdx
  4010e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4010ed:	50                   	push   %rax
  4010ee:	54                   	push   %rsp
  4010ef:	49 c7 c0 90 39 40 00 	mov    $0x403990,%r8
  4010f6:	48 c7 c1 20 39 40 00 	mov    $0x403920,%rcx
  4010fd:	48 c7 c7 d6 11 40 00 	mov    $0x4011d6,%rdi
  401104:	e8 f7 fd ff ff       	callq  400f00 <__libc_start_main@plt>
  401109:	f4                   	hlt    
  40110a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401110 <deregister_tm_clones>:
  401110:	b8 af 61 60 00       	mov    $0x6061af,%eax
  401115:	55                   	push   %rbp
  401116:	48 2d a8 61 60 00    	sub    $0x6061a8,%rax
  40111c:	48 83 f8 0e          	cmp    $0xe,%rax
  401120:	48 89 e5             	mov    %rsp,%rbp
  401123:	76 1b                	jbe    401140 <deregister_tm_clones+0x30>
  401125:	b8 00 00 00 00       	mov    $0x0,%eax
  40112a:	48 85 c0             	test   %rax,%rax
  40112d:	74 11                	je     401140 <deregister_tm_clones+0x30>
  40112f:	5d                   	pop    %rbp
  401130:	bf a8 61 60 00       	mov    $0x6061a8,%edi
  401135:	ff e0                	jmpq   *%rax
  401137:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40113e:	00 00 
  401140:	5d                   	pop    %rbp
  401141:	c3                   	retq   
  401142:	0f 1f 40 00          	nopl   0x0(%rax)
  401146:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40114d:	00 00 00 

0000000000401150 <register_tm_clones>:
  401150:	be a8 61 60 00       	mov    $0x6061a8,%esi
  401155:	55                   	push   %rbp
  401156:	48 81 ee a8 61 60 00 	sub    $0x6061a8,%rsi
  40115d:	48 c1 fe 03          	sar    $0x3,%rsi
  401161:	48 89 e5             	mov    %rsp,%rbp
  401164:	48 89 f0             	mov    %rsi,%rax
  401167:	48 c1 e8 3f          	shr    $0x3f,%rax
  40116b:	48 01 c6             	add    %rax,%rsi
  40116e:	48 d1 fe             	sar    %rsi
  401171:	74 15                	je     401188 <register_tm_clones+0x38>
  401173:	b8 00 00 00 00       	mov    $0x0,%eax
  401178:	48 85 c0             	test   %rax,%rax
  40117b:	74 0b                	je     401188 <register_tm_clones+0x38>
  40117d:	5d                   	pop    %rbp
  40117e:	bf a8 61 60 00       	mov    $0x6061a8,%edi
  401183:	ff e0                	jmpq   *%rax
  401185:	0f 1f 00             	nopl   (%rax)
  401188:	5d                   	pop    %rbp
  401189:	c3                   	retq   
  40118a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401190 <__do_global_dtors_aux>:
  401190:	80 3d 51 50 20 00 00 	cmpb   $0x0,0x205051(%rip)        # 6061e8 <completed.7594>
  401197:	75 11                	jne    4011aa <__do_global_dtors_aux+0x1a>
  401199:	55                   	push   %rbp
  40119a:	48 89 e5             	mov    %rsp,%rbp
  40119d:	e8 6e ff ff ff       	callq  401110 <deregister_tm_clones>
  4011a2:	5d                   	pop    %rbp
  4011a3:	c6 05 3e 50 20 00 01 	movb   $0x1,0x20503e(%rip)        # 6061e8 <completed.7594>
  4011aa:	f3 c3                	repz retq 
  4011ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004011b0 <frame_dummy>:
  4011b0:	bf 20 5e 60 00       	mov    $0x605e20,%edi
  4011b5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4011b9:	75 05                	jne    4011c0 <frame_dummy+0x10>
  4011bb:	eb 93                	jmp    401150 <register_tm_clones>
  4011bd:	0f 1f 00             	nopl   (%rax)
  4011c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4011c5:	48 85 c0             	test   %rax,%rax
  4011c8:	74 f1                	je     4011bb <frame_dummy+0xb>
  4011ca:	55                   	push   %rbp
  4011cb:	48 89 e5             	mov    %rsp,%rbp
  4011ce:	ff d0                	callq  *%rax
  4011d0:	5d                   	pop    %rbp
  4011d1:	e9 7a ff ff ff       	jmpq   401150 <register_tm_clones>

00000000004011d6 <main>:
  4011d6:	55                   	push   %rbp
  4011d7:	53                   	push   %rbx
  4011d8:	48 83 ec 08          	sub    $0x8,%rsp
  4011dc:	89 fb                	mov    %edi,%ebx
  4011de:	48 89 f5             	mov    %rsi,%rbp
  4011e1:	83 ff 01             	cmp    $0x1,%edi
  4011e4:	75 10                	jne    4011f6 <main+0x20>
  4011e6:	48 8b 05 e3 4f 20 00 	mov    0x204fe3(%rip),%rax        # 6061d0 <stdin@@GLIBC_2.2.5>
  4011ed:	48 89 05 34 55 20 00 	mov    %rax,0x205534(%rip)        # 606728 <infile>
  4011f4:	eb 6f                	jmp    401265 <main+0x8f>
  4011f6:	83 ff 02             	cmp    $0x2,%edi
  4011f9:	75 42                	jne    40123d <main+0x67>
  4011fb:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  4011ff:	be a4 39 40 00       	mov    $0x4039a4,%esi
  401204:	e8 a7 fd ff ff       	callq  400fb0 <fopen@plt>
  401209:	48 89 05 18 55 20 00 	mov    %rax,0x205518(%rip)        # 606728 <infile>
  401210:	48 85 c0             	test   %rax,%rax
  401213:	75 50                	jne    401265 <main+0x8f>
  401215:	48 8b 4d 00          	mov    0x0(%rbp),%rcx
  401219:	4c 8b 45 08          	mov    0x8(%rbp),%r8
  40121d:	ba a6 39 40 00       	mov    $0x4039a6,%edx
  401222:	be 01 00 00 00       	mov    $0x1,%esi
  401227:	48 8b 3d b2 4f 20 00 	mov    0x204fb2(%rip),%rdi        # 6061e0 <stderr@@GLIBC_2.2.5>
  40122e:	e8 fd fd ff ff       	callq  401030 <__fprintf_chk@plt>
  401233:	b8 08 00 00 00       	mov    $0x8,%eax
  401238:	e9 0d 02 00 00       	jmpq   40144a <main+0x274>
  40123d:	48 8b 0e             	mov    (%rsi),%rcx
  401240:	ba c3 39 40 00       	mov    $0x4039c3,%edx
  401245:	be 01 00 00 00       	mov    $0x1,%esi
  40124a:	48 8b 3d 8f 4f 20 00 	mov    0x204f8f(%rip),%rdi        # 6061e0 <stderr@@GLIBC_2.2.5>
  401251:	b8 00 00 00 00       	mov    $0x0,%eax
  401256:	e8 d5 fd ff ff       	callq  401030 <__fprintf_chk@plt>
  40125b:	b8 08 00 00 00       	mov    $0x8,%eax
  401260:	e9 e5 01 00 00       	jmpq   40144a <main+0x274>
  401265:	48 89 ee             	mov    %rbp,%rsi
  401268:	89 df                	mov    %ebx,%edi
  40126a:	b8 00 00 00 00       	mov    $0x0,%eax
  40126f:	e8 89 11 00 00       	callq  4023fd <initialize_bomb>
  401274:	bf 00 3a 40 00       	mov    $0x403a00,%edi
  401279:	e8 d2 fb ff ff       	callq  400e50 <puts@plt>
  40127e:	ba 06 00 00 00       	mov    $0x6,%edx
  401283:	be 40 3a 40 00       	mov    $0x403a40,%esi
  401288:	bf 01 00 00 00       	mov    $0x1,%edi
  40128d:	b8 00 00 00 00       	mov    $0x0,%eax
  401292:	e8 09 fd ff ff       	callq  400fa0 <__printf_chk@plt>
  401297:	bf db 39 40 00       	mov    $0x4039db,%edi
  40129c:	e8 af fb ff ff       	callq  400e50 <puts@plt>
  4012a1:	ba 01 00 00 00       	mov    $0x1,%edx
  4012a6:	be f9 39 40 00       	mov    $0x4039f9,%esi
  4012ab:	bf 01 00 00 00       	mov    $0x1,%edi
  4012b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4012b5:	e8 e6 fc ff ff       	callq  400fa0 <__printf_chk@plt>
  4012ba:	48 8b 3d ff 4e 20 00 	mov    0x204eff(%rip),%rdi        # 6061c0 <stdout@@GLIBC_2.2.5>
  4012c1:	e8 aa fc ff ff       	callq  400f70 <fflush@plt>
  4012c6:	b8 00 00 00 00       	mov    $0x0,%eax
  4012cb:	e8 cd 0c 00 00       	callq  401f9d <read_line>
  4012d0:	48 89 c7             	mov    %rax,%rdi
  4012d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4012d8:	e8 13 02 00 00       	callq  4014f0 <phase1>
  4012dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e2:	e8 eb 0f 00 00       	callq  4022d2 <phase_defused>
  4012e7:	ba 02 00 00 00       	mov    $0x2,%edx
  4012ec:	be f9 39 40 00       	mov    $0x4039f9,%esi
  4012f1:	bf 01 00 00 00       	mov    $0x1,%edi
  4012f6:	b8 00 00 00 00       	mov    $0x0,%eax
  4012fb:	e8 a0 fc ff ff       	callq  400fa0 <__printf_chk@plt>
  401300:	48 8b 3d b9 4e 20 00 	mov    0x204eb9(%rip),%rdi        # 6061c0 <stdout@@GLIBC_2.2.5>
  401307:	e8 64 fc ff ff       	callq  400f70 <fflush@plt>
  40130c:	b8 00 00 00 00       	mov    $0x0,%eax
  401311:	e8 87 0c 00 00       	callq  401f9d <read_line>
  401316:	48 89 c7             	mov    %rax,%rdi
  401319:	b8 00 00 00 00       	mov    $0x0,%eax
  40131e:	e8 38 02 00 00       	callq  40155b <phase2>
  401323:	b8 00 00 00 00       	mov    $0x0,%eax
  401328:	e8 a5 0f 00 00       	callq  4022d2 <phase_defused>
  40132d:	ba 03 00 00 00       	mov    $0x3,%edx
  401332:	be f9 39 40 00       	mov    $0x4039f9,%esi
  401337:	bf 01 00 00 00       	mov    $0x1,%edi
  40133c:	b8 00 00 00 00       	mov    $0x0,%eax
  401341:	e8 5a fc ff ff       	callq  400fa0 <__printf_chk@plt>
  401346:	48 8b 3d 73 4e 20 00 	mov    0x204e73(%rip),%rdi        # 6061c0 <stdout@@GLIBC_2.2.5>
  40134d:	e8 1e fc ff ff       	callq  400f70 <fflush@plt>
  401352:	b8 00 00 00 00       	mov    $0x0,%eax
  401357:	e8 41 0c 00 00       	callq  401f9d <read_line>
  40135c:	48 89 c7             	mov    %rax,%rdi
  40135f:	b8 00 00 00 00       	mov    $0x0,%eax
  401364:	e8 d0 02 00 00       	callq  401639 <phase3>
  401369:	b8 00 00 00 00       	mov    $0x0,%eax
  40136e:	e8 5f 0f 00 00       	callq  4022d2 <phase_defused>
  401373:	ba 04 00 00 00       	mov    $0x4,%edx
  401378:	be f9 39 40 00       	mov    $0x4039f9,%esi
  40137d:	bf 01 00 00 00       	mov    $0x1,%edi
  401382:	b8 00 00 00 00       	mov    $0x0,%eax
  401387:	e8 14 fc ff ff       	callq  400fa0 <__printf_chk@plt>
  40138c:	48 8b 3d 2d 4e 20 00 	mov    0x204e2d(%rip),%rdi        # 6061c0 <stdout@@GLIBC_2.2.5>
  401393:	e8 d8 fb ff ff       	callq  400f70 <fflush@plt>
  401398:	b8 00 00 00 00       	mov    $0x0,%eax
  40139d:	e8 fb 0b 00 00       	callq  401f9d <read_line>
  4013a2:	48 89 c7             	mov    %rax,%rdi
  4013a5:	b8 00 00 00 00       	mov    $0x0,%eax
  4013aa:	e8 ab 04 00 00       	callq  40185a <phase4>
  4013af:	b8 00 00 00 00       	mov    $0x0,%eax
  4013b4:	e8 19 0f 00 00       	callq  4022d2 <phase_defused>
  4013b9:	ba 05 00 00 00       	mov    $0x5,%edx
  4013be:	be f9 39 40 00       	mov    $0x4039f9,%esi
  4013c3:	bf 01 00 00 00       	mov    $0x1,%edi
  4013c8:	b8 00 00 00 00       	mov    $0x0,%eax
  4013cd:	e8 ce fb ff ff       	callq  400fa0 <__printf_chk@plt>
  4013d2:	48 8b 3d e7 4d 20 00 	mov    0x204de7(%rip),%rdi        # 6061c0 <stdout@@GLIBC_2.2.5>
  4013d9:	e8 92 fb ff ff       	callq  400f70 <fflush@plt>
  4013de:	b8 00 00 00 00       	mov    $0x0,%eax
  4013e3:	e8 b5 0b 00 00       	callq  401f9d <read_line>
  4013e8:	48 89 c7             	mov    %rax,%rdi
  4013eb:	b8 00 00 00 00       	mov    $0x0,%eax
  4013f0:	e8 39 06 00 00       	callq  401a2e <phase5>
  4013f5:	b8 00 00 00 00       	mov    $0x0,%eax
  4013fa:	e8 d3 0e 00 00       	callq  4022d2 <phase_defused>
  4013ff:	ba 06 00 00 00       	mov    $0x6,%edx
  401404:	be f9 39 40 00       	mov    $0x4039f9,%esi
  401409:	bf 01 00 00 00       	mov    $0x1,%edi
  40140e:	b8 00 00 00 00       	mov    $0x0,%eax
  401413:	e8 88 fb ff ff       	callq  400fa0 <__printf_chk@plt>
  401418:	48 8b 3d a1 4d 20 00 	mov    0x204da1(%rip),%rdi        # 6061c0 <stdout@@GLIBC_2.2.5>
  40141f:	e8 4c fb ff ff       	callq  400f70 <fflush@plt>
  401424:	b8 00 00 00 00       	mov    $0x0,%eax
  401429:	e8 6f 0b 00 00       	callq  401f9d <read_line>
  40142e:	48 89 c7             	mov    %rax,%rdi
  401431:	b8 00 00 00 00       	mov    $0x0,%eax
  401436:	e8 eb 06 00 00       	callq  401b26 <phase6>
  40143b:	b8 00 00 00 00       	mov    $0x0,%eax
  401440:	e8 8d 0e 00 00       	callq  4022d2 <phase_defused>
  401445:	b8 00 00 00 00       	mov    $0x0,%eax
  40144a:	48 83 c4 08          	add    $0x8,%rsp
  40144e:	5b                   	pop    %rbx
  40144f:	5d                   	pop    %rbp
  401450:	c3                   	retq   

0000000000401451 <string_length>:
  401451:	b8 00 00 00 00       	mov    $0x0,%eax
  401456:	eb 07                	jmp    40145f <string_length+0xe>
  401458:	48 83 c7 01          	add    $0x1,%rdi
  40145c:	83 c0 01             	add    $0x1,%eax
  40145f:	80 3f 00             	cmpb   $0x0,(%rdi)
  401462:	75 f4                	jne    401458 <string_length+0x7>
  401464:	f3 c3                	repz retq 

0000000000401466 <strings_not_equal>:
  401466:	41 54                	push   %r12
  401468:	55                   	push   %rbp
  401469:	53                   	push   %rbx
  40146a:	48 89 fb             	mov    %rdi,%rbx
  40146d:	48 89 f5             	mov    %rsi,%rbp
  401470:	e8 dc ff ff ff       	callq  401451 <string_length>
  401475:	41 89 c4             	mov    %eax,%r12d
  401478:	48 89 ef             	mov    %rbp,%rdi
  40147b:	e8 d1 ff ff ff       	callq  401451 <string_length>
  401480:	41 39 c4             	cmp    %eax,%r12d
  401483:	75 1d                	jne    4014a2 <strings_not_equal+0x3c>
  401485:	eb 0d                	jmp    401494 <strings_not_equal+0x2e>
  401487:	3a 45 00             	cmp    0x0(%rbp),%al
  40148a:	75 1d                	jne    4014a9 <strings_not_equal+0x43>
  40148c:	48 83 c3 01          	add    $0x1,%rbx
  401490:	48 83 c5 01          	add    $0x1,%rbp
  401494:	0f b6 03             	movzbl (%rbx),%eax
  401497:	84 c0                	test   %al,%al
  401499:	75 ec                	jne    401487 <strings_not_equal+0x21>
  40149b:	b8 00 00 00 00       	mov    $0x0,%eax
  4014a0:	eb 0c                	jmp    4014ae <strings_not_equal+0x48>
  4014a2:	b8 01 00 00 00       	mov    $0x1,%eax
  4014a7:	eb 05                	jmp    4014ae <strings_not_equal+0x48>
  4014a9:	b8 01 00 00 00       	mov    $0x1,%eax
  4014ae:	5b                   	pop    %rbx
  4014af:	5d                   	pop    %rbp
  4014b0:	41 5c                	pop    %r12
  4014b2:	c3                   	retq   

00000000004014b3 <initialize_phase1>:
  4014b3:	48 83 ec 08          	sub    $0x8,%rsp
  4014b7:	0f be 0d 82 57 20 00 	movsbl 0x205782(%rip),%ecx        # 606c40 <secret>
  4014be:	ba 89 88 88 88       	mov    $0x88888889,%edx
  4014c3:	89 c8                	mov    %ecx,%eax
  4014c5:	f7 e2                	mul    %edx
  4014c7:	c1 ea 04             	shr    $0x4,%edx
  4014ca:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
  4014cd:	c1 e2 05             	shl    $0x5,%edx
  4014d0:	29 c2                	sub    %eax,%edx
  4014d2:	29 d1                	sub    %edx,%ecx
  4014d4:	48 8b 34 cd 00 41 40 	mov    0x404100(,%rcx,8),%rsi
  4014db:	00 
  4014dc:	ba 00 01 00 00       	mov    $0x100,%edx
  4014e1:	bf 00 62 60 00       	mov    $0x606200,%edi
  4014e6:	e8 a5 fa ff ff       	callq  400f90 <__strcpy_chk@plt>
  4014eb:	48 83 c4 08          	add    $0x8,%rsp
  4014ef:	c3                   	retq   

00000000004014f0 <phase1>:
  4014f0:	48 83 ec 08          	sub    $0x8,%rsp
  4014f4:	be 00 62 60 00       	mov    $0x606200,%esi
  4014f9:	e8 68 ff ff ff       	callq  401466 <strings_not_equal>
  4014fe:	85 c0                	test   %eax,%eax
  401500:	74 0a                	je     40150c <phase1+0x1c>
  401502:	b8 00 00 00 00       	mov    $0x0,%eax
  401507:	e8 57 0c 00 00       	callq  402163 <explode_bomb>
  40150c:	48 83 c4 08          	add    $0x8,%rsp
  401510:	c3                   	retq   

0000000000401511 <initialize_phase2>:
  401511:	0f be 35 50 57 20 00 	movsbl 0x205750(%rip),%esi        # 606c68 <secret+0x28>
  401518:	b9 89 88 88 88       	mov    $0x88888889,%ecx
  40151d:	89 f0                	mov    %esi,%eax
  40151f:	f7 e1                	mul    %ecx
  401521:	c1 ea 03             	shr    $0x3,%edx
  401524:	89 d0                	mov    %edx,%eax
  401526:	c1 e0 04             	shl    $0x4,%eax
  401529:	29 d0                	sub    %edx,%eax
  40152b:	29 c6                	sub    %eax,%esi
  40152d:	89 f2                	mov    %esi,%edx
  40152f:	83 c2 01             	add    $0x1,%edx
  401532:	89 15 c8 4d 20 00    	mov    %edx,0x204dc8(%rip)        # 606300 <phase2_data>
  401538:	0f be 35 2a 57 20 00 	movsbl 0x20572a(%rip),%esi        # 606c69 <secret+0x29>
  40153f:	89 f0                	mov    %esi,%eax
  401541:	f7 e1                	mul    %ecx
  401543:	c1 ea 03             	shr    $0x3,%edx
  401546:	89 d0                	mov    %edx,%eax
  401548:	c1 e0 04             	shl    $0x4,%eax
  40154b:	29 d0                	sub    %edx,%eax
  40154d:	29 c6                	sub    %eax,%esi
  40154f:	89 f2                	mov    %esi,%edx
  401551:	83 c2 02             	add    $0x2,%edx
  401554:	89 15 aa 4d 20 00    	mov    %edx,0x204daa(%rip)        # 606304 <phase2_data+0x4>
  40155a:	c3                   	retq   

000000000040155b <phase2>:
  40155b:	53                   	push   %rbx
  40155c:	48 83 ec 20          	sub    $0x20,%rsp
  401560:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401567:	00 00 
  401569:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40156e:	31 c0                	xor    %eax,%eax
  401570:	48 89 e6             	mov    %rsp,%rsi
  401573:	e8 4c 08 00 00       	callq  401dc4 <read_six_numbers>
  401578:	bb 00 00 00 00       	mov    $0x0,%ebx
  40157d:	eb 1c                	jmp    40159b <phase2+0x40>
  40157f:	48 63 c3             	movslq %ebx,%rax
  401582:	8b 34 85 00 63 60 00 	mov    0x606300(,%rax,4),%esi
  401589:	39 34 84             	cmp    %esi,(%rsp,%rax,4)
  40158c:	74 0a                	je     401598 <phase2+0x3d>
  40158e:	b8 00 00 00 00       	mov    $0x0,%eax
  401593:	e8 cb 0b 00 00       	callq  402163 <explode_bomb>
  401598:	83 c3 01             	add    $0x1,%ebx
  40159b:	83 fb 01             	cmp    $0x1,%ebx
  40159e:	7e df                	jle    40157f <phase2+0x24>
  4015a0:	bb 02 00 00 00       	mov    $0x2,%ebx
  4015a5:	eb 26                	jmp    4015cd <phase2+0x72>
  4015a7:	48 63 d3             	movslq %ebx,%rdx
  4015aa:	8d 4b ff             	lea    -0x1(%rbx),%ecx
  4015ad:	48 63 c9             	movslq %ecx,%rcx
  4015b0:	8d 43 fe             	lea    -0x2(%rbx),%eax
  4015b3:	48 98                	cltq   
  4015b5:	8b 04 84             	mov    (%rsp,%rax,4),%eax
  4015b8:	03 04 8c             	add    (%rsp,%rcx,4),%eax
  4015bb:	39 04 94             	cmp    %eax,(%rsp,%rdx,4)
  4015be:	74 0a                	je     4015ca <phase2+0x6f>
  4015c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4015c5:	e8 99 0b 00 00       	callq  402163 <explode_bomb>
  4015ca:	83 c3 01             	add    $0x1,%ebx
  4015cd:	83 fb 05             	cmp    $0x5,%ebx
  4015d0:	7e d5                	jle    4015a7 <phase2+0x4c>
  4015d2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4015d7:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4015de:	00 00 
  4015e0:	74 05                	je     4015e7 <phase2+0x8c>
  4015e2:	e8 b9 f8 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  4015e7:	48 83 c4 20          	add    $0x20,%rsp
  4015eb:	5b                   	pop    %rbx
  4015ec:	c3                   	retq   

00000000004015ed <initialize_phase3>:
  4015ed:	f3 c3                	repz retq 

00000000004015ef <getnumber>:
  4015ef:	ba 89 88 88 88       	mov    $0x88888889,%edx
  4015f4:	89 f8                	mov    %edi,%eax
  4015f6:	f7 ea                	imul   %edx
  4015f8:	01 fa                	add    %edi,%edx
  4015fa:	c1 fa 03             	sar    $0x3,%edx
  4015fd:	89 f8                	mov    %edi,%eax
  4015ff:	c1 f8 1f             	sar    $0x1f,%eax
  401602:	29 c2                	sub    %eax,%edx
  401604:	89 d0                	mov    %edx,%eax
  401606:	c1 e0 04             	shl    $0x4,%eax
  401609:	29 d0                	sub    %edx,%eax
  40160b:	89 fa                	mov    %edi,%edx
  40160d:	29 c2                	sub    %eax,%edx
  40160f:	8d 42 50             	lea    0x50(%rdx),%eax
  401612:	48 98                	cltq   
  401614:	0f be 80 40 6c 60 00 	movsbl 0x606c40(%rax),%eax
  40161b:	eb 15                	jmp    401632 <getnumber+0x43>
  40161d:	31 f8                	xor    %edi,%eax
  40161f:	8d 4a 50             	lea    0x50(%rdx),%ecx
  401622:	48 63 c9             	movslq %ecx,%rcx
  401625:	0f b6 89 40 6c 60 00 	movzbl 0x606c40(%rcx),%ecx
  40162c:	0f af c1             	imul   %ecx,%eax
  40162f:	83 c2 01             	add    $0x1,%edx
  401632:	83 fa 0f             	cmp    $0xf,%edx
  401635:	7e e6                	jle    40161d <getnumber+0x2e>
  401637:	f3 c3                	repz retq 

0000000000401639 <phase3>:
  401639:	53                   	push   %rbx
  40163a:	48 83 ec 10          	sub    $0x10,%rsp
  40163e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401645:	00 00 
  401647:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40164c:	31 c0                	xor    %eax,%eax
  40164e:	c6 44 24 03 41       	movb   $0x41,0x3(%rsp)
  401653:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
  40165a:	00 
  40165b:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
  401660:	48 8d 54 24 03       	lea    0x3(%rsp),%rdx
  401665:	be f0 41 40 00       	mov    $0x4041f0,%esi
  40166a:	e8 11 f9 ff ff       	callq  400f80 <__isoc99_sscanf@plt>
  40166f:	89 c6                	mov    %eax,%esi
  401671:	0f be 4c 24 03       	movsbl 0x3(%rsp),%ecx
  401676:	83 e9 41             	sub    $0x41,%ecx
  401679:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
  40167e:	89 c8                	mov    %ecx,%eax
  401680:	f7 ea                	imul   %edx
  401682:	d1 fa                	sar    %edx
  401684:	89 c8                	mov    %ecx,%eax
  401686:	c1 f8 1f             	sar    $0x1f,%eax
  401689:	89 d3                	mov    %edx,%ebx
  40168b:	29 c3                	sub    %eax,%ebx
  40168d:	8d 04 db             	lea    (%rbx,%rbx,8),%eax
  401690:	29 c1                	sub    %eax,%ecx
  401692:	89 cb                	mov    %ecx,%ebx
  401694:	83 fe 01             	cmp    $0x1,%esi
  401697:	77 0a                	ja     4016a3 <phase3+0x6a>
  401699:	b8 00 00 00 00       	mov    $0x0,%eax
  40169e:	e8 c0 0a 00 00       	callq  402163 <explode_bomb>
  4016a3:	83 fb 08             	cmp    $0x8,%ebx
  4016a6:	77 75                	ja     40171d <phase3+0xe4>
  4016a8:	89 db                	mov    %ebx,%ebx
  4016aa:	ff 24 dd f8 41 40 00 	jmpq   *0x4041f8(,%rbx,8)
  4016b1:	bf 06 00 00 00       	mov    $0x6,%edi
  4016b6:	e8 34 ff ff ff       	callq  4015ef <getnumber>
  4016bb:	eb 6f                	jmp    40172c <phase3+0xf3>
  4016bd:	bf 0e 00 00 00       	mov    $0xe,%edi
  4016c2:	e8 28 ff ff ff       	callq  4015ef <getnumber>
  4016c7:	eb 63                	jmp    40172c <phase3+0xf3>
  4016c9:	bf 01 00 00 00       	mov    $0x1,%edi
  4016ce:	e8 1c ff ff ff       	callq  4015ef <getnumber>
  4016d3:	eb 57                	jmp    40172c <phase3+0xf3>
  4016d5:	bf 0b 00 00 00       	mov    $0xb,%edi
  4016da:	e8 10 ff ff ff       	callq  4015ef <getnumber>
  4016df:	eb 4b                	jmp    40172c <phase3+0xf3>
  4016e1:	bf 04 00 00 00       	mov    $0x4,%edi
  4016e6:	e8 04 ff ff ff       	callq  4015ef <getnumber>
  4016eb:	eb 3f                	jmp    40172c <phase3+0xf3>
  4016ed:	bf 09 00 00 00       	mov    $0x9,%edi
  4016f2:	e8 f8 fe ff ff       	callq  4015ef <getnumber>
  4016f7:	eb 33                	jmp    40172c <phase3+0xf3>
  4016f9:	bf 03 00 00 00       	mov    $0x3,%edi
  4016fe:	e8 ec fe ff ff       	callq  4015ef <getnumber>
  401703:	eb 27                	jmp    40172c <phase3+0xf3>
  401705:	bf 02 00 00 00       	mov    $0x2,%edi
  40170a:	e8 e0 fe ff ff       	callq  4015ef <getnumber>
  40170f:	eb 1b                	jmp    40172c <phase3+0xf3>
  401711:	bf 07 00 00 00       	mov    $0x7,%edi
  401716:	e8 d4 fe ff ff       	callq  4015ef <getnumber>
  40171b:	eb 0f                	jmp    40172c <phase3+0xf3>
  40171d:	b8 00 00 00 00       	mov    $0x0,%eax
  401722:	e8 3c 0a 00 00       	callq  402163 <explode_bomb>
  401727:	b8 00 00 00 00       	mov    $0x0,%eax
  40172c:	33 44 24 04          	xor    0x4(%rsp),%eax
  401730:	a9 ff 0f 00 00       	test   $0xfff,%eax
  401735:	74 0a                	je     401741 <phase3+0x108>
  401737:	b8 00 00 00 00       	mov    $0x0,%eax
  40173c:	e8 22 0a 00 00       	callq  402163 <explode_bomb>
  401741:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401746:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40174d:	00 00 
  40174f:	74 05                	je     401756 <phase3+0x11d>
  401751:	e8 4a f7 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  401756:	48 83 c4 10          	add    $0x10,%rsp
  40175a:	5b                   	pop    %rbx
  40175b:	c3                   	retq   

000000000040175c <Trawl>:
  40175c:	48 85 ff             	test   %rdi,%rdi
  40175f:	74 41                	je     4017a2 <Trawl+0x46>
  401761:	83 fe 01             	cmp    $0x1,%esi
  401764:	75 03                	jne    401769 <Trawl+0xd>
  401766:	8b 07                	mov    (%rdi),%eax
  401768:	c3                   	retq   
  401769:	48 83 ec 08          	sub    $0x8,%rsp
  40176d:	89 f2                	mov    %esi,%edx
  40176f:	c1 ea 1f             	shr    $0x1f,%edx
  401772:	8d 04 16             	lea    (%rsi,%rdx,1),%eax
  401775:	83 e0 01             	and    $0x1,%eax
  401778:	29 d0                	sub    %edx,%eax
  40177a:	83 f8 01             	cmp    $0x1,%eax
  40177d:	75 0f                	jne    40178e <Trawl+0x32>
  40177f:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  401783:	01 d6                	add    %edx,%esi
  401785:	d1 fe                	sar    %esi
  401787:	e8 d0 ff ff ff       	callq  40175c <Trawl>
  40178c:	eb 1a                	jmp    4017a8 <Trawl+0x4c>
  40178e:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  401792:	89 f0                	mov    %esi,%eax
  401794:	c1 e8 1f             	shr    $0x1f,%eax
  401797:	01 c6                	add    %eax,%esi
  401799:	d1 fe                	sar    %esi
  40179b:	e8 bc ff ff ff       	callq  40175c <Trawl>
  4017a0:	eb 06                	jmp    4017a8 <Trawl+0x4c>
  4017a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4017a7:	c3                   	retq   
  4017a8:	48 83 c4 08          	add    $0x8,%rsp
  4017ac:	c3                   	retq   

00000000004017ad <initialize_phase4>:
  4017ad:	ba 01 00 00 00       	mov    $0x1,%edx
  4017b2:	e9 98 00 00 00       	jmpq   40184f <initialize_phase4+0xa2>
  4017b7:	8d 42 78             	lea    0x78(%rdx),%eax
  4017ba:	48 98                	cltq   
  4017bc:	48 63 ca             	movslq %edx,%rcx
  4017bf:	48 8d 34 49          	lea    (%rcx,%rcx,2),%rsi
  4017c3:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
  4017ca:	00 
  4017cb:	0f be 80 40 6c 60 00 	movsbl 0x606c40(%rax),%eax
  4017d2:	89 81 20 63 60 00    	mov    %eax,0x606320(%rcx)
  4017d8:	8d 04 12             	lea    (%rdx,%rdx,1),%eax
  4017db:	83 f8 27             	cmp    $0x27,%eax
  4017de:	7f 18                	jg     4017f8 <initialize_phase4+0x4b>
  4017e0:	48 63 c8             	movslq %eax,%rcx
  4017e3:	48 8d 34 49          	lea    (%rcx,%rcx,2),%rsi
  4017e7:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
  4017ee:	00 
  4017ef:	48 81 c1 20 63 60 00 	add    $0x606320,%rcx
  4017f6:	eb 05                	jmp    4017fd <initialize_phase4+0x50>
  4017f8:	b9 00 00 00 00       	mov    $0x0,%ecx
  4017fd:	48 63 f2             	movslq %edx,%rsi
  401800:	48 8d 3c 76          	lea    (%rsi,%rsi,2),%rdi
  401804:	48 8d 34 fd 00 00 00 	lea    0x0(,%rdi,8),%rsi
  40180b:	00 
  40180c:	48 89 8e 28 63 60 00 	mov    %rcx,0x606328(%rsi)
  401813:	83 c0 01             	add    $0x1,%eax
  401816:	83 f8 27             	cmp    $0x27,%eax
  401819:	7f 16                	jg     401831 <initialize_phase4+0x84>
  40181b:	48 98                	cltq   
  40181d:	48 8d 0c 40          	lea    (%rax,%rax,2),%rcx
  401821:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
  401828:	00 
  401829:	48 05 20 63 60 00    	add    $0x606320,%rax
  40182f:	eb 05                	jmp    401836 <initialize_phase4+0x89>
  401831:	b8 00 00 00 00       	mov    $0x0,%eax
  401836:	48 63 ca             	movslq %edx,%rcx
  401839:	48 8d 34 49          	lea    (%rcx,%rcx,2),%rsi
  40183d:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
  401844:	00 
  401845:	48 89 81 30 63 60 00 	mov    %rax,0x606330(%rcx)
  40184c:	83 c2 01             	add    $0x1,%edx
  40184f:	83 fa 27             	cmp    $0x27,%edx
  401852:	0f 8e 5f ff ff ff    	jle    4017b7 <initialize_phase4+0xa>
  401858:	f3 c3                	repz retq 

000000000040185a <phase4>:
  40185a:	48 83 ec 18          	sub    $0x18,%rsp
  40185e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401865:	00 00 
  401867:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40186c:	31 c0                	xor    %eax,%eax
  40186e:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
  401873:	48 89 e2             	mov    %rsp,%rdx
  401876:	be 40 42 40 00       	mov    $0x404240,%esi
  40187b:	e8 00 f7 ff ff       	callq  400f80 <__isoc99_sscanf@plt>
  401880:	83 f8 01             	cmp    $0x1,%eax
  401883:	7f 0a                	jg     40188f <phase4+0x35>
  401885:	b8 00 00 00 00       	mov    $0x0,%eax
  40188a:	e8 d4 08 00 00       	callq  402163 <explode_bomb>
  40188f:	f6 05 22 54 20 00 01 	testb  $0x1,0x205422(%rip)        # 606cb8 <secret+0x78>
  401896:	74 07                	je     40189f <phase4+0x45>
  401898:	b8 04 00 00 00       	mov    $0x4,%eax
  40189d:	eb 05                	jmp    4018a4 <phase4+0x4a>
  40189f:	b8 08 00 00 00       	mov    $0x8,%eax
  4018a4:	3b 04 24             	cmp    (%rsp),%eax
  4018a7:	7e 0a                	jle    4018b3 <phase4+0x59>
  4018a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4018ae:	e8 b0 08 00 00       	callq  402163 <explode_bomb>
  4018b3:	83 7c 24 04 ff       	cmpl   $0xffffffff,0x4(%rsp)
  4018b8:	75 0a                	jne    4018c4 <phase4+0x6a>
  4018ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4018bf:	e8 9f 08 00 00       	callq  402163 <explode_bomb>
  4018c4:	8b 34 24             	mov    (%rsp),%esi
  4018c7:	bf 38 63 60 00       	mov    $0x606338,%edi
  4018cc:	e8 8b fe ff ff       	callq  40175c <Trawl>
  4018d1:	3b 44 24 04          	cmp    0x4(%rsp),%eax
  4018d5:	74 0a                	je     4018e1 <phase4+0x87>
  4018d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4018dc:	e8 82 08 00 00       	callq  402163 <explode_bomb>
  4018e1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4018e6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4018ed:	00 00 
  4018ef:	74 05                	je     4018f6 <phase4+0x9c>
  4018f1:	e8 aa f5 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  4018f6:	48 83 c4 18          	add    $0x18,%rsp
  4018fa:	c3                   	retq   

00000000004018fb <initialize_phase5>:
  4018fb:	48 83 ec 58          	sub    $0x58,%rsp
  4018ff:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401906:	00 00 
  401908:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  40190d:	31 c0                	xor    %eax,%eax
  40190f:	c7 04 24 0a 00 00 00 	movl   $0xa,(%rsp)
  401916:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%rsp)
  40191d:	00 
  40191e:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%rsp)
  401925:	00 
  401926:	c7 44 24 0c 07 00 00 	movl   $0x7,0xc(%rsp)
  40192d:	00 
  40192e:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%rsp)
  401935:	00 
  401936:	c7 44 24 14 0c 00 00 	movl   $0xc,0x14(%rsp)
  40193d:	00 
  40193e:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%rsp)
  401945:	00 
  401946:	c7 44 24 1c 0b 00 00 	movl   $0xb,0x1c(%rsp)
  40194d:	00 
  40194e:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%rsp)
  401955:	00 
  401956:	c7 44 24 24 04 00 00 	movl   $0x4,0x24(%rsp)
  40195d:	00 
  40195e:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
  401965:	00 
  401966:	c7 44 24 2c 0d 00 00 	movl   $0xd,0x2c(%rsp)
  40196d:	00 
  40196e:	c7 44 24 30 03 00 00 	movl   $0x3,0x30(%rsp)
  401975:	00 
  401976:	c7 44 24 34 09 00 00 	movl   $0x9,0x34(%rsp)
  40197d:	00 
  40197e:	c7 44 24 38 06 00 00 	movl   $0x6,0x38(%rsp)
  401985:	00 
  401986:	c7 44 24 3c 05 00 00 	movl   $0x5,0x3c(%rsp)
  40198d:	00 
  40198e:	0f be 0d 5c 53 20 00 	movsbl 0x20535c(%rip),%ecx        # 606cf1 <secret+0xb1>
  401995:	ba 89 88 88 88       	mov    $0x88888889,%edx
  40199a:	89 c8                	mov    %ecx,%eax
  40199c:	f7 e2                	mul    %edx
  40199e:	c1 ea 03             	shr    $0x3,%edx
  4019a1:	89 d0                	mov    %edx,%eax
  4019a3:	c1 e0 04             	shl    $0x4,%eax
  4019a6:	29 d0                	sub    %edx,%eax
  4019a8:	29 c1                	sub    %eax,%ecx
  4019aa:	89 ca                	mov    %ecx,%edx
  4019ac:	83 c2 01             	add    $0x1,%edx
  4019af:	89 15 2b 4d 20 00    	mov    %edx,0x204d2b(%rip)        # 6066e0 <phase5_data>
  4019b5:	48 8b 04 24          	mov    (%rsp),%rax
  4019b9:	48 89 05 24 4d 20 00 	mov    %rax,0x204d24(%rip)        # 6066e4 <phase5_data+0x4>
  4019c0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4019c5:	48 89 05 20 4d 20 00 	mov    %rax,0x204d20(%rip)        # 6066ec <phase5_data+0xc>
  4019cc:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  4019d1:	48 89 05 1c 4d 20 00 	mov    %rax,0x204d1c(%rip)        # 6066f4 <phase5_data+0x14>
  4019d8:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4019dd:	48 89 05 18 4d 20 00 	mov    %rax,0x204d18(%rip)        # 6066fc <phase5_data+0x1c>
  4019e4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  4019e9:	48 89 05 14 4d 20 00 	mov    %rax,0x204d14(%rip)        # 606704 <phase5_data+0x24>
  4019f0:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  4019f5:	48 89 05 10 4d 20 00 	mov    %rax,0x204d10(%rip)        # 60670c <phase5_data+0x2c>
  4019fc:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  401a01:	48 89 05 0c 4d 20 00 	mov    %rax,0x204d0c(%rip)        # 606714 <phase5_data+0x34>
  401a08:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  401a0d:	48 89 05 08 4d 20 00 	mov    %rax,0x204d08(%rip)        # 60671c <phase5_data+0x3c>
  401a14:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  401a19:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401a20:	00 00 
  401a22:	74 05                	je     401a29 <initialize_phase5+0x12e>
  401a24:	e8 77 f4 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  401a29:	48 83 c4 58          	add    $0x58,%rsp
  401a2d:	c3                   	retq   

0000000000401a2e <phase5>:
  401a2e:	48 83 ec 18          	sub    $0x18,%rsp
  401a32:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401a39:	00 00 
  401a3b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401a40:	31 c0                	xor    %eax,%eax
  401a42:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
  401a47:	48 89 e2             	mov    %rsp,%rdx
  401a4a:	be 40 42 40 00       	mov    $0x404240,%esi
  401a4f:	e8 2c f5 ff ff       	callq  400f80 <__isoc99_sscanf@plt>
  401a54:	83 f8 01             	cmp    $0x1,%eax
  401a57:	7f 0a                	jg     401a63 <phase5+0x35>
  401a59:	b8 00 00 00 00       	mov    $0x0,%eax
  401a5e:	e8 00 07 00 00       	callq  402163 <explode_bomb>
  401a63:	8b 04 24             	mov    (%rsp),%eax
  401a66:	83 e0 0f             	and    $0xf,%eax
  401a69:	89 04 24             	mov    %eax,(%rsp)
  401a6c:	b9 00 00 00 00       	mov    $0x0,%ecx
  401a71:	ba 00 00 00 00       	mov    $0x0,%edx
  401a76:	eb 11                	jmp    401a89 <phase5+0x5b>
  401a78:	83 c2 01             	add    $0x1,%edx
  401a7b:	48 98                	cltq   
  401a7d:	8b 04 85 e4 66 60 00 	mov    0x6066e4(,%rax,4),%eax
  401a84:	89 04 24             	mov    %eax,(%rsp)
  401a87:	01 c1                	add    %eax,%ecx
  401a89:	8b 04 24             	mov    (%rsp),%eax
  401a8c:	83 f8 0f             	cmp    $0xf,%eax
  401a8f:	75 e7                	jne    401a78 <phase5+0x4a>
  401a91:	3b 15 49 4c 20 00    	cmp    0x204c49(%rip),%edx        # 6066e0 <phase5_data>
  401a97:	75 06                	jne    401a9f <phase5+0x71>
  401a99:	3b 4c 24 04          	cmp    0x4(%rsp),%ecx
  401a9d:	74 0a                	je     401aa9 <phase5+0x7b>
  401a9f:	b8 00 00 00 00       	mov    $0x0,%eax
  401aa4:	e8 ba 06 00 00       	callq  402163 <explode_bomb>
  401aa9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401aae:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401ab5:	00 00 
  401ab7:	74 05                	je     401abe <phase5+0x90>
  401ab9:	e8 e2 f3 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  401abe:	48 83 c4 18          	add    $0x18,%rsp
  401ac2:	c3                   	retq   

0000000000401ac3 <initialize_phase6>:
  401ac3:	b8 00 00 00 00       	mov    $0x0,%eax
  401ac8:	eb 55                	jmp    401b1f <initialize_phase6+0x5c>
  401aca:	8d 88 c8 00 00 00    	lea    0xc8(%rax),%ecx
  401ad0:	48 63 c9             	movslq %ecx,%rcx
  401ad3:	48 63 d0             	movslq %eax,%rdx
  401ad6:	48 c1 e2 04          	shl    $0x4,%rdx
  401ada:	0f be 89 40 6c 60 00 	movsbl 0x606c40(%rcx),%ecx
  401ae1:	81 e1 ff ff 00 00    	and    $0xffff,%ecx
  401ae7:	89 8a 40 67 60 00    	mov    %ecx,0x606740(%rdx)
  401aed:	8d 48 01             	lea    0x1(%rax),%ecx
  401af0:	89 8a 44 67 60 00    	mov    %ecx,0x606744(%rdx)
  401af6:	83 f8 04             	cmp    $0x4,%eax
  401af9:	7f 10                	jg     401b0b <initialize_phase6+0x48>
  401afb:	48 63 d1             	movslq %ecx,%rdx
  401afe:	48 c1 e2 04          	shl    $0x4,%rdx
  401b02:	48 81 c2 40 67 60 00 	add    $0x606740,%rdx
  401b09:	eb 05                	jmp    401b10 <initialize_phase6+0x4d>
  401b0b:	ba 00 00 00 00       	mov    $0x0,%edx
  401b10:	48 98                	cltq   
  401b12:	48 c1 e0 04          	shl    $0x4,%rax
  401b16:	48 89 90 48 67 60 00 	mov    %rdx,0x606748(%rax)
  401b1d:	89 c8                	mov    %ecx,%eax
  401b1f:	83 f8 05             	cmp    $0x5,%eax
  401b22:	7e a6                	jle    401aca <initialize_phase6+0x7>
  401b24:	f3 c3                	repz retq 

0000000000401b26 <phase6>:
  401b26:	41 54                	push   %r12
  401b28:	55                   	push   %rbp
  401b29:	53                   	push   %rbx
  401b2a:	48 83 ec 60          	sub    $0x60,%rsp
  401b2e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401b35:	00 00 
  401b37:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  401b3c:	31 c0                	xor    %eax,%eax
  401b3e:	48 89 e6             	mov    %rsp,%rsi
  401b41:	e8 7e 02 00 00       	callq  401dc4 <read_six_numbers>
  401b46:	bd 00 00 00 00       	mov    $0x0,%ebp
  401b4b:	eb 44                	jmp    401b91 <phase6+0x6b>
  401b4d:	48 63 c5             	movslq %ebp,%rax
  401b50:	8b 04 84             	mov    (%rsp,%rax,4),%eax
  401b53:	83 e8 01             	sub    $0x1,%eax
  401b56:	83 f8 05             	cmp    $0x5,%eax
  401b59:	76 0a                	jbe    401b65 <phase6+0x3f>
  401b5b:	b8 00 00 00 00       	mov    $0x0,%eax
  401b60:	e8 fe 05 00 00       	callq  402163 <explode_bomb>
  401b65:	44 8d 65 01          	lea    0x1(%rbp),%r12d
  401b69:	44 89 e3             	mov    %r12d,%ebx
  401b6c:	eb 1b                	jmp    401b89 <phase6+0x63>
  401b6e:	48 63 c5             	movslq %ebp,%rax
  401b71:	48 63 d3             	movslq %ebx,%rdx
  401b74:	8b 3c 94             	mov    (%rsp,%rdx,4),%edi
  401b77:	39 3c 84             	cmp    %edi,(%rsp,%rax,4)
  401b7a:	75 0a                	jne    401b86 <phase6+0x60>
  401b7c:	b8 00 00 00 00       	mov    $0x0,%eax
  401b81:	e8 dd 05 00 00       	callq  402163 <explode_bomb>
  401b86:	83 c3 01             	add    $0x1,%ebx
  401b89:	83 fb 05             	cmp    $0x5,%ebx
  401b8c:	7e e0                	jle    401b6e <phase6+0x48>
  401b8e:	44 89 e5             	mov    %r12d,%ebp
  401b91:	83 fd 05             	cmp    $0x5,%ebp
  401b94:	7e b7                	jle    401b4d <phase6+0x27>
  401b96:	be 00 00 00 00       	mov    $0x0,%esi
  401b9b:	eb 23                	jmp    401bc0 <phase6+0x9a>
  401b9d:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  401ba1:	83 c0 01             	add    $0x1,%eax
  401ba4:	eb 0a                	jmp    401bb0 <phase6+0x8a>
  401ba6:	b8 01 00 00 00       	mov    $0x1,%eax
  401bab:	ba 40 67 60 00       	mov    $0x606740,%edx
  401bb0:	48 63 ce             	movslq %esi,%rcx
  401bb3:	3b 04 8c             	cmp    (%rsp,%rcx,4),%eax
  401bb6:	7c e5                	jl     401b9d <phase6+0x77>
  401bb8:	48 89 54 cc 20       	mov    %rdx,0x20(%rsp,%rcx,8)
  401bbd:	83 c6 01             	add    $0x1,%esi
  401bc0:	83 fe 05             	cmp    $0x5,%esi
  401bc3:	7e e1                	jle    401ba6 <phase6+0x80>
  401bc5:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  401bca:	48 89 d9             	mov    %rbx,%rcx
  401bcd:	b8 01 00 00 00       	mov    $0x1,%eax
  401bd2:	eb 12                	jmp    401be6 <phase6+0xc0>
  401bd4:	48 63 d0             	movslq %eax,%rdx
  401bd7:	48 8b 54 d4 20       	mov    0x20(%rsp,%rdx,8),%rdx
  401bdc:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  401be0:	83 c0 01             	add    $0x1,%eax
  401be3:	48 89 d1             	mov    %rdx,%rcx
  401be6:	83 f8 05             	cmp    $0x5,%eax
  401be9:	7e e9                	jle    401bd4 <phase6+0xae>
  401beb:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
  401bf2:	00 
  401bf3:	bd 00 00 00 00       	mov    $0x0,%ebp
  401bf8:	eb 1b                	jmp    401c15 <phase6+0xef>
  401bfa:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401bfe:	8b 00                	mov    (%rax),%eax
  401c00:	39 03                	cmp    %eax,(%rbx)
  401c02:	7e 0a                	jle    401c0e <phase6+0xe8>
  401c04:	b8 00 00 00 00       	mov    $0x0,%eax
  401c09:	e8 55 05 00 00       	callq  402163 <explode_bomb>
  401c0e:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  401c12:	83 c5 01             	add    $0x1,%ebp
  401c15:	83 fd 04             	cmp    $0x4,%ebp
  401c18:	7e e0                	jle    401bfa <phase6+0xd4>
  401c1a:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  401c1f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401c26:	00 00 
  401c28:	74 05                	je     401c2f <phase6+0x109>
  401c2a:	e8 71 f2 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  401c2f:	48 83 c4 60          	add    $0x60,%rsp
  401c33:	5b                   	pop    %rbx
  401c34:	5d                   	pop    %rbp
  401c35:	41 5c                	pop    %r12
  401c37:	c3                   	retq   

0000000000401c38 <initialize_phase7>:
  401c38:	0f be 0d f2 50 20 00 	movsbl 0x2050f2(%rip),%ecx        # 606d31 <secret+0xf1>
  401c3f:	ba 5b f0 8d 21       	mov    $0x218df05b,%edx
  401c44:	89 c8                	mov    %ecx,%eax
  401c46:	f7 e2                	mul    %edx
  401c48:	c1 ea 12             	shr    $0x12,%edx
  401c4b:	69 d2 7f 84 1e 00    	imul   $0x1e847f,%edx,%edx
  401c51:	29 d1                	sub    %edx,%ecx
  401c53:	89 ca                	mov    %ecx,%edx
  401c55:	81 ea 3f 42 0f 00    	sub    $0xf423f,%edx
  401c5b:	89 15 3f 4b 20 00    	mov    %edx,0x204b3f(%rip)        # 6067a0 <phase7_data>
  401c61:	c3                   	retq   

0000000000401c62 <phase7>:
  401c62:	53                   	push   %rbx
  401c63:	48 83 ec 20          	sub    $0x20,%rsp
  401c67:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401c6e:	00 00 
  401c70:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  401c75:	31 c0                	xor    %eax,%eax
  401c77:	ba 00 00 00 00       	mov    $0x0,%edx
  401c7c:	be 00 00 00 00       	mov    $0x0,%esi
  401c81:	e8 4a f3 ff ff       	callq  400fd0 <strtoul@plt>
  401c86:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401c8a:	89 c7                	mov    %eax,%edi
  401c8c:	81 e7 00 00 80 7f    	and    $0x7f800000,%edi
  401c92:	c1 ef 17             	shr    $0x17,%edi
  401c95:	89 c6                	mov    %eax,%esi
  401c97:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
  401c9d:	c1 f8 1f             	sar    $0x1f,%eax
  401ca0:	83 ff 7e             	cmp    $0x7e,%edi
  401ca3:	76 07                	jbe    401cac <phase7+0x4a>
  401ca5:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401caa:	eb 05                	jmp    401cb1 <phase7+0x4f>
  401cac:	ba 00 00 00 00       	mov    $0x0,%edx
  401cb1:	81 ce 00 00 80 00    	or     $0x800000,%esi
  401cb7:	b9 96 00 00 00       	mov    $0x96,%ecx
  401cbc:	29 f9                	sub    %edi,%ecx
  401cbe:	d3 ee                	shr    %cl,%esi
  401cc0:	21 f2                	and    %esi,%edx
  401cc2:	89 d3                	mov    %edx,%ebx
  401cc4:	f7 db                	neg    %ebx
  401cc6:	31 d3                	xor    %edx,%ebx
  401cc8:	21 d8                	and    %ebx,%eax
  401cca:	31 d0                	xor    %edx,%eax
  401ccc:	89 c3                	mov    %eax,%ebx
  401cce:	3b 05 cc 4a 20 00    	cmp    0x204acc(%rip),%eax        # 6067a0 <phase7_data>
  401cd4:	74 0a                	je     401ce0 <phase7+0x7e>
  401cd6:	b8 00 00 00 00       	mov    $0x0,%eax
  401cdb:	e8 83 04 00 00       	callq  402163 <explode_bomb>
  401ce0:	89 5c 24 0c          	mov    %ebx,0xc(%rsp)
  401ce4:	db 44 24 0c          	fildl  0xc(%rsp)
  401ce8:	d9 5c 24 14          	fstps  0x14(%rsp)
  401cec:	ba 04 00 00 00       	mov    $0x4,%edx
  401cf1:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  401cf6:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
  401cfb:	e8 20 f2 ff ff       	callq  400f20 <memcmp@plt>
  401d00:	85 c0                	test   %eax,%eax
  401d02:	74 0a                	je     401d0e <phase7+0xac>
  401d04:	b8 00 00 00 00       	mov    $0x0,%eax
  401d09:	e8 55 04 00 00       	callq  402163 <explode_bomb>
  401d0e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  401d13:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401d1a:	00 00 
  401d1c:	74 05                	je     401d23 <phase7+0xc1>
  401d1e:	e8 7d f1 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  401d23:	48 83 c4 20          	add    $0x20,%rsp
  401d27:	5b                   	pop    %rbx
  401d28:	c3                   	retq   

0000000000401d29 <sigint_handler>:
  401d29:	55                   	push   %rbp
  401d2a:	48 89 e5             	mov    %rsp,%rbp
  401d2d:	48 83 ec 20          	sub    $0x20,%rsp
  401d31:	89 7d ec             	mov    %edi,-0x14(%rbp)
  401d34:	bf 48 42 40 00       	mov    $0x404248,%edi
  401d39:	e8 12 f1 ff ff       	callq  400e50 <puts@plt>
  401d3e:	bf 03 00 00 00       	mov    $0x3,%edi
  401d43:	e8 18 f3 ff ff       	callq  401060 <sleep@plt>
  401d48:	48 8b 05 71 44 20 00 	mov    0x204471(%rip),%rax        # 6061c0 <stdout@@GLIBC_2.2.5>
  401d4f:	48 89 c7             	mov    %rax,%rdi
  401d52:	e8 19 f2 ff ff       	callq  400f70 <fflush@plt>
  401d57:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  401d5e:	eb 27                	jmp    401d87 <sigint_handler+0x5e>
  401d60:	bf 85 42 40 00       	mov    $0x404285,%edi
  401d65:	e8 e6 f0 ff ff       	callq  400e50 <puts@plt>
  401d6a:	bf 01 00 00 00       	mov    $0x1,%edi
  401d6f:	e8 ec f2 ff ff       	callq  401060 <sleep@plt>
  401d74:	48 8b 05 45 44 20 00 	mov    0x204445(%rip),%rax        # 6061c0 <stdout@@GLIBC_2.2.5>
  401d7b:	48 89 c7             	mov    %rax,%rdi
  401d7e:	e8 ed f1 ff ff       	callq  400f70 <fflush@plt>
  401d83:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  401d87:	e8 f4 f2 ff ff       	callq  401080 <rand@plt>
  401d8c:	89 c1                	mov    %eax,%ecx
  401d8e:	ba 56 55 55 55       	mov    $0x55555556,%edx
  401d93:	89 c8                	mov    %ecx,%eax
  401d95:	f7 ea                	imul   %edx
  401d97:	89 c8                	mov    %ecx,%eax
  401d99:	c1 f8 1f             	sar    $0x1f,%eax
  401d9c:	29 c2                	sub    %eax,%edx
  401d9e:	89 d0                	mov    %edx,%eax
  401da0:	01 c0                	add    %eax,%eax
  401da2:	01 d0                	add    %edx,%eax
  401da4:	29 c1                	sub    %eax,%ecx
  401da6:	89 ca                	mov    %ecx,%edx
  401da8:	8d 42 01             	lea    0x1(%rdx),%eax
  401dab:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  401dae:	7f b0                	jg     401d60 <sigint_handler+0x37>
  401db0:	bf 89 42 40 00       	mov    $0x404289,%edi
  401db5:	e8 96 f0 ff ff       	callq  400e50 <puts@plt>
  401dba:	bf 10 00 00 00       	mov    $0x10,%edi
  401dbf:	e8 3c f2 ff ff       	callq  401000 <exit@plt>

0000000000401dc4 <read_six_numbers>:
  401dc4:	55                   	push   %rbp
  401dc5:	48 89 e5             	mov    %rsp,%rbp
  401dc8:	48 83 ec 20          	sub    $0x20,%rsp
  401dcc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  401dd0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  401dd4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  401dd8:	48 8d 78 14          	lea    0x14(%rax),%rdi
  401ddc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  401de0:	48 8d 70 10          	lea    0x10(%rax),%rsi
  401de4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  401de8:	4c 8d 48 0c          	lea    0xc(%rax),%r9
  401dec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  401df0:	4c 8d 40 08          	lea    0x8(%rax),%r8
  401df4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  401df8:	48 8d 48 04          	lea    0x4(%rax),%rcx
  401dfc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  401e00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401e04:	57                   	push   %rdi
  401e05:	56                   	push   %rsi
  401e06:	be 9c 42 40 00       	mov    $0x40429c,%esi
  401e0b:	48 89 c7             	mov    %rax,%rdi
  401e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  401e13:	e8 68 f1 ff ff       	callq  400f80 <__isoc99_sscanf@plt>
  401e18:	48 83 c4 10          	add    $0x10,%rsp
  401e1c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  401e1f:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
  401e23:	7f 0a                	jg     401e2f <read_six_numbers+0x6b>
  401e25:	b8 00 00 00 00       	mov    $0x0,%eax
  401e2a:	e8 34 03 00 00       	callq  402163 <explode_bomb>
  401e2f:	90                   	nop
  401e30:	c9                   	leaveq 
  401e31:	c3                   	retq   

0000000000401e32 <get_seed>:
  401e32:	55                   	push   %rbp
  401e33:	48 89 e5             	mov    %rsp,%rbp
  401e36:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
  401e3d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401e44:	00 00 
  401e46:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401e4a:	31 c0                	xor    %eax,%eax
  401e4c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  401e53:	48 89 c7             	mov    %rax,%rdi
  401e56:	e8 55 17 00 00       	callq  4035b0 <sha256_init>
  401e5b:	48 8b 05 36 43 20 00 	mov    0x204336(%rip),%rax        # 606198 <username>
  401e62:	48 89 c7             	mov    %rax,%rdi
  401e65:	e8 26 f0 ff ff       	callq  400e90 <strlen@plt>
  401e6a:	48 89 c2             	mov    %rax,%rdx
  401e6d:	48 8b 0d 24 43 20 00 	mov    0x204324(%rip),%rcx        # 606198 <username>
  401e74:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  401e7b:	48 89 ce             	mov    %rcx,%rsi
  401e7e:	48 89 c7             	mov    %rax,%rdi
  401e81:	e8 7a 17 00 00       	callq  403600 <sha256_update>
  401e86:	48 8b 05 03 43 20 00 	mov    0x204303(%rip),%rax        # 606190 <password>
  401e8d:	48 89 c7             	mov    %rax,%rdi
  401e90:	e8 fb ef ff ff       	callq  400e90 <strlen@plt>
  401e95:	48 89 c2             	mov    %rax,%rdx
  401e98:	48 8b 0d f1 42 20 00 	mov    0x2042f1(%rip),%rcx        # 606190 <password>
  401e9f:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  401ea6:	48 89 ce             	mov    %rcx,%rsi
  401ea9:	48 89 c7             	mov    %rax,%rdi
  401eac:	e8 4f 17 00 00       	callq  403600 <sha256_update>
  401eb1:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  401eb5:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  401ebc:	48 89 d6             	mov    %rdx,%rsi
  401ebf:	48 89 c7             	mov    %rax,%rdi
  401ec2:	e8 c9 17 00 00       	callq  403690 <sha256_final>
  401ec7:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  401ecb:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  401ed2:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
  401ed9:	8b 40 04             	mov    0x4(%rax),%eax
  401edc:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
  401ee0:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  401ee7:	00 00 
  401ee9:	74 05                	je     401ef0 <get_seed+0xbe>
  401eeb:	e8 b0 ef ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  401ef0:	c9                   	leaveq 
  401ef1:	c3                   	retq   

0000000000401ef2 <blank_line>:
  401ef2:	55                   	push   %rbp
  401ef3:	48 89 e5             	mov    %rsp,%rbp
  401ef6:	48 83 ec 10          	sub    $0x10,%rsp
  401efa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  401efe:	eb 37                	jmp    401f37 <blank_line+0x45>
  401f00:	e8 8b f1 ff ff       	callq  401090 <__ctype_b_loc@plt>
  401f05:	48 8b 08             	mov    (%rax),%rcx
  401f08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f0c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  401f10:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  401f14:	0f b6 00             	movzbl (%rax),%eax
  401f17:	48 0f be c0          	movsbq %al,%rax
  401f1b:	48 01 c0             	add    %rax,%rax
  401f1e:	48 01 c8             	add    %rcx,%rax
  401f21:	0f b7 00             	movzwl (%rax),%eax
  401f24:	0f b7 c0             	movzwl %ax,%eax
  401f27:	25 00 20 00 00       	and    $0x2000,%eax
  401f2c:	85 c0                	test   %eax,%eax
  401f2e:	75 07                	jne    401f37 <blank_line+0x45>
  401f30:	b8 00 00 00 00       	mov    $0x0,%eax
  401f35:	eb 10                	jmp    401f47 <blank_line+0x55>
  401f37:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f3b:	0f b6 00             	movzbl (%rax),%eax
  401f3e:	84 c0                	test   %al,%al
  401f40:	75 be                	jne    401f00 <blank_line+0xe>
  401f42:	b8 01 00 00 00       	mov    $0x1,%eax
  401f47:	c9                   	leaveq 
  401f48:	c3                   	retq   

0000000000401f49 <skip>:
  401f49:	55                   	push   %rbp
  401f4a:	48 89 e5             	mov    %rsp,%rbp
  401f4d:	48 83 ec 10          	sub    $0x10,%rsp
  401f51:	48 8b 05 d0 47 20 00 	mov    0x2047d0(%rip),%rax        # 606728 <infile>
  401f58:	8b 15 c6 47 20 00    	mov    0x2047c6(%rip),%edx        # 606724 <num_input_strings>
  401f5e:	48 63 d2             	movslq %edx,%rdx
  401f61:	48 c1 e2 07          	shl    $0x7,%rdx
  401f65:	48 8d 8a c0 67 60 00 	lea    0x6067c0(%rdx),%rcx
  401f6c:	48 89 c2             	mov    %rax,%rdx
  401f6f:	be 80 00 00 00       	mov    $0x80,%esi
  401f74:	48 89 cf             	mov    %rcx,%rdi
  401f77:	e8 b4 ef ff ff       	callq  400f30 <fgets@plt>
  401f7c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401f80:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  401f85:	74 10                	je     401f97 <skip+0x4e>
  401f87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f8b:	48 89 c7             	mov    %rax,%rdi
  401f8e:	e8 5f ff ff ff       	callq  401ef2 <blank_line>
  401f93:	85 c0                	test   %eax,%eax
  401f95:	75 ba                	jne    401f51 <skip+0x8>
  401f97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f9b:	c9                   	leaveq 
  401f9c:	c3                   	retq   

0000000000401f9d <read_line>:
  401f9d:	55                   	push   %rbp
  401f9e:	48 89 e5             	mov    %rsp,%rbp
  401fa1:	48 83 ec 10          	sub    $0x10,%rsp
  401fa5:	b8 00 00 00 00       	mov    $0x0,%eax
  401faa:	e8 9a ff ff ff       	callq  401f49 <skip>
  401faf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401fb3:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  401fb8:	75 4c                	jne    402006 <read_line+0x69>
  401fba:	48 8b 15 67 47 20 00 	mov    0x204767(%rip),%rdx        # 606728 <infile>
  401fc1:	48 8b 05 08 42 20 00 	mov    0x204208(%rip),%rax        # 6061d0 <stdin@@GLIBC_2.2.5>
  401fc8:	48 39 c2             	cmp    %rax,%rdx
  401fcb:	75 0c                	jne    401fd9 <read_line+0x3c>
  401fcd:	bf 00 00 00 00       	mov    $0x0,%edi
  401fd2:	e8 52 fd ff ff       	callq  401d29 <sigint_handler>
  401fd7:	eb 2d                	jmp    402006 <read_line+0x69>
  401fd9:	48 8b 05 f0 41 20 00 	mov    0x2041f0(%rip),%rax        # 6061d0 <stdin@@GLIBC_2.2.5>
  401fe0:	48 89 05 41 47 20 00 	mov    %rax,0x204741(%rip)        # 606728 <infile>
  401fe7:	b8 00 00 00 00       	mov    $0x0,%eax
  401fec:	e8 58 ff ff ff       	callq  401f49 <skip>
  401ff1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401ff5:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  401ffa:	75 0a                	jne    402006 <read_line+0x69>
  401ffc:	bf 00 00 00 00       	mov    $0x0,%edi
  402001:	e8 23 fd ff ff       	callq  401d29 <sigint_handler>
  402006:	8b 05 18 47 20 00    	mov    0x204718(%rip),%eax        # 606724 <num_input_strings>
  40200c:	48 98                	cltq   
  40200e:	48 c1 e0 07          	shl    $0x7,%rax
  402012:	48 05 c0 67 60 00    	add    $0x6067c0,%rax
  402018:	48 89 c7             	mov    %rax,%rdi
  40201b:	e8 70 ee ff ff       	callq  400e90 <strlen@plt>
  402020:	89 45 f4             	mov    %eax,-0xc(%rbp)
  402023:	83 7d f4 7e          	cmpl   $0x7e,-0xc(%rbp)
  402027:	7e 37                	jle    402060 <read_line+0xc3>
  402029:	8b 45 f4             	mov    -0xc(%rbp),%eax
  40202c:	83 e8 7f             	sub    $0x7f,%eax
  40202f:	48 98                	cltq   
  402031:	8b 15 ed 46 20 00    	mov    0x2046ed(%rip),%edx        # 606724 <num_input_strings>
  402037:	48 63 d2             	movslq %edx,%rdx
  40203a:	48 c1 e2 07          	shl    $0x7,%rdx
  40203e:	48 83 c2 7f          	add    $0x7f,%rdx
  402042:	48 8d 8a c0 67 60 00 	lea    0x6067c0(%rdx),%rcx
  402049:	48 89 c2             	mov    %rax,%rdx
  40204c:	be 00 00 00 00       	mov    $0x0,%esi
  402051:	48 89 cf             	mov    %rcx,%rdi
  402054:	e8 77 ee ff ff       	callq  400ed0 <memset@plt>
  402059:	c7 45 f4 7f 00 00 00 	movl   $0x7f,-0xc(%rbp)
  402060:	8b 15 be 46 20 00    	mov    0x2046be(%rip),%edx        # 606724 <num_input_strings>
  402066:	8b 45 f4             	mov    -0xc(%rbp),%eax
  402069:	83 e8 01             	sub    $0x1,%eax
  40206c:	48 98                	cltq   
  40206e:	48 63 d2             	movslq %edx,%rdx
  402071:	48 c1 e2 07          	shl    $0x7,%rdx
  402075:	48 01 d0             	add    %rdx,%rax
  402078:	48 05 c0 67 60 00    	add    $0x6067c0,%rax
  40207e:	c6 00 00             	movb   $0x0,(%rax)
  402081:	8b 05 9d 46 20 00    	mov    0x20469d(%rip),%eax        # 606724 <num_input_strings>
  402087:	8d 50 01             	lea    0x1(%rax),%edx
  40208a:	89 15 94 46 20 00    	mov    %edx,0x204694(%rip)        # 606724 <num_input_strings>
  402090:	48 98                	cltq   
  402092:	48 c1 e0 07          	shl    $0x7,%rax
  402096:	48 05 c0 67 60 00    	add    $0x6067c0,%rax
  40209c:	c9                   	leaveq 
  40209d:	c3                   	retq   

000000000040209e <send_msg>:
  40209e:	55                   	push   %rbp
  40209f:	48 89 e5             	mov    %rsp,%rbp
  4020a2:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  4020a9:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  4020af:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4020b6:	00 00 
  4020b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4020bc:	31 c0                	xor    %eax,%eax
  4020be:	8b 05 60 46 20 00    	mov    0x204660(%rip),%eax        # 606724 <num_input_strings>
  4020c4:	83 e8 01             	sub    $0x1,%eax
  4020c7:	48 98                	cltq   
  4020c9:	48 c1 e0 07          	shl    $0x7,%rax
  4020cd:	48 8d b8 c0 67 60 00 	lea    0x6067c0(%rax),%rdi
  4020d4:	8b 35 4a 46 20 00    	mov    0x20464a(%rip),%esi        # 606724 <num_input_strings>
  4020da:	8b 15 c0 40 20 00    	mov    0x2040c0(%rip),%edx        # 6061a0 <bomb_id>
  4020e0:	8b 8d 2c ff ff ff    	mov    -0xd4(%rbp),%ecx
  4020e6:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  4020ed:	49 89 f9             	mov    %rdi,%r9
  4020f0:	41 89 f0             	mov    %esi,%r8d
  4020f3:	be ae 42 40 00       	mov    $0x4042ae,%esi
  4020f8:	48 89 c7             	mov    %rax,%rdi
  4020fb:	b8 00 00 00 00       	mov    $0x0,%eax
  402100:	e8 eb ee ff ff       	callq  400ff0 <sprintf@plt>
  402105:	48 8b 0d 84 40 20 00 	mov    0x204084(%rip),%rcx        # 606190 <password>
  40210c:	48 8b 15 85 40 20 00 	mov    0x204085(%rip),%rdx        # 606198 <username>
  402113:	48 8b 35 5e 40 20 00 	mov    0x20405e(%rip),%rsi        # 606178 <server_port>
  40211a:	48 8b 05 5f 40 20 00 	mov    0x20405f(%rip),%rax        # 606180 <server_hostname>
  402121:	48 8d bd 30 ff ff ff 	lea    -0xd0(%rbp),%rdi
  402128:	49 89 f8             	mov    %rdi,%r8
  40212b:	48 89 c7             	mov    %rax,%rdi
  40212e:	e8 3d 09 00 00       	callq  402a70 <driver_post>
  402133:	83 f8 ff             	cmp    $0xffffffff,%eax
  402136:	75 14                	jne    40214c <send_msg+0xae>
  402138:	bf c0 42 40 00       	mov    $0x4042c0,%edi
  40213d:	e8 7e ee ff ff       	callq  400fc0 <perror@plt>
  402142:	bf 10 00 00 00       	mov    $0x10,%edi
  402147:	e8 b4 ee ff ff       	callq  401000 <exit@plt>
  40214c:	90                   	nop
  40214d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402151:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402158:	00 00 
  40215a:	74 05                	je     402161 <send_msg+0xc3>
  40215c:	e8 3f ed ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  402161:	c9                   	leaveq 
  402162:	c3                   	retq   

0000000000402163 <explode_bomb>:
  402163:	55                   	push   %rbp
  402164:	48 89 e5             	mov    %rsp,%rbp
  402167:	bf e8 42 40 00       	mov    $0x4042e8,%edi
  40216c:	e8 df ec ff ff       	callq  400e50 <puts@plt>
  402171:	bf f1 42 40 00       	mov    $0x4042f1,%edi
  402176:	e8 d5 ec ff ff       	callq  400e50 <puts@plt>
  40217b:	bf 00 00 00 00       	mov    $0x0,%edi
  402180:	e8 19 ff ff ff       	callq  40209e <send_msg>
  402185:	bf 08 43 40 00       	mov    $0x404308,%edi
  40218a:	e8 c1 ec ff ff       	callq  400e50 <puts@plt>
  40218f:	bf 08 00 00 00       	mov    $0x8,%edi
  402194:	e8 67 ee ff ff       	callq  401000 <exit@plt>

0000000000402199 <test_secret_code>:
  402199:	55                   	push   %rbp
  40219a:	48 89 e5             	mov    %rsp,%rbp
  40219d:	48 83 ec 60          	sub    $0x60,%rsp
  4021a1:	89 7d ac             	mov    %edi,-0x54(%rbp)
  4021a4:	89 75 a8             	mov    %esi,-0x58(%rbp)
  4021a7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021ae:	00 00 
  4021b0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4021b4:	31 c0                	xor    %eax,%eax
  4021b6:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
  4021bd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  4021c4:	c7 45 d8 07 00 00 00 	movl   $0x7,-0x28(%rbp)
  4021cb:	c7 45 dc 03 00 00 00 	movl   $0x3,-0x24(%rbp)
  4021d2:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
  4021d9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
  4021e0:	c7 45 e8 07 00 00 00 	movl   $0x7,-0x18(%rbp)
  4021e7:	83 7d ac 06          	cmpl   $0x6,-0x54(%rbp)
  4021eb:	7f 13                	jg     402200 <test_secret_code+0x67>
  4021ed:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
  4021f1:	78 0d                	js     402200 <test_secret_code+0x67>
  4021f3:	8b 45 ac             	mov    -0x54(%rbp),%eax
  4021f6:	48 98                	cltq   
  4021f8:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
  4021fc:	85 c0                	test   %eax,%eax
  4021fe:	75 0a                	jne    40220a <test_secret_code+0x71>
  402200:	b8 00 00 00 00       	mov    $0x0,%eax
  402205:	e9 b2 00 00 00       	jmpq   4022bc <test_secret_code+0x123>
  40220a:	8b 45 ac             	mov    -0x54(%rbp),%eax
  40220d:	83 e8 01             	sub    $0x1,%eax
  402210:	48 98                	cltq   
  402212:	48 c1 e0 07          	shl    $0x7,%rax
  402216:	48 05 c0 67 60 00    	add    $0x6067c0,%rax
  40221c:	48 89 c7             	mov    %rax,%rdi
  40221f:	e8 2c ee ff ff       	callq  401050 <strdup@plt>
  402224:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  402228:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%rbp)
  40222f:	eb 25                	jmp    402256 <test_secret_code+0xbd>
  402231:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  402235:	be 20 00 00 00       	mov    $0x20,%esi
  40223a:	48 89 c7             	mov    %rax,%rdi
  40223d:	e8 6e ec ff ff       	callq  400eb0 <strchr@plt>
  402242:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  402246:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  40224b:	74 05                	je     402252 <test_secret_code+0xb9>
  40224d:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
  402252:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
  402256:	8b 45 ac             	mov    -0x54(%rbp),%eax
  402259:	48 98                	cltq   
  40225b:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
  40225f:	83 e8 01             	sub    $0x1,%eax
  402262:	3b 45 bc             	cmp    -0x44(%rbp),%eax
  402265:	7e 07                	jle    40226e <test_secret_code+0xd5>
  402267:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  40226c:	75 c3                	jne    402231 <test_secret_code+0x98>
  40226e:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  402273:	75 07                	jne    40227c <test_secret_code+0xe3>
  402275:	b8 00 00 00 00       	mov    $0x0,%eax
  40227a:	eb 40                	jmp    4022bc <test_secret_code+0x123>
  40227c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  402280:	be 20 00 00 00       	mov    $0x20,%esi
  402285:	48 89 c7             	mov    %rax,%rdi
  402288:	e8 23 ec ff ff       	callq  400eb0 <strchr@plt>
  40228d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  402291:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  402296:	74 07                	je     40229f <test_secret_code+0x106>
  402298:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  40229c:	c6 00 00             	movb   $0x0,(%rax)
  40229f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  4022a3:	48 89 c7             	mov    %rax,%rdi
  4022a6:	e8 35 ed ff ff       	callq  400fe0 <atoi@plt>
  4022ab:	3b 45 a8             	cmp    -0x58(%rbp),%eax
  4022ae:	75 07                	jne    4022b7 <test_secret_code+0x11e>
  4022b0:	b8 01 00 00 00       	mov    $0x1,%eax
  4022b5:	eb 05                	jmp    4022bc <test_secret_code+0x123>
  4022b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  4022c0:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  4022c7:	00 00 
  4022c9:	74 05                	je     4022d0 <test_secret_code+0x137>
  4022cb:	e8 d0 eb ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  4022d0:	c9                   	leaveq 
  4022d1:	c3                   	retq   

00000000004022d2 <phase_defused>:
  4022d2:	55                   	push   %rbp
  4022d3:	48 89 e5             	mov    %rsp,%rbp
  4022d6:	48 83 ec 10          	sub    $0x10,%rsp
  4022da:	b8 00 00 00 00       	mov    $0x0,%eax
  4022df:	e8 b5 01 00 00       	callq  402499 <get_secret_phase_entry_point>
  4022e4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  4022e7:	8b 05 37 44 20 00    	mov    0x204437(%rip),%eax        # 606724 <num_input_strings>
  4022ed:	39 45 f8             	cmp    %eax,-0x8(%rbp)
  4022f0:	75 3a                	jne    40232c <phase_defused+0x5a>
  4022f2:	0f b6 05 fc 58 20 00 	movzbl 0x2058fc(%rip),%eax        # 607bf5 <secret+0xfb5>
  4022f9:	0f be d0             	movsbl %al,%edx
  4022fc:	0f b6 05 f3 58 20 00 	movzbl 0x2058f3(%rip),%eax        # 607bf6 <secret+0xfb6>
  402303:	0f be c0             	movsbl %al,%eax
  402306:	0f af c2             	imul   %edx,%eax
  402309:	25 ff 0f 00 00       	and    $0xfff,%eax
  40230e:	83 c0 01             	add    $0x1,%eax
  402311:	89 c2                	mov    %eax,%edx
  402313:	8b 05 0b 44 20 00    	mov    0x20440b(%rip),%eax        # 606724 <num_input_strings>
  402319:	89 d6                	mov    %edx,%esi
  40231b:	89 c7                	mov    %eax,%edi
  40231d:	e8 77 fe ff ff       	callq  402199 <test_secret_code>
  402322:	83 f8 ff             	cmp    $0xffffffff,%eax
  402325:	75 05                	jne    40232c <phase_defused+0x5a>
  402327:	e8 37 fe ff ff       	callq  402163 <explode_bomb>
  40232c:	8b 05 f2 43 20 00    	mov    0x2043f2(%rip),%eax        # 606724 <num_input_strings>
  402332:	39 45 f8             	cmp    %eax,-0x8(%rbp)
  402335:	74 3a                	je     402371 <phase_defused+0x9f>
  402337:	0f b6 05 b7 58 20 00 	movzbl 0x2058b7(%rip),%eax        # 607bf5 <secret+0xfb5>
  40233e:	0f be d0             	movsbl %al,%edx
  402341:	0f b6 05 ae 58 20 00 	movzbl 0x2058ae(%rip),%eax        # 607bf6 <secret+0xfb6>
  402348:	0f be c0             	movsbl %al,%eax
  40234b:	0f af c2             	imul   %edx,%eax
  40234e:	25 ff 0f 00 00       	and    $0xfff,%eax
  402353:	83 c0 01             	add    $0x1,%eax
  402356:	89 c2                	mov    %eax,%edx
  402358:	8b 05 c6 43 20 00    	mov    0x2043c6(%rip),%eax        # 606724 <num_input_strings>
  40235e:	89 d6                	mov    %edx,%esi
  402360:	89 c7                	mov    %eax,%edi
  402362:	e8 32 fe ff ff       	callq  402199 <test_secret_code>
  402367:	83 f8 01             	cmp    $0x1,%eax
  40236a:	75 05                	jne    402371 <phase_defused+0x9f>
  40236c:	e8 f2 fd ff ff       	callq  402163 <explode_bomb>
  402371:	bf 01 00 00 00       	mov    $0x1,%edi
  402376:	e8 23 fd ff ff       	callq  40209e <send_msg>
  40237b:	8b 05 a3 43 20 00    	mov    0x2043a3(%rip),%eax        # 606724 <num_input_strings>
  402381:	83 f8 06             	cmp    $0x6,%eax
  402384:	75 74                	jne    4023fa <phase_defused+0x128>
  402386:	0f b6 05 68 58 20 00 	movzbl 0x205868(%rip),%eax        # 607bf5 <secret+0xfb5>
  40238d:	0f be d0             	movsbl %al,%edx
  402390:	0f b6 05 5f 58 20 00 	movzbl 0x20585f(%rip),%eax        # 607bf6 <secret+0xfb6>
  402397:	0f be c0             	movsbl %al,%eax
  40239a:	0f af c2             	imul   %edx,%eax
  40239d:	25 ff 0f 00 00       	and    $0xfff,%eax
  4023a2:	83 c0 01             	add    $0x1,%eax
  4023a5:	89 c2                	mov    %eax,%edx
  4023a7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  4023aa:	89 d6                	mov    %edx,%esi
  4023ac:	89 c7                	mov    %eax,%edi
  4023ae:	e8 e6 fd ff ff       	callq  402199 <test_secret_code>
  4023b3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4023b6:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  4023ba:	75 2a                	jne    4023e6 <phase_defused+0x114>
  4023bc:	bf 30 43 40 00       	mov    $0x404330,%edi
  4023c1:	e8 8a ea ff ff       	callq  400e50 <puts@plt>
  4023c6:	b8 00 00 00 00       	mov    $0x0,%eax
  4023cb:	e8 f8 14 00 00       	callq  4038c8 <secret_phase>
  4023d0:	bf 80 43 40 00       	mov    $0x404380,%edi
  4023d5:	e8 76 ea ff ff       	callq  400e50 <puts@plt>
  4023da:	bf 01 00 00 00       	mov    $0x1,%edi
  4023df:	e8 ba fc ff ff       	callq  40209e <send_msg>
  4023e4:	eb 0a                	jmp    4023f0 <phase_defused+0x11e>
  4023e6:	bf d0 43 40 00       	mov    $0x4043d0,%edi
  4023eb:	e8 60 ea ff ff       	callq  400e50 <puts@plt>
  4023f0:	bf 00 44 40 00       	mov    $0x404400,%edi
  4023f5:	e8 56 ea ff ff       	callq  400e50 <puts@plt>
  4023fa:	90                   	nop
  4023fb:	c9                   	leaveq 
  4023fc:	c3                   	retq   

00000000004023fd <initialize_bomb>:
  4023fd:	55                   	push   %rbp
  4023fe:	48 89 e5             	mov    %rsp,%rbp
  402401:	48 83 ec 20          	sub    $0x20,%rsp
  402405:	89 7d ec             	mov    %edi,-0x14(%rbp)
  402408:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  40240c:	be 29 1d 40 00       	mov    $0x401d29,%esi
  402411:	bf 02 00 00 00       	mov    $0x2,%edi
  402416:	e8 25 eb ff ff       	callq  400f40 <signal@plt>
  40241b:	be 29 1d 40 00       	mov    $0x401d29,%esi
  402420:	bf 09 00 00 00       	mov    $0x9,%edi
  402425:	e8 16 eb ff ff       	callq  400f40 <signal@plt>
  40242a:	e8 03 fa ff ff       	callq  401e32 <get_seed>
  40242f:	89 c7                	mov    %eax,%edi
  402431:	e8 da ea ff ff       	callq  400f10 <srand@plt>
  402436:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  40243d:	eb 16                	jmp    402455 <initialize_bomb+0x58>
  40243f:	e8 3c ec ff ff       	callq  401080 <rand@plt>
  402444:	89 c2                	mov    %eax,%edx
  402446:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402449:	48 98                	cltq   
  40244b:	88 90 40 6c 60 00    	mov    %dl,0x606c40(%rax)
  402451:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  402455:	81 7d fc ff 0f 00 00 	cmpl   $0xfff,-0x4(%rbp)
  40245c:	7e e1                	jle    40243f <initialize_bomb+0x42>
  40245e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402462:	48 8b 10             	mov    (%rax),%rdx
  402465:	48 8b 0d 0c 3d 20 00 	mov    0x203d0c(%rip),%rcx        # 606178 <server_port>
  40246c:	48 8b 05 0d 3d 20 00 	mov    0x203d0d(%rip),%rax        # 606180 <server_hostname>
  402473:	48 89 ce             	mov    %rcx,%rsi
  402476:	48 89 c7             	mov    %rax,%rdi
  402479:	e8 92 01 00 00       	callq  402610 <driver_initialize>
  40247e:	85 c0                	test   %eax,%eax
  402480:	75 0a                	jne    40248c <initialize_bomb+0x8f>
  402482:	bf 10 00 00 00       	mov    $0x10,%edi
  402487:	e8 74 eb ff ff       	callq  401000 <exit@plt>
  40248c:	b8 00 00 00 00       	mov    $0x0,%eax
  402491:	e8 e3 13 00 00       	callq  403879 <initialize_phases>
  402496:	90                   	nop
  402497:	c9                   	leaveq 
  402498:	c3                   	retq   

0000000000402499 <get_secret_phase_entry_point>:
  402499:	55                   	push   %rbp
  40249a:	48 89 e5             	mov    %rsp,%rbp
  40249d:	0f b6 05 50 57 20 00 	movzbl 0x205750(%rip),%eax        # 607bf4 <secret+0xfb4>
  4024a4:	0f be c8             	movsbl %al,%ecx
  4024a7:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
  4024ac:	89 c8                	mov    %ecx,%eax
  4024ae:	f7 e2                	mul    %edx
  4024b0:	c1 ea 02             	shr    $0x2,%edx
  4024b3:	89 d0                	mov    %edx,%eax
  4024b5:	01 c0                	add    %eax,%eax
  4024b7:	01 d0                	add    %edx,%eax
  4024b9:	01 c0                	add    %eax,%eax
  4024bb:	29 c1                	sub    %eax,%ecx
  4024bd:	89 ca                	mov    %ecx,%edx
  4024bf:	8d 42 01             	lea    0x1(%rdx),%eax
  4024c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4024c5:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  4024c9:	74 06                	je     4024d1 <get_secret_phase_entry_point+0x38>
  4024cb:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
  4024cf:	75 04                	jne    4024d5 <get_secret_phase_entry_point+0x3c>
  4024d1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  4024d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4024d8:	5d                   	pop    %rbp
  4024d9:	c3                   	retq   
  4024da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004024e0 <driver_get_socket>:
  4024e0:	41 55                	push   %r13
  4024e2:	41 54                	push   %r12
  4024e4:	b9 06 00 00 00       	mov    $0x6,%ecx
  4024e9:	55                   	push   %rbp
  4024ea:	53                   	push   %rbx
  4024eb:	49 89 fc             	mov    %rdi,%r12
  4024ee:	49 89 f5             	mov    %rsi,%r13
  4024f1:	48 83 ec 58          	sub    $0x58,%rsp
  4024f5:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  4024fa:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402501:	00 00 
  402503:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  402508:	31 c0                	xor    %eax,%eax
  40250a:	48 89 d7             	mov    %rdx,%rdi
  40250d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402510:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  402515:	4c 89 e7             	mov    %r12,%rdi
  402518:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%rsp)
  40251f:	00 
  402520:	e8 1b eb ff ff       	callq  401040 <getaddrinfo@plt>
  402525:	85 c0                	test   %eax,%eax
  402527:	0f 85 a1 00 00 00    	jne    4025ce <driver_get_socket+0xee>
  40252d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  402532:	48 85 db             	test   %rbx,%rbx
  402535:	74 72                	je     4025a9 <driver_get_socket+0xc9>
  402537:	8b 53 0c             	mov    0xc(%rbx),%edx
  40253a:	8b 73 08             	mov    0x8(%rbx),%esi
  40253d:	8b 7b 04             	mov    0x4(%rbx),%edi
  402540:	e8 7b eb ff ff       	callq  4010c0 <socket@plt>
  402545:	83 f8 ff             	cmp    $0xffffffff,%eax
  402548:	89 c5                	mov    %eax,%ebp
  40254a:	74 54                	je     4025a0 <driver_get_socket+0xc0>
  40254c:	8b 53 10             	mov    0x10(%rbx),%edx
  40254f:	48 8b 73 18          	mov    0x18(%rbx),%rsi
  402553:	89 c7                	mov    %eax,%edi
  402555:	e8 b6 ea ff ff       	callq  401010 <connect@plt>
  40255a:	83 f8 ff             	cmp    $0xffffffff,%eax
  40255d:	74 31                	je     402590 <driver_get_socket+0xb0>
  40255f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402564:	e8 37 eb ff ff       	callq  4010a0 <freeaddrinfo@plt>
  402569:	89 e8                	mov    %ebp,%eax
  40256b:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
  402570:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402577:	00 00 
  402579:	0f 85 81 00 00 00    	jne    402600 <driver_get_socket+0x120>
  40257f:	48 83 c4 58          	add    $0x58,%rsp
  402583:	5b                   	pop    %rbx
  402584:	5d                   	pop    %rbp
  402585:	41 5c                	pop    %r12
  402587:	41 5d                	pop    %r13
  402589:	c3                   	retq   
  40258a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402590:	89 ef                	mov    %ebp,%edi
  402592:	e8 49 e9 ff ff       	callq  400ee0 <close@plt>
  402597:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40259e:	00 00 
  4025a0:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
  4025a4:	48 85 db             	test   %rbx,%rbx
  4025a7:	75 8e                	jne    402537 <driver_get_socket+0x57>
  4025a9:	48 8b 3d 30 3c 20 00 	mov    0x203c30(%rip),%rdi        # 6061e0 <stderr@@GLIBC_2.2.5>
  4025b0:	4d 89 e8             	mov    %r13,%r8
  4025b3:	4c 89 e1             	mov    %r12,%rcx
  4025b6:	ba e8 45 40 00       	mov    $0x4045e8,%edx
  4025bb:	be 01 00 00 00       	mov    $0x1,%esi
  4025c0:	31 c0                	xor    %eax,%eax
  4025c2:	e8 69 ea ff ff       	callq  401030 <__fprintf_chk@plt>
  4025c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025cc:	eb 9d                	jmp    40256b <driver_get_socket+0x8b>
  4025ce:	89 c7                	mov    %eax,%edi
  4025d0:	e8 eb e8 ff ff       	callq  400ec0 <gai_strerror@plt>
  4025d5:	48 8b 3d 04 3c 20 00 	mov    0x203c04(%rip),%rdi        # 6061e0 <stderr@@GLIBC_2.2.5>
  4025dc:	49 89 c1             	mov    %rax,%r9
  4025df:	4d 89 e8             	mov    %r13,%r8
  4025e2:	4c 89 e1             	mov    %r12,%rcx
  4025e5:	ba 48 44 40 00       	mov    $0x404448,%edx
  4025ea:	be 01 00 00 00       	mov    $0x1,%esi
  4025ef:	31 c0                	xor    %eax,%eax
  4025f1:	e8 3a ea ff ff       	callq  401030 <__fprintf_chk@plt>
  4025f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025fb:	e9 6b ff ff ff       	jmpq   40256b <driver_get_socket+0x8b>
  402600:	e8 9b e8 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  402605:	90                   	nop
  402606:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40260d:	00 00 00 

0000000000402610 <driver_initialize>:
  402610:	41 57                	push   %r15
  402612:	41 56                	push   %r14
  402614:	41 55                	push   %r13
  402616:	41 54                	push   %r12
  402618:	55                   	push   %rbp
  402619:	53                   	push   %rbx
  40261a:	48 89 d3             	mov    %rdx,%rbx
  40261d:	48 81 ec e8 10 00 00 	sub    $0x10e8,%rsp
  402624:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40262b:	00 00 
  40262d:	48 89 84 24 d8 10 00 	mov    %rax,0x10d8(%rsp)
  402634:	00 
  402635:	31 c0                	xor    %eax,%eax
  402637:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  40263c:	e8 9f fe ff ff       	callq  4024e0 <driver_get_socket>
  402641:	83 f8 ff             	cmp    $0xffffffff,%eax
  402644:	0f 84 76 03 00 00    	je     4029c0 <driver_initialize+0x3b0>
  40264a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40264f:	41 89 c4             	mov    %eax,%r12d
  402652:	e8 59 0f 00 00       	callq  4035b0 <sha256_init>
  402657:	48 89 df             	mov    %rbx,%rdi
  40265a:	be 04 46 40 00       	mov    $0x404604,%esi
  40265f:	48 8d 9c 24 d0 00 00 	lea    0xd0(%rsp),%rbx
  402666:	00 
  402667:	e8 44 e9 ff ff       	callq  400fb0 <fopen@plt>
  40266c:	49 89 c5             	mov    %rax,%r13
  40266f:	eb 17                	jmp    402688 <driver_initialize+0x78>
  402671:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402678:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40267d:	48 63 d0             	movslq %eax,%rdx
  402680:	48 89 de             	mov    %rbx,%rsi
  402683:	e8 78 0f 00 00       	callq  403600 <sha256_update>
  402688:	4c 89 e9             	mov    %r13,%rcx
  40268b:	ba 00 10 00 00       	mov    $0x1000,%edx
  402690:	be 01 00 00 00       	mov    $0x1,%esi
  402695:	48 89 df             	mov    %rbx,%rdi
  402698:	e8 c3 e7 ff ff       	callq  400e60 <fread@plt>
  40269d:	85 c0                	test   %eax,%eax
  40269f:	7f d7                	jg     402678 <driver_initialize+0x68>
  4026a1:	4c 8d bc 24 80 00 00 	lea    0x80(%rsp),%r15
  4026a8:	00 
  4026a9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4026ae:	48 89 de             	mov    %rbx,%rsi
  4026b1:	49 89 de             	mov    %rbx,%r14
  4026b4:	49 8d 6f 40          	lea    0x40(%r15),%rbp
  4026b8:	e8 d3 0f 00 00       	callq  403690 <sha256_final>
  4026bd:	0f 1f 00             	nopl   (%rax)
  4026c0:	45 0f b6 06          	movzbl (%r14),%r8d
  4026c4:	4c 89 ff             	mov    %r15,%rdi
  4026c7:	31 c0                	xor    %eax,%eax
  4026c9:	b9 7d 46 40 00       	mov    $0x40467d,%ecx
  4026ce:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4026d5:	be 01 00 00 00       	mov    $0x1,%esi
  4026da:	49 83 c7 02          	add    $0x2,%r15
  4026de:	49 83 c6 01          	add    $0x1,%r14
  4026e2:	e8 c9 e9 ff ff       	callq  4010b0 <__sprintf_chk@plt>
  4026e7:	4c 39 fd             	cmp    %r15,%rbp
  4026ea:	75 d4                	jne    4026c0 <driver_initialize+0xb0>
  4026ec:	4c 89 ef             	mov    %r13,%rdi
  4026ef:	c6 84 24 c0 00 00 00 	movb   $0x0,0xc0(%rsp)
  4026f6:	00 
  4026f7:	e8 84 e7 ff ff       	callq  400e80 <fclose@plt>
  4026fc:	44 8b 05 9d 3a 20 00 	mov    0x203a9d(%rip),%r8d        # 6061a0 <bomb_id>
  402703:	4c 8d 8c 24 80 00 00 	lea    0x80(%rsp),%r9
  40270a:	00 
  40270b:	b9 07 46 40 00       	mov    $0x404607,%ecx
  402710:	ba 00 10 00 00       	mov    $0x1000,%edx
  402715:	be 01 00 00 00       	mov    $0x1,%esi
  40271a:	48 89 df             	mov    %rbx,%rdi
  40271d:	31 c0                	xor    %eax,%eax
  40271f:	e8 8c e9 ff ff       	callq  4010b0 <__sprintf_chk@plt>
  402724:	49 89 d8             	mov    %rbx,%r8
  402727:	41 8b 10             	mov    (%r8),%edx
  40272a:	49 83 c0 04          	add    $0x4,%r8
  40272e:	8d 82 ff fe fe fe    	lea    -0x1010101(%rdx),%eax
  402734:	f7 d2                	not    %edx
  402736:	21 d0                	and    %edx,%eax
  402738:	25 80 80 80 80       	and    $0x80808080,%eax
  40273d:	74 e8                	je     402727 <driver_initialize+0x117>
  40273f:	89 c2                	mov    %eax,%edx
  402741:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  402748:	00 
  402749:	be 01 00 00 00       	mov    $0x1,%esi
  40274e:	c1 ea 10             	shr    $0x10,%edx
  402751:	a9 80 80 00 00       	test   $0x8080,%eax
  402756:	0f 44 c2             	cmove  %edx,%eax
  402759:	49 8d 50 02          	lea    0x2(%r8),%rdx
  40275d:	89 c1                	mov    %eax,%ecx
  40275f:	4c 0f 44 c2          	cmove  %rdx,%r8
  402763:	00 c1                	add    %al,%cl
  402765:	ba 41 00 00 00       	mov    $0x41,%edx
  40276a:	49 83 d8 03          	sbb    $0x3,%r8
  40276e:	b9 1a 46 40 00       	mov    $0x40461a,%ecx
  402773:	31 c0                	xor    %eax,%eax
  402775:	49 29 d8             	sub    %rbx,%r8
  402778:	e8 33 e9 ff ff       	callq  4010b0 <__sprintf_chk@plt>
  40277d:	ba 17 00 00 00       	mov    $0x17,%edx
  402782:	be 30 46 40 00       	mov    $0x404630,%esi
  402787:	44 89 e7             	mov    %r12d,%edi
  40278a:	e8 e1 e6 ff ff       	callq  400e70 <write@plt>
  40278f:	ba 06 00 00 00       	mov    $0x6,%edx
  402794:	be 48 46 40 00       	mov    $0x404648,%esi
  402799:	44 89 e7             	mov    %r12d,%edi
  40279c:	e8 cf e6 ff ff       	callq  400e70 <write@plt>
  4027a1:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  4027a6:	4c 89 f7             	mov    %r14,%rdi
  4027a9:	e8 e2 e6 ff ff       	callq  400e90 <strlen@plt>
  4027ae:	4c 89 f6             	mov    %r14,%rsi
  4027b1:	48 89 c2             	mov    %rax,%rdx
  4027b4:	44 89 e7             	mov    %r12d,%edi
  4027b7:	e8 b4 e6 ff ff       	callq  400e70 <write@plt>
  4027bc:	ba 33 00 00 00       	mov    $0x33,%edx
  4027c1:	be 70 44 40 00       	mov    $0x404470,%esi
  4027c6:	44 89 e7             	mov    %r12d,%edi
  4027c9:	e8 a2 e6 ff ff       	callq  400e70 <write@plt>
  4027ce:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
  4027d5:	00 
  4027d6:	8b 0a                	mov    (%rdx),%ecx
  4027d8:	48 83 c2 04          	add    $0x4,%rdx
  4027dc:	8d 81 ff fe fe fe    	lea    -0x1010101(%rcx),%eax
  4027e2:	f7 d1                	not    %ecx
  4027e4:	21 c8                	and    %ecx,%eax
  4027e6:	25 80 80 80 80       	and    $0x80808080,%eax
  4027eb:	74 e9                	je     4027d6 <driver_initialize+0x1c6>
  4027ed:	89 c1                	mov    %eax,%ecx
  4027ef:	44 89 e7             	mov    %r12d,%edi
  4027f2:	c1 e9 10             	shr    $0x10,%ecx
  4027f5:	a9 80 80 00 00       	test   $0x8080,%eax
  4027fa:	0f 44 c1             	cmove  %ecx,%eax
  4027fd:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
  402801:	48 0f 44 d1          	cmove  %rcx,%rdx
  402805:	89 c1                	mov    %eax,%ecx
  402807:	00 c1                	add    %al,%cl
  402809:	48 8d 84 24 80 00 00 	lea    0x80(%rsp),%rax
  402810:	00 
  402811:	48 83 da 03          	sbb    $0x3,%rdx
  402815:	48 29 c2             	sub    %rax,%rdx
  402818:	48 89 c6             	mov    %rax,%rsi
  40281b:	e8 50 e6 ff ff       	callq  400e70 <write@plt>
  402820:	ba 1a 00 00 00       	mov    $0x1a,%edx
  402825:	be 4f 46 40 00       	mov    $0x40464f,%esi
  40282a:	44 89 e7             	mov    %r12d,%edi
  40282d:	e8 3e e6 ff ff       	callq  400e70 <write@plt>
  402832:	48 89 da             	mov    %rbx,%rdx
  402835:	8b 0a                	mov    (%rdx),%ecx
  402837:	48 83 c2 04          	add    $0x4,%rdx
  40283b:	8d 81 ff fe fe fe    	lea    -0x1010101(%rcx),%eax
  402841:	f7 d1                	not    %ecx
  402843:	21 c8                	and    %ecx,%eax
  402845:	25 80 80 80 80       	and    $0x80808080,%eax
  40284a:	74 e9                	je     402835 <driver_initialize+0x225>
  40284c:	89 c1                	mov    %eax,%ecx
  40284e:	48 89 de             	mov    %rbx,%rsi
  402851:	44 89 e7             	mov    %r12d,%edi
  402854:	c1 e9 10             	shr    $0x10,%ecx
  402857:	a9 80 80 00 00       	test   $0x8080,%eax
  40285c:	48 89 dd             	mov    %rbx,%rbp
  40285f:	0f 44 c1             	cmove  %ecx,%eax
  402862:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
  402866:	41 be 65 46 40 00    	mov    $0x404665,%r14d
  40286c:	48 0f 44 d1          	cmove  %rcx,%rdx
  402870:	89 c1                	mov    %eax,%ecx
  402872:	00 c1                	add    %al,%cl
  402874:	48 83 da 03          	sbb    $0x3,%rdx
  402878:	48 29 da             	sub    %rbx,%rdx
  40287b:	e8 f0 e5 ff ff       	callq  400e70 <write@plt>
  402880:	eb 17                	jmp    402899 <driver_initialize+0x289>
  402882:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402888:	4c 89 e8             	mov    %r13,%rax
  40288b:	4c 89 ed             	mov    %r13,%rbp
  40288e:	48 29 d8             	sub    %rbx,%rax
  402891:	48 3d fe 0f 00 00    	cmp    $0xffe,%rax
  402897:	7f 24                	jg     4028bd <driver_initialize+0x2ad>
  402899:	48 89 ee             	mov    %rbp,%rsi
  40289c:	44 89 e7             	mov    %r12d,%edi
  40289f:	ba 01 00 00 00       	mov    $0x1,%edx
  4028a4:	e8 47 e6 ff ff       	callq  400ef0 <read@plt>
  4028a9:	48 8d 75 fd          	lea    -0x3(%rbp),%rsi
  4028ad:	b9 04 00 00 00       	mov    $0x4,%ecx
  4028b2:	4c 89 f7             	mov    %r14,%rdi
  4028b5:	4c 8d 6d 01          	lea    0x1(%rbp),%r13
  4028b9:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4028bb:	75 cb                	jne    402888 <driver_initialize+0x278>
  4028bd:	be 20 00 00 00       	mov    $0x20,%esi
  4028c2:	48 89 df             	mov    %rbx,%rdi
  4028c5:	e8 e6 e5 ff ff       	callq  400eb0 <strchr@plt>
  4028ca:	48 85 c0             	test   %rax,%rax
  4028cd:	0f 84 ed 00 00 00    	je     4029c0 <driver_initialize+0x3b0>
  4028d3:	0f be 50 01          	movsbl 0x1(%rax),%edx
  4028d7:	0f be 48 02          	movsbl 0x2(%rax),%ecx
  4028db:	0f be 40 03          	movsbl 0x3(%rax),%eax
  4028df:	83 ea 30             	sub    $0x30,%edx
  4028e2:	8d 8c 89 10 ff ff ff 	lea    -0xf0(%rcx,%rcx,4),%ecx
  4028e9:	6b d2 64             	imul   $0x64,%edx,%edx
  4028ec:	8d 14 4a             	lea    (%rdx,%rcx,2),%edx
  4028ef:	8d 4c 02 d0          	lea    -0x30(%rdx,%rax,1),%ecx
  4028f3:	81 f9 c8 00 00 00    	cmp    $0xc8,%ecx
  4028f9:	0f 85 a9 00 00 00    	jne    4029a8 <driver_initialize+0x398>
  4028ff:	be 6a 46 40 00       	mov    $0x40466a,%esi
  402904:	48 89 df             	mov    %rbx,%rdi
  402907:	e8 64 e7 ff ff       	callq  401070 <strstr@plt>
  40290c:	48 85 c0             	test   %rax,%rax
  40290f:	0f 84 37 01 00 00    	je     402a4c <driver_initialize+0x43c>
  402915:	48 8d 78 10          	lea    0x10(%rax),%rdi
  402919:	0f b6 40 10          	movzbl 0x10(%rax),%eax
  40291d:	84 c0                	test   %al,%al
  40291f:	0f 84 c6 00 00 00    	je     4029eb <driver_initialize+0x3db>
  402925:	3c 20                	cmp    $0x20,%al
  402927:	0f 86 c8 00 00 00    	jbe    4029f5 <driver_initialize+0x3e5>
  40292d:	48 89 fa             	mov    %rdi,%rdx
  402930:	48 b9 00 24 00 00 01 	movabs $0x100002400,%rcx
  402937:	00 00 00 
  40293a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402940:	48 83 c2 01          	add    $0x1,%rdx
  402944:	0f b6 02             	movzbl (%rdx),%eax
  402947:	84 c0                	test   %al,%al
  402949:	0f 84 9c 00 00 00    	je     4029eb <driver_initialize+0x3db>
  40294f:	3c 20                	cmp    $0x20,%al
  402951:	77 ed                	ja     402940 <driver_initialize+0x330>
  402953:	48 0f a3 c1          	bt     %rax,%rcx
  402957:	73 e7                	jae    402940 <driver_initialize+0x330>
  402959:	c6 02 00             	movb   $0x0,(%rdx)
  40295c:	31 f6                	xor    %esi,%esi
  40295e:	ba 0a 00 00 00       	mov    $0xa,%edx
  402963:	e8 e8 e5 ff ff       	callq  400f50 <strtol@plt>
  402968:	b9 00 10 00 00       	mov    $0x1000,%ecx
  40296d:	48 63 d0             	movslq %eax,%rdx
  402970:	48 89 de             	mov    %rbx,%rsi
  402973:	44 89 e7             	mov    %r12d,%edi
  402976:	48 63 e8             	movslq %eax,%rbp
  402979:	e8 c2 e4 ff ff       	callq  400e40 <__read_chk@plt>
  40297e:	c6 84 2c d0 00 00 00 	movb   $0x0,0xd0(%rsp,%rbp,1)
  402985:	00 
  402986:	80 bc 24 d0 00 00 00 	cmpb   $0x59,0xd0(%rsp)
  40298d:	59 
  40298e:	0f 84 84 00 00 00    	je     402a18 <driver_initialize+0x408>
  402994:	bf d0 44 40 00       	mov    $0x4044d0,%edi
  402999:	e8 b2 e4 ff ff       	callq  400e50 <puts@plt>
  40299e:	31 c0                	xor    %eax,%eax
  4029a0:	eb 20                	jmp    4029c2 <driver_initialize+0x3b2>
  4029a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4029a8:	48 8b 3d 31 38 20 00 	mov    0x203831(%rip),%rdi        # 6061e0 <stderr@@GLIBC_2.2.5>
  4029af:	ba a8 44 40 00       	mov    $0x4044a8,%edx
  4029b4:	be 01 00 00 00       	mov    $0x1,%esi
  4029b9:	31 c0                	xor    %eax,%eax
  4029bb:	e8 70 e6 ff ff       	callq  401030 <__fprintf_chk@plt>
  4029c0:	31 c0                	xor    %eax,%eax
  4029c2:	48 8b 9c 24 d8 10 00 	mov    0x10d8(%rsp),%rbx
  4029c9:	00 
  4029ca:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  4029d1:	00 00 
  4029d3:	0f 85 87 00 00 00    	jne    402a60 <driver_initialize+0x450>
  4029d9:	48 81 c4 e8 10 00 00 	add    $0x10e8,%rsp
  4029e0:	5b                   	pop    %rbx
  4029e1:	5d                   	pop    %rbp
  4029e2:	41 5c                	pop    %r12
  4029e4:	41 5d                	pop    %r13
  4029e6:	41 5e                	pop    %r14
  4029e8:	41 5f                	pop    %r15
  4029ea:	c3                   	retq   
  4029eb:	c6 04 25 00 00 00 00 	movb   $0x0,0x0
  4029f2:	00 
  4029f3:	0f 0b                	ud2    
  4029f5:	48 ba 00 24 00 00 01 	movabs $0x100002400,%rdx
  4029fc:	00 00 00 
  4029ff:	48 0f a3 c2          	bt     %rax,%rdx
  402a03:	48 89 fa             	mov    %rdi,%rdx
  402a06:	0f 83 24 ff ff ff    	jae    402930 <driver_initialize+0x320>
  402a0c:	e9 48 ff ff ff       	jmpq   402959 <driver_initialize+0x349>
  402a11:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402a18:	80 bc 24 d1 00 00 00 	cmpb   $0x45,0xd1(%rsp)
  402a1f:	45 
  402a20:	0f 85 6e ff ff ff    	jne    402994 <driver_initialize+0x384>
  402a26:	80 bc 24 d2 00 00 00 	cmpb   $0x53,0xd2(%rsp)
  402a2d:	53 
  402a2e:	0f 85 60 ff ff ff    	jne    402994 <driver_initialize+0x384>
  402a34:	80 bc 24 d3 00 00 00 	cmpb   $0x0,0xd3(%rsp)
  402a3b:	00 
  402a3c:	0f 85 52 ff ff ff    	jne    402994 <driver_initialize+0x384>
  402a42:	b8 01 00 00 00       	mov    $0x1,%eax
  402a47:	e9 76 ff ff ff       	jmpq   4029c2 <driver_initialize+0x3b2>
  402a4c:	31 d2                	xor    %edx,%edx
  402a4e:	48 89 de             	mov    %rbx,%rsi
  402a51:	44 89 e7             	mov    %r12d,%edi
  402a54:	e8 97 e4 ff ff       	callq  400ef0 <read@plt>
  402a59:	31 ed                	xor    %ebp,%ebp
  402a5b:	e9 1e ff ff ff       	jmpq   40297e <driver_initialize+0x36e>
  402a60:	e8 3b e4 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  402a65:	90                   	nop
  402a66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402a6d:	00 00 00 

0000000000402a70 <driver_post>:
  402a70:	55                   	push   %rbp
  402a71:	48 89 e5             	mov    %rsp,%rbp
  402a74:	41 57                	push   %r15
  402a76:	41 56                	push   %r14
  402a78:	41 55                	push   %r13
  402a7a:	41 54                	push   %r12
  402a7c:	4d 89 c6             	mov    %r8,%r14
  402a7f:	53                   	push   %rbx
  402a80:	48 89 d3             	mov    %rdx,%rbx
  402a83:	48 81 ec 48 03 00 00 	sub    $0x348,%rsp
  402a8a:	48 89 bd a0 fc ff ff 	mov    %rdi,-0x360(%rbp)
  402a91:	48 89 8d a8 fc ff ff 	mov    %rcx,-0x358(%rbp)
  402a98:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402a9f:	00 00 
  402aa1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  402aa5:	31 c0                	xor    %eax,%eax
  402aa7:	e8 34 fa ff ff       	callq  4024e0 <driver_get_socket>
  402aac:	83 f8 ff             	cmp    $0xffffffff,%eax
  402aaf:	0f 84 7b 01 00 00    	je     402c30 <driver_post+0x1c0>
  402ab5:	48 89 df             	mov    %rbx,%rdi
  402ab8:	41 89 c5             	mov    %eax,%r13d
  402abb:	e8 d0 e3 ff ff       	callq  400e90 <strlen@plt>
  402ac0:	48 8d 3c 40          	lea    (%rax,%rax,2),%rdi
  402ac4:	49 89 c7             	mov    %rax,%r15
  402ac7:	e8 94 e4 ff ff       	callq  400f60 <malloc@plt>
  402acc:	4c 89 f7             	mov    %r14,%rdi
  402acf:	49 89 c4             	mov    %rax,%r12
  402ad2:	48 89 85 98 fc ff ff 	mov    %rax,-0x368(%rbp)
  402ad9:	e8 b2 e3 ff ff       	callq  400e90 <strlen@plt>
  402ade:	48 8d 3c 40          	lea    (%rax,%rax,2),%rdi
  402ae2:	e8 79 e4 ff ff       	callq  400f60 <malloc@plt>
  402ae7:	45 85 ff             	test   %r15d,%r15d
  402aea:	48 89 85 b0 fc ff ff 	mov    %rax,-0x350(%rbp)
  402af1:	0f 84 19 05 00 00    	je     403010 <driver_post+0x5a0>
  402af7:	41 8d 47 ff          	lea    -0x1(%r15),%eax
  402afb:	44 89 ad b8 fc ff ff 	mov    %r13d,-0x348(%rbp)
  402b02:	4c 89 b5 90 fc ff ff 	mov    %r14,-0x370(%rbp)
  402b09:	49 bf 19 00 00 00 00 	movabs $0x20000000000019,%r15
  402b10:	00 20 00 
  402b13:	4c 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%r11
  402b18:	4c 89 e0             	mov    %r12,%rax
  402b1b:	4c 8d a5 c0 fd ff ff 	lea    -0x240(%rbp),%r12
  402b22:	49 89 c5             	mov    %rax,%r13
  402b25:	4d 89 de             	mov    %r11,%r14
  402b28:	eb 38                	jmp    402b62 <driver_post+0xf2>
  402b2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402b30:	e8 5b e5 ff ff       	callq  401090 <__ctype_b_loc@plt>
  402b35:	48 0f be 95 bc fc ff 	movsbq -0x344(%rbp),%rdx
  402b3c:	ff 
  402b3d:	48 8b 08             	mov    (%rax),%rcx
  402b40:	f6 04 51 08          	testb  $0x8,(%rcx,%rdx,2)
  402b44:	0f 84 0e 01 00 00    	je     402c58 <driver_post+0x1e8>
  402b4a:	0f b6 85 bc fc ff ff 	movzbl -0x344(%rbp),%eax
  402b51:	49 83 c5 01          	add    $0x1,%r13
  402b55:	41 88 45 ff          	mov    %al,-0x1(%r13)
  402b59:	48 83 c3 01          	add    $0x1,%rbx
  402b5d:	4c 39 f3             	cmp    %r14,%rbx
  402b60:	74 1e                	je     402b80 <driver_post+0x110>
  402b62:	0f b6 03             	movzbl (%rbx),%eax
  402b65:	88 85 bc fc ff ff    	mov    %al,-0x344(%rbp)
  402b6b:	83 e8 2a             	sub    $0x2a,%eax
  402b6e:	3c 35                	cmp    $0x35,%al
  402b70:	77 be                	ja     402b30 <driver_post+0xc0>
  402b72:	49 0f a3 c7          	bt     %rax,%r15
  402b76:	72 d2                	jb     402b4a <driver_post+0xda>
  402b78:	eb b6                	jmp    402b30 <driver_post+0xc0>
  402b7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402b80:	4c 89 e8             	mov    %r13,%rax
  402b83:	4c 8b b5 90 fc ff ff 	mov    -0x370(%rbp),%r14
  402b8a:	44 8b ad b8 fc ff ff 	mov    -0x348(%rbp),%r13d
  402b91:	c6 00 00             	movb   $0x0,(%rax)
  402b94:	4c 89 f7             	mov    %r14,%rdi
  402b97:	e8 f4 e2 ff ff       	callq  400e90 <strlen@plt>
  402b9c:	85 c0                	test   %eax,%eax
  402b9e:	0f 84 60 04 00 00    	je     403004 <driver_post+0x594>
  402ba4:	83 e8 01             	sub    $0x1,%eax
  402ba7:	44 89 ad bc fc ff ff 	mov    %r13d,-0x344(%rbp)
  402bae:	48 8b 9d b0 fc ff ff 	mov    -0x350(%rbp),%rbx
  402bb5:	4d 8d 7c 06 01       	lea    0x1(%r14,%rax,1),%r15
  402bba:	4d 89 fd             	mov    %r15,%r13
  402bbd:	eb 2b                	jmp    402bea <driver_post+0x17a>
  402bbf:	90                   	nop
  402bc0:	e8 cb e4 ff ff       	callq  401090 <__ctype_b_loc@plt>
  402bc5:	48 8b 08             	mov    (%rax),%rcx
  402bc8:	49 0f be d7          	movsbq %r15b,%rdx
  402bcc:	f6 04 51 08          	testb  $0x8,(%rcx,%rdx,2)
  402bd0:	0f 84 ea 03 00 00    	je     402fc0 <driver_post+0x550>
  402bd6:	44 88 3b             	mov    %r15b,(%rbx)
  402bd9:	48 83 c3 01          	add    $0x1,%rbx
  402bdd:	49 83 c6 01          	add    $0x1,%r14
  402be1:	4d 39 ee             	cmp    %r13,%r14
  402be4:	0f 84 be 00 00 00    	je     402ca8 <driver_post+0x238>
  402bea:	45 0f b6 3e          	movzbl (%r14),%r15d
  402bee:	41 8d 47 d6          	lea    -0x2a(%r15),%eax
  402bf2:	3c 35                	cmp    $0x35,%al
  402bf4:	77 ca                	ja     402bc0 <driver_post+0x150>
  402bf6:	48 b9 19 00 00 00 00 	movabs $0x20000000000019,%rcx
  402bfd:	00 20 00 
  402c00:	48 0f a3 c1          	bt     %rax,%rcx
  402c04:	72 d0                	jb     402bd6 <driver_post+0x166>
  402c06:	eb b8                	jmp    402bc0 <driver_post+0x150>
  402c08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402c0f:	00 
  402c10:	48 8b 3d c9 35 20 00 	mov    0x2035c9(%rip),%rdi        # 6061e0 <stderr@@GLIBC_2.2.5>
  402c17:	ba a8 44 40 00       	mov    $0x4044a8,%edx
  402c1c:	be 01 00 00 00       	mov    $0x1,%esi
  402c21:	31 c0                	xor    %eax,%eax
  402c23:	e8 08 e4 ff ff       	callq  401030 <__fprintf_chk@plt>
  402c28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402c2f:	00 
  402c30:	31 c0                	xor    %eax,%eax
  402c32:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  402c36:	64 48 33 3c 25 28 00 	xor    %fs:0x28,%rdi
  402c3d:	00 00 
  402c3f:	0f 85 18 04 00 00    	jne    40305d <driver_post+0x5ed>
  402c45:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  402c49:	5b                   	pop    %rbx
  402c4a:	41 5c                	pop    %r12
  402c4c:	41 5d                	pop    %r13
  402c4e:	41 5e                	pop    %r14
  402c50:	41 5f                	pop    %r15
  402c52:	5d                   	pop    %rbp
  402c53:	c3                   	retq   
  402c54:	0f 1f 40 00          	nopl   0x0(%rax)
  402c58:	44 0f be 85 bc fc ff 	movsbl -0x344(%rbp),%r8d
  402c5f:	ff 
  402c60:	b9 7b 46 40 00       	mov    $0x40467b,%ecx
  402c65:	ba 08 00 00 00       	mov    $0x8,%edx
  402c6a:	be 01 00 00 00       	mov    $0x1,%esi
  402c6f:	4c 89 e7             	mov    %r12,%rdi
  402c72:	31 c0                	xor    %eax,%eax
  402c74:	49 83 c5 03          	add    $0x3,%r13
  402c78:	e8 33 e4 ff ff       	callq  4010b0 <__sprintf_chk@plt>
  402c7d:	0f b6 85 c0 fd ff ff 	movzbl -0x240(%rbp),%eax
  402c84:	41 88 45 fd          	mov    %al,-0x3(%r13)
  402c88:	0f b6 85 c1 fd ff ff 	movzbl -0x23f(%rbp),%eax
  402c8f:	41 88 45 fe          	mov    %al,-0x2(%r13)
  402c93:	0f b6 85 c2 fd ff ff 	movzbl -0x23e(%rbp),%eax
  402c9a:	41 88 45 ff          	mov    %al,-0x1(%r13)
  402c9e:	e9 b6 fe ff ff       	jmpq   402b59 <driver_post+0xe9>
  402ca3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402ca8:	44 8b ad bc fc ff ff 	mov    -0x344(%rbp),%r13d
  402caf:	4c 8b 85 98 fc ff ff 	mov    -0x368(%rbp),%r8
  402cb6:	4c 8b 8d a8 fc ff ff 	mov    -0x358(%rbp),%r9
  402cbd:	48 83 ec 08          	sub    $0x8,%rsp
  402cc1:	c6 03 00             	movb   $0x0,(%rbx)
  402cc4:	ff b5 b0 fc ff ff    	pushq  -0x350(%rbp)
  402cca:	b9 20 45 40 00       	mov    $0x404520,%ecx
  402ccf:	ba 00 02 00 00       	mov    $0x200,%edx
  402cd4:	be 01 00 00 00       	mov    $0x1,%esi
  402cd9:	4c 89 e7             	mov    %r12,%rdi
  402cdc:	31 c0                	xor    %eax,%eax
  402cde:	e8 cd e3 ff ff       	callq  4010b0 <__sprintf_chk@plt>
  402ce3:	4d 89 e0             	mov    %r12,%r8
  402ce6:	41 8b 10             	mov    (%r8),%edx
  402ce9:	49 83 c0 04          	add    $0x4,%r8
  402ced:	8d 82 ff fe fe fe    	lea    -0x1010101(%rdx),%eax
  402cf3:	f7 d2                	not    %edx
  402cf5:	21 d0                	and    %edx,%eax
  402cf7:	25 80 80 80 80       	and    $0x80808080,%eax
  402cfc:	74 e8                	je     402ce6 <driver_post+0x276>
  402cfe:	89 c2                	mov    %eax,%edx
  402d00:	48 8d 9d c0 fc ff ff 	lea    -0x340(%rbp),%rbx
  402d07:	b9 1a 46 40 00       	mov    $0x40461a,%ecx
  402d0c:	c1 ea 10             	shr    $0x10,%edx
  402d0f:	a9 80 80 00 00       	test   $0x8080,%eax
  402d14:	be 01 00 00 00       	mov    $0x1,%esi
  402d19:	0f 44 c2             	cmove  %edx,%eax
  402d1c:	49 8d 50 02          	lea    0x2(%r8),%rdx
  402d20:	89 c7                	mov    %eax,%edi
  402d22:	4c 0f 44 c2          	cmove  %rdx,%r8
  402d26:	40 00 c7             	add    %al,%dil
  402d29:	ba 00 01 00 00       	mov    $0x100,%edx
  402d2e:	49 83 d8 03          	sbb    $0x3,%r8
  402d32:	48 89 df             	mov    %rbx,%rdi
  402d35:	31 c0                	xor    %eax,%eax
  402d37:	4d 29 e0             	sub    %r12,%r8
  402d3a:	e8 71 e3 ff ff       	callq  4010b0 <__sprintf_chk@plt>
  402d3f:	ba 1b 00 00 00       	mov    $0x1b,%edx
  402d44:	be 82 46 40 00       	mov    $0x404682,%esi
  402d49:	44 89 ef             	mov    %r13d,%edi
  402d4c:	e8 1f e1 ff ff       	callq  400e70 <write@plt>
  402d51:	ba 06 00 00 00       	mov    $0x6,%edx
  402d56:	be 48 46 40 00       	mov    $0x404648,%esi
  402d5b:	44 89 ef             	mov    %r13d,%edi
  402d5e:	e8 0d e1 ff ff       	callq  400e70 <write@plt>
  402d63:	4c 8b bd a0 fc ff ff 	mov    -0x360(%rbp),%r15
  402d6a:	4c 89 ff             	mov    %r15,%rdi
  402d6d:	e8 1e e1 ff ff       	callq  400e90 <strlen@plt>
  402d72:	4c 89 fe             	mov    %r15,%rsi
  402d75:	48 89 c2             	mov    %rax,%rdx
  402d78:	44 89 ef             	mov    %r13d,%edi
  402d7b:	e8 f0 e0 ff ff       	callq  400e70 <write@plt>
  402d80:	ba 46 00 00 00       	mov    $0x46,%edx
  402d85:	be 48 45 40 00       	mov    $0x404548,%esi
  402d8a:	44 89 ef             	mov    %r13d,%edi
  402d8d:	e8 de e0 ff ff       	callq  400e70 <write@plt>
  402d92:	48 89 da             	mov    %rbx,%rdx
  402d95:	8b 0a                	mov    (%rdx),%ecx
  402d97:	48 83 c2 04          	add    $0x4,%rdx
  402d9b:	8d 81 ff fe fe fe    	lea    -0x1010101(%rcx),%eax
  402da1:	f7 d1                	not    %ecx
  402da3:	21 c8                	and    %ecx,%eax
  402da5:	25 80 80 80 80       	and    $0x80808080,%eax
  402daa:	74 e9                	je     402d95 <driver_post+0x325>
  402dac:	89 c1                	mov    %eax,%ecx
  402dae:	44 89 ef             	mov    %r13d,%edi
  402db1:	c1 e9 10             	shr    $0x10,%ecx
  402db4:	a9 80 80 00 00       	test   $0x8080,%eax
  402db9:	0f 44 c1             	cmove  %ecx,%eax
  402dbc:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
  402dc0:	89 c6                	mov    %eax,%esi
  402dc2:	48 0f 44 d1          	cmove  %rcx,%rdx
  402dc6:	40 00 c6             	add    %al,%sil
  402dc9:	48 89 de             	mov    %rbx,%rsi
  402dcc:	48 83 da 03          	sbb    $0x3,%rdx
  402dd0:	48 29 da             	sub    %rbx,%rdx
  402dd3:	e8 98 e0 ff ff       	callq  400e70 <write@plt>
  402dd8:	ba 1a 00 00 00       	mov    $0x1a,%edx
  402ddd:	be 4f 46 40 00       	mov    $0x40464f,%esi
  402de2:	44 89 ef             	mov    %r13d,%edi
  402de5:	e8 86 e0 ff ff       	callq  400e70 <write@plt>
  402dea:	4c 89 e2             	mov    %r12,%rdx
  402ded:	8b 0a                	mov    (%rdx),%ecx
  402def:	48 83 c2 04          	add    $0x4,%rdx
  402df3:	8d 81 ff fe fe fe    	lea    -0x1010101(%rcx),%eax
  402df9:	f7 d1                	not    %ecx
  402dfb:	21 c8                	and    %ecx,%eax
  402dfd:	25 80 80 80 80       	and    $0x80808080,%eax
  402e02:	74 e9                	je     402ded <driver_post+0x37d>
  402e04:	89 c1                	mov    %eax,%ecx
  402e06:	44 89 ef             	mov    %r13d,%edi
  402e09:	4d 89 e6             	mov    %r12,%r14
  402e0c:	c1 e9 10             	shr    $0x10,%ecx
  402e0f:	a9 80 80 00 00       	test   $0x8080,%eax
  402e14:	0f 44 c1             	cmove  %ecx,%eax
  402e17:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
  402e1b:	89 c6                	mov    %eax,%esi
  402e1d:	48 0f 44 d1          	cmove  %rcx,%rdx
  402e21:	40 00 c6             	add    %al,%sil
  402e24:	4c 89 e6             	mov    %r12,%rsi
  402e27:	48 83 da 03          	sbb    $0x3,%rdx
  402e2b:	4c 29 e2             	sub    %r12,%rdx
  402e2e:	e8 3d e0 ff ff       	callq  400e70 <write@plt>
  402e33:	58                   	pop    %rax
  402e34:	5a                   	pop    %rdx
  402e35:	eb 1a                	jmp    402e51 <driver_post+0x3e1>
  402e37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  402e3e:	00 00 
  402e40:	48 89 d8             	mov    %rbx,%rax
  402e43:	49 89 de             	mov    %rbx,%r14
  402e46:	4c 29 e0             	sub    %r12,%rax
  402e49:	48 3d fe 01 00 00    	cmp    $0x1fe,%rax
  402e4f:	7f 26                	jg     402e77 <driver_post+0x407>
  402e51:	4c 89 f6             	mov    %r14,%rsi
  402e54:	44 89 ef             	mov    %r13d,%edi
  402e57:	ba 01 00 00 00       	mov    $0x1,%edx
  402e5c:	e8 8f e0 ff ff       	callq  400ef0 <read@plt>
  402e61:	49 8d 76 fd          	lea    -0x3(%r14),%rsi
  402e65:	b9 04 00 00 00       	mov    $0x4,%ecx
  402e6a:	bf 65 46 40 00       	mov    $0x404665,%edi
  402e6f:	49 8d 5e 01          	lea    0x1(%r14),%rbx
  402e73:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402e75:	75 c9                	jne    402e40 <driver_post+0x3d0>
  402e77:	be 20 00 00 00       	mov    $0x20,%esi
  402e7c:	4c 89 e7             	mov    %r12,%rdi
  402e7f:	e8 2c e0 ff ff       	callq  400eb0 <strchr@plt>
  402e84:	48 85 c0             	test   %rax,%rax
  402e87:	0f 84 a3 fd ff ff    	je     402c30 <driver_post+0x1c0>
  402e8d:	0f be 50 01          	movsbl 0x1(%rax),%edx
  402e91:	0f be 48 02          	movsbl 0x2(%rax),%ecx
  402e95:	0f be 40 03          	movsbl 0x3(%rax),%eax
  402e99:	83 ea 30             	sub    $0x30,%edx
  402e9c:	8d 8c 89 10 ff ff ff 	lea    -0xf0(%rcx,%rcx,4),%ecx
  402ea3:	6b d2 64             	imul   $0x64,%edx,%edx
  402ea6:	8d 14 4a             	lea    (%rdx,%rcx,2),%edx
  402ea9:	8d 4c 02 d0          	lea    -0x30(%rdx,%rax,1),%ecx
  402ead:	81 f9 93 01 00 00    	cmp    $0x193,%ecx
  402eb3:	0f 84 d1 01 00 00    	je     40308a <driver_post+0x61a>
  402eb9:	81 f9 c8 00 00 00    	cmp    $0xc8,%ecx
  402ebf:	0f 85 4b fd ff ff    	jne    402c10 <driver_post+0x1a0>
  402ec5:	be 6a 46 40 00       	mov    $0x40466a,%esi
  402eca:	4c 89 e7             	mov    %r12,%rdi
  402ecd:	e8 9e e1 ff ff       	callq  401070 <strstr@plt>
  402ed2:	48 85 c0             	test   %rax,%rax
  402ed5:	0f 84 6e 01 00 00    	je     403049 <driver_post+0x5d9>
  402edb:	48 8d 78 10          	lea    0x10(%rax),%rdi
  402edf:	0f b6 40 10          	movzbl 0x10(%rax),%eax
  402ee3:	84 c0                	test   %al,%al
  402ee5:	0f 84 38 01 00 00    	je     403023 <driver_post+0x5b3>
  402eeb:	3c 20                	cmp    $0x20,%al
  402eed:	0f 86 3a 01 00 00    	jbe    40302d <driver_post+0x5bd>
  402ef3:	48 89 fa             	mov    %rdi,%rdx
  402ef6:	48 b9 00 24 00 00 01 	movabs $0x100002400,%rcx
  402efd:	00 00 00 
  402f00:	48 83 c2 01          	add    $0x1,%rdx
  402f04:	0f b6 02             	movzbl (%rdx),%eax
  402f07:	84 c0                	test   %al,%al
  402f09:	0f 84 14 01 00 00    	je     403023 <driver_post+0x5b3>
  402f0f:	3c 20                	cmp    $0x20,%al
  402f11:	77 ed                	ja     402f00 <driver_post+0x490>
  402f13:	48 0f a3 c1          	bt     %rax,%rcx
  402f17:	73 e7                	jae    402f00 <driver_post+0x490>
  402f19:	c6 02 00             	movb   $0x0,(%rdx)
  402f1c:	31 f6                	xor    %esi,%esi
  402f1e:	ba 0a 00 00 00       	mov    $0xa,%edx
  402f23:	e8 28 e0 ff ff       	callq  400f50 <strtol@plt>
  402f28:	b9 00 02 00 00       	mov    $0x200,%ecx
  402f2d:	48 63 d0             	movslq %eax,%rdx
  402f30:	4c 89 e6             	mov    %r12,%rsi
  402f33:	44 89 ef             	mov    %r13d,%edi
  402f36:	48 63 d8             	movslq %eax,%rbx
  402f39:	e8 02 df ff ff       	callq  400e40 <__read_chk@plt>
  402f3e:	48 8b bd 98 fc ff ff 	mov    -0x368(%rbp),%rdi
  402f45:	c6 84 1d c0 fd ff ff 	movb   $0x0,-0x240(%rbp,%rbx,1)
  402f4c:	00 
  402f4d:	e8 de de ff ff       	callq  400e30 <free@plt>
  402f52:	48 8b bd b0 fc ff ff 	mov    -0x350(%rbp),%rdi
  402f59:	e8 d2 de ff ff       	callq  400e30 <free@plt>
  402f5e:	bf 9e 46 40 00       	mov    $0x40469e,%edi
  402f63:	b9 08 00 00 00       	mov    $0x8,%ecx
  402f68:	4c 89 e6             	mov    %r12,%rsi
  402f6b:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402f6d:	0f 84 ef 00 00 00    	je     403062 <driver_post+0x5f2>
  402f73:	0f b6 95 c0 fd ff ff 	movzbl -0x240(%rbp),%edx
  402f7a:	b8 59 00 00 00       	mov    $0x59,%eax
  402f7f:	29 d0                	sub    %edx,%eax
  402f81:	75 2d                	jne    402fb0 <driver_post+0x540>
  402f83:	0f b6 95 c1 fd ff ff 	movzbl -0x23f(%rbp),%edx
  402f8a:	b8 45 00 00 00       	mov    $0x45,%eax
  402f8f:	29 d0                	sub    %edx,%eax
  402f91:	75 1d                	jne    402fb0 <driver_post+0x540>
  402f93:	0f b6 95 c2 fd ff ff 	movzbl -0x23e(%rbp),%edx
  402f9a:	b8 53 00 00 00       	mov    $0x53,%eax
  402f9f:	29 d0                	sub    %edx,%eax
  402fa1:	75 0d                	jne    402fb0 <driver_post+0x540>
  402fa3:	0f b6 85 c3 fd ff ff 	movzbl -0x23d(%rbp),%eax
  402faa:	f7 d8                	neg    %eax
  402fac:	0f 1f 40 00          	nopl   0x0(%rax)
  402fb0:	85 c0                	test   %eax,%eax
  402fb2:	0f 94 c0             	sete   %al
  402fb5:	0f b6 c0             	movzbl %al,%eax
  402fb8:	e9 75 fc ff ff       	jmpq   402c32 <driver_post+0x1c2>
  402fbd:	0f 1f 00             	nopl   (%rax)
  402fc0:	45 0f be c7          	movsbl %r15b,%r8d
  402fc4:	b9 7b 46 40 00       	mov    $0x40467b,%ecx
  402fc9:	ba 08 00 00 00       	mov    $0x8,%edx
  402fce:	be 01 00 00 00       	mov    $0x1,%esi
  402fd3:	4c 89 e7             	mov    %r12,%rdi
  402fd6:	31 c0                	xor    %eax,%eax
  402fd8:	e8 d3 e0 ff ff       	callq  4010b0 <__sprintf_chk@plt>
  402fdd:	0f b6 85 c0 fd ff ff 	movzbl -0x240(%rbp),%eax
  402fe4:	48 83 c3 03          	add    $0x3,%rbx
  402fe8:	88 43 fd             	mov    %al,-0x3(%rbx)
  402feb:	0f b6 85 c1 fd ff ff 	movzbl -0x23f(%rbp),%eax
  402ff2:	88 43 fe             	mov    %al,-0x2(%rbx)
  402ff5:	0f b6 85 c2 fd ff ff 	movzbl -0x23e(%rbp),%eax
  402ffc:	88 43 ff             	mov    %al,-0x1(%rbx)
  402fff:	e9 d9 fb ff ff       	jmpq   402bdd <driver_post+0x16d>
  403004:	48 8b 9d b0 fc ff ff 	mov    -0x350(%rbp),%rbx
  40300b:	e9 9f fc ff ff       	jmpq   402caf <driver_post+0x23f>
  403010:	48 8b 85 98 fc ff ff 	mov    -0x368(%rbp),%rax
  403017:	4c 8d a5 c0 fd ff ff 	lea    -0x240(%rbp),%r12
  40301e:	e9 6e fb ff ff       	jmpq   402b91 <driver_post+0x121>
  403023:	c6 04 25 00 00 00 00 	movb   $0x0,0x0
  40302a:	00 
  40302b:	0f 0b                	ud2    
  40302d:	48 ba 00 24 00 00 01 	movabs $0x100002400,%rdx
  403034:	00 00 00 
  403037:	48 0f a3 c2          	bt     %rax,%rdx
  40303b:	48 89 fa             	mov    %rdi,%rdx
  40303e:	0f 83 b2 fe ff ff    	jae    402ef6 <driver_post+0x486>
  403044:	e9 d0 fe ff ff       	jmpq   402f19 <driver_post+0x4a9>
  403049:	31 d2                	xor    %edx,%edx
  40304b:	4c 89 e6             	mov    %r12,%rsi
  40304e:	44 89 ef             	mov    %r13d,%edi
  403051:	e8 9a de ff ff       	callq  400ef0 <read@plt>
  403056:	31 db                	xor    %ebx,%ebx
  403058:	e9 e1 fe ff ff       	jmpq   402f3e <driver_post+0x4ce>
  40305d:	e8 3e de ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  403062:	bf a6 46 40 00       	mov    $0x4046a6,%edi
  403067:	e8 e4 dd ff ff       	callq  400e50 <puts@plt>
  40306c:	bf af 46 40 00       	mov    $0x4046af,%edi
  403071:	e8 da dd ff ff       	callq  400e50 <puts@plt>
  403076:	bf b8 45 40 00       	mov    $0x4045b8,%edi
  40307b:	e8 d0 dd ff ff       	callq  400e50 <puts@plt>
  403080:	bf 08 00 00 00       	mov    $0x8,%edi
  403085:	e8 76 df ff ff       	callq  401000 <exit@plt>
  40308a:	48 8b 0d 4f 31 20 00 	mov    0x20314f(%rip),%rcx        # 6061e0 <stderr@@GLIBC_2.2.5>
  403091:	bf 90 45 40 00       	mov    $0x404590,%edi
  403096:	ba 26 00 00 00       	mov    $0x26,%edx
  40309b:	be 01 00 00 00       	mov    $0x1,%esi
  4030a0:	e8 7b df ff ff       	callq  401020 <fwrite@plt>
  4030a5:	bf 10 00 00 00       	mov    $0x10,%edi
  4030aa:	e8 51 df ff ff       	callq  401000 <exit@plt>
  4030af:	90                   	nop

00000000004030b0 <sha256_transform>:
  4030b0:	41 57                	push   %r15
  4030b2:	41 56                	push   %r14
  4030b4:	41 b8 10 00 00 00    	mov    $0x10,%r8d
  4030ba:	41 55                	push   %r13
  4030bc:	41 54                	push   %r12
  4030be:	55                   	push   %rbp
  4030bf:	53                   	push   %rbx
  4030c0:	66 0f ef f6          	pxor   %xmm6,%xmm6
  4030c4:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
  4030cb:	66 0f 6f 0d 0d 17 00 	movdqa 0x170d(%rip),%xmm1        # 4047e0 <k+0x100>
  4030d2:	00 
  4030d3:	4c 8d 54 24 44       	lea    0x44(%rsp),%r10
  4030d8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4030df:	00 00 
  4030e1:	48 89 84 24 28 01 00 	mov    %rax,0x128(%rsp)
  4030e8:	00 
  4030e9:	31 c0                	xor    %eax,%eax
  4030eb:	f3 0f 6f 06          	movdqu (%rsi),%xmm0
  4030ef:	66 44 0f 6f c1       	movdqa %xmm1,%xmm8
  4030f4:	66 0f 6f e9          	movdqa %xmm1,%xmm5
  4030f8:	f3 0f 6f 5e 10       	movdqu 0x10(%rsi),%xmm3
  4030fd:	66 44 0f db c0       	pand   %xmm0,%xmm8
  403102:	66 0f 71 d0 08       	psrlw  $0x8,%xmm0
  403107:	66 0f 6f f9          	movdqa %xmm1,%xmm7
  40310b:	66 0f db eb          	pand   %xmm3,%xmm5
  40310f:	66 0f 71 d3 08       	psrlw  $0x8,%xmm3
  403114:	f3 0f 6f 56 20       	movdqu 0x20(%rsi),%xmm2
  403119:	66 0f 67 c3          	packuswb %xmm3,%xmm0
  40311d:	66 0f 6f d9          	movdqa %xmm1,%xmm3
  403121:	66 44 0f 67 c5       	packuswb %xmm5,%xmm8
  403126:	f3 0f 6f 66 30       	movdqu 0x30(%rsi),%xmm4
  40312b:	66 0f 6f e9          	movdqa %xmm1,%xmm5
  40312f:	66 0f db da          	pand   %xmm2,%xmm3
  403133:	66 0f 71 d2 08       	psrlw  $0x8,%xmm2
  403138:	66 0f db ec          	pand   %xmm4,%xmm5
  40313c:	66 0f 71 d4 08       	psrlw  $0x8,%xmm4
  403141:	66 0f 67 d4          	packuswb %xmm4,%xmm2
  403145:	66 0f 6f e1          	movdqa %xmm1,%xmm4
  403149:	66 0f db f8          	pand   %xmm0,%xmm7
  40314d:	66 0f 71 d0 08       	psrlw  $0x8,%xmm0
  403152:	66 0f 67 dd          	packuswb %xmm5,%xmm3
  403156:	66 0f 6f e9          	movdqa %xmm1,%xmm5
  40315a:	66 41 0f db e0       	pand   %xmm8,%xmm4
  40315f:	66 41 0f 71 d0 08    	psrlw  $0x8,%xmm8
  403165:	66 0f db ca          	pand   %xmm2,%xmm1
  403169:	66 0f 71 d2 08       	psrlw  $0x8,%xmm2
  40316e:	66 0f db eb          	pand   %xmm3,%xmm5
  403172:	66 0f 71 d3 08       	psrlw  $0x8,%xmm3
  403177:	66 0f 67 c2          	packuswb %xmm2,%xmm0
  40317b:	66 0f 67 f9          	packuswb %xmm1,%xmm7
  40317f:	66 0f 67 e5          	packuswb %xmm5,%xmm4
  403183:	66 44 0f 67 c3       	packuswb %xmm3,%xmm8
  403188:	66 0f 6f ec          	movdqa %xmm4,%xmm5
  40318c:	66 0f 68 e6          	punpckhbw %xmm6,%xmm4
  403190:	66 41 0f 6f d8       	movdqa %xmm8,%xmm3
  403195:	66 41 0f 6f c8       	movdqa %xmm8,%xmm1
  40319a:	66 44 0f 6f c0       	movdqa %xmm0,%xmm8
  40319f:	66 0f 60 ee          	punpcklbw %xmm6,%xmm5
  4031a3:	66 0f 6f d4          	movdqa %xmm4,%xmm2
  4031a7:	66 0f 6f e7          	movdqa %xmm7,%xmm4
  4031ab:	66 0f 60 de          	punpcklbw %xmm6,%xmm3
  4031af:	66 0f 68 fe          	punpckhbw %xmm6,%xmm7
  4031b3:	66 0f 60 e6          	punpcklbw %xmm6,%xmm4
  4031b7:	66 0f 68 ce          	punpckhbw %xmm6,%xmm1
  4031bb:	66 44 0f 60 c6       	punpcklbw %xmm6,%xmm8
  4031c0:	66 0f 68 c6          	punpckhbw %xmm6,%xmm0
  4031c4:	66 44 0f 6f cc       	movdqa %xmm4,%xmm9
  4031c9:	66 0f ef f6          	pxor   %xmm6,%xmm6
  4031cd:	66 44 0f 61 ce       	punpcklwd %xmm6,%xmm9
  4031d2:	66 0f 69 e6          	punpckhwd %xmm6,%xmm4
  4031d6:	66 45 0f 6f d1       	movdqa %xmm9,%xmm10
  4031db:	66 44 0f 6f cd       	movdqa %xmm5,%xmm9
  4031e0:	66 0f 69 ee          	punpckhwd %xmm6,%xmm5
  4031e4:	66 0f 72 f4 10       	pslld  $0x10,%xmm4
  4031e9:	66 41 0f 72 f2 10    	pslld  $0x10,%xmm10
  4031ef:	66 44 0f 61 ce       	punpcklwd %xmm6,%xmm9
  4031f4:	66 0f 72 f5 18       	pslld  $0x18,%xmm5
  4031f9:	66 0f eb e5          	por    %xmm5,%xmm4
  4031fd:	66 41 0f 72 f1 18    	pslld  $0x18,%xmm9
  403203:	66 45 0f eb ca       	por    %xmm10,%xmm9
  403208:	66 45 0f 6f d0       	movdqa %xmm8,%xmm10
  40320d:	66 44 0f 69 c6       	punpckhwd %xmm6,%xmm8
  403212:	66 44 0f 61 d6       	punpcklwd %xmm6,%xmm10
  403217:	66 41 0f eb e0       	por    %xmm8,%xmm4
  40321c:	66 45 0f eb d1       	por    %xmm9,%xmm10
  403221:	66 44 0f 6f cb       	movdqa %xmm3,%xmm9
  403226:	66 0f 69 de          	punpckhwd %xmm6,%xmm3
  40322a:	66 44 0f 61 ce       	punpcklwd %xmm6,%xmm9
  40322f:	66 0f 72 f3 08       	pslld  $0x8,%xmm3
  403234:	66 0f eb dc          	por    %xmm4,%xmm3
  403238:	66 41 0f 72 f1 08    	pslld  $0x8,%xmm9
  40323e:	66 45 0f eb ca       	por    %xmm10,%xmm9
  403243:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  403248:	66 0f 6f df          	movdqa %xmm7,%xmm3
  40324c:	66 0f 69 fe          	punpckhwd %xmm6,%xmm7
  403250:	66 45 0f 7e cb       	movd   %xmm9,%r11d
  403255:	66 0f 61 de          	punpcklwd %xmm6,%xmm3
  403259:	44 0f 29 4c 24 20    	movaps %xmm9,0x20(%rsp)
  40325f:	66 0f 72 f7 10       	pslld  $0x10,%xmm7
  403264:	66 0f 6f e3          	movdqa %xmm3,%xmm4
  403268:	66 0f 6f da          	movdqa %xmm2,%xmm3
  40326c:	66 0f 69 d6          	punpckhwd %xmm6,%xmm2
  403270:	66 0f 72 f4 10       	pslld  $0x10,%xmm4
  403275:	66 0f 61 de          	punpcklwd %xmm6,%xmm3
  403279:	66 0f 72 f2 18       	pslld  $0x18,%xmm2
  40327e:	66 0f eb d7          	por    %xmm7,%xmm2
  403282:	66 0f 72 f3 18       	pslld  $0x18,%xmm3
  403287:	66 0f eb dc          	por    %xmm4,%xmm3
  40328b:	66 0f 6f e0          	movdqa %xmm0,%xmm4
  40328f:	66 0f 69 c6          	punpckhwd %xmm6,%xmm0
  403293:	66 0f 61 e6          	punpcklwd %xmm6,%xmm4
  403297:	66 0f eb c2          	por    %xmm2,%xmm0
  40329b:	66 0f eb e3          	por    %xmm3,%xmm4
  40329f:	66 0f 6f d9          	movdqa %xmm1,%xmm3
  4032a3:	66 0f 69 ce          	punpckhwd %xmm6,%xmm1
  4032a7:	66 0f 61 de          	punpcklwd %xmm6,%xmm3
  4032ab:	66 0f 72 f1 08       	pslld  $0x8,%xmm1
  4032b0:	66 0f eb c1          	por    %xmm1,%xmm0
  4032b4:	66 0f 72 f3 08       	pslld  $0x8,%xmm3
  4032b9:	66 0f eb dc          	por    %xmm4,%xmm3
  4032bd:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  4032c2:	44 8b 4c 24 58       	mov    0x58(%rsp),%r9d
  4032c7:	8b 44 24 5c          	mov    0x5c(%rsp),%eax
  4032cb:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
  4032d0:	44 89 c9             	mov    %r9d,%ecx
  4032d3:	44 89 ca             	mov    %r9d,%edx
  4032d6:	41 c1 e9 0a          	shr    $0xa,%r9d
  4032da:	c1 c1 0f             	rol    $0xf,%ecx
  4032dd:	c1 c2 0d             	rol    $0xd,%edx
  4032e0:	41 83 c0 02          	add    $0x2,%r8d
  4032e4:	31 ca                	xor    %ecx,%edx
  4032e6:	49 83 c2 08          	add    $0x8,%r10
  4032ea:	41 8b 72 d8          	mov    -0x28(%r10),%esi
  4032ee:	44 31 ca             	xor    %r9d,%edx
  4032f1:	44 01 da             	add    %r11d,%edx
  4032f4:	41 03 52 f8          	add    -0x8(%r10),%edx
  4032f8:	45 8b 5a dc          	mov    -0x24(%r10),%r11d
  4032fc:	41 89 f1             	mov    %esi,%r9d
  4032ff:	89 f1                	mov    %esi,%ecx
  403301:	c1 c1 0e             	rol    $0xe,%ecx
  403304:	41 c1 c9 07          	ror    $0x7,%r9d
  403308:	41 31 c9             	xor    %ecx,%r9d
  40330b:	89 f1                	mov    %esi,%ecx
  40330d:	c1 e9 03             	shr    $0x3,%ecx
  403310:	41 31 c9             	xor    %ecx,%r9d
  403313:	89 c1                	mov    %eax,%ecx
  403315:	41 01 d1             	add    %edx,%r9d
  403318:	89 c2                	mov    %eax,%edx
  40331a:	c1 c1 0d             	rol    $0xd,%ecx
  40331d:	c1 c2 0f             	rol    $0xf,%edx
  403320:	c1 e8 0a             	shr    $0xa,%eax
  403323:	45 89 4a 14          	mov    %r9d,0x14(%r10)
  403327:	31 d1                	xor    %edx,%ecx
  403329:	44 89 da             	mov    %r11d,%edx
  40332c:	31 c8                	xor    %ecx,%eax
  40332e:	41 03 42 fc          	add    -0x4(%r10),%eax
  403332:	c1 c2 0e             	rol    $0xe,%edx
  403335:	8d 0c 30             	lea    (%rax,%rsi,1),%ecx
  403338:	44 89 d8             	mov    %r11d,%eax
  40333b:	44 89 de             	mov    %r11d,%esi
  40333e:	c1 c8 07             	ror    $0x7,%eax
  403341:	c1 ee 03             	shr    $0x3,%esi
  403344:	31 d0                	xor    %edx,%eax
  403346:	31 f0                	xor    %esi,%eax
  403348:	01 c8                	add    %ecx,%eax
  40334a:	41 89 42 18          	mov    %eax,0x18(%r10)
  40334e:	41 83 f8 3e          	cmp    $0x3e,%r8d
  403352:	0f 85 78 ff ff ff    	jne    4032d0 <sha256_transform+0x220>
  403358:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40335f:	00 
  403360:	41 8d 40 fe          	lea    -0x2(%r8),%eax
  403364:	44 89 c6             	mov    %r8d,%esi
  403367:	8b 54 84 20          	mov    0x20(%rsp,%rax,4),%edx
  40336b:	41 8d 40 f1          	lea    -0xf(%r8),%eax
  40336f:	8b 44 84 20          	mov    0x20(%rsp,%rax,4),%eax
  403373:	41 89 d1             	mov    %edx,%r9d
  403376:	89 d1                	mov    %edx,%ecx
  403378:	c1 ea 0a             	shr    $0xa,%edx
  40337b:	41 c1 c1 0f          	rol    $0xf,%r9d
  40337f:	c1 c1 0d             	rol    $0xd,%ecx
  403382:	44 31 c9             	xor    %r9d,%ecx
  403385:	45 8d 48 f9          	lea    -0x7(%r8),%r9d
  403389:	31 ca                	xor    %ecx,%edx
  40338b:	41 8d 48 f0          	lea    -0x10(%r8),%ecx
  40338f:	41 83 c0 01          	add    $0x1,%r8d
  403393:	8b 4c 8c 20          	mov    0x20(%rsp,%rcx,4),%ecx
  403397:	42 03 4c 8c 20       	add    0x20(%rsp,%r9,4),%ecx
  40339c:	41 89 c1             	mov    %eax,%r9d
  40339f:	41 c1 c9 07          	ror    $0x7,%r9d
  4033a3:	01 ca                	add    %ecx,%edx
  4033a5:	89 c1                	mov    %eax,%ecx
  4033a7:	c1 e8 03             	shr    $0x3,%eax
  4033aa:	c1 c1 0e             	rol    $0xe,%ecx
  4033ad:	44 31 c9             	xor    %r9d,%ecx
  4033b0:	31 c8                	xor    %ecx,%eax
  4033b2:	01 d0                	add    %edx,%eax
  4033b4:	41 83 f8 40          	cmp    $0x40,%r8d
  4033b8:	89 44 b4 20          	mov    %eax,0x20(%rsp,%rsi,4)
  4033bc:	75 a2                	jne    403360 <sha256_transform+0x2b0>
  4033be:	8b 5f 54             	mov    0x54(%rdi),%ebx
  4033c1:	8b 47 50             	mov    0x50(%rdi),%eax
  4033c4:	45 31 c9             	xor    %r9d,%r9d
  4033c7:	8b 4f 68             	mov    0x68(%rdi),%ecx
  4033ca:	8b 57 6c             	mov    0x6c(%rdi),%edx
  4033cd:	44 8b 6f 58          	mov    0x58(%rdi),%r13d
  4033d1:	44 8b 77 5c          	mov    0x5c(%rdi),%r14d
  4033d5:	41 89 da             	mov    %ebx,%r10d
  4033d8:	89 5c 24 08          	mov    %ebx,0x8(%rsp)
  4033dc:	8b 5f 60             	mov    0x60(%rdi),%ebx
  4033df:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4033e3:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
  4033e7:	89 cd                	mov    %ecx,%ebp
  4033e9:	89 54 24 18          	mov    %edx,0x18(%rsp)
  4033ed:	45 89 f4             	mov    %r14d,%r12d
  4033f0:	45 89 eb             	mov    %r13d,%r11d
  4033f3:	89 de                	mov    %ebx,%esi
  4033f5:	89 5c 24 0c          	mov    %ebx,0xc(%rsp)
  4033f9:	8b 5f 64             	mov    0x64(%rdi),%ebx
  4033fc:	41 89 c0             	mov    %eax,%r8d
  4033ff:	41 89 d7             	mov    %edx,%r15d
  403402:	89 5c 24 10          	mov    %ebx,0x10(%rsp)
  403406:	eb 17                	jmp    40341f <sha256_transform+0x36f>
  403408:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40340f:	00 
  403410:	89 dd                	mov    %ebx,%ebp
  403412:	45 89 d3             	mov    %r10d,%r11d
  403415:	89 f3                	mov    %esi,%ebx
  403417:	45 89 c2             	mov    %r8d,%r10d
  40341a:	89 ce                	mov    %ecx,%esi
  40341c:	41 89 c0             	mov    %eax,%r8d
  40341f:	89 f1                	mov    %esi,%ecx
  403421:	89 f0                	mov    %esi,%eax
  403423:	89 f2                	mov    %esi,%edx
  403425:	c1 c9 06             	ror    $0x6,%ecx
  403428:	c1 c8 0b             	ror    $0xb,%eax
  40342b:	c1 c2 07             	rol    $0x7,%edx
  40342e:	31 c8                	xor    %ecx,%eax
  403430:	31 d0                	xor    %edx,%eax
  403432:	42 8b 54 0c 20       	mov    0x20(%rsp,%r9,1),%edx
  403437:	41 03 91 e0 46 40 00 	add    0x4046e0(%r9),%edx
  40343e:	49 83 c1 04          	add    $0x4,%r9
  403442:	8d 0c 10             	lea    (%rax,%rdx,1),%ecx
  403445:	89 f0                	mov    %esi,%eax
  403447:	89 f2                	mov    %esi,%edx
  403449:	f7 d0                	not    %eax
  40344b:	21 da                	and    %ebx,%edx
  40344d:	21 e8                	and    %ebp,%eax
  40344f:	31 d0                	xor    %edx,%eax
  403451:	44 89 c2             	mov    %r8d,%edx
  403454:	01 c8                	add    %ecx,%eax
  403456:	c1 ca 02             	ror    $0x2,%edx
  403459:	44 89 d1             	mov    %r10d,%ecx
  40345c:	41 01 c7             	add    %eax,%r15d
  40345f:	44 89 c0             	mov    %r8d,%eax
  403462:	44 21 d9             	and    %r11d,%ecx
  403465:	c1 c8 0d             	ror    $0xd,%eax
  403468:	31 d0                	xor    %edx,%eax
  40346a:	44 89 c2             	mov    %r8d,%edx
  40346d:	c1 c2 0a             	rol    $0xa,%edx
  403470:	31 d0                	xor    %edx,%eax
  403472:	44 89 da             	mov    %r11d,%edx
  403475:	44 31 d2             	xor    %r10d,%edx
  403478:	44 21 c2             	and    %r8d,%edx
  40347b:	31 ca                	xor    %ecx,%edx
  40347d:	43 8d 0c 27          	lea    (%r15,%r12,1),%ecx
  403481:	45 89 dc             	mov    %r11d,%r12d
  403484:	01 d0                	add    %edx,%eax
  403486:	44 01 f8             	add    %r15d,%eax
  403489:	49 81 f9 00 01 00 00 	cmp    $0x100,%r9
  403490:	41 89 ef             	mov    %ebp,%r15d
  403493:	0f 85 77 ff ff ff    	jne    403410 <sha256_transform+0x360>
  403499:	44 89 54 24 1c       	mov    %r10d,0x1c(%rsp)
  40349e:	66 0f 6e 74 24 08    	movd   0x8(%rsp),%xmm6
  4034a4:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
  4034aa:	44 89 5c 24 1c       	mov    %r11d,0x1c(%rsp)
  4034af:	66 0f 6e 7c 24 1c    	movd   0x1c(%rsp),%xmm7
  4034b5:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4034b9:	66 0f 6e 4c 24 1c    	movd   0x1c(%rsp),%xmm1
  4034bf:	44 89 44 24 1c       	mov    %r8d,0x1c(%rsp)
  4034c4:	66 0f 62 c7          	punpckldq %xmm7,%xmm0
  4034c8:	66 0f 6e 7c 24 1c    	movd   0x1c(%rsp),%xmm7
  4034ce:	44 89 6c 24 1c       	mov    %r13d,0x1c(%rsp)
  4034d3:	66 0f 6e 54 24 1c    	movd   0x1c(%rsp),%xmm2
  4034d9:	44 89 74 24 1c       	mov    %r14d,0x1c(%rsp)
  4034de:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
  4034e2:	48 8b 84 24 28 01 00 	mov    0x128(%rsp),%rax
  4034e9:	00 
  4034ea:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4034f1:	00 00 
  4034f3:	66 0f 6f f9          	movdqa %xmm1,%xmm7
  4034f7:	66 0f 6e 4c 24 04    	movd   0x4(%rsp),%xmm1
  4034fd:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  403501:	66 0f 6c f8          	punpcklqdq %xmm0,%xmm7
  403505:	66 0f 62 ce          	punpckldq %xmm6,%xmm1
  403509:	66 0f 6e 74 24 10    	movd   0x10(%rsp),%xmm6
  40350f:	66 0f 6f c7          	movdqa %xmm7,%xmm0
  403513:	66 0f 6e 7c 24 1c    	movd   0x1c(%rsp),%xmm7
  403519:	66 0f 62 d7          	punpckldq %xmm7,%xmm2
  40351d:	66 0f 6e 7c 24 18    	movd   0x18(%rsp),%xmm7
  403523:	66 0f 6c ca          	punpcklqdq %xmm2,%xmm1
  403527:	66 0f fe c1          	paddd  %xmm1,%xmm0
  40352b:	0f 11 47 50          	movups %xmm0,0x50(%rdi)
  40352f:	66 0f 6e 44 24 0c    	movd   0xc(%rsp),%xmm0
  403535:	66 0f 6e 4c 24 14    	movd   0x14(%rsp),%xmm1
  40353b:	66 0f 62 c6          	punpckldq %xmm6,%xmm0
  40353f:	66 0f 62 cf          	punpckldq %xmm7,%xmm1
  403543:	66 0f 6f d0          	movdqa %xmm0,%xmm2
  403547:	66 0f 6e 44 24 04    	movd   0x4(%rsp),%xmm0
  40354d:	89 6c 24 04          	mov    %ebp,0x4(%rsp)
  403551:	66 0f 6e 7c 24 04    	movd   0x4(%rsp),%xmm7
  403557:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
  40355b:	66 0f 6c d1          	punpcklqdq %xmm1,%xmm2
  40355f:	66 0f 6e 4c 24 04    	movd   0x4(%rsp),%xmm1
  403565:	89 74 24 04          	mov    %esi,0x4(%rsp)
  403569:	66 0f 6e 6c 24 04    	movd   0x4(%rsp),%xmm5
  40356f:	66 0f 62 c7          	punpckldq %xmm7,%xmm0
  403573:	66 0f 62 cd          	punpckldq %xmm5,%xmm1
  403577:	66 0f 6f e9          	movdqa %xmm1,%xmm5
  40357b:	66 0f 6c e8          	punpcklqdq %xmm0,%xmm5
  40357f:	66 0f 6f c5          	movdqa %xmm5,%xmm0
  403583:	66 0f fe c2          	paddd  %xmm2,%xmm0
  403587:	0f 11 47 60          	movups %xmm0,0x60(%rdi)
  40358b:	75 12                	jne    40359f <sha256_transform+0x4ef>
  40358d:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
  403594:	5b                   	pop    %rbx
  403595:	5d                   	pop    %rbp
  403596:	41 5c                	pop    %r12
  403598:	41 5d                	pop    %r13
  40359a:	41 5e                	pop    %r14
  40359c:	41 5f                	pop    %r15
  40359e:	c3                   	retq   
  40359f:	e8 fc d8 ff ff       	callq  400ea0 <__stack_chk_fail@plt>
  4035a4:	66 90                	xchg   %ax,%ax
  4035a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4035ad:	00 00 00 

00000000004035b0 <sha256_init>:
  4035b0:	c7 47 40 00 00 00 00 	movl   $0x0,0x40(%rdi)
  4035b7:	48 c7 47 48 00 00 00 	movq   $0x0,0x48(%rdi)
  4035be:	00 
  4035bf:	c7 47 50 67 e6 09 6a 	movl   $0x6a09e667,0x50(%rdi)
  4035c6:	c7 47 54 85 ae 67 bb 	movl   $0xbb67ae85,0x54(%rdi)
  4035cd:	c7 47 58 72 f3 6e 3c 	movl   $0x3c6ef372,0x58(%rdi)
  4035d4:	c7 47 5c 3a f5 4f a5 	movl   $0xa54ff53a,0x5c(%rdi)
  4035db:	c7 47 60 7f 52 0e 51 	movl   $0x510e527f,0x60(%rdi)
  4035e2:	c7 47 64 8c 68 05 9b 	movl   $0x9b05688c,0x64(%rdi)
  4035e9:	c7 47 68 ab d9 83 1f 	movl   $0x1f83d9ab,0x68(%rdi)
  4035f0:	c7 47 6c 19 cd e0 5b 	movl   $0x5be0cd19,0x6c(%rdi)
  4035f7:	c3                   	retq   
  4035f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4035ff:	00 

0000000000403600 <sha256_update>:
  403600:	48 85 d2             	test   %rdx,%rdx
  403603:	74 7d                	je     403682 <sha256_update+0x82>
  403605:	41 55                	push   %r13
  403607:	41 54                	push   %r12
  403609:	49 89 f5             	mov    %rsi,%r13
  40360c:	55                   	push   %rbp
  40360d:	53                   	push   %rbx
  40360e:	49 89 d4             	mov    %rdx,%r12
  403611:	48 89 fd             	mov    %rdi,%rbp
  403614:	31 c9                	xor    %ecx,%ecx
  403616:	31 db                	xor    %ebx,%ebx
  403618:	48 83 ec 08          	sub    $0x8,%rsp
  40361c:	8b 47 40             	mov    0x40(%rdi),%eax
  40361f:	eb 12                	jmp    403633 <sha256_update+0x33>
  403621:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  403628:	8d 4b 01             	lea    0x1(%rbx),%ecx
  40362b:	4c 39 e1             	cmp    %r12,%rcx
  40362e:	48 89 cb             	mov    %rcx,%rbx
  403631:	73 45                	jae    403678 <sha256_update+0x78>
  403633:	41 0f b6 7c 0d 00    	movzbl 0x0(%r13,%rcx,1),%edi
  403639:	89 c1                	mov    %eax,%ecx
  40363b:	83 c0 01             	add    $0x1,%eax
  40363e:	83 f8 40             	cmp    $0x40,%eax
  403641:	40 88 7c 0d 00       	mov    %dil,0x0(%rbp,%rcx,1)
  403646:	89 45 40             	mov    %eax,0x40(%rbp)
  403649:	75 dd                	jne    403628 <sha256_update+0x28>
  40364b:	48 89 ee             	mov    %rbp,%rsi
  40364e:	48 89 ef             	mov    %rbp,%rdi
  403651:	e8 5a fa ff ff       	callq  4030b0 <sha256_transform>
  403656:	8d 4b 01             	lea    0x1(%rbx),%ecx
  403659:	48 81 45 48 00 02 00 	addq   $0x200,0x48(%rbp)
  403660:	00 
  403661:	31 c0                	xor    %eax,%eax
  403663:	c7 45 40 00 00 00 00 	movl   $0x0,0x40(%rbp)
  40366a:	4c 39 e1             	cmp    %r12,%rcx
  40366d:	48 89 cb             	mov    %rcx,%rbx
  403670:	72 c1                	jb     403633 <sha256_update+0x33>
  403672:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403678:	48 83 c4 08          	add    $0x8,%rsp
  40367c:	5b                   	pop    %rbx
  40367d:	5d                   	pop    %rbp
  40367e:	41 5c                	pop    %r12
  403680:	41 5d                	pop    %r13
  403682:	f3 c3                	repz retq 
  403684:	66 90                	xchg   %ax,%ax
  403686:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40368d:	00 00 00 

0000000000403690 <sha256_final>:
  403690:	55                   	push   %rbp
  403691:	53                   	push   %rbx
  403692:	48 89 f5             	mov    %rsi,%rbp
  403695:	48 89 fb             	mov    %rdi,%rbx
  403698:	48 83 ec 08          	sub    $0x8,%rsp
  40369c:	8b 4f 40             	mov    0x40(%rdi),%ecx
  40369f:	83 f9 37             	cmp    $0x37,%ecx
  4036a2:	8d 41 01             	lea    0x1(%rcx),%eax
  4036a5:	0f 87 75 01 00 00    	ja     403820 <sha256_final+0x190>
  4036ab:	89 ca                	mov    %ecx,%edx
  4036ad:	83 f8 38             	cmp    $0x38,%eax
  4036b0:	c6 04 17 80          	movb   $0x80,(%rdi,%rdx,1)
  4036b4:	74 18                	je     4036ce <sha256_final+0x3e>
  4036b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4036bd:	00 00 00 
  4036c0:	89 c2                	mov    %eax,%edx
  4036c2:	83 c0 01             	add    $0x1,%eax
  4036c5:	83 f8 38             	cmp    $0x38,%eax
  4036c8:	c6 04 13 00          	movb   $0x0,(%rbx,%rdx,1)
  4036cc:	75 f2                	jne    4036c0 <sha256_final+0x30>
  4036ce:	8d 04 cd 00 00 00 00 	lea    0x0(,%rcx,8),%eax
  4036d5:	48 03 43 48          	add    0x48(%rbx),%rax
  4036d9:	48 89 de             	mov    %rbx,%rsi
  4036dc:	48 89 df             	mov    %rbx,%rdi
  4036df:	48 89 c2             	mov    %rax,%rdx
  4036e2:	48 89 43 48          	mov    %rax,0x48(%rbx)
  4036e6:	88 43 3f             	mov    %al,0x3f(%rbx)
  4036e9:	48 c1 ea 08          	shr    $0x8,%rdx
  4036ed:	88 53 3e             	mov    %dl,0x3e(%rbx)
  4036f0:	48 89 c2             	mov    %rax,%rdx
  4036f3:	48 c1 ea 10          	shr    $0x10,%rdx
  4036f7:	88 53 3d             	mov    %dl,0x3d(%rbx)
  4036fa:	48 89 c2             	mov    %rax,%rdx
  4036fd:	48 c1 ea 18          	shr    $0x18,%rdx
  403701:	88 53 3c             	mov    %dl,0x3c(%rbx)
  403704:	48 89 c2             	mov    %rax,%rdx
  403707:	48 c1 ea 20          	shr    $0x20,%rdx
  40370b:	88 53 3b             	mov    %dl,0x3b(%rbx)
  40370e:	48 89 c2             	mov    %rax,%rdx
  403711:	48 c1 ea 28          	shr    $0x28,%rdx
  403715:	88 53 3a             	mov    %dl,0x3a(%rbx)
  403718:	48 89 c2             	mov    %rax,%rdx
  40371b:	48 c1 e8 38          	shr    $0x38,%rax
  40371f:	48 c1 ea 30          	shr    $0x30,%rdx
  403723:	88 43 38             	mov    %al,0x38(%rbx)
  403726:	88 53 39             	mov    %dl,0x39(%rbx)
  403729:	e8 82 f9 ff ff       	callq  4030b0 <sha256_transform>
  40372e:	0f b6 43 53          	movzbl 0x53(%rbx),%eax
  403732:	88 45 00             	mov    %al,0x0(%rbp)
  403735:	0f b6 43 57          	movzbl 0x57(%rbx),%eax
  403739:	88 45 04             	mov    %al,0x4(%rbp)
  40373c:	0f b6 43 5b          	movzbl 0x5b(%rbx),%eax
  403740:	88 45 08             	mov    %al,0x8(%rbp)
  403743:	0f b6 43 5f          	movzbl 0x5f(%rbx),%eax
  403747:	88 45 0c             	mov    %al,0xc(%rbp)
  40374a:	0f b6 43 63          	movzbl 0x63(%rbx),%eax
  40374e:	88 45 10             	mov    %al,0x10(%rbp)
  403751:	0f b6 43 67          	movzbl 0x67(%rbx),%eax
  403755:	88 45 14             	mov    %al,0x14(%rbp)
  403758:	0f b6 43 6b          	movzbl 0x6b(%rbx),%eax
  40375c:	88 45 18             	mov    %al,0x18(%rbp)
  40375f:	0f b6 43 6f          	movzbl 0x6f(%rbx),%eax
  403763:	88 45 1c             	mov    %al,0x1c(%rbp)
  403766:	0f b7 43 52          	movzwl 0x52(%rbx),%eax
  40376a:	88 45 01             	mov    %al,0x1(%rbp)
  40376d:	0f b7 43 56          	movzwl 0x56(%rbx),%eax
  403771:	88 45 05             	mov    %al,0x5(%rbp)
  403774:	0f b7 43 5a          	movzwl 0x5a(%rbx),%eax
  403778:	88 45 09             	mov    %al,0x9(%rbp)
  40377b:	0f b7 43 5e          	movzwl 0x5e(%rbx),%eax
  40377f:	88 45 0d             	mov    %al,0xd(%rbp)
  403782:	0f b7 43 62          	movzwl 0x62(%rbx),%eax
  403786:	88 45 11             	mov    %al,0x11(%rbp)
  403789:	0f b7 43 66          	movzwl 0x66(%rbx),%eax
  40378d:	88 45 15             	mov    %al,0x15(%rbp)
  403790:	0f b7 43 6a          	movzwl 0x6a(%rbx),%eax
  403794:	88 45 19             	mov    %al,0x19(%rbp)
  403797:	0f b7 43 6e          	movzwl 0x6e(%rbx),%eax
  40379b:	88 45 1d             	mov    %al,0x1d(%rbp)
  40379e:	8b 43 50             	mov    0x50(%rbx),%eax
  4037a1:	c1 e8 08             	shr    $0x8,%eax
  4037a4:	88 45 02             	mov    %al,0x2(%rbp)
  4037a7:	8b 43 54             	mov    0x54(%rbx),%eax
  4037aa:	c1 e8 08             	shr    $0x8,%eax
  4037ad:	88 45 06             	mov    %al,0x6(%rbp)
  4037b0:	8b 43 58             	mov    0x58(%rbx),%eax
  4037b3:	c1 e8 08             	shr    $0x8,%eax
  4037b6:	88 45 0a             	mov    %al,0xa(%rbp)
  4037b9:	8b 43 5c             	mov    0x5c(%rbx),%eax
  4037bc:	c1 e8 08             	shr    $0x8,%eax
  4037bf:	88 45 0e             	mov    %al,0xe(%rbp)
  4037c2:	8b 43 60             	mov    0x60(%rbx),%eax
  4037c5:	c1 e8 08             	shr    $0x8,%eax
  4037c8:	88 45 12             	mov    %al,0x12(%rbp)
  4037cb:	8b 43 64             	mov    0x64(%rbx),%eax
  4037ce:	c1 e8 08             	shr    $0x8,%eax
  4037d1:	88 45 16             	mov    %al,0x16(%rbp)
  4037d4:	8b 43 68             	mov    0x68(%rbx),%eax
  4037d7:	c1 e8 08             	shr    $0x8,%eax
  4037da:	88 45 1a             	mov    %al,0x1a(%rbp)
  4037dd:	8b 43 6c             	mov    0x6c(%rbx),%eax
  4037e0:	c1 e8 08             	shr    $0x8,%eax
  4037e3:	88 45 1e             	mov    %al,0x1e(%rbp)
  4037e6:	8b 43 50             	mov    0x50(%rbx),%eax
  4037e9:	88 45 03             	mov    %al,0x3(%rbp)
  4037ec:	8b 43 54             	mov    0x54(%rbx),%eax
  4037ef:	88 45 07             	mov    %al,0x7(%rbp)
  4037f2:	8b 43 58             	mov    0x58(%rbx),%eax
  4037f5:	88 45 0b             	mov    %al,0xb(%rbp)
  4037f8:	8b 43 5c             	mov    0x5c(%rbx),%eax
  4037fb:	88 45 0f             	mov    %al,0xf(%rbp)
  4037fe:	8b 43 60             	mov    0x60(%rbx),%eax
  403801:	88 45 13             	mov    %al,0x13(%rbp)
  403804:	8b 43 64             	mov    0x64(%rbx),%eax
  403807:	88 45 17             	mov    %al,0x17(%rbp)
  40380a:	8b 43 68             	mov    0x68(%rbx),%eax
  40380d:	88 45 1b             	mov    %al,0x1b(%rbp)
  403810:	8b 43 6c             	mov    0x6c(%rbx),%eax
  403813:	88 45 1f             	mov    %al,0x1f(%rbp)
  403816:	48 83 c4 08          	add    $0x8,%rsp
  40381a:	5b                   	pop    %rbx
  40381b:	5d                   	pop    %rbp
  40381c:	c3                   	retq   
  40381d:	0f 1f 00             	nopl   (%rax)
  403820:	83 f8 3f             	cmp    $0x3f,%eax
  403823:	c6 04 0f 80          	movb   $0x80,(%rdi,%rcx,1)
  403827:	77 15                	ja     40383e <sha256_final+0x1ae>
  403829:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  403830:	89 c2                	mov    %eax,%edx
  403832:	83 c0 01             	add    $0x1,%eax
  403835:	83 f8 40             	cmp    $0x40,%eax
  403838:	c6 04 13 00          	movb   $0x0,(%rbx,%rdx,1)
  40383c:	75 f2                	jne    403830 <sha256_final+0x1a0>
  40383e:	48 89 df             	mov    %rbx,%rdi
  403841:	48 89 de             	mov    %rbx,%rsi
  403844:	e8 67 f8 ff ff       	callq  4030b0 <sha256_transform>
  403849:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
  40384d:	48 89 d9             	mov    %rbx,%rcx
  403850:	31 c0                	xor    %eax,%eax
  403852:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  403859:	48 c7 43 30 00 00 00 	movq   $0x0,0x30(%rbx)
  403860:	00 
  403861:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  403865:	48 29 f9             	sub    %rdi,%rcx
  403868:	83 c1 38             	add    $0x38,%ecx
  40386b:	c1 e9 03             	shr    $0x3,%ecx
  40386e:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  403871:	8b 4b 40             	mov    0x40(%rbx),%ecx
  403874:	e9 55 fe ff ff       	jmpq   4036ce <sha256_final+0x3e>

0000000000403879 <initialize_phases>:
  403879:	48 83 ec 08          	sub    $0x8,%rsp
  40387d:	b8 00 00 00 00       	mov    $0x0,%eax
  403882:	e8 2c dc ff ff       	callq  4014b3 <initialize_phase1>
  403887:	b8 00 00 00 00       	mov    $0x0,%eax
  40388c:	e8 80 dc ff ff       	callq  401511 <initialize_phase2>
  403891:	b8 00 00 00 00       	mov    $0x0,%eax
  403896:	e8 52 dd ff ff       	callq  4015ed <initialize_phase3>
  40389b:	b8 00 00 00 00       	mov    $0x0,%eax
  4038a0:	e8 08 df ff ff       	callq  4017ad <initialize_phase4>
  4038a5:	b8 00 00 00 00       	mov    $0x0,%eax
  4038aa:	e8 4c e0 ff ff       	callq  4018fb <initialize_phase5>
  4038af:	b8 00 00 00 00       	mov    $0x0,%eax
  4038b4:	e8 0a e2 ff ff       	callq  401ac3 <initialize_phase6>
  4038b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4038be:	e8 75 e3 ff ff       	callq  401c38 <initialize_phase7>
  4038c3:	48 83 c4 08          	add    $0x8,%rsp
  4038c7:	c3                   	retq   

00000000004038c8 <secret_phase>:
  4038c8:	48 83 ec 08          	sub    $0x8,%rsp
  4038cc:	be f0 47 40 00       	mov    $0x4047f0,%esi
  4038d1:	bf 01 00 00 00       	mov    $0x1,%edi
  4038d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4038db:	e8 c0 d6 ff ff       	callq  400fa0 <__printf_chk@plt>
  4038e0:	48 8b 3d d9 28 20 00 	mov    0x2028d9(%rip),%rdi        # 6061c0 <stdout@@GLIBC_2.2.5>
  4038e7:	e8 84 d6 ff ff       	callq  400f70 <fflush@plt>
  4038ec:	b8 00 00 00 00       	mov    $0x0,%eax
  4038f1:	e8 a7 e6 ff ff       	callq  401f9d <read_line>
  4038f6:	48 89 c7             	mov    %rax,%rdi
  4038f9:	b8 00 00 00 00       	mov    $0x0,%eax
  4038fe:	e8 5f e3 ff ff       	callq  401c62 <phase7>
  403903:	b8 00 00 00 00       	mov    $0x0,%eax
  403908:	e8 c5 e9 ff ff       	callq  4022d2 <phase_defused>
  40390d:	48 83 c4 08          	add    $0x8,%rsp
  403911:	c3                   	retq   
  403912:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  403919:	00 00 00 
  40391c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000403920 <__libc_csu_init>:
  403920:	41 57                	push   %r15
  403922:	41 56                	push   %r14
  403924:	41 89 ff             	mov    %edi,%r15d
  403927:	41 55                	push   %r13
  403929:	41 54                	push   %r12
  40392b:	4c 8d 25 de 24 20 00 	lea    0x2024de(%rip),%r12        # 605e10 <__frame_dummy_init_array_entry>
  403932:	55                   	push   %rbp
  403933:	48 8d 2d de 24 20 00 	lea    0x2024de(%rip),%rbp        # 605e18 <__init_array_end>
  40393a:	53                   	push   %rbx
  40393b:	49 89 f6             	mov    %rsi,%r14
  40393e:	49 89 d5             	mov    %rdx,%r13
  403941:	4c 29 e5             	sub    %r12,%rbp
  403944:	48 83 ec 08          	sub    $0x8,%rsp
  403948:	48 c1 fd 03          	sar    $0x3,%rbp
  40394c:	e8 a7 d4 ff ff       	callq  400df8 <_init>
  403951:	48 85 ed             	test   %rbp,%rbp
  403954:	74 20                	je     403976 <__libc_csu_init+0x56>
  403956:	31 db                	xor    %ebx,%ebx
  403958:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40395f:	00 
  403960:	4c 89 ea             	mov    %r13,%rdx
  403963:	4c 89 f6             	mov    %r14,%rsi
  403966:	44 89 ff             	mov    %r15d,%edi
  403969:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40396d:	48 83 c3 01          	add    $0x1,%rbx
  403971:	48 39 eb             	cmp    %rbp,%rbx
  403974:	75 ea                	jne    403960 <__libc_csu_init+0x40>
  403976:	48 83 c4 08          	add    $0x8,%rsp
  40397a:	5b                   	pop    %rbx
  40397b:	5d                   	pop    %rbp
  40397c:	41 5c                	pop    %r12
  40397e:	41 5d                	pop    %r13
  403980:	41 5e                	pop    %r14
  403982:	41 5f                	pop    %r15
  403984:	c3                   	retq   
  403985:	90                   	nop
  403986:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40398d:	00 00 00 

0000000000403990 <__libc_csu_fini>:
  403990:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000403994 <_fini>:
  403994:	48 83 ec 08          	sub    $0x8,%rsp
  403998:	48 83 c4 08          	add    $0x8,%rsp
  40399c:	c3                   	retq   
