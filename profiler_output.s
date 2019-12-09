        1 [0x00400000]	0x8fa40000  lw $4, 0($29)                   ; exceptions.s:183: lw $a0 0($sp)		# argc
        1 [0x00400004]	0x27a50004  addiu $5, $29, 4                ; exceptions.s:184: addiu $a1 $sp 4		# argv
        1 [0x00400008]	0x24a60004  addiu $6, $5, 4                 ; exceptions.s:185: addiu $a2 $a1 4		# envp
        1 [0x0040000c]	0x00041080  sll $2, $4, 2                   ; exceptions.s:186: sll $v0 $a0 2
        1 [0x00400010]	0x00c23021  addu $6, $6, $2                 ; exceptions.s:187: addu $a2 $a2 $v0
        1 [0x00400014]	0x0c100009  jal 0x00400024 [main]           ; exceptions.s:188: jal main
        0 [0x00400018]	0x00000000  nop                             ; exceptions.s:189: nop
        0 [0x0040001c]	0x3402000a  ori $2, $0, 10                  ; exceptions.s:191: li $v0 10
        0 [0x00400020]	0x0000000c  syscall                         ; exceptions.s:192: syscall			# syscall 10 (exit)
        1 [0x00400024]	0x340c0000  ori $12, $0, 0                  ; jank_jesus_code.s:50: li      $t4, 0
        1 [0x00400028]	0x358c1000  ori $12, $12, 4096              ; jank_jesus_code.s:51: or      $t4, $t4, BONK_INT_MASK # request bonk
        1 [0x0040002c]	0x358c0800  ori $12, $12, 2048              ; jank_jesus_code.s:52: or      $t4, $t4, REQUEST_PUZZLE_INT_MASK	       # puzzle interrupt bit
        1 [0x00400030]	0x358c0001  ori $12, $12, 1                 ; jank_jesus_code.s:53: or      $t4, $t4, 1 # global enable
        1 [0x00400034]	0x408c6000  mtc0 $12, $12                   ; jank_jesus_code.s:54: mtc0    $t4, $12
        1 [0x00400038]	0x34090001  ori $9, $0, 1                   ; jank_jesus_code.s:58: li	$t1, 1
        1 [0x0040003c]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:59: sw  $t1, SWITCH_MODE($0)         #paint mode
        1 [0x00400040]	0xac2900f0  sw $9, 240($1)
        1 [0x00400044]	0x34090000  ori $9, $0, 0                   ; jank_jesus_code.s:60: li      $t1, 0
        1 [0x00400048]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:61: sw      $t1, ANGLE_CONTROL($0)
        1 [0x0040004c]	0xac290018  sw $9, 24($1)
        2 [0x00400050]	0x34080001  ori $8, $0, 1                   ; jank_jesus_code.s:63: li      $t0, 1
        2 [0x00400054]	0x3c011003  lui $1, 4099                    ; jank_jesus_code.s:64: sw      $t0, my_flag($0)
        2 [0x00400058]	0xac2887e8  sw $8, -30744($1)
   225688 [0x0040005c]	0x3c011003  lui $1, 4099                    ; jank_jesus_code.s:68: lw      $t0, my_flag($0)
   225602 [0x00400060]	0x8c2887e8  lw $8, -30744($1)
   225625 [0x00400064]	0x1008fffe  beq $0, $8, -8 [loop-0x00400064]; jank_jesus_code.s:69: beq     $t0, 0, loop
      231 [0x00400068]	0x34190064  ori $25, $0, 100                ; jank_jesus_code.s:71: li      $t9, 100
      231 [0x0040006c]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:72: sw      $t9, VELOCITY($0)
      231 [0x00400070]	0xac390010  sw $25, 16($1)
      231 [0x00400074]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:73: sw      $t9, PICKUP_POWERUP
      231 [0x00400078]	0xac3900f4  sw $25, 244($1)
      231 [0x0040007c]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:75: sw      $0, USE_POWERUP($0)
      231 [0x00400080]	0xac2000ec  sw $0, 236($1)
      231 [0x00400084]	0x3c081001  lui $8, 4097 [puzzle]           ; jank_jesus_code.s:77: la	$t0, puzzle	
      231 [0x00400088]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:78: sw      $t0, REQUEST_PUZZLE($0)
      231 [0x0040008c]	0xac2800d0  sw $8, 208($1)
      232 [0x00400090]	0x34080000  ori $8, $0, 0                   ; jank_jesus_code.s:83: li      $t0, 0
      232 [0x00400094]	0x3c011003  lui $1, 4099                    ; jank_jesus_code.s:84: sw      $t0, my_flag($0)
      231 [0x00400098]	0xac2887e8  sw $8, -30744($1)
      231 [0x0040009c]	0x08100017  j 0x0040005c [loop]             ; jank_jesus_code.s:86: j       loop
        0 [0x004000a0]	0x03e00008  jr $31                          ; jank_jesus_code.s:89: jr $ra


