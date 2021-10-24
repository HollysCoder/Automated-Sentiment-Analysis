# ---------------- Beginning of Generated Code --------------------
        .file   "foo"
        .text
        .globl graph1
        .type   graph1, @function
graph1:
.LFB0:
	.cfi_startproc
	pushq	%rbp              # save base pointer on stack
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp        # move stack pointer to base pointer
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
        subq	$1344, %rsp 	  # make space for this stack frame
	movq	%rbx, %r9        # save %rbx (callee-saved) in %r9
# ------------------------- begin Your code -----------------------------
	movl	$48,%eax         	#  48 -> %eax
	movl	%eax,%edi         	#  %eax -> %edi
	call	new@PLT          	#  new()
	movq	%rax,-1016(%rbp)     	#  %rax -> john
	movl	$48,%eax         	#  48 -> %eax
	movl	%eax,%edi         	#  %eax -> %edi
	call	new@PLT          	#  new()
	movq	%rax,-1008(%rbp)     	#  %rax -> mary
	movl	$48,%eax         	#  48 -> %eax
	movl	%eax,%edi         	#  %eax -> %edi
	call	new@PLT          	#  new()
	movq	%rax,-1000(%rbp)     	#  %rax -> fred
	movl	$2,%eax         	#  2 -> %eax
	movq	-1016(%rbp),%rcx     	#  john -> %rcx
	movl	%eax,32(%rcx)         	#  %eax -> ^. [32+%rcx]
	movl	$19,%eax         	#  19 -> %eax
	movq	-1016(%rbp),%rcx     	#  john -> %rcx
	movl	%eax,0(%rcx)         	#  %eax -> ^. [0+%rcx]
.L1:
	movq	-1008(%rbp),%rax     	#  mary -> %rax
	movq	-1016(%rbp),%rcx     	#  john -> %rcx
	movq	%rax,8(%rcx)         	#  %rax -> ^. [8+%rcx]
	movsd	.LC4(%rip),%xmm0   	#  40000.000000 -> %xmm0
	movq	-1016(%rbp),%rax     	#  john -> %rax
	movsd	%xmm0,40(%rax)         	#  %xmm0 -> ^. [40+%rax]
	movsd	.LC5(%rip),%xmm0   	#  3.000000 -> %xmm0
	movq	-1016(%rbp),%rax     	#  john -> %rax
	movsd	%xmm0,16(%rax)         	#  %xmm0 -> ^. [16+%rax]
	movl	$21,%eax         	#  21 -> %eax
	movq	-1008(%rbp),%rcx     	#  mary -> %rcx
	movl	%eax,0(%rcx)         	#  %eax -> ^. [0+%rcx]
	movq	-1000(%rbp),%rax     	#  fred -> %rax
	movq	-1008(%rbp),%rcx     	#  mary -> %rcx
	movq	%rax,8(%rcx)         	#  %rax -> ^. [8+%rcx]
.L0:
	movl	$20,%eax         	#  20 -> %eax
	movq	-1000(%rbp),%rcx     	#  fred -> %rcx
	movl	%eax,0(%rcx)         	#  %eax -> ^. [0+%rcx]
	movq	$0,%rax         	#  0 -> %rax
	movq	-1000(%rbp),%rcx     	#  fred -> %rcx
	movq	%rax,8(%rcx)         	#  %rax -> ^. [8+%rcx]
	movsd	.LC6(%rip),%xmm0   	#  4.500000 -> %xmm0
	movq	-1016(%rbp),%rax     	#  john -> %rax
	movq	8(%rax),%rcx         	#  ^.[8+%rax] -> %rcx
	movq	8(%rcx),%rax         	#  ^.[8+%rcx] -> %rax
	movsd	%xmm0,24(%rax)         	#  %xmm0 -> ^. [24+%rax]
	movq	-1016(%rbp),%rax     	#  john -> %rax
	movsd	40(%rax),%xmm0         	#  ^.[40+%rax] -> %xmm0
	movl	$96,%eax         	#  96 -> %eax
	cltq	                  	#  sign-extend
	movsd	%xmm0,-1296(%rbp,%rax)	#  %xmm0 -> ac[%rax]
	movq	-1016(%rbp),%rax     	#  john -> %rax
	movq	%rax,-992(%rbp)     	#  %rax -> ptr
	movl	$0,%eax         	#  0 -> %eax
	movl	%eax,-1308(%rbp)     	#  %eax -> sum
	movl	$1,%eax         	#  1 -> %eax
	movl	%eax,-1312(%rbp)     	#  %eax -> i
