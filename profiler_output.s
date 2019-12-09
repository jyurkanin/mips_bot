        1 [0x00400000]	0x8fa40000  lw $4, 0($29)                   ; exceptions.s:183: lw $a0 0($sp)		# argc
        1 [0x00400004]	0x27a50004  addiu $5, $29, 4                ; exceptions.s:184: addiu $a1 $sp 4		# argv
        1 [0x00400008]	0x24a60004  addiu $6, $5, 4                 ; exceptions.s:185: addiu $a2 $a1 4		# envp
        1 [0x0040000c]	0x00041080  sll $2, $4, 2                   ; exceptions.s:186: sll $v0 $a0 2
        1 [0x00400010]	0x00c23021  addu $6, $6, $2                 ; exceptions.s:187: addu $a2 $a2 $v0
        1 [0x00400014]	0x0c100009  jal 0x00400024 [main]           ; exceptions.s:188: jal main
        0 [0x00400018]	0x00000000  nop                             ; exceptions.s:189: nop
        0 [0x0040001c]	0x3402000a  ori $2, $0, 10                  ; exceptions.s:191: li $v0 10
        0 [0x00400020]	0x0000000c  syscall                         ; exceptions.s:192: syscall			# syscall 10 (exit)
        1 [0x00400024]	0x340c0000  ori $12, $0, 0                  ; spimbot_pks3.s:49: li      $t4, 0
        1 [0x00400028]	0x358c1000  ori $12, $12, 4096              ; spimbot_pks3.s:50: or      $t4, $t4, BONK_INT_MASK                     # request bonk
        1 [0x0040002c]	0x358c0800  ori $12, $12, 2048              ; spimbot_pks3.s:51: or      $t4, $t4, REQUEST_PUZZLE_INT_MASK           # puzzle interrupt bit
        1 [0x00400030]	0x358c0001  ori $12, $12, 1                 ; spimbot_pks3.s:52: or      $t4, $t4, 1 # global enable
        1 [0x00400034]	0x408c6000  mtc0 $12, $12                   ; spimbot_pks3.s:53: mtc0    $t4, $12
        1 [0x00400038]	0x34090001  ori $9, $0, 1                   ; spimbot_pks3.s:56: li	$t1, 1
        1 [0x0040003c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:57: sw  $t1, SWITCH_MODE($0)         #paint mode
        1 [0x00400040]	0xac2900f0  sw $9, 240($1)
        1 [0x00400044]	0x3409000a  ori $9, $0, 10                  ; spimbot_pks3.s:59: li	$t1, 10
        1 [0x00400048]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:60: sw	$t1, VELOCITY($0)
        1 [0x0040004c]	0xac290010  sw $9, 16($1)
        1 [0x00400050]	0x340b0001  ori $11, $0, 1                  ; spimbot_pks3.s:64: li	$t3, 1
        1 [0x00400054]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:65: sw  $t3, completed_request($0)      #start with this set to 1. Meaning it is ready to request a new puzzle.
        1 [0x00400058]	0xac2b2148  sw $11, 8520($1)
   327975 [0x0040005c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:68: lw  $t1, GET_TIMER($0)              #gets cycle number
   327962 [0x00400060]	0x8c29001c  lw $9, 28($1)
   327968 [0x00400064]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:71: lw	$t1, GET_PAINT_BUCKETS($0)	    #does what it says.
   327969 [0x00400068]	0x8c2900e4  lw $9, 228($1)
   327964 [0x0040006c]	0x200a000a  addi $10, $0, 10                ; spimbot_pks3.s:72: add	$t2, $0, 10			            #load 10 into $t2
   327956 [0x00400070]	0x0149082a  slt $1, $10, $9                 ; spimbot_pks3.s:74: bgt	$t1, $t2, end_check_for_paint   #branch if we have enough paint > 10
   327967 [0x00400074]	0x14200009  bne $1, $0, 36 [end_check_for_paint-0x00400074]
    12064 [0x00400078]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:76: lw  $t3, completed_request($0)      #check if the puzzle is completed
    12066 [0x0040007c]	0x8c2b2148  lw $11, 8520($1)
    12063 [0x00400080]	0x11600006  beq $11, $0, 24 [end_check_for_paint-0x00400080]; spimbot_pks3.s:78: beq	$t3, $0, end_check_for_paint	#branch if puzzle is not completed. So it does not request more puzzles
       60 [0x00400084]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:79: sw  $0, completed_request($0)       #set request to incomplete
       60 [0x00400088]	0xac202148  sw $0, 8520($1)
       60 [0x0040008c]	0x3c091001  lui $9, 4097 [puzzle]           ; spimbot_pks3.s:80: la	$t1, puzzle			            #load puzzle address into $t1
       60 [0x00400090]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:81: sw	$t1, REQUEST_PUZZLE($0)		    #request puzzle with this address
       60 [0x00400094]	0xac2900d0  sw $9, 208($1)
   327966 [0x00400098]	0x08100017  j 0x0040005c [bot_loop]         ; spimbot_pks3.s:88: j	bot_loop
        0 [0x0040009c]	0x03e00008  jr $31                          ; spimbot_pks3.s:91: jr $ra


kernel text segment

      177 [0x80000180]	0x0001d821  addu $27, $0, $1                ; spimbot_pks3.s:100: move      $k1, $at        # Save $at
      177 [0x80000184]	0x3c019000  lui $1, -28672 [chunkIH]        ; spimbot_pks3.s:102: la        $k0, chunkIH
      177 [0x80000188]	0x343a0208  ori $26, $1, 520 [chunkIH]
      177 [0x8000018c]	0xaf440000  sw $4, 0($26)                   ; spimbot_pks3.s:103: sw        $a0, 0($k0)        # Get some free registers
      177 [0x80000190]	0xaf420004  sw $2, 4($26)                   ; spimbot_pks3.s:104: sw        $v0, 4($k0)        # by storing them to a global variable
      177 [0x80000194]	0xaf480008  sw $8, 8($26)                   ; spimbot_pks3.s:105: sw        $t0, 8($k0)
      177 [0x80000198]	0xaf49000c  sw $9, 12($26)                  ; spimbot_pks3.s:106: sw        $t1, 12($k0)
      177 [0x8000019c]	0xaf4a0010  sw $10, 16($26)                 ; spimbot_pks3.s:107: sw        $t2, 16($k0)
      177 [0x800001a0]	0xaf4b0014  sw $11, 20($26)                 ; spimbot_pks3.s:108: sw        $t3, 20($k0)
      177 [0x800001a4]	0xaf4c0018  sw $12, 24($26)                 ; spimbot_pks3.s:109: sw $t4, 24($k0)
      177 [0x800001a8]	0xaf4d001c  sw $13, 28($26)                 ; spimbot_pks3.s:110: sw $t5, 28($k0)
      177 [0x800001ac]	0x401a6800  mfc0 $26, $13                   ; spimbot_pks3.s:112: mfc0      $k0, $13             # Get Cause register
      177 [0x800001b0]	0x001a2082  srl $4, $26, 2                  ; spimbot_pks3.s:113: srl       $a0, $k0, 2
      177 [0x800001b4]	0x3084000f  andi $4, $4, 15                 ; spimbot_pks3.s:114: and       $a0, $a0, 0xf        # ExcCode field
      177 [0x800001b8]	0x14040034  bne $0, $4, 208 [non_intrpt-0x800001b8]; spimbot_pks3.s:115: bne       $a0, 0, non_intrpt
      354 [0x800001bc]	0x401a6800  mfc0 $26, $13                   ; spimbot_pks3.s:120: mfc0       $k0, $13        # Get Cause register, again
      354 [0x800001c0]	0x101a0036  beq $0, $26, 216 [done-0x800001c0]; spimbot_pks3.s:121: beq        $k0, 0, done        # handled all outstanding interrupts
      177 [0x800001c4]	0x33441000  andi $4, $26, 4096              ; spimbot_pks3.s:123: and        $a0, $k0, BONK_INT_MASK    # is there a bonk interrupt?
      177 [0x800001c8]	0x1404000a  bne $0, $4, 40 [bonk_interrupt-0x800001c8]; spimbot_pks3.s:124: bne        $a0, 0, bonk_interrupt
       60 [0x800001cc]	0x33448000  andi $4, $26, -32768            ; spimbot_pks3.s:126: and        $a0, $k0, TIMER_INT_MASK    # is there a timer interrupt?
       60 [0x800001d0]	0x1404002b  bne $0, $4, 172 [timer_interrupt-0x800001d0]; spimbot_pks3.s:127: bne        $a0, 0, timer_interrupt
       60 [0x800001d4]	0x33440800  andi $4, $26, 2048              ; spimbot_pks3.s:129: and     $a0, $k0, REQUEST_PUZZLE_INT_MASK
       60 [0x800001d8]	0x14040015  bne $0, $4, 84 [request_puzzle_interrupt-0x800001d8]; spimbot_pks3.s:130: bne     $a0, 0, request_puzzle_interrupt
        0 [0x800001dc]	0x34020004  ori $2, $0, 4                   ; spimbot_pks3.s:132: li        $v0, PRINT_STRING    # Unhandled interrupt types
        0 [0x800001e0]	0x3c019000  lui $1, -28672 [unhandled_str]  ; spimbot_pks3.s:133: la        $a0, unhandled_str
        0 [0x800001e4]	0x34240241  ori $4, $1, 577 [unhandled_str]
        0 [0x800001e8]	0x0000000c  syscall                         ; spimbot_pks3.s:134: syscall
        0 [0x800001ec]	0x080000a6  j 0x00000298 [done]             ; spimbot_pks3.s:135: j    done
      117 [0x800001f0]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:138: sw 	$0, BONK_ACK
      117 [0x800001f4]	0xac200060  sw $0, 96($1)
      117 [0x800001f8]	0x20080001  addi $8, $0, 1                  ; spimbot_pks3.s:140: add $t0, $0, 1
      117 [0x800001fc]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:141: sw  $t0, SWITCH_MODE($0)         #paint mode 
      117 [0x80000200]	0xac2800f0  sw $8, 240($1)
      117 [0x80000204]	0x34080043  ori $8, $0, 67                  ; spimbot_pks3.s:142: li	$t0, 67
      117 [0x80000208]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:143: sw	$t0, ANGLE($0)
      117 [0x8000020c]	0xac280014  sw $8, 20($1)
      117 [0x80000210]	0x34080000  ori $8, $0, 0                   ; spimbot_pks3.s:145: li	$t0, 0
      117 [0x80000214]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:146: sw	$t0, ANGLE_CONTROL($0)
      117 [0x80000218]	0xac280018  sw $8, 24($1)
      117 [0x8000021c]	0x3408000a  ori $8, $0, 10                  ; spimbot_pks3.s:148: li	$t0, 10
      117 [0x80000220]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:149: sw	$t0, VELOCITY($0)
      117 [0x80000224]	0xac280010  sw $8, 16($1)
      117 [0x80000228]	0x0800006f  j 0x000001bc [interrupt_dispatch]; spimbot_pks3.s:151: j       interrupt_dispatch    # see if other interrupts are waiting
       60 [0x8000022c]	0x3c010001  lui $1, 1                       ; spimbot_pks3.s:154: li	$t0, 69420
       60 [0x80000230]	0x34280f2c  ori $8, $1, 3884
       60 [0x80000234]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:155: sw 	$t0, REQUEST_PUZZLE_ACK($0)
       60 [0x80000238]	0xac2800d8  sw $8, 216($1)
       60 [0x8000023c]	0x3c041001  lui $4, 4097 [puzzle]           ; spimbot_pks3.s:159: la 	$a0, puzzle
       60 [0x80000240]	0x3c011001  lui $1, 4097 [heap]             ; spimbot_pks3.s:160: la	$a1, heap
       60 [0x80000244]	0x34250148  ori $5, $1, 328 [heap]
       60 [0x80000248]	0x0c000275  jal 0x000009d4 [copy_board]     ; spimbot_pks3.s:161: jal 	copy_board
       60 [0x8000024c]	0x3c011001  lui $1, 4097 [heap]             ; spimbot_pks3.s:163: la	$a0, heap
       60 [0x80000250]	0x34240148  ori $4, $1, 328 [heap]
       60 [0x80000254]	0x34050000  ori $5, $0, 0                   ; spimbot_pks3.s:164: li	$a1, 0				#dimensions are 8 by 8
       60 [0x80000258]	0x34060000  ori $6, $0, 0                   ; spimbot_pks3.s:165: li	$a2, 0
       60 [0x8000025c]	0x3c071001  lui $7, 4097 [puzzle]           ; spimbot_pks3.s:166: la	$a3, puzzle
       60 [0x80000260]	0x0c0000b2  jal 0x000002c8 [solve_puzzle]   ; spimbot_pks3.s:167: jal 	solve_puzzle 
       60 [0x80000264]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:168: sw	$a3, SUBMIT_SOLUTION($0)	#submit puzzle
       60 [0x80000268]	0xac2700d4  sw $7, 212($1)
       60 [0x8000026c]	0x340b0001  ori $11, $0, 1                  ; spimbot_pks3.s:170: li  $t3, 1
       60 [0x80000270]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:171: sw  $t3, completed_request($0)      #set the puzzle to completed
       60 [0x80000274]	0xac2b2148  sw $11, 8520($1)
       60 [0x80000278]	0x0800006f  j 0x000001bc [interrupt_dispatch]; spimbot_pks3.s:172: j	interrupt_dispatch
        0 [0x8000027c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:175: sw      $0, TIMER_ACK
        0 [0x80000280]	0xac20006c  sw $0, 108($1)
        0 [0x80000284]	0x0800006f  j 0x000001bc [interrupt_dispatch]; spimbot_pks3.s:177: j        interrupt_dispatch    # see if other interrupts are waiting
        0 [0x80000288]	0x34020004  ori $2, $0, 4                   ; spimbot_pks3.s:180: li        $v0, PRINT_STRING
        0 [0x8000028c]	0x3c019000  lui $1, -28672 [non_intrpt_str] ; spimbot_pks3.s:181: la        $a0, non_intrpt_str
        0 [0x80000290]	0x34240228  ori $4, $1, 552 [non_intrpt_str]
        0 [0x80000294]	0x0000000c  syscall                         ; spimbot_pks3.s:182: syscall                # print out an error message
      177 [0x80000298]	0x3c019000  lui $1, -28672 [chunkIH]        ; spimbot_pks3.s:186: la      $k0, chunkIH
      177 [0x8000029c]	0x343a0208  ori $26, $1, 520 [chunkIH]
      177 [0x800002a0]	0x8f440000  lw $4, 0($26)                   ; spimbot_pks3.s:187: lw      $a0, 0($k0)        # Restore saved registers
      177 [0x800002a4]	0x8f420004  lw $2, 4($26)                   ; spimbot_pks3.s:188: lw      $v0, 4($k0)
      177 [0x800002a8]	0x8f480008  lw $8, 8($26)                   ; spimbot_pks3.s:189: lw      $t0, 8($k0)
      177 [0x800002ac]	0x8f49000c  lw $9, 12($26)                  ; spimbot_pks3.s:190: lw      $t1, 12($k0)
      177 [0x800002b0]	0x8f4a0010  lw $10, 16($26)                 ; spimbot_pks3.s:191: lw      $t2, 16($k0)
      177 [0x800002b4]	0x8f4b0014  lw $11, 20($26)                 ; spimbot_pks3.s:192: lw      $t3, 20($k0)
      177 [0x800002b8]	0x8f4c0018  lw $12, 24($26)                 ; spimbot_pks3.s:193: lw $t4, 24($k0)
      177 [0x800002bc]	0x8f4d001c  lw $13, 28($26)                 ; spimbot_pks3.s:194: lw $t5, 28($k0)
      177 [0x800002c0]	0x001b0821  addu $1, $0, $27                ; spimbot_pks3.s:196: move    $at, $k1        # Restore $at
      177 [0x800002c4]	0x42000018  eret                            ; spimbot_pks3.s:198: eret
      423 [0x800002c8]	0x23bdffdc  addi $29, $29, -36              ; spimbot_pks3.s:293: sub     $sp, $sp, 36
      423 [0x800002cc]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:294: sw      $ra, 0($sp)
      423 [0x800002d0]	0xafb00004  sw $16, 4($29)                  ; spimbot_pks3.s:295: sw      $s0, 4($sp)
      423 [0x800002d4]	0xafb10008  sw $17, 8($29)                  ; spimbot_pks3.s:296: sw      $s1, 8($sp)
      423 [0x800002d8]	0xafb2000c  sw $18, 12($29)                 ; spimbot_pks3.s:297: sw      $s2, 12($sp)
      423 [0x800002dc]	0xafb30010  sw $19, 16($29)                 ; spimbot_pks3.s:298: sw      $s3, 16($sp)
      423 [0x800002e0]	0xafb40014  sw $20, 20($29)                 ; spimbot_pks3.s:299: sw      $s4, 20($sp)
      423 [0x800002e4]	0xafb50018  sw $21, 24($29)                 ; spimbot_pks3.s:300: sw      $s5, 24($sp)
      423 [0x800002e8]	0xafb6001c  sw $22, 28($29)                 ; spimbot_pks3.s:301: sw      $s6, 28($sp)
      423 [0x800002ec]	0xafb70020  sw $23, 32($29)                 ; spimbot_pks3.s:302: sw      $s7, 32($sp)
      423 [0x800002f0]	0x34170008  ori $23, $0, 8                  ; spimbot_pks3.s:303: li   $s7, GRIDSIZE
      423 [0x800002f4]	0x00058021  addu $16, $0, $5                ; spimbot_pks3.s:304: move $s0, $a1     # row
      423 [0x800002f8]	0x00068821  addu $17, $0, $6                ; spimbot_pks3.s:305: move $s1, $a2     # col
      423 [0x800002fc]	0x00049021  addu $18, $0, $4                ; spimbot_pks3.s:307: move $s2, $a0     # current_board
      423 [0x80000300]	0x00079821  addu $19, $0, $7                ; spimbot_pks3.s:308: move $s3, $a3     # puzzle
      423 [0x80000304]	0x0217082a  slt $1, $16, $23                ; spimbot_pks3.s:310: bge  $s0, $s7, solve_done_check  # row >= GRIDSIZE
      423 [0x80000308]	0x10200004  beq $1, $0, 16 [solve_done_check-0x80000308]
      419 [0x8000030c]	0x0237082a  slt $1, $17, $23                ; spimbot_pks3.s:311: bge  $s1, $s7, solve_done_check  # col >= GRIDSIZE
      419 [0x80000310]	0x10200002  beq $1, $0, 8 [solve_done_check-0x80000310]
      419 [0x80000314]	0x080000d0  j 0x00000340 [solve_not_done]   ; spimbot_pks3.s:312: j solve_not_done
        4 [0x80000318]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:314: move $a0, $s2     # current_board
        4 [0x8000031c]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:315: move $a1, $s3     # puzzle
        4 [0x80000320]	0x0c0001aa  jal 0x000006a8 [board_done]     ; spimbot_pks3.s:316: jal board_done
        4 [0x80000324]	0x10400037  beq $2, $0, 220 [solve_done_false-0x80000324]; spimbot_pks3.s:318: beq $v0, $0, solve_done_false  # if (done)
        0 [0x80000328]	0x0002b821  addu $23, $0, $2                ; spimbot_pks3.s:319: move $s7, $v0     # save done
        0 [0x8000032c]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:320: move $a0, $s2     # current_board
        0 [0x80000330]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:321: move $a1, $s3     # puzzle // same as puzzle->board
        0 [0x80000334]	0x0c000275  jal 0x000009d4 [copy_board]     ; spimbot_pks3.s:322: jal copy_board
        0 [0x80000338]	0x00171021  addu $2, $0, $23                ; spimbot_pks3.s:324: move $v0, $s7     # $v0: done
        0 [0x8000033c]	0x08000101  j 0x00000404 [solve_done]       ; spimbot_pks3.s:326: j solve_done
      419 [0x80000340]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:330: move $a0, $s2 # current_board
      419 [0x80000344]	0x0c000269  jal 0x000009a4 [increment_heap] ; spimbot_pks3.s:331: jal increment_heap
      419 [0x80000348]	0x00029021  addu $18, $0, $2                ; spimbot_pks3.s:332: move $s2, $v0 # update current_board
      419 [0x8000034c]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:334: li  $v0, 0 # changed = false
      592 [0x80000350]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:337: move $a0, $s2
      592 [0x80000354]	0x0c00010e  jal 0x00000438 [rule1]          ; spimbot_pks3.s:340: jal rule1          # changed = rule1(current_board);
      592 [0x80000358]	0x0002b021  addu $22, $0, $2                ; spimbot_pks3.s:341: move $s6, $v0      # done
      592 [0x8000035c]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:343: move $a0, $s2      # current_board
      592 [0x80000360]	0x1440fffc  bne $2, $0, -16 [solve_start_do-0x80000360]; spimbot_pks3.s:346:                       
      419 [0x80000364]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:348: move $a0, $s2     # current_board
      419 [0x80000368]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:349: move $a1, $s3     # puzzle
      419 [0x8000036c]	0x0c0001aa  jal 0x000006a8 [board_done]     ; spimbot_pks3.s:350: jal board_done
      419 [0x80000370]	0x10400007  beq $2, $0, 28 [solve_board_not_done_after_dowhile-0x80000370]; spimbot_pks3.s:352: beq $v0, $0, solve_board_not_done_after_dowhile  # if (done)
       60 [0x80000374]	0x0002b821  addu $23, $0, $2                ; spimbot_pks3.s:353: move $s7, $v0     # save done
       60 [0x80000378]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:354: move $a0, $s2     # current_board
       60 [0x8000037c]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:355: move $a1, $s3     # puzzle // same as puzzle->board
       60 [0x80000380]	0x0c000275  jal 0x000009d4 [copy_board]     ; spimbot_pks3.s:356: jal copy_board
       60 [0x80000384]	0x00171021  addu $2, $0, $23                ; spimbot_pks3.s:358: move $v0, $s7     # $v0: done
       60 [0x80000388]	0x08000101  j 0x00000404 [solve_done]       ; spimbot_pks3.s:359: j   solve_done
      359 [0x8000038c]	0x72174002  mul $8, $16, $23                ; spimbot_pks3.s:364: mul $t0, $s0, $s7  # row*GRIDSIZE
      359 [0x80000390]	0x01114020  add $8, $8, $17                 ; spimbot_pks3.s:365: add $t0, $t0, $s1  # row*GRIDSIZE + col
      359 [0x80000394]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:366: mul $t0, $t0, 2    # sizeof(unsigned short) * (row*GRIDSIZE + col)
      359 [0x80000398]	0x71014002  mul $8, $8, $1
      359 [0x8000039c]	0x0112a020  add $20, $8, $18                ; spimbot_pks3.s:367: add $s4, $t0, $s2  # &current_board[row*GRIDSIZE + col]
      359 [0x800003a0]	0x96960000  lhu $22, 0($20)                 ; spimbot_pks3.s:368: lhu $s6, 0($s4)    # possibles = current_board[row*GRIDSIZE + col]
      359 [0x800003a4]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:370: li $s5, 0 # char number = 0
     2500 [0x800003a8]	0x02b7082a  slt $1, $21, $23                ; spimbot_pks3.s:372: bge $s5, $s7, solve_start_guess_end # number < GRIDSIZE
     2500 [0x800003ac]	0x10200015  beq $1, $0, 84 [solve_start_guess_end-0x800003ac]
     2300 [0x800003b0]	0x34080001  ori $8, $0, 1                   ; spimbot_pks3.s:373: li $t0, 1
     2300 [0x800003b4]	0x02a84804  sllv $9, $8, $21                ; spimbot_pks3.s:374: sll $t1, $t0, $s5 # (1 << number)
     2300 [0x800003b8]	0x01364024  and $8, $9, $22                 ; spimbot_pks3.s:375: and $t0, $t1, $s6 # (1 << number) & possibles
     2300 [0x800003bc]	0x1100000f  beq $8, $0, 60 [solve_start_guess_else-0x800003bc]; spimbot_pks3.s:376: beq $t0, $0, solve_start_guess_else
      363 [0x800003c0]	0xa6890000  sh $9, 0($20)                   ; spimbot_pks3.s:377: sh  $t1, 0($s4)   # current_board[row*GRIDSIZE + col] = 1 << number;
      363 [0x800003c4]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:379: move $a0, $s2     # current_board
      363 [0x800003c8]	0x00102821  addu $5, $0, $16                ; spimbot_pks3.s:380: move $a1, $s0     # next_row = row
      363 [0x800003cc]	0x22e8ffff  addi $8, $23, -1                ; spimbot_pks3.s:381: sub  $t0, $s7, 1  # GRIDSIZE-1
      363 [0x800003d0]	0x16280002  bne $17, $8, 8 [solve_start_guess_same_row-0x800003d0]; spimbot_pks3.s:382: bne  $s1, $t0, solve_start_guess_same_row # col < GRIDSIZE // col==GRIDSIZE-1
       43 [0x800003d4]	0x20a50001  addi $5, $5, 1                  ; spimbot_pks3.s:383: addi $a1, $a1, 1  # row + 1
      363 [0x800003d8]	0x00113021  addu $6, $0, $17                ; spimbot_pks3.s:385: move $a2, $s1     # col
      363 [0x800003dc]	0x24c60001  addiu $6, $6, 1                 ; spimbot_pks3.s:386: addu $a2, $a2, 1  # col + 1
      363 [0x800003e0]	0x00d7001b  divu $6, $23                    ; spimbot_pks3.s:387: divu $a2, $s7
      363 [0x800003e4]	0x00003010  mfhi $6                         ; spimbot_pks3.s:388: mfhi $a2          # (col + 1) % GRIDSIZE
      363 [0x800003e8]	0x00133821  addu $7, $0, $19                ; spimbot_pks3.s:389: move $a3, $s3     # puzzle
      363 [0x800003ec]	0x0c0000b2  jal 0x000002c8 [solve_puzzle]   ; spimbot_pks3.s:390: jal solve_puzzle         # solve(current_board, next_row, (col + 1) % GRIDSIZE, puzzle)
      363 [0x800003f0]	0x14400010  bne $2, $0, 64 [solve_done_true-0x800003f0]; spimbot_pks3.s:392: bne  $v0, $0, solve_done_true # if done {return true}
      204 [0x800003f4]	0xa6960000  sh $22, 0($20)                  ; spimbot_pks3.s:393: sh   $s6, 0($s4)  # current_board[row*GRIDSIZE + col] = possibles;
     2141 [0x800003f8]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:395: addi $s5, $s5, 1
     2141 [0x800003fc]	0x080000ea  j 0x000003a8 [solve_start_guess]; spimbot_pks3.s:396: j solve_start_guess
      204 [0x80000400]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:400: li  $v0, 0        # done = false
      423 [0x80000404]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:403: lw  $ra, 0($sp)
      423 [0x80000408]	0x8fb00004  lw $16, 4($29)                  ; spimbot_pks3.s:404: lw  $s0, 4($sp)
      423 [0x8000040c]	0x8fb10008  lw $17, 8($29)                  ; spimbot_pks3.s:405: lw  $s1, 8($sp)
      423 [0x80000410]	0x8fb2000c  lw $18, 12($29)                 ; spimbot_pks3.s:406: lw  $s2, 12($sp)
      423 [0x80000414]	0x8fb30010  lw $19, 16($29)                 ; spimbot_pks3.s:407: lw  $s3, 16($sp)
      423 [0x80000418]	0x8fb40014  lw $20, 20($29)                 ; spimbot_pks3.s:408: lw  $s4, 20($sp)
      423 [0x8000041c]	0x8fb50018  lw $21, 24($29)                 ; spimbot_pks3.s:409: lw  $s5, 24($sp)
      423 [0x80000420]	0x8fb6001c  lw $22, 28($29)                 ; spimbot_pks3.s:410: lw  $s6, 28($sp)
      423 [0x80000424]	0x8fb70020  lw $23, 32($29)                 ; spimbot_pks3.s:411: lw  $s7, 32($sp)
      423 [0x80000428]	0x23bd0024  addi $29, $29, 36               ; spimbot_pks3.s:412: add $sp, $sp, 36
      423 [0x8000042c]	0x03e00008  jr $31                          ; spimbot_pks3.s:413: jr      $ra
      159 [0x80000430]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:416: li $v0, 1
      159 [0x80000434]	0x08000101  j 0x00000404 [solve_done]       ; spimbot_pks3.s:417: j solve_done
      592 [0x80000438]	0x23bdffe8  addi $29, $29, -24              ; spimbot_pks3.s:448: sub     $sp, $sp, 24
      592 [0x8000043c]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:449: sw      $ra, 0($sp)
      592 [0x80000440]	0xafb00004  sw $16, 4($29)                  ; spimbot_pks3.s:450: sw      $s0, 4($sp)
      592 [0x80000444]	0xafb10008  sw $17, 8($29)                  ; spimbot_pks3.s:451: sw      $s1, 8($sp)
      592 [0x80000448]	0xafb2000c  sw $18, 12($29)                 ; spimbot_pks3.s:452: sw      $s2, 12($sp)
      592 [0x8000044c]	0xafb30010  sw $19, 16($29)                 ; spimbot_pks3.s:453: sw      $s3, 16($sp)
      592 [0x80000450]	0xafb40014  sw $20, 20($29)                 ; spimbot_pks3.s:454: sw      $s4, 20($sp)
      592 [0x80000454]	0x34100008  ori $16, $0, 8                  ; spimbot_pks3.s:455: li      $s0, GRIDSIZE                  # $s0: GRIDSIZE = 4
      592 [0x80000458]	0x00048821  addu $17, $0, $4                ; spimbot_pks3.s:456: move    $s1, $a0                # $s1: board
      592 [0x8000045c]	0x34120000  ori $18, $0, 0                  ; spimbot_pks3.s:457: li      $s2, 0                  # $s2: changed = false
      592 [0x80000460]	0x34130000  ori $19, $0, 0                  ; spimbot_pks3.s:458: li      $s3, 0                  # $s3: y = 0
     5328 [0x80000464]	0x0270082a  slt $1, $19, $16                ; spimbot_pks3.s:460: bge     $s3, $s0, r1_for_y_end  # for: y < GRIDSIZE
     5328 [0x80000468]	0x1020002f  beq $1, $0, 188 [r1_for_y_end-0x80000468]
     4736 [0x8000046c]	0x34140000  ori $20, $0, 0                  ; spimbot_pks3.s:461: li      $s4, 0                  # $s4: x = 0
    42624 [0x80000470]	0x0290082a  slt $1, $20, $16                ; spimbot_pks3.s:463: bge     $s4, $s0, r1_for_x_end  # for: x < GRIDSIZE
    42624 [0x80000474]	0x1020002a  beq $1, $0, 168 [r1_for_x_end-0x80000474]
    37888 [0x80000478]	0x72702002  mul $4, $19, $16                ; spimbot_pks3.s:464: mul     $a0, $s3, $s0           # $a0: y*GRIDSIZE
    37888 [0x8000047c]	0x00942020  add $4, $4, $20                 ; spimbot_pks3.s:465: add     $a0, $a0, $s4           # $a0: y*GRIDSIZE + x
    37888 [0x80000480]	0x00042040  sll $4, $4, 1                   ; spimbot_pks3.s:466: sll     $a0, $a0, 1             # $a0: 2*(y*GRIDSIZE + x)
    37888 [0x80000484]	0x00912020  add $4, $4, $17                 ; spimbot_pks3.s:467: add     $a0, $a0, $s1           # $a0: &board[y*GRIDSIZE+x]
    37888 [0x80000488]	0x94840000  lhu $4, 0($4)                   ; spimbot_pks3.s:468: lhu     $a0, 0($a0)             # $a0: value = board[y*GRIDSIZE+x]
    37888 [0x8000048c]	0x0004b021  addu $22, $0, $4                ; spimbot_pks3.s:469: move    $s6, $a0                # $s6: value
    37888 [0x80000490]	0x0c00025e  jal 0x00000978 [has_single_bit_set]; spimbot_pks3.s:470: jal     has_single_bit_set
    37888 [0x80000494]	0x10020020  beq $0, $2, 128 [r1_for_x_inc-0x80000494]; spimbot_pks3.s:471: beq     $v0, 0, r1_for_x_inc    # if(has_single_bit_set(value))
    35363 [0x80000498]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:472: li      $s5, 0                  # $s5: k = 0
    35363 [0x8000049c]	0x34180000  ori $24, $0, 0                  ; spimbot_pks3.s:476: li      $t8, 0
    35363 [0x800004a0]	0x7270c002  mul $24, $19, $16               ; spimbot_pks3.s:477: mul     $t8, $s3, $s0           # $t0: y*GRIDSIZE
    35363 [0x800004a4]	0x0315c020  add $24, $24, $21               ; spimbot_pks3.s:478: add     $t8, $t8, $s5           # $t0: y*GRIDSIZE + k
    35363 [0x800004a8]	0x0018c040  sll $24, $24, 1                 ; spimbot_pks3.s:479: sll     $t8, $t8, 1             # $t0: 2*(y*GRIDSIZE + k)
    35363 [0x800004ac]	0x0311c020  add $24, $24, $17               ; spimbot_pks3.s:480: add     $t8, $t8, $s1           # $t0: &board[y*GRIDSIZE+k]
   318267 [0x800004b0]	0x02b0082a  slt $1, $21, $16                ; spimbot_pks3.s:486: bge     $s5, $s0, r1_for_k_end  # for: k < GRIDSIZE
   318267 [0x800004b4]	0x10200018  beq $1, $0, 96 [r1_for_k_end-0x800004b4]
   282904 [0x800004b8]	0x12b40008  beq $21, $20, 32 [r1_if_kx_end-0x800004b8]; spimbot_pks3.s:487: beq     $s5, $s4, r1_if_kx_end  # if (k != x)
   247541 [0x800004bc]	0x97090000  lhu $9, 0($24)                  ; spimbot_pks3.s:489: lhu     $t1, 0($t8)             # $t1: board[y*GRIDSIZE + k]
   247541 [0x800004c0]	0x01365024  and $10, $9, $22                ; spimbot_pks3.s:490: and     $t2, $t1, $s6           # $t2: board[y*GRIDSIZE + k] & value
   247541 [0x800004c4]	0x100a0005  beq $0, $10, 20 [r1_if_kx_end-0x800004c4]; spimbot_pks3.s:491: beq     $t2, 0, r1_if_kx_end    # if (board[y*GRIDSIZE + k] & value)
     4544 [0x800004c8]	0x02c05827  nor $11, $22, $0                ; spimbot_pks3.s:492: not     $t3, $s6                # $t3: ~value
     4544 [0x800004cc]	0x012b4824  and $9, $9, $11                 ; spimbot_pks3.s:493: and     $t1, $t1, $t3           # $t1:  board[y*GRIDSIZE + k] & ~value
     4544 [0x800004d0]	0xa7090000  sh $9, 0($24)                   ; spimbot_pks3.s:494: sh      $t1, 0($t8)             # board[y*GRIDSIZE + k] &= ~value
     4544 [0x800004d4]	0x34120001  ori $18, $0, 1                  ; spimbot_pks3.s:495: li      $s2, 1                  # changed = true
   282904 [0x800004d8]	0x12b3000c  beq $21, $19, 48 [r1_if_ky_end-0x800004d8]; spimbot_pks3.s:497: beq     $s5, $s3, r1_if_ky_end  # if (k != y)
   247541 [0x800004dc]	0x72b04002  mul $8, $21, $16                ; spimbot_pks3.s:498: mul     $t0, $s5, $s0           # $t0: k*GRIDSIZE
   247541 [0x800004e0]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:499: add     $t0, $t0, $s4           # $t0: k*GRIDSIZE + x
   247541 [0x800004e4]	0x00084040  sll $8, $8, 1                   ; spimbot_pks3.s:500: sll     $t0, $t0, 1             # $t0: 2*(k*GRIDSIZE + x)
   247541 [0x800004e8]	0x01114020  add $8, $8, $17                 ; spimbot_pks3.s:501: add     $t0, $t0, $s1           # $t0: &board[k*GRIDSIZE+x]
   247541 [0x800004ec]	0x95090000  lhu $9, 0($8)                   ; spimbot_pks3.s:502: lhu     $t1, 0($t0)             # $t1: board[k*GRIDSIZE + x]
   247541 [0x800004f0]	0x01365024  and $10, $9, $22                ; spimbot_pks3.s:503: and     $t2, $t1, $s6           # $t2: board[k*GRIDSIZE + x] & value
   247541 [0x800004f4]	0x100a0005  beq $0, $10, 20 [r1_if_ky_end-0x800004f4]; spimbot_pks3.s:504: beq     $t2, 0, r1_if_ky_end    # if (board[k*GRIDSIZE + x] & value)
     4698 [0x800004f8]	0x02c05827  nor $11, $22, $0                ; spimbot_pks3.s:505: not     $t3, $s6                # $t3: ~value
     4698 [0x800004fc]	0x012b4824  and $9, $9, $11                 ; spimbot_pks3.s:506: and     $t1, $t1, $t3           # $t1:  board[k*GRIDSIZE + x] & ~value
     4698 [0x80000500]	0xa5090000  sh $9, 0($8)                    ; spimbot_pks3.s:507: sh      $t1, 0($t0)             # board[k*GRIDSIZE + x] &= ~value
     4698 [0x80000504]	0x34120001  ori $18, $0, 1                  ; spimbot_pks3.s:508: li      $s2, 1                  # changed = true
   282904 [0x80000508]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:510: add     $s5, $s5, 1             # for: k++
   282904 [0x8000050c]	0x23180002  addi $24, $24, 2                ; spimbot_pks3.s:511: add     $t8, $t8, 2
   282904 [0x80000510]	0x0800012c  j 0x000004b0 [r1_for_k_start]   ; spimbot_pks3.s:512: j       r1_for_k_start
    37888 [0x80000514]	0x22940001  addi $20, $20, 1                ; spimbot_pks3.s:515: add     $s4, $s4, 1             # for: x++
    37888 [0x80000518]	0x0800011c  j 0x00000470 [r1_for_x_start]   ; spimbot_pks3.s:516: j       r1_for_x_start  
     4736 [0x8000051c]	0x22730001  addi $19, $19, 1                ; spimbot_pks3.s:519: add     $s3, $s3, 1             # for: y++
     4736 [0x80000520]	0x08000119  j 0x00000464 [r1_for_y_start]   ; spimbot_pks3.s:520: j       r1_for_y_start
      592 [0x80000524]	0x00121021  addu $2, $0, $18                ; spimbot_pks3.s:522: move    $v0, $s2                # return changed
      592 [0x80000528]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:524: lw      $ra, 0($sp)
      592 [0x8000052c]	0x8fb00004  lw $16, 4($29)                  ; spimbot_pks3.s:525: lw      $s0, 4($sp)
      592 [0x80000530]	0x8fb10008  lw $17, 8($29)                  ; spimbot_pks3.s:526: lw      $s1, 8($sp)
      592 [0x80000534]	0x8fb2000c  lw $18, 12($29)                 ; spimbot_pks3.s:527: lw      $s2, 12($sp)
      592 [0x80000538]	0x8fb30010  lw $19, 16($29)                 ; spimbot_pks3.s:528: lw      $s3, 16($sp)
      592 [0x8000053c]	0x8fb40014  lw $20, 20($29)                 ; spimbot_pks3.s:529: lw      $s4, 20($sp)
      592 [0x80000540]	0x23bd0018  addi $29, $29, 24               ; spimbot_pks3.s:530: add     $sp, $sp, 24
      592 [0x80000544]	0x03e00008  jr $31                          ; spimbot_pks3.s:531: jr      $ra
        0 [0x80000548]	0x23bdfffc  addi $29, $29, -4               ; spimbot_pks3.s:537: sub $sp, $sp, 4                       #Store ra onto stack and initialize GRIDSIZE
        0 [0x8000054c]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:538: sw $ra, 0($sp)
        0 [0x80000550]	0x34080008  ori $8, $0, 8                   ; spimbot_pks3.s:539: li $t0, GRIDSIZE                               # GRIDSIZE
        0 [0x80000554]	0x34090001  ori $9, $0, 1                   ; spimbot_pks3.s:540: li $t1, 1
        0 [0x80000558]	0x01094804  sllv $9, $9, $8                 ; spimbot_pks3.s:541: sll $t1, $t1, $t0
        0 [0x8000055c]	0x2529ffff  addiu $9, $9, -1                ; spimbot_pks3.s:542: subu $t1, $t1, 1                         #int ALL_VALUES = (1 << GRIDSIZE) - 1;
        0 [0x80000560]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:543: li $v0, 0                               #bool changed = false
        0 [0x80000564]	0x340a0000  ori $10, $0, 0                  ; spimbot_pks3.s:544: li $t2, 0                               #i = 0
        0 [0x80000568]	0x0148082a  slt $1, $10, $8                 ; spimbot_pks3.s:546: bge $t2, $t0, rule2iloopend
        0 [0x8000056c]	0x1020004c  beq $1, $0, 304 [rule2iloopend-0x8000056c]
        0 [0x80000570]	0x340b0000  ori $11, $0, 0                  ; spimbot_pks3.s:547: li $t3, 0                               #j = 0
        0 [0x80000574]	0x0168082a  slt $1, $11, $8                 ; spimbot_pks3.s:549: bge $t3, $t0, rule2jloopend
        0 [0x80000578]	0x10200047  beq $1, $0, 284 [rule2jloopend-0x80000578]
        0 [0x8000057c]	0x71486002  mul $12, $10, $8                ; spimbot_pks3.s:551: mul $t4, $t2, $t0
        0 [0x80000580]	0x018b6020  add $12, $12, $11               ; spimbot_pks3.s:552: add $t4, $t4, $t3
        0 [0x80000584]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:553: mul $t4, $t4, 2                     #sizeof(unsigned short)*(i*GRIDSIZE + j)
        0 [0x80000588]	0x71816002  mul $12, $12, $1
        0 [0x8000058c]	0x008c6020  add $12, $4, $12                ; spimbot_pks3.s:554: add $t4, $a0, $t4                   #address of board[i*GRIDSIZE+j]
        0 [0x80000590]	0x958c0000  lhu $12, 0($12)                 ; spimbot_pks3.s:555: lhu $t4, 0($t4)                     #board[i*GRIDSIZE + j]
        0 [0x80000594]	0x23bdffe8  addi $29, $29, -24              ; spimbot_pks3.s:557: sub $sp, $sp, 24                    # Allocate stack 
        0 [0x80000598]	0xafa40000  sw $4, 0($29)                   ; spimbot_pks3.s:558: sw $a0, 0($sp)
        0 [0x8000059c]	0xafa80004  sw $8, 4($29)                   ; spimbot_pks3.s:559: sw $t0, 4($sp)
        0 [0x800005a0]	0xafa90008  sw $9, 8($29)                   ; spimbot_pks3.s:560: sw $t1, 8($sp)
        0 [0x800005a4]	0xafaa000c  sw $10, 12($29)                 ; spimbot_pks3.s:561: sw $t2, 12($sp)
        0 [0x800005a8]	0xafab0010  sw $11, 16($29)                 ; spimbot_pks3.s:562: sw $t3, 16($sp)
        0 [0x800005ac]	0xafa20014  sw $2, 20($29)                  ; spimbot_pks3.s:563: sw $v0, 20($sp)                     #Store all necessary variables on stack
        0 [0x800005b0]	0x000c2021  addu $4, $0, $12                ; spimbot_pks3.s:564: move $a0, $t4
        0 [0x800005b4]	0x0c00025e  jal 0x00000978 [has_single_bit_set]; spimbot_pks3.s:565: jal has_single_bit_set
        0 [0x800005b8]	0x8fa40000  lw $4, 0($29)                   ; spimbot_pks3.s:566: lw $a0, 0($sp)
        0 [0x800005bc]	0x8fa80004  lw $8, 4($29)                   ; spimbot_pks3.s:567: lw $t0, 4($sp)
        0 [0x800005c0]	0x8fa90008  lw $9, 8($29)                   ; spimbot_pks3.s:568: lw $t1, 8($sp)
        0 [0x800005c4]	0x8faa000c  lw $10, 12($29)                 ; spimbot_pks3.s:569: lw $t2, 12($sp)
        0 [0x800005c8]	0x8fab0010  lw $11, 16($29)                 ; spimbot_pks3.s:570: lw $t3, 16($sp)
        0 [0x800005cc]	0x00026021  addu $12, $0, $2                ; spimbot_pks3.s:571: move $t4, $v0                       # Save $v0 into $t4
        0 [0x800005d0]	0x8fa20014  lw $2, 20($29)                  ; spimbot_pks3.s:572: lw $v0, 20($sp)                     
        0 [0x800005d4]	0x23bd0018  addi $29, $29, 24               ; spimbot_pks3.s:573: add $sp, $sp, 24                    # Deallocate stack
        0 [0x800005d8]	0x1580002d  bne $12, $0, 180 [rule2continuestatement-0x800005d8]; spimbot_pks3.s:575: bne $t4, $0, rule2continuestatement #if (has_single_bit_set(value)) continue;
        0 [0x800005dc]	0x340d0000  ori $13, $0, 0                  ; spimbot_pks3.s:577: li $t5, 0                           #isum = 0
        0 [0x800005e0]	0x340e0000  ori $14, $0, 0                  ; spimbot_pks3.s:578: li $t6, 0                           #jsum = 0
        0 [0x800005e4]	0x340c0000  ori $12, $0, 0                  ; spimbot_pks3.s:579: li $t4, 0                           #k = 0, t2 = i, t3 = j, t4 = k
        0 [0x800005e8]	0x0188082a  slt $1, $12, $8                 ; spimbot_pks3.s:581: bge $t4, $t0, rule2kloopend
        0 [0x800005ec]	0x10200013  beq $1, $0, 76 [rule2kloopend-0x800005ec]
        0 [0x800005f0]	0x118b0008  beq $12, $11, 32 [rule2kequalsj-0x800005f0]; spimbot_pks3.s:582: beq $t4, $t3, rule2kequalsj
        0 [0x800005f4]	0x71487802  mul $15, $10, $8                ; spimbot_pks3.s:583: mul $t7, $t2, $t0           #i*GRIDSIZE
        0 [0x800005f8]	0x01ec7820  add $15, $15, $12               ; spimbot_pks3.s:584: add $t7, $t7, $t4           #i*GRIDSIZE+k
        0 [0x800005fc]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:585: mul $t7, $t7, 2
        0 [0x80000600]	0x71e17802  mul $15, $15, $1
        0 [0x80000604]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:586: add $t7, $a0, $t7           #&board[i*GRIDSIZE + k]
        0 [0x80000608]	0x95ef0000  lhu $15, 0($15)                 ; spimbot_pks3.s:587: lhu $t7, 0($t7)
        0 [0x8000060c]	0x01cf7025  or $14, $14, $15                ; spimbot_pks3.s:588: or $t6, $t6, $t7            #jsum |= board[i*GRIDSIZE + k];
        0 [0x80000610]	0x118a0008  beq $12, $10, 32 [rule2kequalsi-0x80000610]; spimbot_pks3.s:590: beq $t4, $t2, rule2kequalsi     
        0 [0x80000614]	0x71887802  mul $15, $12, $8                ; spimbot_pks3.s:591: mul $t7, $t4, $t0           #k*GRIDSIZE
        0 [0x80000618]	0x01eb7820  add $15, $15, $11               ; spimbot_pks3.s:592: add $t7, $t7, $t3           #k*GRIDSIZE+j
        0 [0x8000061c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:593: mul $t7, $t7, 2
        0 [0x80000620]	0x71e17802  mul $15, $15, $1
        0 [0x80000624]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:594: add $t7, $a0, $t7           #&board[k*GRIDSIZE + j]
        0 [0x80000628]	0x95ef0000  lhu $15, 0($15)                 ; spimbot_pks3.s:595: lhu $t7, 0($t7)
        0 [0x8000062c]	0x01af6825  or $13, $13, $15                ; spimbot_pks3.s:596: or $t5, $t5, $t7            #isum |= board[k*GRIDSIZE + j];
        0 [0x80000630]	0x218c0001  addi $12, $12, 1                ; spimbot_pks3.s:598: add $t4, $t4, 1
        0 [0x80000634]	0x0800017a  j 0x000005e8 [rule2kloopstart]  ; spimbot_pks3.s:599: j rule2kloopstart
        0 [0x80000638]	0x112e000b  beq $9, $14, 44 [rule2allvalequalsjsum-0x80000638]; spimbot_pks3.s:601: beq $t1, $t6, rule2allvalequalsjsum
        0 [0x8000063c]	0x01c07027  nor $14, $14, $0                ; spimbot_pks3.s:602: not $t6, $t6                    # ~jsum
        0 [0x80000640]	0x012e7024  and $14, $9, $14                ; spimbot_pks3.s:603: and $t6, $t1, $t6               #ALL_VALUES & ~jsum
        0 [0x80000644]	0x710a7802  mul $15, $8, $10                ; spimbot_pks3.s:604: mul $t7, $t0, $t2               # i*GRIDSIZE
        0 [0x80000648]	0x01eb7820  add $15, $15, $11               ; spimbot_pks3.s:605: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
        0 [0x8000064c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:606: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
        0 [0x80000650]	0x71e17802  mul $15, $15, $1
        0 [0x80000654]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:607: add $t7, $a0, $t7
        0 [0x80000658]	0xa5ee0000  sh $14, 0($15)                  ; spimbot_pks3.s:608: sh $t6, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~jsum;
        0 [0x8000065c]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:609: li $v0, 1
        0 [0x80000660]	0x080001a3  j 0x0000068c [rule2continuestatement]; spimbot_pks3.s:610: j rule2continuestatement
        0 [0x80000664]	0x112d000a  beq $9, $13, 40 [rule2continuestatement-0x80000664]; spimbot_pks3.s:612: beq $t1, $t5, rule2continuestatement
        0 [0x80000668]	0x01a06827  nor $13, $13, $0                ; spimbot_pks3.s:613: not $t5, $t5                    # ~isum
        0 [0x8000066c]	0x012d6824  and $13, $9, $13                ; spimbot_pks3.s:614: and $t5, $t1, $t5               #ALL_VALUES & ~isum;
        0 [0x80000670]	0x710a7802  mul $15, $8, $10                ; spimbot_pks3.s:615: mul $t7, $t0, $t2               # i*GRIDSIZE
        0 [0x80000674]	0x01eb7820  add $15, $15, $11               ; spimbot_pks3.s:616: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
        0 [0x80000678]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:617: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
        0 [0x8000067c]	0x71e17802  mul $15, $15, $1
        0 [0x80000680]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:618: add $t7, $a0, $t7
        0 [0x80000684]	0xa5ed0000  sh $13, 0($15)                  ; spimbot_pks3.s:619: sh $t5, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~isum;
        0 [0x80000688]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:620: li $v0, 1
        0 [0x8000068c]	0x216b0001  addi $11, $11, 1                ; spimbot_pks3.s:622: add $t3, $t3, 1
        0 [0x80000690]	0x0800015d  j 0x00000574 [rule2jloopstart]  ; spimbot_pks3.s:623: j rule2jloopstart                   #continue; iterates to next index of jloop
        0 [0x80000694]	0x214a0001  addi $10, $10, 1                ; spimbot_pks3.s:625: add $t2, $t2, 1
        0 [0x80000698]	0x0800015a  j 0x00000568 [rule2iloopstart]  ; spimbot_pks3.s:626: j rule2iloopstart
        0 [0x8000069c]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:629: lw $ra, 0($sp)
        0 [0x800006a0]	0x23bd0004  addi $29, $29, 4                ; spimbot_pks3.s:630: add $sp, $sp, 4
        0 [0x800006a4]	0x03e00008  jr $31                          ; spimbot_pks3.s:631: jr $ra
      423 [0x800006a8]	0x23bdffdc  addi $29, $29, -36              ; spimbot_pks3.s:639: sub $sp, $sp, 36
      423 [0x800006ac]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:640: sw  $ra, 0($sp)
      423 [0x800006b0]	0xafb00004  sw $16, 4($29)                  ; spimbot_pks3.s:641: sw  $s0, 4($sp)
      423 [0x800006b4]	0xafb10008  sw $17, 8($29)                  ; spimbot_pks3.s:642: sw  $s1, 8($sp)
      423 [0x800006b8]	0xafb2000c  sw $18, 12($29)                 ; spimbot_pks3.s:643: sw  $s2, 12($sp)
      423 [0x800006bc]	0xafb30010  sw $19, 16($29)                 ; spimbot_pks3.s:644: sw  $s3, 16($sp)
      423 [0x800006c0]	0xafb40014  sw $20, 20($29)                 ; spimbot_pks3.s:645: sw  $s4, 20($sp)
      423 [0x800006c4]	0xafb50018  sw $21, 24($29)                 ; spimbot_pks3.s:646: sw  $s5, 24($sp)
      423 [0x800006c8]	0xafb6001c  sw $22, 28($29)                 ; spimbot_pks3.s:647: sw  $s6, 28($sp)
      423 [0x800006cc]	0xafb70020  sw $23, 32($29)                 ; spimbot_pks3.s:648: sw  $s7, 32($sp)
      423 [0x800006d0]	0x00048021  addu $16, $0, $4                ; spimbot_pks3.s:650: move    $s0, $a0        # s0 = current_board
      423 [0x800006d4]	0x00058821  addu $17, $0, $5                ; spimbot_pks3.s:651: move    $s1, $a1        # s1 = puzzle
      423 [0x800006d8]	0x34120008  ori $18, $0, 8                  ; spimbot_pks3.s:652: li  $s2, GRIDSIZE              # s2 = GRIDSIZE
      423 [0x800006dc]	0x34080001  ori $8, $0, 1                   ; spimbot_pks3.s:653: li  $t0, 1
      423 [0x800006e0]	0x02484004  sllv $8, $8, $18                ; spimbot_pks3.s:654: sll $t0, $t0, $s2       # 1 << GRIDSIZE
      423 [0x800006e4]	0x2113ffff  addi $19, $8, -1                ; spimbot_pks3.s:655: sub $s3, $t0, 1     # s3 = ALL_VALUES = (1 << GRIDSIZE) - 1
      423 [0x800006e8]	0x34140000  ori $20, $0, 0                  ; spimbot_pks3.s:657: li  $s4, 0          # s4 = i = 0
     2757 [0x800006ec]	0x0292082a  slt $1, $20, $18                ; spimbot_pks3.s:659: bge $s4, $s2, bd_i1_loop_end    # !(i < GRIDSIZE)
     2757 [0x800006f0]	0x10200025  beq $1, $0, 148 [bd_i1_loop_end-0x800006f0]
     2493 [0x800006f4]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:661: li  $s5, 0          # s5 = acc = 0
     2493 [0x800006f8]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:662: li  $s6, 0          # s6 = j = 0
    22437 [0x800006fc]	0x02d2082a  slt $1, $22, $18                ; spimbot_pks3.s:664: bge $s6, $s2, bd_j1_loop_end    # !(j < GRIDSIZE)
    22437 [0x80000700]	0x1020000d  beq $1, $0, 52 [bd_j1_loop_end-0x80000700]
    19944 [0x80000704]	0x72924002  mul $8, $20, $18                ; spimbot_pks3.s:666: mul $t0, $s4, $s2       # i*GRIDSIZE
    19944 [0x80000708]	0x01164020  add $8, $8, $22                 ; spimbot_pks3.s:667: add $t0, $t0, $s6       # i*GRIDSIZE + j
    19944 [0x8000070c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:668: mul $t0, $t0, 2         # sizeof(unsigned short)*(i*GRIDSIZE + j)
    19944 [0x80000710]	0x71014002  mul $8, $8, $1
    19944 [0x80000714]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:669: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
    19944 [0x80000718]	0x95170000  lhu $23, 0($8)                  ; spimbot_pks3.s:670: lhu $s7, 0($t0)         # s7 = value = current_board[i*GRIDSIZE + j]
    19944 [0x8000071c]	0x00172021  addu $4, $0, $23                ; spimbot_pks3.s:672: move    $a0, $s7
    19944 [0x80000720]	0x0c00025e  jal 0x00000978 [has_single_bit_set]; spimbot_pks3.s:673: jal has_single_bit_set
    19944 [0x80000724]	0x10400002  beq $2, $0, 8 [bd_j1_loop_increment-0x80000724]; spimbot_pks3.s:674: beq $v0, $0, bd_j1_loop_increment   # if (!hsbs(value)) continue
    19784 [0x80000728]	0x02b7a826  xor $21, $21, $23               ; spimbot_pks3.s:675: xor $s5, $s5, $s7
    19944 [0x8000072c]	0x22d60001  addi $22, $22, 1                ; spimbot_pks3.s:678: add $s6, $s6, 1     # ++ j
    19944 [0x80000730]	0x080001bf  j 0x000006fc [bd_j1_loop_start] ; spimbot_pks3.s:679: j   bd_j1_loop_start
     2493 [0x80000734]	0x16b30085  bne $21, $19, 532 [bd_return_false-0x80000734]; spimbot_pks3.s:681: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
     2413 [0x80000738]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:683: li  $s5, 0          # s5 = acc = 0
     2413 [0x8000073c]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:684: li  $s6, 0          # s6 = j = 0
    21717 [0x80000740]	0x02d2082a  slt $1, $22, $18                ; spimbot_pks3.s:686: bge $s6, $s2, bd_j2_loop_end    # !(j < GRIDSIZE)
    21717 [0x80000744]	0x1020000d  beq $1, $0, 52 [bd_j2_loop_end-0x80000744]
    19304 [0x80000748]	0x72d24002  mul $8, $22, $18                ; spimbot_pks3.s:688: mul $t0, $s6, $s2       # j*GRIDSIZE
    19304 [0x8000074c]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:689: add $t0, $t0, $s4       # j*GRIDSIZE + i
    19304 [0x80000750]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:690: mul $t0, $t0, 2
    19304 [0x80000754]	0x71014002  mul $8, $8, $1
    19304 [0x80000758]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:691: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
    19304 [0x8000075c]	0x95170000  lhu $23, 0($8)                  ; spimbot_pks3.s:692: lhu $s7, 0($t0)     # s7 = value = current_board[j*GRIDSIZE + i]
    19304 [0x80000760]	0x00172021  addu $4, $0, $23                ; spimbot_pks3.s:694: move    $a0, $s7
    19304 [0x80000764]	0x0c00025e  jal 0x00000978 [has_single_bit_set]; spimbot_pks3.s:695: jal has_single_bit_set
    19304 [0x80000768]	0x10400002  beq $2, $0, 8 [bd_j2_loop_increment-0x80000768]; spimbot_pks3.s:696: beq $v0, $0, bd_j2_loop_increment   # if (!hsbs(value)) continue
    19146 [0x8000076c]	0x02b7a826  xor $21, $21, $23               ; spimbot_pks3.s:697: xor $s5, $s5, $s7
    19304 [0x80000770]	0x22d60001  addi $22, $22, 1                ; spimbot_pks3.s:700: add $s6, $s6, 1     # ++ j
    19304 [0x80000774]	0x080001d0  j 0x00000740 [bd_j2_loop_start] ; spimbot_pks3.s:701: j   bd_j2_loop_start
     2413 [0x80000778]	0x16b30074  bne $21, $19, 464 [bd_return_false-0x80000778]; spimbot_pks3.s:703: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
     2334 [0x8000077c]	0x22940001  addi $20, $20, 1                ; spimbot_pks3.s:706: add $s4, $s4, 1     # ++ i
     2334 [0x80000780]	0x080001bb  j 0x000006ec [bd_i1_loop_start] ; spimbot_pks3.s:707: j   bd_i1_loop_start
      264 [0x80000784]	0x34140000  ori $20, $0, 0                  ; spimbot_pks3.s:709: li  $s4, 0          # s4 = i = 0
     1234 [0x80000788]	0x0292082a  slt $1, $20, $18                ; spimbot_pks3.s:711: bge $s4, $s2, bd_i2_loop_end    # !(i < GRIDSIZE)
     1234 [0x8000078c]	0x1020006d  beq $1, $0, 436 [bd_i2_loop_end-0x8000078c]
     1174 [0x80000790]	0x34080002  ori $8, $0, 2                   ; spimbot_pks3.s:713: li  $t0, 2          # sizeof(short)
     1174 [0x80000794]	0x71124002  mul $8, $8, $18                 ; spimbot_pks3.s:714: mul $t0, $t0, $s2
     1174 [0x80000798]	0x71124002  mul $8, $8, $18                 ; spimbot_pks3.s:715: mul $t0, $t0, $s2       # sizeof(unsigned short board[GRIDSIZE*GRIDSIZE])
     1174 [0x8000079c]	0x02289820  add $19, $17, $8                ; spimbot_pks3.s:716: add $s3, $s1, $t0       # s3 = &(puzzle->constraints)
     1174 [0x800007a0]	0x22880001  addi $8, $20, 1                 ; spimbot_pks3.s:718: add $t0, $s4, 1     # i+1
     1174 [0x800007a4]	0x22490002  addi $9, $18, 2                 ; spimbot_pks3.s:719: add $t1, $s2, 2     # GRIDSIZE+2
     1174 [0x800007a8]	0x71094002  mul $8, $8, $9                  ; spimbot_pks3.s:720: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
     1174 [0x800007ac]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:721: mul $t0, $t0, 2
     1174 [0x800007b0]	0x71014002  mul $8, $8, $1
     1174 [0x800007b4]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:722: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
     1174 [0x800007b8]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:723: lhu $t9, 0($t0)     # t9 = left_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
     1174 [0x800007bc]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:724: li  $s5, 0          # s5 = count = 0
     1174 [0x800007c0]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:725: li  $s6, 0          # s6 = last = 0
     1174 [0x800007c4]	0x34170000  ori $23, $0, 0                  ; spimbot_pks3.s:727: li  $s7, 0          # s7 = j = 0
    10566 [0x800007c8]	0x02f2082a  slt $1, $23, $18                ; spimbot_pks3.s:729: bge $s7, $s2, bd_j3_loop_end    # !(j < GRIDSIZE)
    10566 [0x800007cc]	0x1020000d  beq $1, $0, 52 [bd_j3_loop_end-0x800007cc]
     9392 [0x800007d0]	0x72924002  mul $8, $20, $18                ; spimbot_pks3.s:731: mul $t0, $s4, $s2       # i*GRIDSIZE
     9392 [0x800007d4]	0x01174020  add $8, $8, $23                 ; spimbot_pks3.s:732: add $t0, $t0, $s7       # i*GRIDSIZE + j
     9392 [0x800007d8]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:733: mul $t0, $t0, 2
     9392 [0x800007dc]	0x71014002  mul $8, $8, $1
     9392 [0x800007e0]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:734: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     9392 [0x800007e4]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:735: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
     9392 [0x800007e8]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:736: ble $t0, $s6, bd_j3_loop_increment  # !(current > last)
     9392 [0x800007ec]	0x10200003  beq $1, $0, 12 [bd_j3_loop_increment-0x800007ec]
     3348 [0x800007f0]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:737: add $s5, $s5, 1     # count += 1
     3348 [0x800007f4]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:738: move    $s6, $t0        # last = current
     9392 [0x800007f8]	0x22f70001  addi $23, $23, 1                ; spimbot_pks3.s:740: add $s7, $s7, 1     # ++ j
     9392 [0x800007fc]	0x080001f2  j 0x000007c8 [bd_j3_loop_start] ; spimbot_pks3.s:741: j   bd_j3_loop_start
     1174 [0x80000800]	0x16b90052  bne $21, $25, 328 [bd_return_false-0x80000800]; spimbot_pks3.s:743: bne $s5, $t9, bd_return_false   # if (count != left_constraint) return false
     1066 [0x80000804]	0x22880001  addi $8, $20, 1                 ; spimbot_pks3.s:745: add $t0, $s4, 1     # i+1
     1066 [0x80000808]	0x22490002  addi $9, $18, 2                 ; spimbot_pks3.s:746: add $t1, $s2, 2     # GRIDSIZE+2
     1066 [0x8000080c]	0x71094002  mul $8, $8, $9                  ; spimbot_pks3.s:747: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
     1066 [0x80000810]	0x01124020  add $8, $8, $18                 ; spimbot_pks3.s:748: add $t0, $t0, $s2       # (i+1)*(GRIDSIZE+2) + GRIDSIZE
     1066 [0x80000814]	0x21080001  addi $8, $8, 1                  ; spimbot_pks3.s:749: add $t0, $t0, 1     # (i+1)*(GRIDSIZE+2) + GRIDSIZE + 1
     1066 [0x80000818]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:750: mul $t0, $t0, 2
     1066 [0x8000081c]	0x71014002  mul $8, $8, $1
     1066 [0x80000820]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:751: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
     1066 [0x80000824]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:752: lhu $t9, 0($t0)     # t9 = right_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
     1066 [0x80000828]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:753: li  $s5, 0          # s5 = count = 0
     1066 [0x8000082c]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:754: li  $s6, 0          # s6 = last = 0
     1066 [0x80000830]	0x2257ffff  addi $23, $18, -1               ; spimbot_pks3.s:756: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
     9594 [0x80000834]	0x02e0082a  slt $1, $23, $0                 ; spimbot_pks3.s:758: blt $s7, $0, bd_j4_loop_end # !(j >= 0)
     9594 [0x80000838]	0x1420000d  bne $1, $0, 52 [bd_j4_loop_end-0x80000838]
     8528 [0x8000083c]	0x72924002  mul $8, $20, $18                ; spimbot_pks3.s:760: mul $t0, $s4, $s2       # i*GRIDSIZE
     8528 [0x80000840]	0x01174020  add $8, $8, $23                 ; spimbot_pks3.s:761: add $t0, $t0, $s7       # i*GRIDSIZE + j
     8528 [0x80000844]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:762: mul $t0, $t0, 2
     8528 [0x80000848]	0x71014002  mul $8, $8, $1
     8528 [0x8000084c]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:763: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     8528 [0x80000850]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:764: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
     8528 [0x80000854]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:765: ble $t0, $s6, bd_j4_loop_increment  # !(current > last)
     8528 [0x80000858]	0x10200003  beq $1, $0, 12 [bd_j4_loop_increment-0x80000858]
     2652 [0x8000085c]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:766: add $s5, $s5, 1     # count += 1
     2652 [0x80000860]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:767: move    $s6, $t0        # last = current
     8528 [0x80000864]	0x22f7ffff  addi $23, $23, -1               ; spimbot_pks3.s:769: sub $s7, $s7, 1     # -- j
     8528 [0x80000868]	0x0800020d  j 0x00000834 [bd_j4_loop_start] ; spimbot_pks3.s:770: j   bd_j4_loop_start
     1066 [0x8000086c]	0x16b90037  bne $21, $25, 220 [bd_return_false-0x8000086c]; spimbot_pks3.s:772: bne $s5, $t9, bd_return_false   # if (count != right_constraint) return false
     1022 [0x80000870]	0x22880001  addi $8, $20, 1                 ; spimbot_pks3.s:773: add $t0, $s4, 1     # i+1
     1022 [0x80000874]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:774: mul $t0, $t0, 2
     1022 [0x80000878]	0x71014002  mul $8, $8, $1
     1022 [0x8000087c]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:775: add $t0, $t0, $s3       # &puzzle->constraints[i + 1]
     1022 [0x80000880]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:776: lhu $t9, 0($t0)     # t9 = top_constraint = puzzle->constraints[i + 1]
     1022 [0x80000884]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:777: li  $s5, 0          # s5 = count = 0
     1022 [0x80000888]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:778: li  $s6, 0          # s6 = last = 0
     1022 [0x8000088c]	0x34170000  ori $23, $0, 0                  ; spimbot_pks3.s:780: li  $s7, 0          # s7 = j = 0
     9198 [0x80000890]	0x02f2082a  slt $1, $23, $18                ; spimbot_pks3.s:782: bge $s7, $s2, bd_j5_loop_end    # !(j < GRIDSIZE)
     9198 [0x80000894]	0x1020000d  beq $1, $0, 52 [bd_j5_loop_end-0x80000894]
     8176 [0x80000898]	0x72f24002  mul $8, $23, $18                ; spimbot_pks3.s:784: mul $t0, $s7, $s2       # j*GRIDSIZE
     8176 [0x8000089c]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:785: add $t0, $t0, $s4       # j*GRIDSIZE + i
     8176 [0x800008a0]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:786: mul $t0, $t0, 2
     8176 [0x800008a4]	0x71014002  mul $8, $8, $1
     8176 [0x800008a8]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:787: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     8176 [0x800008ac]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:788: lhu $t0, 0( 
     8176 [0x800008b0]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:789: ble $t0, $s6, bd_j5_loop_increment  # !(current > last)
     8176 [0x800008b4]	0x10200003  beq $1, $0, 12 [bd_j5_loop_increment-0x800008b4]
     2944 [0x800008b8]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:790: add $s5, $s5, 1     # count += 1
     2944 [0x800008bc]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:791: move    $s6, $t0        # last = current
     8176 [0x800008c0]	0x22f70001  addi $23, $23, 1                ; spimbot_pks3.s:793: add $s7, $s7, 1     # ++ j
     8176 [0x800008c4]	0x08000224  j 0x00000890 [bd_j5_loop_start] ; spimbot_pks3.s:794: j   bd_j5_loop_start
     1022 [0x800008c8]	0x16b90020  bne $21, $25, 128 [bd_return_false-0x800008c8]; spimbot_pks3.s:796: bne $s5, $t9, bd_return_false   # if (count != top_constraint) return false
      970 [0x800008cc]	0x22480001  addi $8, $18, 1                 ; spimbot_pks3.s:798: add $t0, $s2, 1     # GRIDSIZE+1
      970 [0x800008d0]	0x22490002  addi $9, $18, 2                 ; spimbot_pks3.s:799: add $t1, $s2, 2     # GRIDSIZE+2
      970 [0x800008d4]	0x71094002  mul $8, $8, $9                  ; spimbot_pks3.s:800: mul $t0, $t0, $t1       # (GRIDSIZE+1)*(GRIDSIZE+2)
      970 [0x800008d8]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:801: add $t0, $t0, $s4       # (GRIDSIZE+1)*(GRIDSIZE+2) + i
      970 [0x800008dc]	0x21080001  addi $8, $8, 1                  ; spimbot_pks3.s:802: add $t0, $t0, 1     # (GRIDSIZE+1)*(GRIDSIZE+2) + i + 1
      970 [0x800008e0]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:803: mul $t0, $t0, 2
      970 [0x800008e4]	0x71014002  mul $8, $8, $1
      970 [0x800008e8]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:804: add $t0, $t0, $s3       # &puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
      970 [0x800008ec]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:805: lhu $t9, 0($t0)     # t9 = bottom_constraint = puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
      970 [0x800008f0]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:806: li  $s5, 0          # s5 = count = 0
      970 [0x800008f4]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:807: li  $s6, 0          # s6 = last = 0
      970 [0x800008f8]	0x2257ffff  addi $23, $18, -1               ; spimbot_pks3.s:809: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
     8730 [0x800008fc]	0x02e0082a  slt $1, $23, $0                 ; spimbot_pks3.s:811: blt $s7, $0, bd_j6_loop_end # !(j >= 0)
     8730 [0x80000900]	0x1420000d  bne $1, $0, 52 [bd_j6_loop_end-0x80000900]
     7760 [0x80000904]	0x72f24002  mul $8, $23, $18                ; spimbot_pks3.s:813: mul $t0, $s7, $s2       # j*GRIDSIZE
     7760 [0x80000908]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:814: add $t0, $t0, $s4       # j*GRIDSIZE + i
     7760 [0x8000090c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:815: mul $t0, $t0, 2
     7760 [0x80000910]	0x71014002  mul $8, $8, $1
     7760 [0x80000914]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:816: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     7760 [0x80000918]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:817: lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
     7760 [0x8000091c]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:818: ble $t0, $s6, bd_j6_loop_increment  # !(current > last)
     7760 [0x80000920]	0x10200003  beq $1, $0, 12 [bd_j6_loop_increment-0x80000920]
     2614 [0x80000924]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:819: add $s5, $s5, 1     # count += 1
     2614 [0x80000928]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:820: move    $s6, $t0        # last = current
     7760 [0x8000092c]	0x22f7ffff  addi $23, $23, -1               ; spimbot_pks3.s:822: sub $s7, $s7, 1     # -- j
     7760 [0x80000930]	0x0800023f  j 0x000008fc [bd_j6_loop_start] ; spimbot_pks3.s:823: j   bd_j6_loop_start
      970 [0x80000934]	0x16b90005  bne $21, $25, 20 [bd_return_false-0x80000934]; spimbot_pks3.s:825: bne $s5, $t9, bd_return_false   # if (count != bottom_constraint) return false
      970 [0x80000938]	0x22940001  addi $20, $20, 1                ; spimbot_pks3.s:827: add $s4, $s4, 1
      970 [0x8000093c]	0x080001e2  j 0x00000788 [bd_i2_loop_start] ; spimbot_pks3.s:828: j   bd_i2_loop_start
       60 [0x80000940]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:830: li  $v0, 1          # return true
       60 [0x80000944]	0x08000253  j 0x0000094c [bd_return]        ; spimbot_pks3.s:831: j   bd_return
      363 [0x80000948]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:833: li  $v0, 0          # return false
      423 [0x8000094c]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:835: lw  $ra, 0($sp)
      423 [0x80000950]	0x8fb00004  lw $16, 4($29)                  ; spimbot_pks3.s:836: lw  $s0, 4($sp)
      423 [0x80000954]	0x8fb10008  lw $17, 8($29)                  ; spimbot_pks3.s:837: lw  $s1, 8($sp)
      423 [0x80000958]	0x8fb2000c  lw $18, 12($29)                 ; spimbot_pks3.s:838: lw  $s2, 12($sp)
      423 [0x8000095c]	0x8fb30010  lw $19, 16($29)                 ; spimbot_pks3.s:839: lw  $s3, 16($sp)
      423 [0x80000960]	0x8fb40014  lw $20, 20($29)                 ; spimbot_pks3.s:840: lw  $s4, 20($sp)
      423 [0x80000964]	0x8fb50018  lw $21, 24($29)                 ; spimbot_pks3.s:841: lw  $s5, 24($sp)
      423 [0x80000968]	0x8fb6001c  lw $22, 28($29)                 ; spimbot_pks3.s:842: lw  $s6, 28($sp)
      423 [0x8000096c]	0x8fb70020  lw $23, 32($29)                 ; spimbot_pks3.s:843: lw  $s7, 32($sp)
      423 [0x80000970]	0x23bd0024  addi $29, $29, 36               ; spimbot_pks3.s:844: add $sp, $sp, 36
      423 [0x80000974]	0x03e00008  jr $31                          ; spimbot_pks3.s:845: jr $ra
    77136 [0x80000978]	0x10800009  beq $4, $0, 36 [has_single_bit_set_iszero-0x80000978]; spimbot_pks3.s:851: beq     $a0, $0, has_single_bit_set_iszero
    77136 [0x8000097c]	0x2082ffff  addi $2, $4, -1                 ; spimbot_pks3.s:852: sub     $v0, $a0, 1             # $v0: b-1
    77136 [0x80000980]	0x00821024  and $2, $4, $2                  ; spimbot_pks3.s:853: and     $v0, $a0, $v0           # $v0: b & (b-1)
    77136 [0x80000984]	0x00401027  nor $2, $2, $0                  ; spimbot_pks3.s:854: not     $v0, $v0                # $v0: !(b & (b-1))
    77136 [0x80000988]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:856: bne     $v0, -1, has_single_bit_set_iszero
    77136 [0x8000098c]	0x3421ffff  ori $1, $1, -1
    77136 [0x80000990]	0x14220003  bne $1, $2, 12 [has_single_bit_set_iszero-0x80000990]
    74293 [0x80000994]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:857: li      $v0, 1
    74293 [0x80000998]	0x08000268  j 0x000009a0 [has_single_bit_set_done]; spimbot_pks3.s:858: j       has_single_bit_set_done
     2843 [0x8000099c]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:860: li      $v0, 0
    77136 [0x800009a0]	0x03e00008  jr $31                          ; spimbot_pks3.s:862: jr      $ra
      419 [0x800009a4]	0x23bdfffc  addi $29, $29, -4               ; spimbot_pks3.s:870: sub $sp, $sp, 4
      419 [0x800009a8]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:871: sw  $ra, 0($sp) # save $ra on stack
      419 [0x800009ac]	0x34080008  ori $8, $0, 8                   ; spimbot_pks3.s:873: li  $t0, GRIDSIZE
      419 [0x800009b0]	0x71084002  mul $8, $8, $8                  ; spimbot_pks3.s:874: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
      419 [0x800009b4]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:875: mul $a1, $t0, 2
      419 [0x800009b8]	0x71012802  mul $5, $8, $1
      419 [0x800009bc]	0x00852820  add $5, $4, $5                  ; spimbot_pks3.s:876: add $a1, $a0, $a1               # new_board = old_board + GRIDSIZE*GRIDSIZE
      419 [0x800009c0]	0x0c000275  jal 0x000009d4 [copy_board]     ; spimbot_pks3.s:878: jal copy_board
      419 [0x800009c4]	0x00021021  addu $2, $0, $2                 ; spimbot_pks3.s:880: move $v0, $v0                   # // output the output of copy_board
      419 [0x800009c8]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:881: lw  $ra, 0($sp)
      419 [0x800009cc]	0x23bd0004  addi $29, $29, 4                ; spimbot_pks3.s:882: add $sp, $sp, 4
      419 [0x800009d0]	0x03e00008  jr $31                          ; spimbot_pks3.s:883: jr $ra
      539 [0x800009d4]	0x34080008  ori $8, $0, 8                   ; spimbot_pks3.s:891: li  $t0, GRIDSIZE
      539 [0x800009d8]	0x71084002  mul $8, $8, $8                  ; spimbot_pks3.s:892: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
      539 [0x800009dc]	0x00044821  addu $9, $0, $4                 ; spimbot_pks3.s:893: move  $t1, $a0                      # i = 0
      539 [0x800009e0]	0x00055021  addu $10, $0, $5                ; spimbot_pks3.s:894: move  $t2, $a1
      539 [0x800009e4]	0x340c0000  ori $12, $0, 0                  ; spimbot_pks3.s:895: li  $t4, 0
    17787 [0x800009e8]	0x0188082a  slt $1, $12, $8                 ; spimbot_pks3.s:897: bge $t4, $t0, ih_done           # i < GRIDSIZE*GRIDSIZE
    17787 [0x800009ec]	0x10200007  beq $1, $0, 28 [ih_done-0x800009ec]
    17248 [0x800009f0]	0x8d2b0000  lw $11, 0($9)                   ; spimbot_pks3.s:901: lw $t3, 0($t1)                 # old_board[i]
    17248 [0x800009f4]	0xad4b0000  sw $11, 0($10)                  ; spimbot_pks3.s:904: sw  $t3, 0($t2)                 # new_board[i] = old_board[i]
    17248 [0x800009f8]	0x21290004  addi $9, $9, 4                  ; spimbot_pks3.s:906: addi $t1, $t1, 4                # i++
    17248 [0x800009fc]	0x214a0004  addi $10, $10, 4                ; spimbot_pks3.s:907: addi $t2, $t2, 4
    17248 [0x80000a00]	0x218c0002  addi $12, $12, 2                ; spimbot_pks3.s:908: addi $t4, $t4, 2
    17248 [0x80000a04]	0x0800027a  j 0x000009e8 [ih_loop]          ; spimbot_pks3.s:909: j    ih_loop
      539 [0x80000a08]	0x00051021  addu $2, $0, $5                 ; spimbot_pks3.s:911: move $v0, $a1
      539 [0x80000a0c]	0x03e00008  jr $31                          ; spimbot_pks3.s:912: jr $ra