kernel text segment

      552 [0x80000180]	0x0001d821  addu $27, $0, $1                ; jank_jesus_code.s:98: move      $k1, $at        # Save $at
      552 [0x80000184]	0x3c019000  lui $1, -28672 [chunkIH]        ; jank_jesus_code.s:100: la        $k0, chunkIH
      552 [0x80000188]	0x343a0208  ori $26, $1, 520 [chunkIH]
      552 [0x8000018c]	0xaf440000  sw $4, 0($26)                   ; jank_jesus_code.s:101: sw        $a0, 0($k0)        # Get some free registers
      552 [0x80000190]	0xaf420004  sw $2, 4($26)                   ; jank_jesus_code.s:102: sw        $v0, 4($k0)        # by storing them to a global variable
      552 [0x80000194]	0xaf480008  sw $8, 8($26)                   ; jank_jesus_code.s:103: sw        $t0, 8($k0)
      552 [0x80000198]	0xaf49000c  sw $9, 12($26)                  ; jank_jesus_code.s:104: sw        $t1, 12($k0)
      552 [0x8000019c]	0xaf4a0010  sw $10, 16($26)                 ; jank_jesus_code.s:105: sw        $t2, 16($k0)
      552 [0x800001a0]	0xaf4b0014  sw $11, 20($26)                 ; jank_jesus_code.s:106: sw        $t3, 20($k0)
      552 [0x800001a4]	0xaf4c0018  sw $12, 24($26)                 ; jank_jesus_code.s:107: sw $t4, 24($k0)
      552 [0x800001a8]	0xaf4d001c  sw $13, 28($26)                 ; jank_jesus_code.s:108: sw $t5, 28($k0)
      552 [0x800001ac]	0x401a6800  mfc0 $26, $13                   ; jank_jesus_code.s:110: mfc0      $k0, $13             # Get Cause register
      552 [0x800001b0]	0x001a2082  srl $4, $26, 2                  ; jank_jesus_code.s:111: srl       $a0, $k0, 2
      552 [0x800001b4]	0x3084000f  andi $4, $4, 15                 ; jank_jesus_code.s:112: and       $a0, $a0, 0xf        # ExcCode field
      552 [0x800001b8]	0x1404003a  bne $0, $4, 232 [non_intrpt-0x800001b8]; jank_jesus_code.s:113: bne       $a0, 0, non_intrpt
     1103 [0x800001bc]	0x401a6800  mfc0 $26, $13                   ; jank_jesus_code.s:118: mfc0       $k0, $13        # Get Cause register, again
     1103 [0x800001c0]	0x101a003c  beq $0, $26, 240 [done-0x800001c0]; jank_jesus_code.s:119: beq        $k0, 0, done        # handled all outstanding interrupts
      552 [0x800001c4]	0x33441000  andi $4, $26, 4096              ; jank_jesus_code.s:121: and        $a0, $k0, BONK_INT_MASK    # is there a bonk interrupt?
      552 [0x800001c8]	0x1404000a  bne $0, $4, 40 [bonk_interrupt-0x800001c8]; jank_jesus_code.s:122: bne        $a0, 0, bonk_interrupt
      231 [0x800001cc]	0x33448000  andi $4, $26, -32768            ; jank_jesus_code.s:124: and        $a0, $k0, TIMER_INT_MASK    # is there a timer interrupt?
      231 [0x800001d0]	0x14040031  bne $0, $4, 196 [timer_interrupt-0x800001d0]; jank_jesus_code.s:125: bne        $a0, 0, timer_interrupt
      231 [0x800001d4]	0x33440800  andi $4, $26, 2048              ; jank_jesus_code.s:127: and $a0, $k0, REQUEST_PUZZLE_INT_MASK
      231 [0x800001d8]	0x14040019  bne $0, $4, 100 [request_puzzle_interrupt-0x800001d8]; jank_jesus_code.s:128: bne $a0, 0, request_puzzle_interrupt
        0 [0x800001dc]	0x34020004  ori $2, $0, 4                   ; jank_jesus_code.s:130: li        $v0, PRINT_STRING    # Unhandled interrupt types
        0 [0x800001e0]	0x3c019000  lui $1, -28672 [unhandled_str]  ; jank_jesus_code.s:131: la        $a0, unhandled_str
        0 [0x800001e4]	0x34240241  ori $4, $1, 577 [unhandled_str]
        0 [0x800001e8]	0x0000000c  syscall                         ; jank_jesus_code.s:132: syscall
        0 [0x800001ec]	0x080000ac  j 0x000002b0 [done]             ; jank_jesus_code.s:133: j    done
      321 [0x800001f0]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:136: sw $0, BONK_ACK
      321 [0x800001f4]	0xac200060  sw $0, 96($1)
      321 [0x800001f8]	0x34090001  ori $9, $0, 1                   ; jank_jesus_code.s:141: li	$t1, 1
      321 [0x800001fc]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:142: sw  $t1, SWITCH_MODE($0)         #paint mode
      321 [0x80000200]	0xac2900f0  sw $9, 240($1)
      321 [0x80000204]	0x34190064  ori $25, $0, 100                ; jank_jesus_code.s:144: li      $t9, 100
      321 [0x80000208]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:145: sw      $t9, VELOCITY($0)
      321 [0x8000020c]	0xac390010  sw $25, 16($1)
      321 [0x80000210]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:146: sw      $t9, PICKUP_POWERUP
      321 [0x80000214]	0xac3900f4  sw $25, 244($1)
      321 [0x80000218]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:148: lw      $t0, ANGLE
      321 [0x8000021c]	0x8c280014  lw $8, 20($1)
      321 [0x80000220]	0x2108ffbd  addi $8, $8, -67                ; jank_jesus_code.s:150: add     $t0, $t0, -67
      321 [0x80000224]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:151: sw      $t0, ANGLE
      321 [0x80000228]	0xac280014  sw $8, 20($1)
      321 [0x8000022c]	0x34080001  ori $8, $0, 1                   ; jank_jesus_code.s:152: li      $t0, 1
      321 [0x80000230]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:153: sw      $t0, ANGLE_CONTROL
      321 [0x80000234]	0xac280018  sw $8, 24($1)
      321 [0x80000238]	0x0800006f  j 0x000001bc [interrupt_dispatch]; jank_jesus_code.s:155: j       interrupt_dispatch    # see if other interrupts are waiting
      231 [0x8000023c]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:158: sw $0, REQUEST_PUZZLE_ACK
      231 [0x80000240]	0xac2000d8  sw $0, 216($1)
      231 [0x80000244]	0x3419000a  ori $25, $0, 10                 ; jank_jesus_code.s:161: li      $t9, 10
      231 [0x80000248]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:162: sw      $t9, VELOCITY($0)
      231 [0x8000024c]	0xac390010  sw $25, 16($1)
      232 [0x80000250]	0x34080001  ori $8, $0, 1                   ; jank_jesus_code.s:164: li      $t0, 1
      232 [0x80000254]	0x3c011003  lui $1, 4099                    ; jank_jesus_code.s:165: sw      $t0, my_flag($0)
      231 [0x80000258]	0xac2887e8  sw $8, -30744($1)
      231 [0x8000025c]	0x3c041001  lui $4, 4097 [puzzle]           ; jank_jesus_code.s:167: la      $a0, puzzle
      231 [0x80000260]	0x3c011001  lui $1, 4097 [heap]             ; jank_jesus_code.s:168: la      $a1, heap
      231 [0x80000264]	0x34250148  ori $5, $1, 328 [heap]
      231 [0x80000268]	0x0c00025d  jal 0x00000974 [copy_board]     ; jank_jesus_code.s:169: jal     copy_board
      231 [0x8000026c]	0x3c011001  lui $1, 4097 [heap]             ; jank_jesus_code.s:171: la      $a0, heap
      231 [0x80000270]	0x34240148  ori $4, $1, 328 [heap]
      231 [0x80000274]	0x34050000  ori $5, $0, 0                   ; jank_jesus_code.s:172: li      $a1, 0
      231 [0x80000278]	0x34060000  ori $6, $0, 0                   ; jank_jesus_code.s:173: li      $a2, 0
      231 [0x8000027c]	0x3c071001  lui $7, 4097 [puzzle]           ; jank_jesus_code.s:175: la      $a3, puzzle
      231 [0x80000280]	0x0c0000b8  jal 0x000002e0 [solve_puzzle]   ; jank_jesus_code.s:176: jal     solve_puzzle
      230 [0x80000284]	0x3c081001  lui $8, 4097 [puzzle]           ; jank_jesus_code.s:178: la      $t0, puzzle
      230 [0x80000288]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:179: sw      $t0, SUBMIT_SOLUTION($0)
      230 [0x8000028c]	0xac2800d4  sw $8, 212($1)
      230 [0x80000290]	0x0800006f  j 0x000001bc [interrupt_dispatch]; jank_jesus_code.s:181: j	interrupt_dispatch
        0 [0x80000294]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:184: sw $0, TIMER_ACK
        0 [0x80000298]	0xac20006c  sw $0, 108($1)
        0 [0x8000029c]	0x0800006f  j 0x000001bc [interrupt_dispatch]; jank_jesus_code.s:186: j        interrupt_dispatch    # see if other interrupts are waiting
        0 [0x800002a0]	0x34020004  ori $2, $0, 4                   ; jank_jesus_code.s:189: li        $v0, PRINT_STRING
        0 [0x800002a4]	0x3c019000  lui $1, -28672 [non_intrpt_str] ; jank_jesus_code.s:190: la        $a0, non_intrpt_str
        0 [0x800002a8]	0x34240228  ori $4, $1, 552 [non_intrpt_str]
        0 [0x800002ac]	0x0000000c  syscall                         ; jank_jesus_code.s:191: syscall                # print out an error message
      551 [0x800002b0]	0x3c019000  lui $1, -28672 [chunkIH]        ; jank_jesus_code.s:195: la      $k0, chunkIH
      551 [0x800002b4]	0x343a0208  ori $26, $1, 520 [chunkIH]
      551 [0x800002b8]	0x8f440000  lw $4, 0($26)                   ; jank_jesus_code.s:196: lw      $a0, 0($k0)        # Restore saved registers
      551 [0x800002bc]	0x8f420004  lw $2, 4($26)                   ; jank_jesus_code.s:197: lw      $v0, 4($k0)
      551 [0x800002c0]	0x8f480008  lw $8, 8($26)                   ; jank_jesus_code.s:198: lw      $t0, 8($k0)
      551 [0x800002c4]	0x8f49000c  lw $9, 12($26)                  ; jank_jesus_code.s:199: lw      $t1, 12($k0)
      551 [0x800002c8]	0x8f4a0010  lw $10, 16($26)                 ; jank_jesus_code.s:200: lw      $t2, 16($k0)
      551 [0x800002cc]	0x8f4b0014  lw $11, 20($26)                 ; jank_jesus_code.s:201: lw      $t3, 20($k0)
      551 [0x800002d0]	0x8f4c0018  lw $12, 24($26)                 ; jank_jesus_code.s:202: lw $t4, 24($k0)
      551 [0x800002d4]	0x8f4d001c  lw $13, 28($26)                 ; jank_jesus_code.s:203: lw $t5, 28($k0)
      551 [0x800002d8]	0x001b0821  addu $1, $0, $27                ; jank_jesus_code.s:205: move    $at, $k1        # Restore $at
      551 [0x800002dc]	0x42000018  eret                            ; jank_jesus_code.s:207: eret
      231 [0x800002e0]	0x23bdffdc  addi $29, $29, -36              ; jank_jesus_code.s:293: sub     $sp, $sp, 36
      231 [0x800002e4]	0xafbf0000  sw $31, 0($29)                  ; jank_jesus_code.s:294: sw      $ra, 0($sp)
      231 [0x800002e8]	0xafb00004  sw $16, 4($29)                  ; jank_jesus_code.s:295: sw      $s0, 4($sp)
      231 [0x800002ec]	0xafb10008  sw $17, 8($29)                  ; jank_jesus_code.s:296: sw      $s1, 8($sp)
      231 [0x800002f0]	0xafb2000c  sw $18, 12($29)                 ; jank_jesus_code.s:297: sw      $s2, 12($sp)
      231 [0x800002f4]	0xafb30010  sw $19, 16($29)                 ; jank_jesus_code.s:298: sw      $s3, 16($sp)
      231 [0x800002f8]	0xafb40014  sw $20, 20($29)                 ; jank_jesus_code.s:299: sw      $s4, 20($sp)
      231 [0x800002fc]	0xafb50018  sw $21, 24($29)                 ; jank_jesus_code.s:300: sw      $s5, 24($sp)
      231 [0x80000300]	0xafb6001c  sw $22, 28($29)                 ; jank_jesus_code.s:301: sw      $s6, 28($sp)
      231 [0x80000304]	0xafb70020  sw $23, 32($29)                 ; jank_jesus_code.s:302: sw      $s7, 32($sp)
      231 [0x80000308]	0x34170008  ori $23, $0, 8                  ; jank_jesus_code.s:303: li   $s7, GRIDSIZE
      231 [0x8000030c]	0x00058021  addu $16, $0, $5                ; jank_jesus_code.s:304: move $s0, $a1     # row
      231 [0x80000310]	0x00068821  addu $17, $0, $6                ; jank_jesus_code.s:305: move $s1, $a2     # col
      231 [0x80000314]	0x00049021  addu $18, $0, $4                ; jank_jesus_code.s:307: move $s2, $a0     # current_board
      231 [0x80000318]	0x00079821  addu $19, $0, $7                ; jank_jesus_code.s:308: move $s3, $a3     # puzzle
      231 [0x8000031c]	0x0217082a  slt $1, $16, $23                ; jank_jesus_code.s:310: bge  $s0, $s7, solve_done_check  # row >= GRIDSIZE
      231 [0x80000320]	0x10200004  beq $1, $0, 16 [solve_done_check-0x80000320]
      231 [0x80000324]	0x0237082a  slt $1, $17, $23                ; jank_jesus_code.s:311: bge  $s1, $s7, solve_done_check  # col >= GRIDSIZE
      231 [0x80000328]	0x10200002  beq $1, $0, 8 [solve_done_check-0x80000328]
      231 [0x8000032c]	0x080000d6  j 0x00000358 [solve_not_done]   ; jank_jesus_code.s:312: j solve_not_done
        0 [0x80000330]	0x00122021  addu $4, $0, $18                ; jank_jesus_code.s:314: move $a0, $s2     # current_board
        0 [0x80000334]	0x00132821  addu $5, $0, $19                ; jank_jesus_code.s:315: move $a1, $s3     # puzzle
        0 [0x80000338]	0x0c000192  jal 0x00000648 [board_done]     ; jank_jesus_code.s:316: jal board_done
        0 [0x8000033c]	0x10400000  beq $2, $0, 0 [solve_done_false-0x8000033c]; jank_jesus_code.s:318: beq $v0, $0, solve_done_false  # if (done)
        0 [0x80000340]	0x0002b821  addu $23, $0, $2                ; jank_jesus_code.s:319: move $s7, $v0     # save done
        0 [0x80000344]	0x00122021  addu $4, $0, $18                ; jank_jesus_code.s:320: move $a0, $s2     # current_board
        0 [0x80000348]	0x00132821  addu $5, $0, $19                ; jank_jesus_code.s:321: move $a1, $s3     # puzzle // same as puzzle->board
        0 [0x8000034c]	0x0c00025d  jal 0x00000974 [copy_board]     ; jank_jesus_code.s:322: jal copy_board
        0 [0x80000350]	0x00171021  addu $2, $0, $23                ; jank_jesus_code.s:324: move $v0, $s7     # $v0: done
        0 [0x80000354]	0x080000e9  j 0x000003a4 [solve_done]       ; jank_jesus_code.s:326: j solve_done
      231 [0x80000358]	0x00122021  addu $4, $0, $18                ; jank_jesus_code.s:330: move $a0, $s2 # current_board
      231 [0x8000035c]	0x0c000251  jal 0x00000944 [increment_heap] ; jank_jesus_code.s:331: jal increment_heap
      231 [0x80000360]	0x00029021  addu $18, $0, $2                ; jank_jesus_code.s:332: move $s2, $v0 # update current_board
      231 [0x80000364]	0x34020000  ori $2, $0, 0                   ; jank_jesus_code.s:334: li  $v0, 0 # changed = false
      847 [0x80000368]	0x00122021  addu $4, $0, $18                ; jank_jesus_code.s:337: move $a0, $s2
      847 [0x8000036c]	0x0c0000f6  jal 0x000003d8 [rule1]          ; jank_jesus_code.s:340: jal rule1          # changed = rule1(current_board);
      847 [0x80000370]	0x0002b021  addu $22, $0, $2                ; jank_jesus_code.s:341: move $s6, $v0      # done
      847 [0x80000374]	0x00122021  addu $4, $0, $18                ; jank_jesus_code.s:343: move $a0, $s2      # current_board
      847 [0x80000378]	0x1440fffc  bne $2, $0, -16 [solve_start_do-0x80000378]; jank_jesus_code.s:349: bne $v0, $0, solve_start_do # while (changed)
      231 [0x8000037c]	0x00122021  addu $4, $0, $18                ; jank_jesus_code.s:351: move $a0, $s2     # current_board
      231 [0x80000380]	0x00132821  addu $5, $0, $19                ; jank_jesus_code.s:352: move $a1, $s3     # puzzle
      231 [0x80000384]	0x0c000192  jal 0x00000648 [board_done]     ; jank_jesus_code.s:353: jal board_done
      230 [0x80000388]	0x0002b821  addu $23, $0, $2                ; jank_jesus_code.s:355: move $s7, $v0     # save done
      230 [0x8000038c]	0x00122021  addu $4, $0, $18                ; jank_jesus_code.s:356: move $a0, $s2     # current_board
      230 [0x80000390]	0x00132821  addu $5, $0, $19                ; jank_jesus_code.s:357: move $a1, $s3     # puzzle // same as puzzle->board
      230 [0x80000394]	0x0c00025d  jal 0x00000974 [copy_board]     ; jank_jesus_code.s:358: jal copy_board
      230 [0x80000398]	0x00171021  addu $2, $0, $23                ; jank_jesus_code.s:360: move $v0, $s7     # $v0: done
      230 [0x8000039c]	0x080000e9  j 0x000003a4 [solve_done]       ; jank_jesus_code.s:361: j   solve_done
        0 [0x800003a0]	0x34020000  ori $2, $0, 0                   ; jank_jesus_code.s:364: li  $v0, 0        # done = false
      230 [0x800003a4]	0x8fbf0000  lw $31, 0($29)                  ; jank_jesus_code.s:367: lw  $ra, 0($sp)
      230 [0x800003a8]	0x8fb00004  lw $16, 4($29)                  ; jank_jesus_code.s:368: lw  $s0, 4($sp)
      230 [0x800003ac]	0x8fb10008  lw $17, 8($29)                  ; jank_jesus_code.s:369: lw  $s1, 8($sp)
      230 [0x800003b0]	0x8fb2000c  lw $18, 12($29)                 ; jank_jesus_code.s:370: lw  $s2, 12($sp)
      230 [0x800003b4]	0x8fb30010  lw $19, 16($29)                 ; jank_jesus_code.s:371: lw  $s3, 16($sp)
      230 [0x800003b8]	0x8fb40014  lw $20, 20($29)                 ; jank_jesus_code.s:372: lw  $s4, 20($sp)
      230 [0x800003bc]	0x8fb50018  lw $21, 24($29)                 ; jank_jesus_code.s:373: lw  $s5, 24($sp)
      230 [0x800003c0]	0x8fb6001c  lw $22, 28($29)                 ; jank_jesus_code.s:374: lw  $s6, 28($sp)
      230 [0x800003c4]	0x8fb70020  lw $23, 32($29)                 ; jank_jesus_code.s:375: lw  $s7, 32($sp)
      230 [0x800003c8]	0x23bd0024  addi $29, $29, 36               ; jank_jesus_code.s:376: add $sp, $sp, 36
      230 [0x800003cc]	0x03e00008  jr $31                          ; jank_jesus_code.s:377: jr      $ra
        0 [0x800003d0]	0x34020001  ori $2, $0, 1                   ; jank_jesus_code.s:380: li $v0, 1
        0 [0x800003d4]	0x080000e9  j 0x000003a4 [solve_done]       ; jank_jesus_code.s:381: j solve_done
      847 [0x800003d8]	0x23bdffe8  addi $29, $29, -24              ; jank_jesus_code.s:412: sub     $sp, $sp, 24
      847 [0x800003dc]	0xafbf0000  sw $31, 0($29)                  ; jank_jesus_code.s:413: sw      $ra, 0($sp)
      847 [0x800003e0]	0xafb00004  sw $16, 4($29)                  ; jank_jesus_code.s:414: sw      $s0, 4($sp)
      847 [0x800003e4]	0xafb10008  sw $17, 8($29)                  ; jank_jesus_code.s:415: sw      $s1, 8($sp)
      847 [0x800003e8]	0xafb2000c  sw $18, 12($29)                 ; jank_jesus_code.s:416: sw      $s2, 12($sp)
      847 [0x800003ec]	0xafb30010  sw $19, 16($29)                 ; jank_jesus_code.s:417: sw      $s3, 16($sp)
      847 [0x800003f0]	0xafb40014  sw $20, 20($29)                 ; jank_jesus_code.s:418: sw      $s4, 20($sp)
      847 [0x800003f4]	0x34100008  ori $16, $0, 8                  ; jank_jesus_code.s:419: li      $s0, GRIDSIZE                  # $s0: GRIDSIZE = 4
      847 [0x800003f8]	0x00048821  addu $17, $0, $4                ; jank_jesus_code.s:420: move    $s1, $a0                # $s1: board
      847 [0x800003fc]	0x34120000  ori $18, $0, 0                  ; jank_jesus_code.s:421: li      $s2, 0                  # $s2: changed = false
      847 [0x80000400]	0x34130000  ori $19, $0, 0                  ; jank_jesus_code.s:422: li      $s3, 0                  # $s3: y = 0
     7623 [0x80000404]	0x0270082a  slt $1, $19, $16                ; jank_jesus_code.s:424: bge     $s3, $s0, r1_for_y_end  # for: y < GRIDSIZE
     7623 [0x80000408]	0x1020002f  beq $1, $0, 188 [r1_for_y_end-0x80000408]
     6776 [0x8000040c]	0x34140000  ori $20, $0, 0                  ; jank_jesus_code.s:425: li      $s4, 0                  # $s4: x = 0
    60984 [0x80000410]	0x0290082a  slt $1, $20, $16                ; jank_jesus_code.s:427: bge     $s4, $s0, r1_for_x_end  # for: x < GRIDSIZE
    60984 [0x80000414]	0x1020002a  beq $1, $0, 168 [r1_for_x_end-0x80000414]
    54208 [0x80000418]	0x72702002  mul $4, $19, $16                ; jank_jesus_code.s:428: mul     $a0, $s3, $s0           # $a0: y*GRIDSIZE
    54208 [0x8000041c]	0x00942020  add $4, $4, $20                 ; jank_jesus_code.s:429: add     $a0, $a0, $s4           # $a0: y*GRIDSIZE + x
    54208 [0x80000420]	0x00042040  sll $4, $4, 1                   ; jank_jesus_code.s:430: sll     $a0, $a0, 1             # $a0: 2*(y*GRIDSIZE + x)
    54208 [0x80000424]	0x00912020  add $4, $4, $17                 ; jank_jesus_code.s:431: add     $a0, $a0, $s1           # $a0: &board[y*GRIDSIZE+x]
    54208 [0x80000428]	0x94840000  lhu $4, 0($4)                   ; jank_jesus_code.s:432: lhu     $a0, 0($a0)             # $a0: value = board[y*GRIDSIZE+x]
    54208 [0x8000042c]	0x0004b021  addu $22, $0, $4                ; jank_jesus_code.s:433: move    $s6, $a0                # $s6: value
    54208 [0x80000430]	0x0c000246  jal 0x00000918 [has_single_bit_set]; jank_jesus_code.s:434: jal     has_single_bit_set
    54208 [0x80000434]	0x10020020  beq $0, $2, 128 [r1_for_x_inc-0x80000434]; jank_jesus_code.s:435: beq     $v0, 0, r1_for_x_inc    # if(has_single_bit_set(value))
    47225 [0x80000438]	0x34150000  ori $21, $0, 0                  ; jank_jesus_code.s:436: li      $s5, 0                  # $s5: k = 0
    47225 [0x8000043c]	0x34180000  ori $24, $0, 0                  ; jank_jesus_code.s:440: li      $t8, 0
    47225 [0x80000440]	0x7270c002  mul $24, $19, $16               ; jank_jesus_code.s:441: mul     $t8, $s3, $s0           # $t0: y*GRIDSIZE
    47225 [0x80000444]	0x0315c020  add $24, $24, $21               ; jank_jesus_code.s:442: add     $t8, $t8, $s5           # $t0: y*GRIDSIZE + k
    47225 [0x80000448]	0x0018c040  sll $24, $24, 1                 ; jank_jesus_code.s:443: sll     $t8, $t8, 1             # $t0: 2*(y*GRIDSIZE + k)
    47225 [0x8000044c]	0x0311c020  add $24, $24, $17               ; jank_jesus_code.s:444: add     $t8, $t8, $s1           # $t0: &board[y*GRIDSIZE+k]
   425025 [0x80000450]	0x02b0082a  slt $1, $21, $16                ; jank_jesus_code.s:450: bge     $s5, $s0, r1_for_k_end  # for: k < GRIDSIZE
   425025 [0x80000454]	0x10200018  beq $1, $0, 96 [r1_for_k_end-0x80000454]
   377800 [0x80000458]	0x12b40008  beq $21, $20, 32 [r1_if_kx_end-0x80000458]; jank_jesus_code.s:451: beq     $s5, $s4, r1_if_kx_end  # if (k != x)
   330575 [0x8000045c]	0x97090000  lhu $9, 0($24)                  ; jank_jesus_code.s:453: lhu     $t1, 0($t8)             # $t1: board[y*GRIDSIZE + k]
   330575 [0x80000460]	0x01365024  and $10, $9, $22                ; jank_jesus_code.s:454: and     $t2, $t1, $s6           # $t2: board[y*GRIDSIZE + k] & value
   330575 [0x80000464]	0x100a0005  beq $0, $10, 20 [r1_if_kx_end-0x80000464]; jank_jesus_code.s:455: beq     $t2, 0, r1_if_kx_end    # if (board[y*GRIDSIZE + k] & value)
    17581 [0x80000468]	0x02c05827  nor $11, $22, $0                ; jank_jesus_code.s:456: not     $t3, $s6                # $t3: ~value
    17581 [0x8000046c]	0x012b4824  and $9, $9, $11                 ; jank_jesus_code.s:457: and     $t1, $t1, $t3           # $t1:  board[y*GRIDSIZE + k] & ~value
    17581 [0x80000470]	0xa7090000  sh $9, 0($24)                   ; jank_jesus_code.s:458: sh      $t1, 0($t8)             # board[y*GRIDSIZE + k] &= ~value
    17581 [0x80000474]	0x34120001  ori $18, $0, 1                  ; jank_jesus_code.s:461: li      $s2, 1                  # changed = true
   377800 [0x80000478]	0x12b3000c  beq $21, $19, 48 [r1_if_ky_end-0x80000478]; jank_jesus_code.s:463: beq     $s5, $s3, r1_if_ky_end  # if (k != y)
   330575 [0x8000047c]	0x72b04002  mul $8, $21, $16                ; jank_jesus_code.s:464: mul     $t0, $s5, $s0           # $t0: k*GRIDSIZE
   330575 [0x80000480]	0x01144020  add $8, $8, $20                 ; jank_jesus_code.s:465: add     $t0, $t0, $s4           # $t0: k*GRIDSIZE + x
   330575 [0x80000484]	0x00084040  sll $8, $8, 1                   ; jank_jesus_code.s:466: sll     $t0, $t0, 1             # $t0: 2*(k*GRIDSIZE + x)
   330575 [0x80000488]	0x01114020  add $8, $8, $17                 ; jank_jesus_code.s:467: add     $t0, $t0, $s1           # $t0: &board[k*GRIDSIZE+x]
   330575 [0x8000048c]	0x95090000  lhu $9, 0($8)                   ; jank_jesus_code.s:468: lhu     $t1, 0($t0)             # $t1: board[k*GRIDSIZE + x]
   330575 [0x80000490]	0x01365024  and $10, $9, $22                ; jank_jesus_code.s:469: and     $t2, $t1, $s6           # $t2: board[k*GRIDSIZE + x] & value
   330575 [0x80000494]	0x100a0005  beq $0, $10, 20 [r1_if_ky_end-0x80000494]; jank_jesus_code.s:470: beq     $t2, 0, r1_if_ky_end    # if (board[k*GRIDSIZE + x] & value)
    17777 [0x80000498]	0x02c05827  nor $11, $22, $0                ; jank_jesus_code.s:471: not     $t3, $s6                # $t3: ~value
    17777 [0x8000049c]	0x012b4824  and $9, $9, $11                 ; jank_jesus_code.s:472: and     $t1, $t1, $t3           # $t1:  board[k*GRIDSIZE + x] & ~value
    17777 [0x800004a0]	0xa5090000  sh $9, 0($8)                    ; jank_jesus_code.s:473: sh      $t1, 0($t0)             # board[k*GRIDSIZE + x] &= ~value
    17777 [0x800004a4]	0x34120001  ori $18, $0, 1                  ; jank_jesus_code.s:474: li      $s2, 1                  # changed = true
   377800 [0x800004a8]	0x22b50001  addi $21, $21, 1                ; jank_jesus_code.s:476: add     $s5, $s5, 1             # for: k++
   377800 [0x800004ac]	0x23180002  addi $24, $24, 2                ; jank_jesus_code.s:477: add     $t8, $t8, 2
   377800 [0x800004b0]	0x08000114  j 0x00000450 [r1_for_k_start]   ; jank_jesus_code.s:478: j       r1_for_k_start
    54208 [0x800004b4]	0x22940001  addi $20, $20, 1                ; jank_jesus_code.s:481: add     $s4, $s4, 1             # for: x++
    54208 [0x800004b8]	0x08000104  j 0x00000410 [r1_for_x_start]   ; jank_jesus_code.s:482: j       r1_for_x_start  
     6776 [0x800004bc]	0x22730001  addi $19, $19, 1                ; jank_jesus_code.s:485: add     $s3, $s3, 1             # for: y++
     6776 [0x800004c0]	0x08000101  j 0x00000404 [r1_for_y_start]   ; jank_jesus_code.s:486: j       r1_for_y_start
      847 [0x800004c4]	0x00121021  addu $2, $0, $18                ; jank_jesus_code.s:488: move    $v0, $s2                # return changed
      847 [0x800004c8]	0x8fbf0000  lw $31, 0($29)                  ; jank_jesus_code.s:490: lw      $ra, 0($sp)
      847 [0x800004cc]	0x8fb00004  lw $16, 4($29)                  ; jank_jesus_code.s:491: lw      $s0, 4($sp)
      847 [0x800004d0]	0x8fb10008  lw $17, 8($29)                  ; jank_jesus_code.s:492: lw      $s1, 8($sp)
      847 [0x800004d4]	0x8fb2000c  lw $18, 12($29)                 ; jank_jesus_code.s:493: lw      $s2, 12($sp)
      847 [0x800004d8]	0x8fb30010  lw $19, 16($29)                 ; jank_jesus_code.s:494: lw      $s3, 16($sp)
      847 [0x800004dc]	0x8fb40014  lw $20, 20($29)                 ; jank_jesus_code.s:495: lw      $s4, 20($sp)
      847 [0x800004e0]	0x23bd0018  addi $29, $29, 24               ; jank_jesus_code.s:496: add     $sp, $sp, 24
      847 [0x800004e4]	0x03e00008  jr $31                          ; jank_jesus_code.s:497: jr      $ra
        0 [0x800004e8]	0x23bdfffc  addi $29, $29, -4               ; jank_jesus_code.s:503: sub $sp, $sp, 4                       #Store ra onto stack and initialize GRIDSIZE
        0 [0x800004ec]	0xafbf0000  sw $31, 0($29)                  ; jank_jesus_code.s:504: sw $ra, 0($sp)
        0 [0x800004f0]	0x34080008  ori $8, $0, 8                   ; jank_jesus_code.s:505: li $t0, GRIDSIZE                               # GRIDSIZE
        0 [0x800004f4]	0x34090001  ori $9, $0, 1                   ; jank_jesus_code.s:506: li $t1, 1
        0 [0x800004f8]	0x01094804  sllv $9, $9, $8                 ; jank_jesus_code.s:507: sll $t1, $t1, $t0
        0 [0x800004fc]	0x2529ffff  addiu $9, $9, -1                ; jank_jesus_code.s:508: subu $t1, $t1, 1                         #int ALL_VALUES = (1 << GRIDSIZE) - 1;
        0 [0x80000500]	0x34020000  ori $2, $0, 0                   ; jank_jesus_code.s:509: li $v0, 0                               #bool changed = false
        0 [0x80000504]	0x340a0000  ori $10, $0, 0                  ; jank_jesus_code.s:510: li $t2, 0                               #i = 0
        0 [0x80000508]	0x0148082a  slt $1, $10, $8                 ; jank_jesus_code.s:512: bge $t2, $t0, rule2iloopend
        0 [0x8000050c]	0x1020004c  beq $1, $0, 304 [rule2iloopend-0x8000050c]
        0 [0x80000510]	0x340b0000  ori $11, $0, 0                  ; jank_jesus_code.s:513: li $t3, 0                               #j = 0
        0 [0x80000514]	0x0168082a  slt $1, $11, $8                 ; jank_jesus_code.s:515: bge $t3, $t0, rule2jloopend
        0 [0x80000518]	0x10200047  beq $1, $0, 284 [rule2jloopend-0x80000518]
        0 [0x8000051c]	0x71486002  mul $12, $10, $8                ; jank_jesus_code.s:517: mul $t4, $t2, $t0
        0 [0x80000520]	0x018b6020  add $12, $12, $11               ; jank_jesus_code.s:518: add $t4, $t4, $t3
        0 [0x80000524]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:519: mul $t4, $t4, 2                     #sizeof(unsigned short)*(i*GRIDSIZE + j)
        0 [0x80000528]	0x71816002  mul $12, $12, $1
        0 [0x8000052c]	0x008c6020  add $12, $4, $12                ; jank_jesus_code.s:520: add $t4, $a0, $t4                   #address of board[i*GRIDSIZE+j]
        0 [0x80000530]	0x958c0000  lhu $12, 0($12)                 ; jank_jesus_code.s:521: lhu $t4, 0($t4)                     #board[i*GRIDSIZE + j]
        0 [0x80000534]	0x23bdffe8  addi $29, $29, -24              ; jank_jesus_code.s:523: sub $sp, $sp, 24                    # Allocate stack 
        0 [0x80000538]	0xafa40000  sw $4, 0($29)                   ; jank_jesus_code.s:524: sw $a0, 0($sp)
        0 [0x8000053c]	0xafa80004  sw $8, 4($29)                   ; jank_jesus_code.s:525: sw $t0, 4($sp)
        0 [0x80000540]	0xafa90008  sw $9, 8($29)                   ; jank_jesus_code.s:526: sw $t1, 8($sp)
        0 [0x80000544]	0xafaa000c  sw $10, 12($29)                 ; jank_jesus_code.s:527: sw $t2, 12($sp)
        0 [0x80000548]	0xafab0010  sw $11, 16($29)                 ; jank_jesus_code.s:528: sw $t3, 16($sp)
        0 [0x8000054c]	0xafa20014  sw $2, 20($29)                  ; jank_jesus_code.s:529: sw $v0, 20($sp)                     #Store all necessary variables on stack
        0 [0x80000550]	0x000c2021  addu $4, $0, $12                ; jank_jesus_code.s:530: move $a0, $t4
        0 [0x80000554]	0x0c000246  jal 0x00000918 [has_single_bit_set]; jank_jesus_code.s:531: jal has_single_bit_set
        0 [0x80000558]	0x8fa40000  lw $4, 0($29)                   ; jank_jesus_code.s:532: lw $a0, 0($sp)
        0 [0x8000055c]	0x8fa80004  lw $8, 4($29)                   ; jank_jesus_code.s:533: lw $t0, 4($sp)
        0 [0x80000560]	0x8fa90008  lw $9, 8($29)                   ; jank_jesus_code.s:534: lw $t1, 8($sp)
        0 [0x80000564]	0x8faa000c  lw $10, 12($29)                 ; jank_jesus_code.s:535: lw $t2, 12($sp)
        0 [0x80000568]	0x8fab0010  lw $11, 16($29)                 ; jank_jesus_code.s:536: lw $t3, 16($sp)
        0 [0x8000056c]	0x00026021  addu $12, $0, $2                ; jank_jesus_code.s:537: move $t4, $v0                       # Save $v0 into $t4
        0 [0x80000570]	0x8fa20014  lw $2, 20($29)                  ; jank_jesus_code.s:538: lw $v0, 20($sp)                     # Restore variables
        0 [0x80000574]	0x23bd0018  addi $29, $29, 24               ; jank_jesus_code.s:539: add $sp, $sp, 24                    # Deallocate stack
        0 [0x80000578]	0x1580002d  bne $12, $0, 180 [rule2continuestatement-0x80000578]; jank_jesus_code.s:541: bne $t4, $0, rule2continuestatement #if (has_single_bit_set(value)) continue;
        0 [0x8000057c]	0x340d0000  ori $13, $0, 0                  ; jank_jesus_code.s:543: li $t5, 0                           #isum = 0
        0 [0x80000580]	0x340e0000  ori $14, $0, 0                  ; jank_jesus_code.s:544: li $t6, 0                           #jsum = 0
        0 [0x80000584]	0x340c0000  ori $12, $0, 0                  ; jank_jesus_code.s:545: li $t4, 0                           #k = 0, t2 = i, t3 = j, t4 = k
        0 [0x80000588]	0x0188082a  slt $1, $12, $8                 ; jank_jesus_code.s:547: bge $t4, $t0, rule2kloopend
        0 [0x8000058c]	0x10200013  beq $1, $0, 76 [rule2kloopend-0x8000058c]
        0 [0x80000590]	0x118b0008  beq $12, $11, 32 [rule2kequalsj-0x80000590]; jank_jesus_code.s:548: beq $t4, $t3, rule2kequalsj
        0 [0x80000594]	0x71487802  mul $15, $10, $8                ; jank_jesus_code.s:549: mul $t7, $t2, $t0           #i*GRIDSIZE
        0 [0x80000598]	0x01ec7820  add $15, $15, $12               ; jank_jesus_code.s:550: add $t7, $t7, $t4           #i*GRIDSIZE+k
        0 [0x8000059c]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:551: mul $t7, $t7, 2
        0 [0x800005a0]	0x71e17802  mul $15, $15, $1
        0 [0x800005a4]	0x008f7820  add $15, $4, $15                ; jank_jesus_code.s:552: add $t7, $a0, $t7           #&board[i*GRIDSIZE + k]
        0 [0x800005a8]	0x95ef0000  lhu $15, 0($15)                 ; jank_jesus_code.s:553: lhu $t7, 0($t7)
        0 [0x800005ac]	0x01cf7025  or $14, $14, $15                ; jank_jesus_code.s:554: or $t6, $t6, $t7            #jsum |= board[i*GRIDSIZE + k];
        0 [0x800005b0]	0x118a0008  beq $12, $10, 32 [rule2kequalsi-0x800005b0]; jank_jesus_code.s:556: beq $t4, $t2, rule2kequalsi     
        0 [0x800005b4]	0x71887802  mul $15, $12, $8                ; jank_jesus_code.s:557: mul $t7, $t4, $t0           #k*GRIDSIZE
        0 [0x800005b8]	0x01eb7820  add $15, $15, $11               ; jank_jesus_code.s:558: add $t7, $t7, $t3           #k*GRIDSIZE+j
        0 [0x800005bc]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:559: mul $t7, $t7, 2
        0 [0x800005c0]	0x71e17802  mul $15, $15, $1
        0 [0x800005c4]	0x008f7820  add $15, $4, $15                ; jank_jesus_code.s:560: add $t7, $a0, $t7           #&board[k*GRIDSIZE + j]
        0 [0x800005c8]	0x95ef0000  lhu $15, 0($15)                 ; jank_jesus_code.s:561: lhu $t7, 0($t7)
        0 [0x800005cc]	0x01af6825  or $13, $13, $15                ; jank_jesus_code.s:562: or $t5, $t5, $t7            #isum |= board[k*GRIDSIZE + j];
        0 [0x800005d0]	0x218c0001  addi $12, $12, 1                ; jank_jesus_code.s:564: add $t4, $t4, 1
        0 [0x800005d4]	0x08000162  j 0x00000588 [rule2kloopstart]  ; jank_jesus_code.s:565: j rule2kloopstart
        0 [0x800005d8]	0x112e000b  beq $9, $14, 44 [rule2allvalequalsjsum-0x800005d8]; jank_jesus_code.s:567: beq $t1, $t6, rule2allvalequalsjsum
        0 [0x800005dc]	0x01c07027  nor $14, $14, $0                ; jank_jesus_code.s:568: not $t6, $t6                    # ~jsum
        0 [0x800005e0]	0x012e7024  and $14, $9, $14                ; jank_jesus_code.s:569: and $t6, $t1, $t6               #ALL_VALUES & ~jsum
        0 [0x800005e4]	0x710a7802  mul $15, $8, $10                ; jank_jesus_code.s:570: mul $t7, $t0, $t2               # i*GRIDSIZE
        0 [0x800005e8]	0x01eb7820  add $15, $15, $11               ; jank_jesus_code.s:571: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
        0 [0x800005ec]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:572: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
        0 [0x800005f0]	0x71e17802  mul $15, $15, $1
        0 [0x800005f4]	0x008f7820  add $15, $4, $15                ; jank_jesus_code.s:573: add $t7, $a0, $t7
        0 [0x800005f8]	0xa5ee0000  sh $14, 0($15)                  ; jank_jesus_code.s:574: sh $t6, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~jsum;
        0 [0x800005fc]	0x34020001  ori $2, $0, 1                   ; jank_jesus_code.s:575: li $v0, 1
        0 [0x80000600]	0x0800018b  j 0x0000062c [rule2continuestatement]; jank_jesus_code.s:576: j rule2continuestatement
        0 [0x80000604]	0x112d000a  beq $9, $13, 40 [rule2continuestatement-0x80000604]; jank_jesus_code.s:578:  4($sp)
        0 [0x80000608]	0x01a06827  nor $13, $13, $0                ; jank_jesus_code.s:579: not $t5, $t5                    # ~isum
        0 [0x8000060c]	0x012d6824  and $13, $9, $13                ; jank_jesus_code.s:580: and $t5, $t1, $t5               #ALL_VALUES & ~isum;
        0 [0x80000610]	0x710a7802  mul $15, $8, $10                ; jank_jesus_code.s:581: mul $t7, $t0, $t2               # i*GRIDSIZE
        0 [0x80000614]	0x01eb7820  add $15, $15, $11               ; jank_jesus_code.s:582: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
        0 [0x80000618]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:583: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
        0 [0x8000061c]	0x71e17802  mul $15, $15, $1
        0 [0x80000620]	0x008f7820  add $15, $4, $15                ; jank_jesus_code.s:584: add $t7, $a0, $t7
        0 [0x80000624]	0xa5ed0000  sh $13, 0($15)                  ; jank_jesus_code.s:585: sh $t5, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~isum;
        0 [0x80000628]	0x34020001  ori $2, $0, 1                   ; jank_jesus_code.s:586: li $v0, 1
        0 [0x8000062c]	0x216b0001  addi $11, $11, 1                ; jank_jesus_code.s:588: add $t3, $t3, 1
        0 [0x80000630]	0x08000145  j 0x00000514 [rule2jloopstart]  ; jank_jesus_code.s:589: j rule2jloopstart                   #continue; iterates to next index of jloop
        0 [0x80000634]	0x214a0001  addi $10, $10, 1                ; jank_jesus_code.s:591: add $t2, $t2, 1
        0 [0x80000638]	0x08000142  j 0x00000508 [rule2iloopstart]  ; jank_jesus_code.s:592: j rule2iloopstart
        0 [0x8000063c]	0x8fbf0000  lw $31, 0($29)                  ; jank_jesus_code.s:595: lw $ra, 0($sp)
        0 [0x80000640]	0x23bd0004  addi $29, $29, 4                ; jank_jesus_code.s:596: add $sp, $sp, 4
        0 [0x80000644]	0x03e00008  jr $31                          ; jank_jesus_code.s:597: jr $ra
      231 [0x80000648]	0x23bdffdc  addi $29, $29, -36              ; jank_jesus_code.s:605: sub $sp, $sp, 36
      231 [0x8000064c]	0xafbf0000  sw $31, 0($29)                  ; jank_jesus_code.s:606: sw  $ra, 0($sp)
      231 [0x80000650]	0xafb00004  sw $16, 4($29)                  ; jank_jesus_code.s:607: sw  $s0, 4($sp)
      231 [0x80000654]	0xafb10008  sw $17, 8($29)                  ; jank_jesus_code.s:608: sw  $s1, 8($sp)
      231 [0x80000658]	0xafb2000c  sw $18, 12($29)                 ; jank_jesus_code.s:609: sw  $s2, 12($sp)
      231 [0x8000065c]	0xafb30010  sw $19, 16($29)                 ; jank_jesus_code.s:610: sw  $s3, 16($sp)
      231 [0x80000660]	0xafb40014  sw $20, 20($29)                 ; jank_jesus_code.s:611: sw  $s4, 20($sp)
      231 [0x80000664]	0xafb50018  sw $21, 24($29)                 ; jank_jesus_code.s:612: sw  $s5, 24($sp)
      231 [0x80000668]	0xafb6001c  sw $22, 28($29)                 ; jank_jesus_code.s:613: sw  $s6, 28($sp)
      231 [0x8000066c]	0xafb70020  sw $23, 32($29)                 ; jank_jesus_code.s:614: sw  $s7, 32($sp)
      231 [0x80000670]	0x00048021  addu $16, $0, $4                ; jank_jesus_code.s:616: move    $s0, $a0        # s0 = current_board
      231 [0x80000674]	0x00058821  addu $17, $0, $5                ; jank_jesus_code.s:617: move    $s1, $a1        # s1 = puzzle
      231 [0x80000678]	0x34120008  ori $18, $0, 8                  ; jank_jesus_code.s:618: li  $s2, GRIDSIZE              # s2 = GRIDSIZE
      231 [0x8000067c]	0x34080001  ori $8, $0, 1                   ; jank_jesus_code.s:619: li  $t0, 1
      231 [0x80000680]	0x02484004  sllv $8, $8, $18                ; jank_jesus_code.s:620: sll $t0, $t0, $s2       # 1 << GRIDSIZE
      231 [0x80000684]	0x2113ffff  addi $19, $8, -1                ; jank_jesus_code.s:621: sub $s3, $t0, 1     # s3 = ALL_VALUES = (1 << GRIDSIZE) - 1
      231 [0x80000688]	0x34140000  ori $20, $0, 0                  ; jank_jesus_code.s:623: li  $s4, 0          # s4 = i = 0
     1808 [0x8000068c]	0x0292082a  slt $1, $20, $18                ; jank_jesus_code.s:625: bge $s4, $s2, bd_i1_loop_end    # !(i < GRIDSIZE)
     1808 [0x80000690]	0x10200025  beq $1, $0, 148 [bd_i1_loop_end-0x80000690]
     1615 [0x80000694]	0x34150000  ori $21, $0, 0                  ; jank_jesus_code.s:627: li  $s5, 0          # s5 = acc = 0
     1615 [0x80000698]	0x34160000  ori $22, $0, 0                  ; jank_jesus_code.s:628: li  $s6, 0          # s6 = j = 0
    14535 [0x8000069c]	0x02d2082a  slt $1, $22, $18                ; jank_jesus_code.s:630: bge $s6, $s2, bd_j1_loop_end    # !(j < GRIDSIZE)
    14535 [0x800006a0]	0x1020000d  beq $1, $0, 52 [bd_j1_loop_end-0x800006a0]
    12920 [0x800006a4]	0x72924002  mul $8, $20, $18                ; jank_jesus_code.s:632: mul $t0, $s4, $s2       # i*GRIDSIZE
    12920 [0x800006a8]	0x01164020  add $8, $8, $22                 ; jank_jesus_code.s:633: add $t0, $t0, $s6       # i*GRIDSIZE + j
    12920 [0x800006ac]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:634: mul $t0, $t0, 2         # sizeof(unsigned short)*(i*GRIDSIZE + j)
    12920 [0x800006b0]	0x71014002  mul $8, $8, $1
    12920 [0x800006b4]	0x02084020  add $8, $16, $8                 ; jank_jesus_code.s:635: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
    12920 [0x800006b8]	0x95170000  lhu $23, 0($8)                  ; jank_jesus_code.s:636: lhu $s7, 0($t0)         # s7 = value = current_board[i*GRIDSIZE + j]
    12920 [0x800006bc]	0x00172021  addu $4, $0, $23                ; jank_jesus_code.s:638: move    $a0, $s7
    12920 [0x800006c0]	0x0c000246  jal 0x00000918 [has_single_bit_set]; jank_jesus_code.s:639: jal has_single_bit_set
    12920 [0x800006c4]	0x10400002  beq $2, $0, 8 [bd_j1_loop_increment-0x800006c4]; jank_jesus_code.s:640: beq $v0, $0, bd_j1_loop_increment   # if (!hsbs(value)) continue
    12874 [0x800006c8]	0x02b7a826  xor $21, $21, $23               ; jank_jesus_code.s:641: xor $s5, $s5, $s7
    12920 [0x800006cc]	0x22d60001  addi $22, $22, 1                ; jank_jesus_code.s:644: add $s6, $s6, 1     # ++ j
    12920 [0x800006d0]	0x080001a7  j 0x0000069c [bd_j1_loop_start] ; jank_jesus_code.s:645: j   bd_j1_loop_start
     1615 [0x800006d4]	0x16b30085  bne $21, $19, 532 [bd_return_false-0x800006d4]; jank_jesus_code.s:647: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
     1593 [0x800006d8]	0x34150000  ori $21, $0, 0                  ; jank_jesus_code.s:649: li  $s5, 0          # s5 = acc = 0
     1593 [0x800006dc]	0x34160000  ori $22, $0, 0                  ; jank_jesus_code.s:650: li  $s6, 0          # s6 = j = 0
    14337 [0x800006e0]	0x02d2082a  slt $1, $22, $18                ; jank_jesus_code.s:652: bge $s6, $s2, bd_j2_loop_end    # !(j < GRIDSIZE)
    14337 [0x800006e4]	0x1020000d  beq $1, $0, 52 [bd_j2_loop_end-0x800006e4]
    12744 [0x800006e8]	0x72d24002  mul $8, $22, $18                ; jank_jesus_code.s:654: mul $t0, $s6, $s2       # j*GRIDSIZE
    12744 [0x800006ec]	0x01144020  add $8, $8, $20                 ; jank_jesus_code.s:655: add $t0, $t0, $s4       # j*GRIDSIZE + i
    12744 [0x800006f0]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:656: mul $t0, $t0, 2
    12744 [0x800006f4]	0x71014002  mul $8, $8, $1
    12744 [0x800006f8]	0x02084020  add $8, $16, $8                 ; jank_jesus_code.s:657: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
    12744 [0x800006fc]	0x95170000  lhu $23, 0($8)                  ; jank_jesus_code.s:658: lhu $s7, 0($t0)     # s7 = value = current_board[j*GRIDSIZE + i]
    12744 [0x80000700]	0x00172021  addu $4, $0, $23                ; jank_jesus_code.s:660: move    $a0, $s7
    12744 [0x80000704]	0x0c000246  jal 0x00000918 [has_single_bit_set]; jank_jesus_code.s:661: jal has_single_bit_set
    12744 [0x80000708]	0x10400002  beq $2, $0, 8 [bd_j2_loop_increment-0x80000708]; jank_jesus_code.s:662: beq $v0, $0, bd_j2_loop_increment   # if (!hsbs(value)) continue
    12712 [0x8000070c]	0x02b7a826  xor $21, $21, $23               ; jank_jesus_code.s:663: xor $s5, $s5, $s7
    12744 [0x80000710]	0x22d60001  addi $22, $22, 1                ; jank_jesus_code.s:666: add $s6, $s6, 1     # ++ j
    12744 [0x80000714]	0x080001b8  j 0x000006e0 [bd_j2_loop_start] ; jank_jesus_code.s:667: j   bd_j2_loop_start
     1593 [0x80000718]	0x16b30074  bne $21, $19, 464 [bd_return_false-0x80000718]; jank_jesus_code.s:669: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
     1577 [0x8000071c]	0x22940001  addi $20, $20, 1                ; jank_jesus_code.s:672: add $s4, $s4, 1     # ++ i
     1577 [0x80000720]	0x080001a3  j 0x0000068c [bd_i1_loop_start] ; jank_jesus_code.s:673: j   bd_i1_loop_start
      193 [0x80000724]	0x34140000  ori $20, $0, 0                  ; jank_jesus_code.s:675: li  $s4, 0          # s4 = i = 0
     1735 [0x80000728]	0x0292082a  slt $1, $20, $18                ; jank_jesus_code.s:677: bge $s4, $s2, bd_i2_loop_end    # !(i < GRIDSIZE)
     1735 [0x8000072c]	0x1020006d  beq $1, $0, 436 [bd_i2_loop_end-0x8000072c]
     1543 [0x80000730]	0x34080002  ori $8, $0, 2                   ; jank_jesus_code.s:679: li  $t0, 2          # sizeof(short)
     1543 [0x80000734]	0x71124002  mul $8, $8, $18                 ; jank_jesus_code.s:680: mul $t0, $t0, $s2
     1543 [0x80000738]	0x71124002  mul $8, $8, $18                 ; jank_jesus_code.s:681: mul $t0, $t0, $s2       # sizeof(unsigned short board[GRIDSIZE*GRIDSIZE])
     1543 [0x8000073c]	0x02289820  add $19, $17, $8                ; jank_jesus_code.s:682: add $s3, $s1, $t0       # s3 = &(puzzle->constraints)
     1543 [0x80000740]	0x22880001  addi $8, $20, 1                 ; jank_jesus_code.s:684: add $t0, $s4, 1     # i+1
     1543 [0x80000744]	0x22490002  addi $9, $18, 2                 ; jank_jesus_code.s:685: add $t1, $s2, 2     # GRIDSIZE+2
     1543 [0x80000748]	0x71094002  mul $8, $8, $9                  ; jank_jesus_code.s:686: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
     1543 [0x8000074c]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:687: mul $t0, $t0, 2
     1543 [0x80000750]	0x71014002  mul $8, $8, $1
     1543 [0x80000754]	0x01134020  add $8, $8, $19                 ; jank_jesus_code.s:688: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
     1543 [0x80000758]	0x95190000  lhu $25, 0($8)                  ; jank_jesus_code.s:689: lhu $t9, 0($t0)     # t9 = left_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
     1543 [0x8000075c]	0x34150000  ori $21, $0, 0                  ; jank_jesus_code.s:690: li  $s5, 0          # s5 = count = 0
     1543 [0x80000760]	0x34160000  ori $22, $0, 0                  ; jank_jesus_code.s:691: li  $s6, 0          # s6 = last = 0
     1543 [0x80000764]	0x34170000  ori $23, $0, 0                  ; jank_jesus_code.s:693: li  $s7, 0          # s7 = j = 0
    13885 [0x80000768]	0x02f2082a  slt $1, $23, $18                ; jank_jesus_code.s:695: bge $s7, $s2, bd_j3_loop_end    # !(j < GRIDSIZE)
    13885 [0x8000076c]	0x1020000d  beq $1, $0, 52 [bd_j3_loop_end-0x8000076c]
    12343 [0x80000770]	0x72924002  mul $8, $20, $18                ; jank_jesus_code.s:697: mul $t0, $s4, $s2       # i*GRIDSIZE
    12343 [0x80000774]	0x01174020  add $8, $8, $23                 ; jank_jesus_code.s:698: add $t0, $t0, $s7       # i*GRIDSIZE + j
    12342 [0x80000778]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:699: mul $t0, $t0, 2
    12342 [0x8000077c]	0x71014002  mul $8, $8, $1
    12342 [0x80000780]	0x02084020  add $8, $16, $8                 ; jank_jesus_code.s:700: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
    12342 [0x80000784]	0x95080000  lhu $8, 0($8)                   ; jank_jesus_code.s:701: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
    12342 [0x80000788]	0x02c8082a  slt $1, $22, $8                 ; jank_jesus_code.s:702: ble $t0, $s6, bd_j3_loop_increment  # !(current > last)
    12342 [0x8000078c]	0x10200003  beq $1, $0, 12 [bd_j3_loop_increment-0x8000078c]
     4205 [0x80000790]	0x22b50001  addi $21, $21, 1                ; jank_jesus_code.s:703: add $s5, $s5, 1     # count += 1
     4205 [0x80000794]	0x0008b021  addu $22, $0, $8                ; jank_jesus_code.s:704: move    $s6, $t0        # last = current
    12342 [0x80000798]	0x22f70001  addi $23, $23, 1                ; jank_jesus_code.s:706: add $s7, $s7, 1     # ++ j
    12342 [0x8000079c]	0x080001da  j 0x00000768 [bd_j3_loop_start] ; jank_jesus_code.s:707: j   bd_j3_loop_start
     1542 [0x800007a0]	0x16b90052  bne $21, $25, 328 [bd_return_false-0x800007a0]; jank_jesus_code.s:709: bne $s5, $t9, bd_return_false   # if (count != left_constraint) return false
     1542 [0x800007a4]	0x22880001  addi $8, $20, 1                 ; jank_jesus_code.s:711: add $t0, $s4, 1     # i+1
     1542 [0x800007a8]	0x22490002  addi $9, $18, 2                 ; jank_jesus_code.s:712: add $t1, $s2, 2     # GRIDSIZE+2
     1542 [0x800007ac]	0x71094002  mul $8, $8, $9                  ; jank_jesus_code.s:713: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
     1542 [0x800007b0]	0x01124020  add $8, $8, $18                 ; jank_jesus_code.s:714: add $t0, $t0, $s2       # (i+1)*(GRIDSIZE+2) + GRIDSIZE
     1542 [0x800007b4]	0x21080001  addi $8, $8, 1                  ; jank_jesus_code.s:715: add $t0, $t0, 1     # (i+1)*(GRIDSIZE+2) + GRIDSIZE + 1
     1542 [0x800007b8]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:716: mul $t0, $t0, 2
     1542 [0x800007bc]	0x71014002  mul $8, $8, $1
     1542 [0x800007c0]	0x01134020  add $8, $8, $19                 ; jank_jesus_code.s:717: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
     1542 [0x800007c4]	0x95190000  lhu $25, 0($8)                  ; jank_jesus_code.s:718: lhu $t9, 0($t0)     # t9 = right_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
     1542 [0x800007c8]	0x34150000  ori $21, $0, 0                  ; jank_jesus_code.s:719: li  $s5, 0          # s5 = count = 0
     1542 [0x800007cc]	0x34160000  ori $22, $0, 0                  ; jank_jesus_code.s:720: li  $s6, 0          # s6 = last = 0
     1542 [0x800007d0]	0x2257ffff  addi $23, $18, -1               ; jank_jesus_code.s:722: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
    13878 [0x800007d4]	0x02e0082a  slt $1, $23, $0                 ; jank_jesus_code.s:724: blt $s7, $0, bd_j4_loop_end # !(j >= 0)
    13878 [0x800007d8]	0x1420000d  bne $1, $0, 52 [bd_j4_loop_end-0x800007d8]
    12336 [0x800007dc]	0x72924002  mul $8, $20, $18                ; jank_jesus_code.s:726: mul $t0, $s4, $s2       # i*GRIDSIZE
    12336 [0x800007e0]	0x01174020  add $8, $8, $23                 ; jank_jesus_code.s:727: add $t0, $t0, $s7       # i*GRIDSIZE + j
    12336 [0x800007e4]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:728: mul $t0, $t0, 2
    12336 [0x800007e8]	0x71014002  mul $8, $8, $1
    12336 [0x800007ec]	0x02084020  add $8, $16, $8                 ; jank_jesus_code.s:729: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
    12336 [0x800007f0]	0x95080000  lhu $8, 0($8)                   ; jank_jesus_code.s:730: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
    12336 [0x800007f4]	0x02c8082a  slt $1, $22, $8                 ; jank_jesus_code.s:731: ble $t0, $s6, bd_j4_loop_increment  # !(current > last)
    12336 [0x800007f8]	0x10200003  beq $1, $0, 12 [bd_j4_loop_increment-0x800007f8]
     4228 [0x800007fc]	0x22b50001  addi $21, $21, 1                ; jank_jesus_code.s:732: add $s5, $s5, 1     # count += 1
     4228 [0x80000800]	0x0008b021  addu $22, $0, $8                ; jank_jesus_code.s:733: move    $s6, $t0        # last = current
    12336 [0x80000804]	0x22f7ffff  addi $23, $23, -1               ; jank_jesus_code.s:735: sub $s7, $s7, 1     # -- j
    12336 [0x80000808]	0x080001f5  j 0x000007d4 [bd_j4_loop_start] ; jank_jesus_code.s:736: j   bd_j4_loop_start
     1542 [0x8000080c]	0x16b90037  bne $21, $25, 220 [bd_return_false-0x8000080c]; jank_jesus_code.s:738: bne $s5, $t9, bd_return_false   # if (count != right_constraint) return false
     1542 [0x80000810]	0x22880001  addi $8, $20, 1                 ; jank_jesus_code.s:739: add $t0, $s4, 1     # i+1
     1542 [0x80000814]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:740: mul $t0, $t0, 2
     1542 [0x80000818]	0x71014002  mul $8, $8, $1
     1542 [0x8000081c]	0x01134020  add $8, $8, $19                 ; jank_jesus_code.s:741: add $t0, $t0, $s3       # &puzzle->constraints[i + 1]
     1542 [0x80000820]	0x95190000  lhu $25, 0($8)                  ; jank_jesus_code.s:742: lhu $t9, 0($t0)     # t9 = top_constraint = puzzle->constraints[i + 1]
     1542 [0x80000824]	0x34150000  ori $21, $0, 0                  ; jank_jesus_code.s:743: li  $s5, 0          # s5 = count = 0
     1542 [0x80000828]	0x34160000  ori $22, $0, 0                  ; jank_jesus_code.s:744: li  $s6, 0          # s6 = last = 0
     1542 [0x8000082c]	0x34170000  ori $23, $0, 0                  ; jank_jesus_code.s:746: li  $s7, 0          # s7 = j = 0
    13878 [0x80000830]	0x02f2082a  slt $1, $23, $18                ; jank_jesus_code.s:748: bge $s7, $s2, bd_j5_loop_end    # !(j < GRIDSIZE)
    13878 [0x80000834]	0x1020000d  beq $1, $0, 52 [bd_j5_loop_end-0x80000834]
    12336 [0x80000838]	0x72f24002  mul $8, $23, $18                ; jank_jesus_code.s:750: mul $t0, $s7, $s2       # j*GRIDSIZE
    12336 [0x8000083c]	0x01144020  add $8, $8, $20                 ; jank_jesus_code.s:751: add $t0, $t0, $s4       # j*GRIDSIZE + i
    12336 [0x80000840]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:752: mul $t0, $t0, 2
    12336 [0x80000844]	0x71014002  mul $8, $8, $1
    12336 [0x80000848]	0x02084020  add $8, $16, $8                 ; jank_jesus_code.s:753: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
    12336 [0x8000084c]	0x95080000  lhu $8, 0($8)                   ; jank_jesus_code.s:754: lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
    12336 [0x80000850]	0x02c8082a  slt $1, $22, $8                 ; jank_jesus_code.s:755: ble $t0, $s6, bd_j5_loop_increment  # !(current > last)
    12336 [0x80000854]	0x10200003  beq $1, $0, 12 [bd_j5_loop_increment-0x80000854]
     4342 [0x80000858]	0x22b50001  addi $21, $21, 1                ; jank_jesus_code.s:756: add $s5, $s5, 1     # count += 1
     4342 [0x8000085c]	0x0008b021  addu $22, $0, $8                ; jank_jesus_code.s:757: move    $s6, $t0        # last = current
    12336 [0x80000860]	0x22f70001  addi $23, $23, 1                ; jank_jesus_code.s:759: add $s7, $s7, 1     # ++ j
    12336 [0x80000864]	0x0800020c  j 0x00000830 [bd_j5_loop_start] ; jank_jesus_code.s:760: j   bd_j5_loop_start
     1542 [0x80000868]	0x16b90020  bne $21, $25, 128 [bd_return_false-0x80000868]; jank_jesus_code.s:762: bne $s5, $t9, bd_return_false   # if (count != top_constraint) return false
     1542 [0x8000086c]	0x22480001  addi $8, $18, 1                 ; jank_jesus_code.s:764: add $t0, $s2, 1     # GRIDSIZE+1
     1542 [0x80000870]	0x22490002  addi $9, $18, 2                 ; jank_jesus_code.s:765: add $t1, $s2, 2     # GRIDSIZE+2
     1542 [0x80000874]	0x71094002  mul $8, $8, $9                  ; jank_jesus_code.s:766: mul $t0, $t0, $t1       # (GRIDSIZE+1)*(GRIDSIZE+2)
     1542 [0x80000878]	0x01144020  add $8, $8, $20                 ; jank_jesus_code.s:767: add $t0, $t0, $s4       # (GRIDSIZE+1)*(GRIDSIZE+2) + i
     1542 [0x8000087c]	0x21080001  addi $8, $8, 1                  ; jank_jesus_code.s:768: add $t0, $t0, 1     # (GRIDSIZE+1)*(GRIDSIZE+2) + i + 1
     1542 [0x80000880]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:769: mul $t0, $t0, 2
     1542 [0x80000884]	0x71014002  mul $8, $8, $1
     1542 [0x80000888]	0x01134020  add $8, $8, $19                 ; jank_jesus_code.s:770: add $t0, $t0, $s3       # &puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
     1542 [0x8000088c]	0x95190000  lhu $25, 0($8)                  ; jank_jesus_code.s:771: lhu $t9, 0($t0)     # t9 = bottom_constraint = puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
     1542 [0x80000890]	0x34150000  ori $21, $0, 0                  ; jank_jesus_code.s:772: li  $s5, 0          # s5 = count = 0
     1542 [0x80000894]	0x34160000  ori $22, $0, 0                  ; jank_jesus_code.s:773: li  $s6, 0          # s6 = last = 0
     1542 [0x80000898]	0x2257ffff  addi $23, $18, -1               ; jank_jesus_code.s:775: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
    13878 [0x8000089c]	0x02e0082a  slt $1, $23, $0                 ; jank_jesus_code.s:777: blt $s7, $0, bd_j6_loop_end # !(j >= 0)
    13878 [0x800008a0]	0x1420000d  bne $1, $0, 52 [bd_j6_loop_end-0x800008a0]
    12336 [0x800008a4]	0x72f24002  mul $8, $23, $18                ; jank_jesus_code.s:779: mul $t0, $s7, $s2       # j*GRIDSIZE
    12336 [0x800008a8]	0x01144020  add $8, $8, $20                 ; jank_jesus_code.s:780: add $t0, $t0, $s4       # j*GRIDSIZE + i
    12336 [0x800008ac]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:781: mul $t0, $t0, 2
    12336 [0x800008b0]	0x71014002  mul $8, $8, $1
    12336 [0x800008b4]	0x02084020  add $8, $16, $8                 ; jank_jesus_code.s:782: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
    12336 [0x800008b8]	0x95080000  lhu $8, 0($8)                   ; jank_jesus_code.s:783: lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
    12336 [0x800008bc]	0x02c8082a  slt $1, $22, $8                 ; jank_jesus_code.s:784: ble $t0, $s6, bd_j6_loop_increment  # !(current > last)
    12336 [0x800008c0]	0x10200003  beq $1, $0, 12 [bd_j6_loop_increment-0x800008c0]
     4167 [0x800008c4]	0x22b50001  addi $21, $21, 1                ; jank_jesus_code.s:785: add $s5, $s5, 1     # count += 1
     4167 [0x800008c8]	0x0008b021  addu $22, $0, $8                ; jank_jesus_code.s:786: move    $s6, $t0        # last = current
    12336 [0x800008cc]	0x22f7ffff  addi $23, $23, -1               ; jank_jesus_code.s:788: sub $s7, $s7, 1     # -- j
    12336 [0x800008d0]	0x08000227  j 0x0000089c [bd_j6_loop_start] ; jank_jesus_code.s:789: j   bd_j6_loop_start
     1542 [0x800008d4]	0x16b90005  bne $21, $25, 20 [bd_return_false-0x800008d4]; jank_jesus_code.s:791: bne $s5, $t9, bd_return_false   # if (count != bottom_constraint) return false
     1542 [0x800008d8]	0x22940001  addi $20, $20, 1                ; jank_jesus_code.s:793: add $s4, $s4, 1
     1542 [0x800008dc]	0x080001ca  j 0x00000728 [bd_i2_loop_start] ; jank_jesus_code.s:794: j   bd_i2_loop_start
      192 [0x800008e0]	0x34020001  ori $2, $0, 1                   ; jank_jesus_code.s:796: li  $v0, 1          # return true
      192 [0x800008e4]	0x0800023b  j 0x000008ec [bd_return]        ; jank_jesus_code.s:797: j   bd_return
       38 [0x800008e8]	0x34020000  ori $2, $0, 0                   ; jank_jesus_code.s:799: li  $v0, 0          # return false
      230 [0x800008ec]	0x8fbf0000  lw $31, 0($29)                  ; jank_jesus_code.s:801: lw  $ra, 0($sp)
      230 [0x800008f0]	0x8fb00004  lw $16, 4($29)                  ; jank_jesus_code.s:802: lw  $s0, 4($sp)
      230 [0x800008f4]	0x8fb10008  lw $17, 8($29)                  ; jank_jesus_code.s:803: lw  $s1, 8($sp)
      230 [0x800008f8]	0x8fb2000c  lw $18, 12($29)                 ; jank_jesus_code.s:804: lw  $s2,
      230 [0x800008fc]	0x8fb30010  lw $19, 16($29)                 ; jank_jesus_code.s:805: lw  $s3, 16($sp)
      230 [0x80000900]	0x8fb40014  lw $20, 20($29)                 ; jank_jesus_code.s:806: lw  $s4, 20($sp)
      230 [0x80000904]	0x8fb50018  lw $21, 24($29)                 ; jank_jesus_code.s:807: lw  $s5, 24($sp)
      230 [0x80000908]	0x8fb6001c  lw $22, 28($29)                 ; jank_jesus_code.s:808: lw  $s6, 28($sp)
      230 [0x8000090c]	0x8fb70020  lw $23, 32($29)                 ; jank_jesus_code.s:809: lw  $s7, 32($sp)
      230 [0x80000910]	0x23bd0024  addi $29, $29, 36               ; jank_jesus_code.s:810: add $sp, $sp, 36
      230 [0x80000914]	0x03e00008  jr $31                          ; jank_jesus_code.s:811: jr $ra
    79872 [0x80000918]	0x10800009  beq $4, $0, 36 [has_single_bit_set_iszero-0x80000918]; jank_jesus_code.s:817: beq     $a0, $0, has_single_bit_set_iszero
    79872 [0x8000091c]	0x2082ffff  addi $2, $4, -1                 ; jank_jesus_code.s:818: sub     $v0, $a0, 1             # $v0: b-1
    79872 [0x80000920]	0x00821024  and $2, $4, $2                  ; jank_jesus_code.s:819: and     $v0, $a0, $v0           # $v0: b & (b-1)
    79872 [0x80000924]	0x00401027  nor $2, $2, $0                  ; jank_jesus_code.s:820: not     $v0, $v0                # $v0: !(b & (b-1))
    79872 [0x80000928]	0x3c01ffff  lui $1, -1                      ; jank_jesus_code.s:822: bne     $v0, -1, has_single_bit_set_iszero
    79872 [0x8000092c]	0x3421ffff  ori $1, $1, -1
    79872 [0x80000930]	0x14220003  bne $1, $2, 12 [has_single_bit_set_iszero-0x80000930]
    72811 [0x80000934]	0x34020001  ori $2, $0, 1                   ; jank_jesus_code.s:823: li      $v0, 1
    72811 [0x80000938]	0x08000250  j 0x00000940 [has_single_bit_set_done]; jank_jesus_code.s:824: j       has_single_bit_set_done
     7061 [0x8000093c]	0x34020000  ori $2, $0, 0                   ; jank_jesus_code.s:826: li      $v0, 0
    79872 [0x80000940]	0x03e00008  jr $31                          ; jank_jesus_code.s:828: jr      $ra
      231 [0x80000944]	0x23bdfffc  addi $29, $29, -4               ; jank_jesus_code.s:836: sub $sp, $sp, 4
      231 [0x80000948]	0xafbf0000  sw $31, 0($29)                  ; jank_jesus_code.s:837: sw  $ra, 0($sp) # save $ra on stack
      231 [0x8000094c]	0x34080008  ori $8, $0, 8                   ; jank_jesus_code.s:839: li  $t0, GRIDSIZE
      231 [0x80000950]	0x71084002  mul $8, $8, $8                  ; jank_jesus_code.s:840: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
      231 [0x80000954]	0x34010002  ori $1, $0, 2                   ; jank_jesus_code.s:841: mul $a1, $t0, 2
      231 [0x80000958]	0x71012802  mul $5, $8, $1
      231 [0x8000095c]	0x00852820  add $5, $4, $5                  ; jank_jesus_code.s:842: add $a1, $a0, $a1               # new_board = old_board + GRIDSIZE*GRIDSIZE
      231 [0x80000960]	0x0c00025d  jal 0x00000974 [copy_board]     ; jank_jesus_code.s:844: jal copy_board
      231 [0x80000964]	0x00021021  addu $2, $0, $2                 ; jank_jesus_code.s:846: move $v0, $v0                   # // output the output of copy_board
      231 [0x80000968]	0x8fbf0000  lw $31, 0($29)                  ; jank_jesus_code.s:847: lw  $ra, 0($sp)
      231 [0x8000096c]	0x23bd0004  addi $29, $29, 4                ; jank_jesus_code.s:848: add $sp, $sp, 4
      231 [0x80000970]	0x03e00008  jr $31                          ; jank_jesus_code.s:849: jr $ra
      692 [0x80000974]	0x34080008  ori $8, $0, 8                   ; jank_jesus_code.s:857: li  $t0, GRIDSIZE
      692 [0x80000978]	0x71084002  mul $8, $8, $8                  ; jank_jesus_code.s:858: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
      692 [0x8000097c]	0x00044821  addu $9, $0, $4                 ; jank_jesus_code.s:859: move  $t1, $a0                      # i = 0
      692 [0x80000980]	0x00055021  addu $10, $0, $5                ; jank_jesus_code.s:860: move  $t2, $a1
      692 [0x80000984]	0x340c0000  ori $12, $0, 0                  ; jank_jesus_code.s:861: li  $t4, 0
    22836 [0x80000988]	0x0188082a  slt $1, $12, $8                 ; jank_jesus_code.s:863: bge $t4, $t0, ih_done           # i < GRIDSIZE*GRIDSIZE
    22836 [0x8000098c]	0x10200007  beq $1, $0, 28 [ih_done-0x8000098c]
    22144 [0x80000990]	0x8d2b0000  lw $11, 0($9)                   ; jank_jesus_code.s:867: lw $t3, 0($t1)                 # old_board[i]
    22144 [0x80000994]	0xad4b0000  sw $11, 0($10)                  ; jank_jesus_code.s:870: sw  $t3, 0($t2)                 # new_board[i] = old_board[i]
    22144 [0x80000998]	0x21290004  addi $9, $9, 4                  ; jank_jesus_code.s:872: addi $t1, $t1, 4                # i++
    22144 [0x8000099c]	0x214a0004  addi $10, $10, 4                ; jank_jesus_code.s:873: addi $t2, $t2, 4
    22144 [0x800009a0]	0x218c0002  addi $12, $12, 2                ; jank_jesus_code.s:874: addi $t4, $t4, 2
    22144 [0x800009a4]	0x08000262  j 0x00000988 [ih_loop]          ; jank_jesus_code.s:875: j    ih_loop
      692 [0x800009a8]	0x00051021  addu $2, $0, $5                 ; jank_jesus_code.s:877: move $v0, $a1
      692 [0x800009ac]	0x03e00008  jr $31                          ; jank_jesus_code.s:878: jr $ra