.L2:
	movq	-992(%rbp),%rax     	#  ptr -> %rax
	movq	$0,%rcx         	#  0 -> %rcx
	cmpq	%rcx,%rax           	#  compare %rax - %rcx
	jne	.L7 			#  jump if     !=
	jmp	.L8 			#  jump 
.L7:
	movl	-1308(%rbp),%eax     	#  sum -> %eax
	movq	-992(%rbp),%rcx     	#  ptr -> %rcx
	movl	0(%rcx),%edx         	#  ^.[0+%rcx] -> %edx
	addl	%edx,%eax         	#  %eax + %edx -> %eax
	movl	%eax,-1308(%rbp)     	#  %eax -> sum
	movq	-992(%rbp),%rax     	#  ptr -> %rax
	movl	0(%rax),%ecx         	#  ^.[0+%rax] -> %ecx
	movl	$-48,%eax         	#  -48 -> %eax
	movl	$48,%edx         	#  48 -> %edx
	movl	-1312(%rbp),%ebx     	#  i -> %ebx
	imull	%ebx,%edx         	#  %edx * %ebx -> %edx
	addl	%edx,%eax         	#  %eax + %edx -> %eax
	cltq	                  	#  sign-extend
 3            :
yylex() =  258   tokentype:  3  value:           complex
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                 i
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:               sum
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:           integer
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                ac
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  288   tokentype:  2  which:    1        array
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  287   tokentype:  1  which:    8           ..
yylex() =  260   tokentype:  5  type:     0           10
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  303   tokentype:  2  which:   16           of
yylex() =  258   tokentype:  3  value:           complex
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               aco
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  288   tokentype:  2  which:    1        array
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  287   tokentype:  1  which:    8           ..
yylex() =  260   tokentype:  5  type:     0           10
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:             color
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  303   tokentype:  2  which:   16           of
yylex() =  258   tokentype:  3  value:             color
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:              mary
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:              fred
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:                pp
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:            people
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  288   tokentype:  2  which:    1        array
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  287   tokentype:  1  which:    8           ..
yylex() =  260   tokentype:  5  type:     0           20
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  303   tokentype:  2  which:   16           of
yylex() =  258   tokentype:  3  value:            person
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  289   tokentype:  2  which:    2        begin
yylex() =  258   tokentype:  3  value:               new
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              john
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               new
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              mary
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               new
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              fred
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          favorite
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              blue
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0           19
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  260   tokentype:  5  type:     0         1492
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              mary
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            salary
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     1 4.000000e+04
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          location
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                re
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0            3
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              mary
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0           21
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              mary
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              fred
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  260   tokentype:  5  type:     0         1776
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:              fred
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0           20
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              fred
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  302   tokentype:  2  which:   15          nil
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          location
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                im
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     1 4.500000e+00
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                ac
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            7
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                re
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            salary
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              john
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               sum
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0            0
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                 i
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  315   tokentype:  2  which:   28        while
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  267   tokentype:  0  which:    7           <>
yylex() =  302   tokentype:  2  which:   15          nil
yylex() =  292   tokentype:  2  which:    5           do
yylex() =  289   tokentype:  2  which:    2        begin
yylex() =  258   tokentype:  3  value:               sum
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:               sum
yylex() =  261   tokentype:  0  which:    1            +
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:            people
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  258   tokentype:  3  value:                 i
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               aco
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  258   tokentype:  3  value:                 i
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:             white
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          favorite
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                 i
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:                 i
yylex() =  261   tokentype:  0  which:    1            +
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  295   tokentype:  2  which:    8          end
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:             write
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  259   tokentype:  4  value:              i = 
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:           writeln
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:                 i
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:             write
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  259   tokentype:  4  value:    Sum of ages = 
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:           writeln
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:               sum
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:             write
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  259   tokentype:  4  value:    Fred loc im = 
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:           writeln
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              fred
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          location
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                im
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  300   tokentype:  2  which:   13           if
yylex() =  258   tokentype:  3  value:               sum
yylex() =  268   tokentype:  0  which:    8            <
yylex() =  260   tokentype:  5  type:     0            3
yylex() =  310   tokentype:  2  which:   23         then
yylex() =  299   tokentype:  2  which:   12         goto
yylex() =  260   tokentype:  5  type:     0         1776
yylex() =  295   tokentype:  2  which:    8          end
yylex() =  273   tokentype:  0  which:   13            .
