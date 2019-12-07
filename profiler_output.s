        1 [0x00400000]	0x8fa40000  lw $4, 0($29)                   ; exceptions.s:183: lw $a0 0($sp)		# argc
        1 [0x00400004]	0x27a50004  addiu $5, $29, 4                ; exceptions.s:184: addiu $a1 $sp 4		# argv
        1 [0x00400008]	0x24a60004  addiu $6, $5, 4                 ; exceptions.s:185: addiu $a2 $a1 4		# envp
        1 [0x0040000c]	0x00041080  sll $2, $4, 2                   ; exceptions.s:186: sll $v0 $a0 2
        1 [0x00400010]	0x00c23021  addu $6, $6, $2                 ; exceptions.s:187: addu $a2 $a2 $v0
        1 [0x00400014]	0x0c100009  jal 0x00400024 [main]           ; exceptions.s:188: jal main
        0 [0x00400018]	0x00000000  nop                             ; exceptions.s:189: nop
        0 [0x0040001c]	0x3402000a  ori $2, $0, 10                  ; exceptions.s:191: li $v0 10
        0 [0x00400020]	0x0000000c  syscall                         ; exceptions.s:192: syscall			# syscall 10 (exit)
        1 [0x00400024]	0x340c0000  ori $12, $0, 0                  ; spimbot_pks3.s:69: li      $t4, 0
        1 [0x00400028]	0x358c1000  ori $12, $12, 4096              ; spimbot_pks3.s:70: or      $t4, $t4, BONK_INT_MASK                     # request bonk
        1 [0x0040002c]	0x358c0800  ori $12, $12, 2048              ; spimbot_pks3.s:71: or      $t4, $t4, REQUEST_PUZZLE_INT_MASK           # puzzle interrupt bit
        1 [0x00400030]	0x358c0001  ori $12, $12, 1                 ; spimbot_pks3.s:72: or      $t4, $t4, 1 # global enable
        1 [0x00400034]	0x408c6000  mtc0 $12, $12                   ; spimbot_pks3.s:73: mtc0    $t4, $12
        1 [0x00400038]	0x34090001  ori $9, $0, 1                   ; spimbot_pks3.s:78: li  $t1, 1
        1 [0x0040003c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:79: sw  $t1, SWITCH_MODE($0)         #paint mode
        1 [0x00400040]	0xac2900f0  sw $9, 240($1)
        1 [0x00400044]	0x3409000a  ori $9, $0, 10                  ; spimbot_pks3.s:81: li  $t1, 10
        1 [0x00400048]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:82: sw  $t1, VELOCITY($0)
        1 [0x0040004c]	0xac290010  sw $9, 16($1)
        1 [0x00400050]	0x340b0001  ori $11, $0, 1                  ; spimbot_pks3.s:86: li  $t3, 1
        1 [0x00400054]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:87: sw  $t3, completed_request($0)      #start with this set to 1. Meaning it is ready to request a new puzzle.
        1 [0x00400058]	0xac2b2148  sw $11, 8520($1)
        1 [0x0040005c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:89: lw  $t1, GET_TIMER($0)              #gets cycle number  
        1 [0x00400060]	0x8c29001c  lw $9, 28($1)
        1 [0x00400064]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:90: sw  $t1, last_powerup_check($0)     #store current cycle number to this.
        1 [0x00400068]	0xac29214c  sw $9, 8524($1)
        1 [0x0040006c]	0x3c011001  lui $1, 4097 [powerup_map]      ; spimbot_pks3.s:92: la  $t3, powerup_map
        1 [0x00400070]	0x342b2150  ori $11, $1, 8528 [powerup_map]
        1 [0x00400074]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:93: sw  $t3, GET_POWERUP_MAP($0)        #get initial powerup map
        1 [0x00400078]	0xac2b00e0  sw $11, 224($1)
    11761 [0x0040007c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:98: lw	    $t1, GET_PAINT_BUCKETS($0)	    	#does what it says.
    11756 [0x00400080]	0x8c2900e4  lw $9, 228($1)
    11759 [0x00400084]	0x200a000a  addi $10, $0, 10                ; spimbot_pks3.s:99: add	    $t2, $0, 10			    	#load 10 into $t2	
    11763 [0x00400088]	0x0149082a  slt $1, $10, $9                 ; spimbot_pks3.s:100: bgt	    $t1, $t2, end_check_for_paint     	#branch if we have enough paint > 10    
    11757 [0x0040008c]	0x14200009  bne $1, $0, 36 [end_check_for_paint-0x0040008c]
     3116 [0x00400090]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:101: lw      $t3, completed_request($0)      	#check if the puzzle is completed
     3117 [0x00400094]	0x8c2b2148  lw $11, 8520($1)
     3119 [0x00400098]	0x11600006  beq $11, $0, 24 [end_check_for_paint-0x00400098]; spimbot_pks3.s:103: beq	    $t3, $0, end_check_for_paint   		#branch if puzzle is not completed. So it does not request more puzzles
       22 [0x0040009c]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:104: sw      $0, completed_request($0)       	#set request to incomplete
       22 [0x004000a0]	0xac202148  sw $0, 8520($1)
       22 [0x004000a4]	0x3c091001  lui $9, 4097 [puzzle]           ; spimbot_pks3.s:105: la	    $t1, puzzle			        #load puzzle address into $t1
       22 [0x004000a8]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:106: sw	    $t1, REQUEST_PUZZLE($0)		    	#request puzzle with this address
       22 [0x004000ac]	0xac2900d0  sw $9, 208($1)
    11761 [0x004000b0]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:111: lw  	$t1, GET_TIMER($0)              #gets current cycle number
    11757 [0x004000b4]	0x8c29001c  lw $9, 28($1)
    11759 [0x004000b8]	0x34080100  ori $8, $0, 256                 ; spimbot_pks3.s:112: li  	$t0, CHECK_POWERUP_MAP          #a constant for comparing. If the timer says its been more than CHECK_POWERUP_MAP cycles since last powermap update, then get a new powerup map
    11756 [0x004000bc]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:113: lw  	$t2, last_powerup_check($0)     #gets the cycle number of the last update
    11760 [0x004000c0]	0x8c2a214c  lw $10, 8524($1)
    11760 [0x004000c4]	0x010a4020  add $8, $8, $10                 ; spimbot_pks3.s:114: add 	$t0, $t0, $t2                   #add last_powerup_check to last cycle number of update.
    11759 [0x004000c8]	0x0109082a  slt $1, $8, $9                  ; spimbot_pks3.s:116: bgt 	$t1, $t0, end_check_for_powerup_map #Compare the current cycle number to the (last_powerup_check+CHECK_POWERUP_MAP) and if cycle number is smaller, branch. Because we don't need to update the powerup map
    11758 [0x004000cc]	0x14200013  bne $1, $0, 76 [end_check_for_powerup_map-0x004000cc]
       32 [0x004000d0]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:118: sw  	$t1, last_powerup_check($0)     #stores the current cycle in it
       32 [0x004000d4]	0xac29214c  sw $9, 8524($1)
       32 [0x004000d8]	0x3c011001  lui $1, 4097 [powerup_map]      ; spimbot_pks3.s:119: la  	$a0, powerup_map    
       32 [0x004000dc]	0x34242150  ori $4, $1, 8528 [powerup_map]
       32 [0x004000e0]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:120: sw  	$a0, GET_POWERUP_MAP($0)        #get initial powerup map
       32 [0x004000e4]	0xac2400e0  sw $4, 224($1)
       32 [0x004000e8]	0x0c10007a  jal 0x004001e8 [get_closest_powerup]; spimbot_pks3.s:122: jal 	get_closest_powerup
       31 [0x004000ec]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:124: li  	$t0, -1 		        #if get_closest_powerup return -1 == x, then no powerup was found
       31 [0x004000f0]	0x3428ffff  ori $8, $1, -1
       31 [0x004000f4]	0x11020007  beq $8, $2, 28 [set_target_null-0x004000f4]; spimbot_pks3.s:125: beq 	$t0, $v0, set_target_null    	#if no powerup is found, then skip this part 
       31 [0x004000f8]	0x3c011001  lui $1, 4097 [target_pos]       ; spimbot_pks3.s:127: la  	$t0, target_pos     
       31 [0x004000fc]	0x34282158  ori $8, $1, 8536 [target_pos]
       31 [0x00400100]	0xad020000  sw $2, 0($8)                    ; spimbot_pks3.s:128: sw  	$v0, 0($t0)                     #set the current target as the closest powerup
       31 [0x00400104]	0xad030004  sw $3, 4($8)                    ; spimbot_pks3.s:129: sw	    $v1, 4($t0)
       31 [0x00400108]	0x00008020  add $16, $0, $0                 ; spimbot_pks3.s:130: add	    $s0, $0, $0                     #signal that we have found a target
       31 [0x0040010c]	0x08100046  j 0x00400118 [end_check_for_powerup_map]; spimbot_pks3.s:131: j	    end_check_for_powerup_map
        0 [0x00400110]	0x3c01dead  lui $1, -8531                   ; spimbot_pks3.s:133: li	$s0, 0xDEADBEEF		    	#signal that we have no target.
        0 [0x00400114]	0x3430beef  ori $16, $1, -16657
    11759 [0x00400118]	0x0810001f  j 0x0040007c [bot_loop]         ; spimbot_pks3.s:139: j   	bot_loop
        0 [0x0040011c]	0x03e00008  jr $31                          ; spimbot_pks3.s:142: jr $ra
       94 [0x00400120]	0x70842002  mul $4, $4, $4                  ; spimbot_pks3.s:165: mul	$a0, $a0, $a0	            # x^2
       94 [0x00400124]	0x70a52802  mul $5, $5, $5                  ; spimbot_pks3.s:166: mul	$a1, $a1, $a1	            # y^2
       94 [0x00400128]	0x00851020  add $2, $4, $5                  ; spimbot_pks3.s:167: add	$v0, $a0, $a1	            # x^2 + y^2
       94 [0x0040012c]	0x44820000  mtc1 $2, $f0                    ; spimbot_pks3.s:168: mtc1	$v0, $f0
       94 [0x00400130]	0x46800020  cvt.s.w $f0, $f0                ; spimbot_pks3.s:169: cvt.s.w	$f0, $f0	            # float(x^2 + y^2)
       94 [0x00400134]	0x46000004  sqrt.s $f0, $f0                 ; spimbot_pks3.s:170: sqrt.s	$f0, $f0	            # sqrt(x^2 + y^2)
     1620 [0x00400138]	0x46000024  cvt.w.s $f0, $f0                ; spimbot_pks3.s:171: cvt.w.s	$f0, $f0	            # int(sqrt(...))
     1619 [0x0040013c]	0x44020000  mfc1 $2, $f0                    ; spimbot_pks3.s:172: mfc1	$v0, $f0
     1619 [0x00400140]	0x03e00008  jr $31                          ; spimbot_pks3.s:173: jr	$ra
        0 [0x00400144]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:183: li	$v0, 0		# angle = 0;
        0 [0x00400148]	0x00044021  addu $8, $0, $4                 ; spimbot_pks3.s:184: abs	$t0, $a0	# get absolute values
        0 [0x0040014c]	0x04810002  bgez $4 8
        0 [0x00400150]	0x00044022  sub $8, $0, $4
        0 [0x00400154]	0x00054821  addu $9, $0, $5                 ; spimbot_pks3.s:185: abs	$t1, $a1
        0 [0x00400158]	0x04a10002  bgez $5 8
        0 [0x0040015c]	0x00054822  sub $9, $0, $5
        0 [0x00400160]	0x0109082a  slt $1, $8, $9                  ; spimbot_pks3.s:186: ble	$t1, $t0, no_TURN_90
        0 [0x00400164]	0x10200005  beq $1, $0, 20 [no_TURN_90-0x00400164]
        0 [0x00400168]	0x00054021  addu $8, $0, $5                 ; spimbot_pks3.s:188: move	$t0, $a1	# int temp = y;
        0 [0x0040016c]	0x00042822  sub $5, $0, $4                  ; spimbot_pks3.s:189: neg	$a1, $a0	# y = -x;
        0 [0x00400170]	0x00082021  addu $4, $0, $8                 ; spimbot_pks3.s:190: move	$a0, $t0	# x = temp;
        0 [0x00400174]	0x3402005a  ori $2, $0, 90                  ; spimbot_pks3.s:191: li	$v0, 90		# angle = 90;
        0 [0x00400178]	0x04810002  bgez $4 8 [pos_x-0x00400178]    ; spimbot_pks3.s:193: bgez	$a0, pos_x 	# skip if (x >= 0)
        0 [0x0040017c]	0x204200b4  addi $2, $2, 180                ; spimbot_pks3.s:195: add	$v0, $v0, 180	# angle += 180;
        0 [0x00400180]	0x44840000  mtc1 $4, $f0                    ; spimbot_pks3.s:197: mtc1	$a0, $f0
        0 [0x00400184]	0x44850800  mtc1 $5, $f1                    ; spimbot_pks3.s:198: mtc1	$a1, $f1
        0 [0x00400188]	0x46800020  cvt.s.w $f0, $f0                ; spimbot_pks3.s:199: cvt.s.w $f0, $f0	# convert from ints to floats
        0 [0x0040018c]	0x46800860  cvt.s.w $f1, $f1                ; spimbot_pks3.s:200: cvt.s.w $f1, $f1
        0 [0x00400190]	0x46000803  div.s $f0, $f1, $f0             ; spimbot_pks3.s:201: div.s	$f0, $f1, $f0	# float v = (float) y / (float) x;
        0 [0x00400194]	0x46000042  mul.s $f1, $f0, $f0             ; spimbot_pks3.s:202: mul.s	$f1, $f0, $f0	# v^^2
        0 [0x00400198]	0x46000882  mul.s $f2, $f1, $f0             ; spimbot_pks3.s:203: mul.s	$f2, $f1, $f0	# v^^3
        0 [0x0040019c]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:204: l.s	$f3, three	# load 3.0
        0 [0x004001a0]	0xc4232160  lwc1 $f3, 8544($1)
        0 [0x004001a4]	0x460310c3  div.s $f3, $f2, $f3             ; spimbot_pks3.s:205: div.s 	$f3, $f2, $f3	# v^^3/3
        0 [0x004001a8]	0x46030181  sub.s $f6, $f0, $f3             ; spimbot_pks3.s:206: sub.s	$f6, $f0, $f3	# v - v^^3/3
        0 [0x004001ac]	0x46020902  mul.s $f4, $f1, $f2             ; spimbot_pks3.s:207: mul.s	$f4, $f1, $f2	# v^^5
        0 [0x004001b0]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:208: l.s	$f5, five	# load 5.0
        0 [0x004001b4]	0xc4252164  lwc1 $f5, 8548($1)
        0 [0x004001b8]	0x46052143  div.s $f5, $f4, $f5             ; spimbot_pks3.s:209: div.s 	$f5, $f4, $f5	# v^^5/5
        0 [0x004001bc]	0x46053180  add.s $f6, $f6, $f5             ; spimbot_pks3.s:210: add.s	$f6, $f6, $f5	# value = v - v^^3/3 + v^^5/5
        0 [0x004001c0]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:211: l.s	$f8, PI		# load PI
        0 [0x004001c4]	0xc4282168  lwc1 $f8, 8552($1)
        0 [0x004001c8]	0x46083183  div.s $f6, $f6, $f8             ; spimbot_pks3.s:212: div.s	$f6, $f6, $f8	# value / PI
        0 [0x004001cc]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:213: l.s	$f7, F180	# load 180.0
        0 [0x004001d0]	0xc427216c  lwc1 $f7, 8556($1)
        0 [0x004001d4]	0x46073182  mul.s $f6, $f6, $f7             ; spimbot_pks3.s:214: mul.s	$f6, $f6, $f7	# 180.0 * value / PI
        0 [0x004001d8]	0x460031a4  cvt.w.s $f6, $f6                ; spimbot_pks3.s:215: cvt.w.s $f6, $f6	# convert "delta" back to integer
        0 [0x004001dc]	0x44083000  mfc1 $8, $f6                    ; spimbot_pks3.s:216: mfc1	$t0, $f6
        0 [0x004001e0]	0x00481020  add $2, $2, $8                  ; spimbot_pks3.s:217: add	$v0, $v0, $t0	# angle += delta
        0 [0x004001e4]	0x03e00008  jr $31                          ; spimbot_pks3.s:218: jr 	$ra
       32 [0x004001e8]	0x23bdfffc  addi $29, $29, -4               ; spimbot_pks3.s:231: sub	$sp, $sp, 4
       32 [0x004001ec]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:232: sw	$ra, 0($sp)
       32 [0x004001f0]	0x8c890000  lw $9, 0($4)                    ; spimbot_pks3.s:234: lw	$t1, 0($a0)		#get the number of powerups
       32 [0x004001f4]	0x208a0004  addi $10, $4, 4                 ; spimbot_pks3.s:235: add	$t2, $a0, 4		#load the pointer to the powerups array
       32 [0x004001f8]	0x340b0000  ori $11, $0, 0                  ; spimbot_pks3.s:237: li 	$t3, 0			#t3 is the index in the array.
       32 [0x004001fc]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:238: li	$t6, 0xFFFFFFFF		#this is the distance to the closest powerup
       32 [0x00400200]	0x342effff  ori $14, $1, -1
      125 [0x00400204]	0x0169082a  slt $1, $11, $9                 ; spimbot_pks3.s:241: bge	    $t3, $t1, end_iterate_over_powerups
      125 [0x00400208]	0x1020000d  beq $1, $0, 52 [end_iterate_over_powerups-0x00400208]
       94 [0x0040020c]	0x954c0000  lhu $12, 0($10)                 ; spimbot_pks3.s:243: lhu	    $t4, 0($t2)		#get x_pos (short) powerup_array[t3*12].x
       94 [0x00400210]	0x954d0002  lhu $13, 2($10)                 ; spimbot_pks3.s:244: lhu	    $t5, 2($t2)		#get y_pos (short) powerup_
       94 [0x00400214]	0x000c2021  addu $4, $0, $12                ; spimbot_pks3.s:246: move	$a0, $t4
       94 [0x00400218]	0x000d2821  addu $5, $0, $13                ; spimbot_pks3.s:247: move	$a1, $t5
       94 [0x0040021c]	0x0c100048  jal 0x00400120 [euclidean_dist] ; spimbot_pks3.s:250: jal	euclidean_dist
       93 [0x00400220]	0x01c2082b  sltu $1, $14, $2                ; spimbot_pks3.s:252: bltu	    $t6, $v0, dont_set_min_dist 	#if(t6 < v0) branch
       93 [0x00400224]	0x14200003  bne $1, $0, 12 [dont_set_min_dist-0x00400224]
       31 [0x00400228]	0x00027021  addu $14, $0, $2                ; spimbot_pks3.s:253: move	$t6, $v0			#set the smallest distance.
       31 [0x0040022c]	0x000a7821  addu $15, $0, $10               ; spimbot_pks3.s:254: move	$t7, $t2			#record the pointer of the powerup for later use.
       93 [0x00400230]	0x214a000c  addi $10, $10, 12               ; spimbot_pks3.s:257: add	    $t2, $t2, 12		#increment the pointer by 12 bytes. Due to the size of ArenaPowerup struct
       93 [0x00400234]	0x216b0001  addi $11, $11, 1                ; spimbot_pks3.s:258: add	    $t3, $t3, 1
       93 [0x00400238]	0x08100081  j 0x00400204 [iterate_over_powerups]; spimbot_pks3.s:259: j	    iterate_over_powerups
       31 [0x0040023c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:263: li  $t8, 0xFFFFFFFF
       31 [0x00400240]	0x3438ffff  ori $24, $1, -1
       31 [0x00400244]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:264: li  $v0, -1
       31 [0x00400248]	0x3422ffff  ori $2, $1, -1
       31 [0x0040024c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:265: li  $v1, -1
       31 [0x00400250]	0x3423ffff  ori $3, $1, -1
       31 [0x00400254]	0x11d80003  beq $14, $24, 12 [got_no_powerups-0x00400254]; spimbot_pks3.s:266: beq $t6, $t8, got_no_powerups
       31 [0x00400258]	0x85e20000  lh $2, 0($15)                   ; spimbot_pks3.s:268: lh	$v0, 0($t7)		#get x_pos (short) powerup_array[min].x
       31 [0x0040025c]	0x85e30002  lh $3, 2($15)                   ; spimbot_pks3.s:269: lh	$v1, 2($t7)		#get y_pos (short) powerup_array[min].y
       31 [0x00400260]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:271: lw	$ra, 0($sp)
       31 [0x00400264]	0x23bd0004  addi $29, $29, 4                ; spimbot_pks3.s:272: add	$sp, $sp, 4
       31 [0x00400268]	0x03e00008  jr $31                          ; spimbot_pks3.s:273: jr	$ra


kernel text segment

      194 [0x80000180]	0x0001d821  addu $27, $0, $1                ; spimbot_pks3.s:292: move      $k1, $at        # Save $at
      194 [0x80000184]	0x3c019000  lui $1, -28672 [chunkIH]        ; spimbot_pks3.s:294: la        $k0, chunkIH
      194 [0x80000188]	0x343a0208  ori $26, $1, 520 [chunkIH]
      194 [0x8000018c]	0xaf440000  sw $4, 0($26)                   ; spimbot_pks3.s:295: sw        $a0, 0($k0)        # Get some free registers
      194 [0x80000190]	0xaf420004  sw $2, 4($26)                   ; spimbot_pks3.s:296: sw        $v0, 4($k0)        # by storing them to a global variable
      194 [0x80000194]	0xaf480008  sw $8, 8($26)                   ; spimbot_pks3.s:297: sw        $t0, 8($k0)
      194 [0x80000198]	0xaf49000c  sw $9, 12($26)                  ; spimbot_pks3.s:298: sw        $t1, 12($k0)
      194 [0x8000019c]	0xaf4a0010  sw $10, 16($26)                 ; spimbot_pks3.s:299: sw        $t2, 16($k0)
      194 [0x800001a0]	0xaf4b0014  sw $11, 20($26)                 ; spimbot_pks3.s:300: sw        $t3, 20($k0)
      194 [0x800001a4]	0xaf4c0018  sw $12, 24($26)                 ; spimbot_pks3.s:301: sw $t4, 24($k0)
      194 [0x800001a8]	0xaf4d001c  sw $13, 28($26)                 ; spimbot_pks3.s:302: sw $t5, 28($k0)
      194 [0x800001ac]	0x401a6800  mfc0 $26, $13                   ; spimbot_pks3.s:304: mfc0      $k0, $13             # Get Cause register
      194 [0x800001b0]	0x001a2082  srl $4, $26, 2                  ; spimbot_pks3.s:305: srl       $a0, $k0, 2
      194 [0x800001b4]	0x3084000f  andi $4, $4, 15                 ; spimbot_pks3.s:306: and       $a0, $a0, 0xf        # ExcCode field
      194 [0x800001b8]	0x14040034  bne $0, $4, 208 [non_intrpt-0x800001b8]; spimbot_pks3.s:307: bne       $a0, 0, non_intrpt
     1914 [0x800001bc]	0x401a6800  mfc0 $26, $13                   ; spimbot_pks3.s:312: mfc0       $k0, $13        # Get Cause register, again
     9351 [0x800001c0]	0x101a0036  beq $0, $26, 216 [done-0x800001c0]; spimbot_pks3.s:313: beq        $k0, 0, done        # handled all outstanding interrupts
     7628 [0x800001c4]	0x33441000  andi $4, $26, 4096              ; spimbot_pks3.s:315: and        $a0, $k0, BONK_INT_MASK    # is there a bonk interrupt?
     7628 [0x800001c8]	0x1404000a  bne $0, $4, 40 [bonk_interrupt-0x800001c8]; spimbot_pks3.s:316: bne        $a0, 0, bonk_interrupt
     7456 [0x800001cc]	0x33448000  andi $4, $26, -32768            ; spimbot_pks3.s:318: and        $a0, $k0, TIMER_INT_MASK    # is there a timer interrupt?
     7456 [0x800001d0]	0x1404002b  bne $0, $4, 172 [timer_interrupt-0x800001d0]; spimbot_pks3.s:319: bne        $a0, 0, timer_interrupt
     7456 [0x800001d4]	0x33440800  andi $4, $26, 2048              ; spimbot_pks3.s:321: and     $a0, $k0, REQUEST_PUZZLE_INT_MASK
     7456 [0x800001d8]	0x14040015  bne $0, $4, 84 [request_puzzle_interrupt-0x800001d8]; spimbot_pks3.s:322: bne     $a0, 0, request_puzzle_interrupt
     7983 [0x800001dc]	0x34020004  ori $2, $0, 4                   ; spimbot_pks3.s:324: li        $v0, PRINT_STRING    # Unhandled interrupt types
     7981 [0x800001e0]	0x3c019000  lui $1, -28672 [unhandled_str]  ; spimbot_pks3.s:325: la        $a0, unhandled_str
     7981 [0x800001e4]	0x34240241  ori $4, $1, 577 [unhandled_str]
     7981 [0x800001e8]	0x0000000c  syscall                         ; spimbot_pks3.s:326: syscall
     7981 [0x800001ec]	0x080000a6  j 0x00000298 [done]             ; spimbot_pks3.s:327: j    done
      172 [0x800001f0]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:330: sw 	$0, BONK_ACK
      172 [0x800001f4]	0xac200060  sw $0, 96($1)
      172 [0x800001f8]	0x20080001  addi $8, $0, 1                  ; spimbot_pks3.s:332: add $t0, $0, 1
      172 [0x800001fc]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:333: sw  $t0, SWITCH_MODE($0)         #paint mode 
      172 [0x80000200]	0xac2800f0  sw $8, 240($1)
      172 [0x80000204]	0x34080043  ori $8, $0, 67                  ; spimbot_pks3.s:334: li	$t0, 67
      172 [0x80000208]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:335: sw	$t0, ANGLE($0)
      172 [0x8000020c]	0xac280014  sw $8, 20($1)
      172 [0x80000210]	0x34080000  ori $8, $0, 0                   ; spimbot_pks3.s:337: li	$t0, 0
      172 [0x80000214]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:338: sw	$t0, ANGLE_CONTROL($0)
      172 [0x80000218]	0xac280018  sw $8, 24($1)
      172 [0x8000021c]	0x3408000a  ori $8, $0, 10                  ; spimbot_pks3.s:340: li	$t0, 10
      172 [0x80000220]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:341: sw	$t0, VELOCITY($0)
      172 [0x80000224]	0xac280010  sw $8, 16($1)
      172 [0x80000228]	0x0800006f  j 0x000001bc [interrupt_dispatch]; spimbot_pks3.s:343: j       interrupt_dispatch    # see if other interrupts are waiting
       22 [0x8000022c]	0x3c010001  lui $1, 1                       ; spimbot_pks3.s:346: li	$t0, 69420
       22 [0x80000230]	0x34280f2c  ori $8, $1, 3884
       22 [0x80000234]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:347: sw 	$t0, REQUEST_PUZZLE_ACK($0)
       22 [0x80000238]	0xac2800d8  sw $8, 216($1)
       22 [0x8000023c]	0x3c041001  lui $4, 4097 [puzzle]           ; spimbot_pks3.s:351: la 	$a0, puzzle
       22 [0x80000240]	0x3c011001  lui $1, 4097 [heap]             ; spimbot_pks3.s:352: la	$a1, heap
       22 [0x80000244]	0x34250148  ori $5, $1, 328 [heap]
       22 [0x80000248]	0x0c00027b  jal 0x000009ec [copy_board]     ; spimbot_pks3.s:353: jal 	copy_board
       22 [0x8000024c]	0x3c011001  lui $1, 4097 [heap]             ; spimbot_pks3.s:355: la	$a0, heap
       22 [0x80000250]	0x34240148  ori $4, $1, 328 [heap]
       22 [0x80000254]	0x34050000  ori $5, $0, 0                   ; spimbot_pks3.s:356: li	$a1, 0				#dimensions are 8 by 8
       22 [0x80000258]	0x34060000  ori $6, $0, 0                   ; spimbot_pks3.s:357: li	$a2, 0
       22 [0x8000025c]	0x3c071001  lui $7, 4097 [puzzle]           ; spimbot_pks3.s:358: la	$a3, puzzle
       22 [0x80000260]	0x0c0000b2  jal 0x000002c8 [solve_puzzle]   ; spimbot_pks3.s:359: jal 	solve_puzzle 
     1548 [0x80000264]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:360: sw	$a3, SUBMIT_SOLUTION($0)	#submit puzzle
     1548 [0x80000268]	0xac2700d4  sw $7, 212($1)
     1548 [0x8000026c]	0x340b0001  ori $11, $0, 1                  ; spimbot_pks3.s:362: li  $t3, 1
     1548 [0x80000270]	0x3c011001  lui $1, 4097                    ; spimbot_pks3.s:363: sw  $t3, completed_request($0)      #set the puzzle to completed
     1548 [0x80000274]	0xac2b2148  sw $11, 8520($1)
     1548 [0x80000278]	0x0800006f  j 0x000001bc [interrupt_dispatch]; spimbot_pks3.s:364: j	interrupt_dispatch
        0 [0x8000027c]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:367: sw      $0, TIMER_ACK
        0 [0x80000280]	0xac20006c  sw $0, 108($1)
        0 [0x80000284]	0x0800006f  j 0x000001bc [interrupt_dispatch]; spimbot_pks3.s:369: j        interrupt_dispatch    # see if other interrupts are waiting
        0 [0x80000288]	0x34020004  ori $2, $0, 4                   ; spimbot_pks3.s:372: li        $v0, PRINT_STRING
        0 [0x8000028c]	0x3c019000  lui $1, -28672 [non_intrpt_str] ; spimbot_pks3.s:373: la        $a0, non_intrpt_str
        0 [0x80000290]	0x34240228  ori $4, $1, 552 [non_intrpt_str]
        0 [0x80000294]	0x0000000c  syscall                         ; spimbot_pks3.s:374: syscall                # print out an error message
     9700 [0x80000298]	0x3c019000  lui $1, -28672 [chunkIH]        ; spimbot_pks3.s:378: la      $k0, chunkIH
     9700 [0x8000029c]	0x343a0208  ori $26, $1, 520 [chunkIH]
     9700 [0x800002a0]	0x8f440000  lw $4, 0($26)                   ; spimbot_pks3.s:379: lw      $a0, 0($k0)        # Restore saved registers
     9700 [0x800002a4]	0x8f420004  lw $2, 4($26)                   ; spimbot_pks3.s:380: lw      $v0, 4($k0)
     9700 [0x800002a8]	0x8f480008  lw $8, 8($26)                   ; spimbot_pks3.s:381: lw      $t0, 8($k0)
     9700 [0x800002ac]	0x8f49000c  lw $9, 12($26)                  ; spimbot_pks3.s:382: lw      $t1, 12($k0)
     9700 [0x800002b0]	0x8f4a0010  lw $10, 16($26)                 ; spimbot_pks3.s:383: lw      $t2, 16($k0)
     9700 [0x800002b4]	0x8f4b0014  lw $11, 20($26)                 ; spimbot_pks3.s:384: lw      $t3, 20($k0)
     9700 [0x800002b8]	0x8f4c0018  lw $12, 24($26)                 ; spimbot_pks3.s:385: lw $t4, 24($k0)
    30281 [0x800002bc]	0x8f4d001c  lw $13, 28($26)                 ; spimbot_pks3.s:386: lw $t5, 28($k0)
   178753 [0x800002c0]	0x001b0821  addu $1, $0, $27                ; spimbot_pks3.s:388: move    $at, $k1        # Restore $at
  5356425 [0x800002c4]	0x42000018  eret                            ; spimbot_pks3.s:390: eret
      190 [0x800002c8]	0x23bdffdc  addi $29, $29, -36              ; spimbot_pks3.s:435: sub     $sp, $sp, 36
      190 [0x800002cc]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:436: sw      $ra, 0($sp)
      190 [0x800002d0]	0xafb00004  sw $16, 4($29)                  ; spimbot_pks3.s:437: sw      $s0, 4($sp)
      190 [0x800002d4]	0xafb10008  sw $17, 8($29)                  ; spimbot_pks3.s:438: sw      $s1, 8($sp)
      190 [0x800002d8]	0xafb2000c  sw $18, 12($29)                 ; spimbot_pks3.s:439: sw      $s2, 12($sp)
      190 [0x800002dc]	0xafb30010  sw $19, 16($29)                 ; spimbot_pks3.s:440: sw      $s3, 16($sp)
      190 [0x800002e0]	0xafb40014  sw $20, 20($29)                 ; spimbot_pks3.s:441: sw      $s4, 20($sp)
      190 [0x800002e4]	0xafb50018  sw $21, 24($29)                 ; spimbot_pks3.s:442: sw      $s5, 24($sp)
      190 [0x800002e8]	0xafb6001c  sw $22, 28($29)                 ; spimbot_pks3.s:443: sw      $s6, 28($sp)
      190 [0x800002ec]	0xafb70020  sw $23, 32($29)                 ; spimbot_pks3.s:444: sw      $s7, 32($sp)
      190 [0x800002f0]	0x34170008  ori $23, $0, 8                  ; spimbot_pks3.s:445: li   $s7, GRIDSIZE
      190 [0x800002f4]	0x00058021  addu $16, $0, $5                ; spimbot_pks3.s:446: move $s0, $a1     # row
      190 [0x800002f8]	0x00068821  addu $17, $0, $6                ; spimbot_pks3.s:447: move $s1, $a2     # col
      190 [0x800002fc]	0x00049021  addu $18, $0, $4                ; spimbot_pks3.s:449: move $s2, $a0     # current_board
      190 [0x80000300]	0x00079821  addu $19, $0, $7                ; spimbot_pks3.s:450: move $s3, $a3     # puzzle
      190 [0x80000304]	0x0217082a  slt $1, $16, $23                ; spimbot_pks3.s:452: bge  $s0, $s7, solve_done_check  # row >= GRIDSIZE
      190 [0x80000308]	0x10200004  beq $1, $0, 16 [solve_done_check-0x80000308]
      188 [0x8000030c]	0x0237082a  slt $1, $17, $23                ; spimbot_pks3.s:453: bge  $s1, $s7, solve_done_check  # col >= GRIDSIZE
      188 [0x80000310]	0x10200002  beq $1, $0, 8 [solve_done_check-0x80000310]
      188 [0x80000314]	0x080000d0  j 0x00000340 [solve_not_done]   ; spimbot_pks3.s:454: j solve_not_done
        2 [0x80000318]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:456: move $a0, $s2     # current_board
        2 [0x8000031c]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:457: move $a1, $s3     # puzzle
        2 [0x80000320]	0x0c0001b0  jal 0x000006c0 [board_done]     ; spimbot_pks3.s:458: jal board_done
        2 [0x80000324]	0x10400039  beq $2, $0, 228 [solve_done_false-0x80000324]; spimbot_pks3.s:460: beq $v0, $0, solve_done_false  # if (done)
        0 [0x80000328]	0x0002b821  addu $23, $0, $2                ; spimbot_pks3.s:461: move $s7, $v0     # save done
        0 [0x8000032c]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:462: move $a0, $s2     # current_board
        0 [0x80000330]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:463: move $a1, $s3     # puzzle // same as puzzle->board
        0 [0x80000334]	0x0c00027b  jal 0x000009ec [copy_board]     ; spimbot_pks3.s:464: jal copy_board
        0 [0x80000338]	0x00171021  addu $2, $0, $23                ; spimbot_pks3.s:466: move $v0, $s7     # $v0: done
        0 [0x8000033c]	0x08000103  j 0x0000040c [solve_done]       ; spimbot_pks3.s:468: j solve_done
      188 [0x80000340]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:472: move $a0, $s2 # current_board
      188 [0x80000344]	0x0c00026f  jal 0x000009bc [increment_heap] ; spimbot_pks3.s:473: jal increment_heap
      188 [0x80000348]	0x00029021  addu $18, $0, $2                ; spimbot_pks3.s:474: move $s2, $v0 # update current_board
      188 [0x8000034c]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:476: li  $v0, 0 # changed = false
      234 [0x80000350]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:479: move $a0, $s2
      234 [0x80000354]	0x0c000110  jal 0x00000440 [rule1]          ; spimbot_pks3.s:482: jal rule1          # changed = rule1(current_board);
      234 [0x80000358]	0x0002b021  addu $22, $0, $2                ; spimbot_pks3.s:483: move $s6, $v0      # done
      234 [0x8000035c]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:485: move $a0, $s2      # current_board
      234 [0x80000360]	0x0c000158  jal 0x00000560 [rule2]          ; spimbot_pks3.s:486: jal rule2
      234 [0x80000364]	0x00561025  or $2, $2, $22                  ; spimbot_pks3.s:488: or   $v0, $v0, $s6 # changed |= rule2(current_board);
      234 [0x80000368]	0x1440fffa  bne $2, $0, -24 [solve_start_do-0x80000368]; spimbot_pks3.s:490: bne $v0, $0, solve_start_do # while (changed)
      188 [0x8000036c]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:492: move $a0, $s2     # current_board
      188 [0x80000370]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:493: move $a1, $s3     # puzzle
      188 [0x80000374]	0x0c0001b0  jal 0x000006c0 [board_done]     ; spimbot_pks3.s:494: jal board_done
      188 [0x80000378]	0x10400007  beq $2, $0, 28 [solve_board_not_done_after_dowhile-0x80000378]; spimbot_pks3.s:496: beq $v0, $0, solve_board_not_done_after_dowhile  # if (done)
       22 [0x8000037c]	0x0002b821  addu $23, $0, $2                ; spimbot_pks3.s:497: move $s7, $v0     # save done
       22 [0x80000380]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:498: move $a0, $s2     # current_board
       22 [0x80000384]	0x00132821  addu $5, $0, $19                ; spimbot_pks3.s:499: move $a1, $s3     # puzzle // same as puzzle->board
       22 [0x80000388]	0x0c00027b  jal 0x000009ec [copy_board]     ; spimbot_pks3.s:500: jal copy_board
       22 [0x8000038c]	0x00171021  addu $2, $0, $23                ; spimbot_pks3.s:502: move $v0, $s7     # $v0: done
       22 [0x80000390]	0x08000103  j 0x0000040c [solve_done]       ; spimbot_pks3.s:503: j   solve_done
      166 [0x80000394]	0x72174002  mul $8, $16, $23                ; spimbot_pks3.s:508: mul $t0, $s0, $s7  # row*GRIDSIZE
      166 [0x80000398]	0x01114020  add $8, $8, $17                 ; spimbot_pks3.s:509: add $t0, $t0, $s1  # row*GRIDSIZE + col
      166 [0x8000039c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:510: mul $t0, $t0, 2    # sizeof(unsigned short) * (row*GRIDSIZE + col)
      166 [0x800003a0]	0x71014002  mul $8, $8, $1
      166 [0x800003a4]	0x0112a020  add $20, $8, $18                ; spimbot_pks3.s:511: add $s4, $t0, $s2  # &current_board[row*GRIDSIZE + col]
      166 [0x800003a8]	0x96960000  lhu $22, 0($20)                 ; spimbot_pks3.s:512: lhu $s6, 0($s4)    # possibles = current_board[row*GRIDSIZE + col]
      166 [0x800003ac]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:514: li $s5, 0 # char number = 0
     1171 [0x800003b0]	0x02b7082a  slt $1, $21, $23                ; spimbot_pks3.s:516: bge $s5, $s7, solve_start_guess_end # number < GRIDSIZE
     1171 [0x800003b4]	0x10200015  beq $1, $0, 84 [solve_start_guess_end-0x800003b4]
     1076 [0x800003b8]	0x34080001  ori $8, $0, 1                   ; spimbot_pks3.s:517: li $t0, 1
     1076 [0x800003bc]	0x02a84804  sllv $9, $8, $21                ; spimbot_pks3.s:518: sll $t1, $t0, $s5 # (1 << number)
     1076 [0x800003c0]	0x01364024  and $8, $9, $22                 ; spimbot_pks3.s:519: and $t0, $t1, $s6 # (1 << number) & possibles
     1076 [0x800003c4]	0x1100000f  beq $8, $0, 60 [solve_start_guess_else-0x800003c4]; spimbot_pks3.s:520: beq $t0, $0, solve_start_guess_else
      168 [0x800003c8]	0xa6890000  sh $9, 0($20)                   ; spimbot_pks3.s:521: sh  $t1, 0($s4)   # current_board[row*GRIDSIZE + col] = 1 << number;
      168 [0x800003cc]	0x00122021  addu $4, $0, $18                ; spimbot_pks3.s:523: move $a0, $s2     # current_board
      168 [0x800003d0]	0x00102821  addu $5, $0, $16                ; spimbot_pks3.s:524: move $a1, $s0     # next_row = row
      168 [0x800003d4]	0x22e8ffff  addi $8, $23, -1                ; spimbot_pks3.s:525: sub  $t0, $s7, 1  # GRIDSIZE-1
      168 [0x800003d8]	0x16280002  bne $17, $8, 8 [solve_start_guess_same_row-0x800003d8]; spimbot_pks3.s:526: bne  $s1, $t0, solve_start_guess_same_row # col < GRIDSIZE // col==GRIDSIZE-1
       20 [0x800003dc]	0x20a50001  addi $5, $5, 1                  ; spimbot_pks3.s:527: addi $a1, $a1, 1  # row + 1
      168 [0x800003e0]	0x00113021  addu $6, $0, $17                ; spimbot_pks3.s:529: move $a2, $s1     # col
      168 [0x800003e4]	0x24c60001  addiu $6, $6, 1                 ; spimbot_pks3.s:530: addu $a2, $a2, 1  # col + 1
      168 [0x800003e8]	0x00d7001b  divu $6, $23                    ; spimbot_pks3.s:531: divu $a2, $s7
      168 [0x800003ec]	0x00003010  mfhi $6                         ; spimbot_pks3.s:532: mfhi $a2          # (col + 1) % GRIDSIZE
      168 [0x800003f0]	0x00133821  addu $7, $0, $19                ; spimbot_pks3.s:533: move $a3, $s3     # puzzle
      168 [0x800003f4]	0x0c0000b2  jal 0x000002c8 [solve_puzzle]   ; spimbot_pks3.s:534: jal solve_puzzle         # solve(current_board, next_row, (col + 1) % GRIDSIZE, puzzle)
      168 [0x800003f8]	0x14400010  bne $2, $0, 64 [solve_done_true-0x800003f8]; spimbot_pks3.s:536: bne  $v0, $0, solve_done_true # if done {return true}
       97 [0x800003fc]	0xa6960000  sh $22, 0($20)                  ; spimbot_pks3.s:537: sh   $s6, 0($s4)  # current_board[row*GRIDSIZE + col] = possibles;
     1005 [0x80000400]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:539: addi $s5, $s5, 1
     1005 [0x80000404]	0x080000ec  j 0x000003b0 [solve_start_guess]; spimbot_pks3.s:540: j solve_start_guess
       97 [0x80000408]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:544: li  $v0, 0        # done = false
      190 [0x8000040c]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:547: lw  $ra, 0($sp)
      190 [0x80000410]	0x8fb00004  lw $16, 4($29)                  ; spimbot_pks3.s:548: lw  $s0, 4($sp)
      190 [0x80000414]	0x8fb10008  lw $17, 8($29)                  ; spimbot_pks3.s:549: lw  $s1, 8($sp)
      190 [0x80000418]	0x8fb2000c  lw $18, 12($29)                 ; spimbot_pks3.s:550: lw  $s2, 
      190 [0x8000041c]	0x8fb30010  lw $19, 16($29)                 ; spimbot_pks3.s:551: lw  $s3, 16($sp)
      190 [0x80000420]	0x8fb40014  lw $20, 20($29)                 ; spimbot_pks3.s:552: lw  $s4, 20($sp)
      190 [0x80000424]	0x8fb50018  lw $21, 24($29)                 ; spimbot_pks3.s:553: lw  $s5, 24($sp)
      190 [0x80000428]	0x8fb6001c  lw $22, 28($29)                 ; spimbot_pks3.s:554: lw  $s6, 28($sp)
      190 [0x8000042c]	0x8fb70020  lw $23, 32($29)                 ; spimbot_pks3.s:555: lw  $s7, 32($sp)
      190 [0x80000430]	0x23bd0024  addi $29, $29, 36               ; spimbot_pks3.s:556: add $sp, $sp, 36
      190 [0x80000434]	0x03e00008  jr $31                          ; spimbot_pks3.s:557: jr      $ra
       71 [0x80000438]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:560: li $v0, 1
       71 [0x8000043c]	0x08000103  j 0x0000040c [solve_done]       ; spimbot_pks3.s:561: j solve_done
      234 [0x80000440]	0x23bdffdc  addi $29, $29, -36              ; spimbot_pks3.s:592: sub     $sp, $sp, 36
      234 [0x80000444]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:593: sw      $ra, 0($sp)
      234 [0x80000448]	0xafb00004  sw $16, 4($29)                  ; spimbot_pks3.s:594: sw      $s0, 4($sp)
      234 [0x8000044c]	0xafb10008  sw $17, 8($29)                  ; spimbot_pks3.s:595: sw      $s1, 8($sp)
      234 [0x80000450]	0xafb2000c  sw $18, 12($29)                 ; spimbot_pks3.s:596: sw      $s2, 12($sp)
      234 [0x80000454]	0xafb30010  sw $19, 16($29)                 ; spimbot_pks3.s:597: sw      $s3, 16($sp)
      234 [0x80000458]	0xafb40014  sw $20, 20($29)                 ; spimbot_pks3.s:598: sw      $s4, 20($sp)
      234 [0x8000045c]	0xafb50018  sw $21, 24($29)                 ; spimbot_pks3.s:599: sw      $s5, 24($sp)
      234 [0x80000460]	0xafb6001c  sw $22, 28($29)                 ; spimbot_pks3.s:600: sw      $s6, 28($sp)
      234 [0x80000464]	0xafb70020  sw $23, 32($29)                 ; spimbot_pks3.s:601: sw      $s7, 32($sp)
      234 [0x80000468]	0x34100008  ori $16, $0, 8                  ; spimbot_pks3.s:602: li      $s0, GRIDSIZE                  # $s0: GRIDSIZE = 4
      234 [0x8000046c]	0x00048821  addu $17, $0, $4                ; spimbot_pks3.s:603: move    $s1, $a0                # $s1: board
      234 [0x80000470]	0x34120000  ori $18, $0, 0                  ; spimbot_pks3.s:604: li      $s2, 0                  # $s2: changed = false
      234 [0x80000474]	0x34130000  ori $19, $0, 0                  ; spimbot_pks3.s:605: li      $s3, 0                  # $s3: y = 0
     2106 [0x80000478]	0x0270082a  slt $1, $19, $16                ; spimbot_pks3.s:607: bge     $s3, $s0, r1_for_y_end  # for: y < GRIDSIZE
     2106 [0x8000047c]	0x1020002d  beq $1, $0, 180 [r1_for_y_end-0x8000047c]
     1872 [0x80000480]	0x34140000  ori $20, $0, 0                  ; spimbot_pks3.s:608: li      $s4, 0                  # $s4: x = 0
    16848 [0x80000484]	0x0290082a  slt $1, $20, $16                ; spimbot_pks3.s:610: bge     $s4, $s0, r1_for_x_end  # for: x < GRIDSIZE
    16848 [0x80000488]	0x10200028  beq $1, $0, 160 [r1_for_x_end-0x80000488]
    14976 [0x8000048c]	0x72702002  mul $4, $19, $16                ; spimbot_pks3.s:611: mul     $a0, $s3, $s0           # $a0: y*GRIDSIZE
    14976 [0x80000490]	0x00942020  add $4, $4, $20                 ; spimbot_pks3.s:612: add     $a0, $a0, $s4           # $a0: y*GRIDSIZE + x
    14976 [0x80000494]	0x00042040  sll $4, $4, 1                   ; spimbot_pks3.s:613: sll     $a0, $a0, 1             # $a0: 2*(y*GRIDSIZE + x)
    14976 [0x80000498]	0x00912020  add $4, $4, $17                 ; spimbot_pks3.s:614: add     $a0, $a0, $s1           # $a0: &board[y*GRIDSIZE+x]
    14976 [0x8000049c]	0x94840000  lhu $4, 0($4)                   ; spimbot_pks3.s:615: lhu     $a0, 0($a0)             # $a0: value = board[y*GRIDSIZE+x]
    14976 [0x800004a0]	0x0004b021  addu $22, $0, $4                ; spimbot_pks3.s:616: move    $s6, $a0                # $s6: value
    14976 [0x800004a4]	0x0c000264  jal 0x00000990 [has_single_bit_set]; spimbot_pks3.s:617: jal     has_single_bit_set
    14976 [0x800004a8]	0x1002001e  beq $0, $2, 120 [r1_for_x_inc-0x800004a8]; spimbot_pks3.s:618: beq     $v0, 0, r1_for_x_inc    # if(has_single_bit_set(value))
    14069 [0x800004ac]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:619: li      $s5, 0                  # $s5: k = 0
   126621 [0x800004b0]	0x02b0082a  slt $1, $21, $16                ; spimbot_pks3.s:621: bge     $s5, $s0, r1_for_k_end  # for: k < GRIDSIZE
   126621 [0x800004b4]	0x1020001b  beq $1, $0, 108 [r1_for_k_end-0x800004b4]
   112552 [0x800004b8]	0x12b4000c  beq $21, $20, 48 [r1_if_kx_end-0x800004b8]; spimbot_pks3.s:622: beq     $s5, $s4, r1_if_kx_end  # if (k != x)
    98483 [0x800004bc]	0x72704002  mul $8, $19, $16                ; spimbot_pks3.s:623: mul     $t0, $s3, $s0           # $t0: y*GRIDSIZE
    98483 [0x800004c0]	0x01154020  add $8, $8, $21                 ; spimbot_pks3.s:624: add     $t0, $t0, $s5           # $t0: y*GRIDSIZE + k
    98483 [0x800004c4]	0x00084040  sll $8, $8, 1                   ; spimbot_pks3.s:625: sll     $t0, $t0, 1             # $t0: 2*(y*GRIDSIZE + k)
    98483 [0x800004c8]	0x01114020  add $8, $8, $17                 ; spimbot_pks3.s:626: add     $t0, $t0, $s1           # $t0: &board[y*GRIDSIZE+k]
    98483 [0x800004cc]	0x95090000  lhu $9, 0($8)                   ; spimbot_pks3.s:627: lhu     $t1, 0($t0)             # $t1: board[y*GRIDSIZE + k]
    98483 [0x800004d0]	0x01365024  and $10, $9, $22                ; spimbot_pks3.s:628: and     $t2, $t1, $s6           # $t2: board[y*GRIDSIZE + k] & value
    98483 [0x800004d4]	0x100a0005  beq $0, $10, 20 [r1_if_kx_end-0x800004d4]; spimbot_pks3.s:629: beq     $t2, 0, r1_if_kx_end    # if (board[y*GRIDSIZE + k] & value)
     1569 [0x800004d8]	0x02c05827  nor $11, $22, $0                ; spimbot_pks3.s:630: not     $t3, $s6                # $t3: ~value
     1569 [0x800004dc]	0x012b4824  and $9, $9, $11                 ; spimbot_pks3.s:631: and     $t1, $t1, $t3           # $t1:  board[y*GRIDSIZE + k] & ~value
     1569 [0x800004e0]	0xa5090000  sh $9, 0($8)                    ; spimbot_pks3.s:632: sh      $t1, 0($t0)             # board[y*GRIDSIZE + k] &= ~value
     1569 [0x800004e4]	0x34120001  ori $18, $0, 1                  ; spimbot_pks3.s:633: li      $s2, 1                  # changed = true
   112552 [0x800004e8]	0x12b3000c  beq $21, $19, 48 [r1_if_ky_end-0x800004e8]; spimbot_pks3.s:635: beq     $s5, $s3, r1_if_ky_end  # if (k != y)
    98483 [0x800004ec]	0x72b04002  mul $8, $21, $16                ; spimbot_pks3.s:636: mul     $t0, $s5, $s0           # $t0: k*GRIDSIZE
    98483 [0x800004f0]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:637: add     $t0, $t0, $s4           # $t0: k*GRIDSIZE + x
    98483 [0x800004f4]	0x00084040  sll $8, $8, 1                   ; spimbot_pks3.s:638: sll     $t0, $t0, 1             # $t0: 2*(k*GRIDSIZE + x)
    98483 [0x800004f8]	0x01114020  add $8, $8, $17                 ; spimbot_pks3.s:639: add     $t0, $t0, $s1           # $t0: &board[k*GRIDSIZE+x]
    98483 [0x800004fc]	0x95090000  lhu $9, 0($8)                   ; spimbot_pks3.s:640: lhu     $t1, 0($t0)             # $t1: board[k*GRIDSIZE + x]
    98483 [0x80000500]	0x01365024  and $10, $9, $22                ; spimbot_pks3.s:641: and     $t2, $t1, $s6           # $t2: board[k*GRIDSIZE + x] & value
    98483 [0x80000504]	0x100a0005  beq $0, $10, 20 [r1_if_ky_end-0x80000504]; spimbot_pks3.s:642: beq     $t2, 0, r1_if_ky_end    # if (board[k*GRIDSIZE + x] & value)
     1576 [0x80000508]	0x02c05827  nor $11, $22, $0                ; spimbot_pks3.s:643: not     $t3, $s6                # $t3: ~value
     1576 [0x8000050c]	0x012b4824  and $9, $9, $11                 ; spimbot_pks3.s:644: and     $t1, $t1, $t3           # $t1:  board[k*GRIDSIZE + x] & ~value
     1576 [0x80000510]	0xa5090000  sh $9, 0($8)                    ; spimbot_pks3.s:645: sh      $t1, 0($t0)             # board[k*GRIDSIZE + x] &= ~value
     1576 [0x80000514]	0x34120001  ori $18, $0, 1                  ; spimbot_pks3.s:646: li      $s2, 1                  # changed = true
   112552 [0x80000518]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:648: add     $s5, $s5, 1             # for: k++
   112552 [0x8000051c]	0x0800012c  j 0x000004b0 [r1_for_k_start]   ; spimbot_pks3.s:649: j       r1_for_k_start
    14976 [0x80000520]	0x22940001  addi $20, $20, 1                ; spimbot_pks3.s:652: add     $s4, $s4, 1             # for: x++
    14976 [0x80000524]	0x08000121  j 0x00000484 [r1_for_x_start]   ; spimbot_pks3.s:653: j       r1_for_x_start  
     1872 [0x80000528]	0x22730001  addi $19, $19, 1                ; spimbot_pks3.s:656: add     $s3, $s3, 1             # for: y++
     1872 [0x8000052c]	0x0800011e  j 0x00000478 [r1_for_y_start]   ; spimbot_pks3.s:657: j       r1_for_y_start
      234 [0x80000530]	0x00121021  addu $2, $0, $18                ; spimbot_pks3.s:659: move    $v0, $s2                # return changed
      234 [0x80000534]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:661: lw      $ra, 0($sp)
      234 [0x80000538]	0x8fb00004  lw $16, 4($29)                  ; spimbot_pks3.s:662: lw      $s0, 4($sp)
      234 [0x8000053c]	0x8fb10008  lw $17, 8($29)                  ; spimbot_pks3.s:663: lw      $s1, 8($sp)
      234 [0x80000540]	0x8fb2000c  lw $18, 12($29)                 ; spimbot_pks3.s:664: lw      $s2, 12($sp)
      234 [0x80000544]	0x8fb30010  lw $19, 16($29)                 ; spimbot_pks3.s:665: lw      $s3, 16($sp)
      234 [0x80000548]	0x8fb40014  lw $20, 20($29)                 ; spimbot_pks3.s:666: lw      $s4, 20($sp)
      234 [0x8000054c]	0x8fb50018  lw $21, 24($29)                 ; spimbot_pks3.s:667: lw      $s5, 24($sp)
      234 [0x80000550]	0x8fb6001c  lw $22, 28($29)                 ; spimbot_pks3.s:668: lw      $s6, 28($sp)
      234 [0x80000554]	0x8fb70020  lw $23, 32($29)                 ; spimbot_pks3.s:669: lw      $s7, 32($sp)
      234 [0x80000558]	0x23bd0024  addi $29, $29, 36               ; spimbot_pks3.s:670: add     $sp, $sp, 36
      234 [0x8000055c]	0x03e00008  jr $31                          ; spimbot_pks3.s:671: jr      $ra
      234 [0x80000560]	0x23bdfffc  addi $29, $29, -4               ; spimbot_pks3.s:677: sub $sp, $sp, 4                       #Store ra onto stack and initialize GRIDSIZE
      234 [0x80000564]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:678: sw $ra, 0($sp)
      234 [0x80000568]	0x34080008  ori $8, $0, 8                   ; spimbot_pks3.s:679: li $t0, GRIDSIZE                               # GRIDSIZE
      234 [0x8000056c]	0x34090001  ori $9, $0, 1                   ; spimbot_pks3.s:680: li $t1, 1
      234 [0x80000570]	0x01094804  sllv $9, $9, $8                 ; spimbot_pks3.s:681: sll $t1, $t1, $t0
      234 [0x80000574]	0x2529ffff  addiu $9, $9, -1                ; spimbot_pks3.s:682: subu $t1, $t1, 1                         #int ALL_VALUES = (1 << GRIDSIZE) - 1;
      234 [0x80000578]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:683: li $v0, 0                               #bool changed = false
      234 [0x8000057c]	0x340a0000  ori $10, $0, 0                  ; spimbot_pks3.s:684: li $t2, 0                               #i = 0
     2106 [0x80000580]	0x0148082a  slt $1, $10, $8                 ; spimbot_pks3.s:686: bge $t2, $t0, rule2iloopend
     2106 [0x80000584]	0x1020004c  beq $1, $0, 304 [rule2iloopend-0x80000584]
     1872 [0x80000588]	0x340b0000  ori $11, $0, 0                  ; spimbot_pks3.s:687: li $t3, 0                               #j = 0
    16848 [0x8000058c]	0x0168082a  slt $1, $11, $8                 ; spimbot_pks3.s:689: bge $t3, $t0, rule2jloopend
    16848 [0x80000590]	0x10200047  beq $1, $0, 284 [rule2jloopend-0x80000590]
    14976 [0x80000594]	0x71486002  mul $12, $10, $8                ; spimbot_pks3.s:691: mul $t4, $t2, $t0
    14976 [0x80000598]	0x018b6020  add $12, $12, $11               ; spimbot_pks3.s:692: add $t4, $t4, $t3
    14976 [0x8000059c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:693: mul $t4, $t4, 2                     #sizeof(unsigned short)*(i*GRIDSIZE + j)
    14976 [0x800005a0]	0x71816002  mul $12, $12, $1
    14976 [0x800005a4]	0x008c6020  add $12, $4, $12                ; spimbot_pks3.s:694: add $t4, $a0, $t4                   #address of board[i*GRIDSIZE+j]
    14976 [0x800005a8]	0x958c0000  lhu $12, 0($12)                 ; spimbot_pks3.s:695: lhu $t4, 0($t4)                     #board[i*GRIDSIZE + j]
    14976 [0x800005ac]	0x23bdffe8  addi $29, $29, -24              ; spimbot_pks3.s:697: sub $sp, $sp, 24                    # Allocate stack 
    14976 [0x800005b0]	0xafa40000  sw $4, 0($29)                   ; spimbot_pks3.s:698: sw $a0, 0($sp)
    14976 [0x800005b4]	0xafa80004  sw $8, 4($29)                   ; spimbot_pks3.s:699: sw $t0, 4($sp)
    14976 [0x800005b8]	0xafa90008  sw $9, 8($29)                   ; spimbot_pks3.s:700: sw $t1, 8($sp)
    14976 [0x800005bc]	0xafaa000c  sw $10, 12($29)                 ; spimbot_pks3.s:701: sw $t2, 12($sp)
    14976 [0x800005c0]	0xafab0010  sw $11, 16($29)                 ; spimbot_pks3.s:702: sw $t3, 16($sp)
    14976 [0x800005c4]	0xafa20014  sw $2, 20($29)                  ; spimbot_pks3.s:703: sw $v0, 20($sp)                     #Store all necessary variables on stack
    14976 [0x800005c8]	0x000c2021  addu $4, $0, $12                ; spimbot_pks3.s:704: move $a0, $t4
    14976 [0x800005cc]	0x0c000264  jal 0x00000990 [has_single_bit_set]; spimbot_pks3.s:705: jal has_single_bit_set
    14976 [0x800005d0]	0x8fa40000  lw $4, 0($29)                   ; spimbot_pks3.s:706: lw $a0, 0($sp)
    14976 [0x800005d4]	0x8fa80004  lw $8, 4($29)                   ; spimbot_pks3.s:707: lw $t0, 4($sp)
    14976 [0x800005d8]	0x8fa90008  lw $9, 8($29)                   ; spimbot_pks3.s:708: lw $t1, 8($sp)
    14976 [0x800005dc]	0x8faa000c  lw $10, 12($29)                 ; spimbot_pks3.s:709: lw $t2, 12($sp)
    14976 [0x800005e0]	0x8fab0010  lw $11, 16($29)                 ; spimbot_pks3.s:710: lw $t3, 16($sp)
    14976 [0x800005e4]	0x00026021  addu $12, $0, $2                ; spimbot_pks3.s:711: move $t4, $v0                       # Save $v0 into $t4
    14976 [0x800005e8]	0x8fa20014  lw $2, 20($29)                  ; spimbot_pks3.s:712: lw $v0, 20($sp)                     # Restore variables
    14976 [0x800005ec]	0x23bd0018  addi $29, $29, 24               ; spimbot_pks3.s:713: add $sp, $sp, 24                    # Deallocate stack
    14976 [0x800005f0]	0x1580002d  bne $12, $0, 180 [rule2continuestatement-0x800005f0]; spimbot_pks3.s:715: bne $t4, $0, rule2continuestatement #if (has_single_bit_set(value)) continue;
      677 [0x800005f4]	0x340d0000  ori $13, $0, 0                  ; spimbot_pks3.s:717: li $t5, 0                           #isum = 0
      677 [0x800005f8]	0x340e0000  ori $14, $0, 0                  ; spimbot_pks3.s:718: li $t6, 0                           #jsum = 0
      677 [0x800005fc]	0x340c0000  ori $12, $0, 0                  ; spimbot_pks3.s:719: li $t4, 0                           #k = 0, t2 = i, t3 = j, t4 = k
     6093 [0x80000600]	0x0188082a  slt $1, $12, $8                 ; spimbot_pks3.s:721: bge $t4, $t0, rule2kloopend
     6093 [0x80000604]	0x10200013  beq $1, $0, 76 [rule2kloopend-0x80000604]
     5416 [0x80000608]	0x118b0008  beq $12, $11, 32 [rule2kequalsj-0x80000608]; spimbot_pks3.s:722: beq $t4, $t3, rule2kequalsj
     4739 [0x8000060c]	0x71487802  mul $15, $10, $8                ; spimbot_pks3.s:723: mul $t7, $t2, $t0           #i*GRIDSIZE
     4739 [0x80000610]	0x01ec7820  add $15, $15, $12               ; spimbot_pks3.s:724: add $t7, $t7, $t4           #i*GRIDSIZE+k
     4739 [0x80000614]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:725: mul $t7, $t7, 2
     4739 [0x80000618]	0x71e17802  mul $15, $15, $1
     4739 [0x8000061c]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:726: add $t7, $a0, $t7           #&board[i*GRIDSIZE + k]
     4739 [0x80000620]	0x95ef0000  lhu $15, 0($15)                 ; spimbot_pks3.s:727: lhu $t7, 0($t7)
     4739 [0x80000624]	0x01cf7025  or $14, $14, $15                ; spimbot_pks3.s:728: or $t6, $t6, $t7            #jsum |= board[i*GRIDSIZE + k];
     5416 [0x80000628]	0x118a0008  beq $12, $10, 32 [rule2kequalsi-0x80000628]; spimbot_pks3.s:730: beq $t4, $t2, rule2kequalsi     
     4739 [0x8000062c]	0x71887802  mul $15, $12, $8                ; spimbot_pks3.s:731: mul $t7, $t4, $t0           #k*GRIDSIZE
     4739 [0x80000630]	0x01eb7820  add $15, $15, $11               ; spimbot_pks3.s:732: add $t7, $t7, $t3           #k*GRIDSIZE+j
     4739 [0x80000634]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:733: mul $t7, $t7, 2
     4739 [0x80000638]	0x71e17802  mul $15, $15, $1
     4739 [0x8000063c]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:734: add $t7, $a0, $t7           #&board[k*GRIDSIZE + j]
     4739 [0x80000640]	0x95ef0000  lhu $15, 0($15)                 ; spimbot_pks3.s:735: lhu $t7, 0($t7)
     4739 [0x80000644]	0x01af6825  or $13, $13, $15                ; spimbot_pks3.s:736: or $t5, $t5, $t7            #isum |= board[k*GRIDSIZE + j];
     5416 [0x80000648]	0x218c0001  addi $12, $12, 1                ; spimbot_pks3.s:738: add $t4, $t4, 1
     5416 [0x8000064c]	0x08000180  j 0x00000600 [rule2kloopstart]  ; spimbot_pks3.s:739: j rule2kloopstart
      677 [0x80000650]	0x112e000b  beq $9, $14, 44 [rule2allvalequalsjsum-0x80000650]; spimbot_pks3.s:741: beq $t1, $t6, rule2allvalequalsjsum
      149 [0x80000654]	0x01c07027  nor $14, $14, $0                ; spimbot_pks3.s:742: not $t6, $t6                    # ~jsum
      149 [0x80000658]	0x012e7024  and $14, $9, $14                ; spimbot_pks3.s:743: and $t6, $t1, $t6               #ALL_VALUES & ~jsum
      149 [0x8000065c]	0x710a7802  mul $15, $8, $10                ; spimbot_pks3.s:744: mul $t7, $t0, $t2               # i*GRIDSIZE
      149 [0x80000660]	0x01eb7820  add $15, $15, $11               ; spimbot_pks3.s:745: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
      149 [0x80000664]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:746: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
      149 [0x80000668]	0x71e17802  mul $15, $15, $1
      149 [0x8000066c]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:747: add $t7, $a0, $t7
      149 [0x80000670]	0xa5ee0000  sh $14, 0($15)                  ; spimbot_pks3.s:748: sh $t6, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~jsum;
      149 [0x80000674]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:749: li $v0, 1
      149 [0x80000678]	0x080001a9  j 0x000006a4 [rule2continuestatement]; spimbot_pks3.s:750: j rule2continuestatement
      528 [0x8000067c]	0x112d000a  beq $9, $13, 40 [rule2continuestatement-0x8000067c]; spimbot_pks3.s:752: beq $t1, $t5, rule2continuestatement
       52 [0x80000680]	0x01a06827  nor $13, $13, $0                ; spimbot_pks3.s:753: not $t5, $t5                    # ~isum
       52 [0x80000684]	0x012d6824  and $13, $9, $13                ; spimbot_pks3.s:754: and $t5, $t1, $t5               #ALL_VALUES & ~isum;
       52 [0x80000688]	0x710a7802  mul $15, $8, $10                ; spimbot_pks3.s:755: mul $t7, $t0, $t2               # i*GRIDSIZE
       52 [0x8000068c]	0x01eb7820  add $15, $15, $11               ; spimbot_pks3.s:756: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
       52 [0x80000690]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:757: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
       52 [0x80000694]	0x71e17802  mul $15, $15, $1
       52 [0x80000698]	0x008f7820  add $15, $4, $15                ; spimbot_pks3.s:758: add $t7, $a0, $t7
       52 [0x8000069c]	0xa5ed0000  sh $13, 0($15)                  ; spimbot_pks3.s:759: sh $t5, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~isum;
       52 [0x800006a0]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:760: li $v0, 1
    14976 [0x800006a4]	0x216b0001  addi $11, $11, 1                ; spimbot_pks3.s:762: add $t3, $t3, 1
    14976 [0x800006a8]	0x08000163  j 0x0000058c [rule2jloopstart]  ; spimbot_pks3.s:763: j rule2jloopstart                   #continue; iterates to next index of jloop
     1872 [0x800006ac]	0x214a0001  addi $10, $10, 1                ; spimbot_pks3.s:765: add $t2, $t2, 1
     1872 [0x800006b0]	0x08000160  j 0x00000580 [rule2iloopstart]  ; spimbot_pks3.s:766: j rule2iloopstart
      234 [0x800006b4]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:769: lw $ra, 0($sp)
      234 [0x800006b8]	0x23bd0004  addi $29, $29, 4                ; spimbot_pks3.s:770: add $sp, $sp, 4
      234 [0x800006bc]	0x03e00008  jr $31                          ; spimbot_pks3.s:771: jr $ra
      190 [0x800006c0]	0x23bdffdc  addi $29, $29, -36              ; spimbot_pks3.s:779: sub $sp, $sp, 36
      190 [0x800006c4]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:780: sw  $ra, 0($sp)
      190 [0x800006c8]	0xafb00004  sw $16, 4($29)                  ; spimbot_pks3.s:781: sw  $s0, 4($sp)
      190 [0x800006cc]	0xafb10008  sw $17, 8($29)                  ; spimbot_pks3.s:782: sw  $s1, 8($sp)
      190 [0x800006d0]	0xafb2000c  sw $18, 12($29)                 ; spimbot_pks3.s:783: sw  $s2, 12($sp)
      190 [0x800006d4]	0xafb30010  sw $19, 16($29)                 ; spimbot_pks3.s:784: sw  $s3, 16($sp)
      190 [0x800006d8]	0xafb40014  sw $20, 20($29)                 ; spimbot_pks3.s:785: sw  $s4, 20($sp)
      190 [0x800006dc]	0xafb50018  sw $21, 24($29)                 ; spimbot_pks3.s:786: sw  $s5, 24($sp)
      190 [0x800006e0]	0xafb6001c  sw $22, 28($29)                 ; spimbot_pks3.s:787: sw  $s6, 28($sp)
      190 [0x800006e4]	0xafb70020  sw $23, 32($29)                 ; spimbot_pks3.s:788: sw  $s7, 32($sp)
      190 [0x800006e8]	0x00048021  addu $16, $0, $4                ; spimbot_pks3.s:790: move    $s0, $a0        # s0 = current_board
      190 [0x800006ec]	0x00058821  addu $17, $0, $5                ; spimbot_pks3.s:791: move    $s1, $a1        # s1 = puzzle
      190 [0x800006f0]	0x34120008  ori $18, $0, 8                  ; spimbot_pks3.s:792: li  $s2, GRIDSIZE              # s2 = GRIDSIZE
      190 [0x800006f4]	0x34080001  ori $8, $0, 1                   ; spimbot_pks3.s:793: li  $t0, 1
      190 [0x800006f8]	0x02484004  sllv $8, $8, $18                ; spimbot_pks3.s:794: sll $t0, $t0, $s2       # 1 << GRIDSIZE
      190 [0x800006fc]	0x2113ffff  addi $19, $8, -1                ; spimbot_pks3.s:795: sub $s3, $t0, 1     # s3 = ALL_VALUES = (1 << GRIDSIZE) - 1
      190 [0x80000700]	0x34140000  ori $20, $0, 0                  ; spimbot_pks3.s:797: li  $s4, 0          # s4 = i = 0
     1235 [0x80000704]	0x0292082a  slt $1, $20, $18                ; spimbot_pks3.s:799: bge $s4, $s2, bd_i1_loop_end    # !(i < GRIDSIZE)
     1235 [0x80000708]	0x10200025  beq $1, $0, 148 [bd_i1_loop_end-0x80000708]
     1116 [0x8000070c]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:801: li  $s5, 0          # s5 = acc = 0
     1116 [0x80000710]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:802: li  $s6, 0          # s6 = j = 0
    10044 [0x80000714]	0x02d2082a  slt $1, $22, $18                ; spimbot_pks3.s:804: bge $s6, $s2, bd_j1_loop_end    # !(j < GRIDSIZE)
    10044 [0x80000718]	0x1020000d  beq $1, $0, 52 [bd_j1_loop_end-0x80000718]
     8928 [0x8000071c]	0x72924002  mul $8, $20, $18                ; spimbot_pks3.s:806: mul $t0, $s4, $s2       # i*GRIDSIZE
     8928 [0x80000720]	0x01164020  add $8, $8, $22                 ; spimbot_pks3.s:807: add $t0, $t0, $s6       # i*GRIDSIZE + j
     8928 [0x80000724]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:808: mul $t0, $t0, 2         # sizeof(unsigned short)*(i*GRIDSIZE + j)
     8928 [0x80000728]	0x71014002  mul $8, $8, $1
     8928 [0x8000072c]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:809: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     8928 [0x80000730]	0x95170000  lhu $23, 0($8)                  ; spimbot_pks3.s:810: lhu $s7, 0($t0)         # s7 = value = current_board[i*GRIDSIZE + j]
     8928 [0x80000734]	0x00172021  addu $4, $0, $23                ; spimbot_pks3.s:812: move    $a0, $s7
     8928 [0x80000738]	0x0c000264  jal 0x00000990 [has_single_bit_set]; spimbot_pks3.s:813: jal has_single_bit_set
     8928 [0x8000073c]	0x10400002  beq $2, $0, 8 [bd_j1_loop_increment-0x8000073c]; spimbot_pks3.s:814: beq $v0, $0, bd_j1_loop_increment   # if (!hsbs(value)) continue
     8822 [0x80000740]	0x02b7a826  xor $21, $21, $23               ; spimbot_pks3.s:815: xor $s5, $s5, $s7
     8928 [0x80000744]	0x22d60001  addi $22, $22, 1                ; spimbot_pks3.s:818: add $s6, $s6, 1     # ++ j
     8928 [0x80000748]	0x080001c5  j 0x00000714 [bd_j1_loop_start] ; spimbot_pks3.s:819: j   bd_j1_loop_start
     1116 [0x8000074c]	0x16b30085  bne $21, $19, 532 [bd_return_false-0x8000074c]; spimbot_pks3.s:821: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
     1063 [0x80000750]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:823: li  $s5, 0          # s5 = acc = 0
     1063 [0x80000754]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:824: li  $s6, 0          # s6 = j = 0
     9567 [0x80000758]	0x02d2082a  slt $1, $22, $18                ; spimbot_pks3.s:826: bge $s6, $s2, bd_j2_loop_end    # !(j < GRIDSIZE)
     9567 [0x8000075c]	0x1020000d  beq $1, $0, 52 [bd_j2_loop_end-0x8000075c]
     8504 [0x80000760]	0x72d24002  mul $8, $22, $18                ; spimbot_pks3.s:828: mul $t0, $s6, $s2       # j*GRIDSIZE
     8504 [0x80000764]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:829: add $t0, $t0, $s4       # j*GRIDSIZE + i
     8504 [0x80000768]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:830: mul $t0, $t0, 2
     8504 [0x8000076c]	0x71014002  mul $8, $8, $1
     8504 [0x80000770]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:831: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     8504 [0x80000774]	0x95170000  lhu $23, 0($8)                  ; spimbot_pks3.s:832: lhu $s7, 0($t0)     # s7 = value = current_board[j*GRIDSIZE + i]
     8504 [0x80000778]	0x00172021  addu $4, $0, $23                ; spimbot_pks3.s:834: move    $a0, $s7
     8504 [0x8000077c]	0x0c000264  jal 0x00000990 [has_single_bit_set]; spimbot_pks3.s:835: jal has_single_bit_set
     8504 [0x80000780]	0x10400002  beq $2, $0, 8 [bd_j2_loop_increment-0x80000780]; spimbot_pks3.s:836: beq $v0, $0, bd_j2_loop_increment   # if (!hsbs(value)) continue
     8468 [0x80000784]	0x02b7a826  xor $21, $21, $23               ; spimbot_pks3.s:837: xor $s5, $s5, $s7
     8504 [0x80000788]	0x22d60001  addi $22, $22, 1                ; spimbot_pks3.s:840: add $s6, $s6, 1     # ++ j
     8504 [0x8000078c]	0x080001d6  j 0x00000758 [bd_j2_loop_start] ; spimbot_pks3.s:841: j   bd_j2_loop_start
     1063 [0x80000790]	0x16b30074  bne $21, $19, 464 [bd_return_false-0x80000790]; spimbot_pks3.s:843: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
     1045 [0x80000794]	0x22940001  addi $20, $20, 1                ; spimbot_pks3.s:846: add $s4, $s4, 1     # ++ i
     1045 [0x80000798]	0x080001c1  j 0x00000704 [bd_i1_loop_start] ; spimbot_pks3.s:847: j   bd_i1_loop_start
      119 [0x8000079c]	0x34140000  ori $20, $0, 0                  ; spimbot_pks3.s:849: li  $s4, 0          # s4 = i = 0
      697 [0x800007a0]	0x0292082a  slt $1, $20, $18                ; spimbot_pks3.s:851: bge $s4, $s2, bd_i2_loop_end    # !(i < GRIDSIZE)
      697 [0x800007a4]	0x1020006d  beq $1, $0, 436 [bd_i2_loop_end-0x800007a4]
      675 [0x800007a8]	0x34080002  ori $8, $0, 2                   ; spimbot_pks3.s:853: li  $t0, 2          # sizeof(short)
      675 [0x800007ac]	0x71124002  mul $8, $8, $18                 ; spimbot_pks3.s:854: mul $t0, $t0, $s2
      675 [0x800007b0]	0x71124002  mul $8, $8, $18                 ; spimbot_pks3.s:855: mul $t0, $t0, $s2       # sizeof(unsigned short board[GRIDSIZE*GRIDSIZE])
      675 [0x800007b4]	0x02289820  add $19, $17, $8                ; spimbot_pks3.s:856: add $s3, $s1, $t0       # s3 = &(puzzle->constraints)
      675 [0x800007b8]	0x22880001  addi $8, $20, 1                 ; spimbot_pks3.s:858: add $t0, $s4, 1     # i+1
      675 [0x800007bc]	0x22490002  addi $9, $18, 2                 ; spimbot_pks3.s:859: add $t1, $s2, 2     # GRIDSIZE+2
      675 [0x800007c0]	0x71094002  mul $8, $8, $9                  ; spimbot_pks3.s:860: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
      675 [0x800007c4]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:861: mul $t0, $t0, 2
      675 [0x800007c8]	0x71014002  mul $8, $8, $1
      675 [0x800007cc]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:862: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
      675 [0x800007d0]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:863: lhu $t9, 0($t0)     # t9 = left_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
      675 [0x800007d4]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:864: li  $s5, 0          # s5 = count = 0
      675 [0x800007d8]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:865: li  $s6, 0          # s6 = last = 0
      675 [0x800007dc]	0x34170000  ori $23, $0, 0                  ; spimbot_pks3.s:867: li  $s7, 0          # s7 = j = 0
     6075 [0x800007e0]	0x02f2082a  slt $1, $23, $18                ; spimbot_pks3.s:869: bge $s7, $s2, bd_j3_loop_end    # !(j < GRIDSIZE)
     6075 [0x800007e4]	0x1020000d  beq $1, $0, 52 [bd_j3_loop_end-0x800007e4]
     5400 [0x800007e8]	0x72924002  mul $8, $20, $18                ; spimbot_pks3.s:871: mul $t0, $s4, $s2       # i*GRIDSIZE
     5400 [0x800007ec]	0x01174020  add $8, $8, $23                 ; spimbot_pks3.s:872: add $t0, $t0, $s7       # i*GRIDSIZE + j
     5400 [0x800007f0]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:873: mul $t0, $t0, 2
     5400 [0x800007f4]	0x71014002  mul $8, $8, $1
     5400 [0x800007f8]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:874: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     5400 [0x800007fc]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:875: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
     5400 [0x80000800]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:876: ble $t0, $s6, bd_j3_loop_increment  # !(current > last)
     5400 [0x80000804]	0x10200003  beq $1, $0, 12 [bd_j3_loop_increment-0x80000804]
     1924 [0x80000808]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:877: add $s5, $s5, 1     # count += 1
     1924 [0x8000080c]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:878: move    $s6, $t0        # last = current
     5400 [0x80000810]	0x22f70001  addi $23, $23, 1                ; spimbot_pks3.s:880: add $s7, $s7, 1     # ++ j
     5400 [0x80000814]	0x080001f8  j 0x000007e0 [bd_j3_loop_start] ; spimbot_pks3.s:881: j   bd_j3_loop_start
      675 [0x80000818]	0x16b90052  bne $21, $25, 328 [bd_return_false-0x80000818]; spimbot_pks3.s:883: bne $s5, $t9, bd_return_false   # if (count != left_constraint) return false
      630 [0x8000081c]	0x22880001  addi $8, $20, 1                 ; spimbot_pks3.s:885: add $t0, $s4, 1     # i+1
      630 [0x80000820]	0x22490002  addi $9, $18, 2                 ; spimbot_pks3.s:886: add $t1, $s2, 2     # GRIDSIZE+2
      630 [0x80000824]	0x71094002  mul $8, $8, $9                  ; spimbot_pks3.s:887: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
      630 [0x80000828]	0x01124020  add $8, $8, $18                 ; spimbot_pks3.s:888: add $t0, $t0, $s2       # (i+1)*(GRIDSIZE+2) + GRIDSIZE
      630 [0x8000082c]	0x21080001  addi $8, $8, 1                  ; spimbot_pks3.s:889: add $t0, $t0, 1     # (i+1)*(GRIDSIZE+2) + GRIDSIZE + 1
      630 [0x80000830]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:890: mul $t0, $t0, 2
      630 [0x80000834]	0x71014002  mul $8, $8, $1
      630 [0x80000838]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:891: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
      630 [0x8000083c]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:892: lhu $t9, 0($t0)     # t9 = right_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
      630 [0x80000840]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:893: li  $s5, 0          # s5 = count = 0
      630 [0x80000844]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:894: li  $s6, 0          # s6 = last = 0
      630 [0x80000848]	0x2257ffff  addi $23, $18, -1               ; spimbot_pks3.s:896: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
     5670 [0x8000084c]	0x02e0082a  slt $1, $23, $0                 ; spimbot_pks3.s:898: blt $s7, $0, bd_j4_loop_end # !(j >= 0)
     5670 [0x80000850]	0x1420000d  bne $1, $0, 52 [bd_j4_loop_end-0x80000850]
     5040 [0x80000854]	0x72924002  mul $8, $20, $18                ; spimbot_pks3.s:900: mul $t0, $s4, $s2       # i*GRIDSIZE
     5040 [0x80000858]	0x01174020  add $8, $8, $23                 ; spimbot_pks3.s:901: add $t0, $t0, $s7       # i*GRIDSIZE + j
     5040 [0x8000085c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:902: mul $t0, $t0, 2
     5040 [0x80000860]	0x71014002  mul $8, $8, $1
     5040 [0x80000864]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:903: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     5040 [0x80000868]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:904: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
     5040 [0x8000086c]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:905: ble $t0, $s6, bd_j4_loop_increment  # !(current > last)
     5040 [0x80000870]	0x10200003  beq $1, $0, 12 [bd_j4_loop_increment-0x80000870]
     1551 [0x80000874]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:906: add $s5, $s5, 1     # count += 1
     1551 [0x80000878]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:907: move    $s6, $t0        # last = current
     5040 [0x8000087c]	0x22f7ffff  addi $23, $23, -1               ; spimbot_pks3.s:909: sub $s7, $s7, 1     # -- j
     5040 [0x80000880]	0x08000213  j 0x0000084c [bd_j4_loop_start] ; spimbot_pks3.s:910: j   bd_j4_loop_start
      630 [0x80000884]	0x16b90037  bne $21, $25, 220 [bd_return_false-0x80000884]; spimbot_pks3.s:912: bne $s5, $t9, bd_return_false   # if (count != right_constraint) return false
      630 [0x80000888]	0x22880001  addi $8, $20, 1                 ; spimbot_pks3.s:913: add $t0, $s4, 1     # i+1
      630 [0x8000088c]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:914: mul $t0, $t0, 2
      630 [0x80000890]	0x71014002  mul $8, $8, $1
      630 [0x80000894]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:915: add $t0, $t0, $s3       # &puzzle->constraints[i + 1]
      630 [0x80000898]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:916: lhu $t9, 0($t0)     # t9 = top_constraint = puzzle->constraints[i + 1]
      630 [0x8000089c]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:917: li  $s5, 0          # s5 = count = 0
      630 [0x800008a0]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:918: li  $s6, 0          # s6 = last = 0
      630 [0x800008a4]	0x34170000  ori $23, $0, 0                  ; spimbot_pks3.s:920: li  $s7, 0          # s7 = j = 0
     5670 [0x800008a8]	0x02f2082a  slt $1, $23, $18                ; spimbot_pks3.s:922: bge $s7, $s2, bd_j5_loop_end    # !(j < GRIDSIZE)
     5670 [0x800008ac]	0x1020000d  beq $1, $0, 52 [bd_j5_loop_end-0x800008ac]
     5040 [0x800008b0]	0x72f24002  mul $8, $23, $18                ; spimbot_pks3.s:924: mul $t0, $s7, $s2       # j*GRIDSIZE
     5040 [0x800008b4]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:925: add $t0, $t0, $s4       # j*GRIDSIZE + i
     5040 [0x800008b8]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:926: mul $t0, $t0, 2
     5040 [0x800008bc]	0x71014002  mul $8, $8, $1
     5040 [0x800008c0]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:927: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     5040 [0x800008c4]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:928: lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
     5040 [0x800008c8]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:929: ble $t0, $s6, bd_j5_loop_increment  # !(current > last)
     5040 [0x800008cc]	0x10200003  beq $1, $0, 12 [bd_j5_loop_increment-0x800008cc]
     1768 [0x800008d0]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:930: add $s5, $s5, 1     # count += 1
     1768 [0x800008d4]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:931: move    $s6, $t0        # last = current
     5040 [0x800008d8]	0x22f70001  addi $23, $23, 1                ; spimbot_pks3.s:933: add $s7, $s7, 1     # ++ j
     5040 [0x800008dc]	0x0800022a  j 0x000008a8 [bd_j5_loop_start] ; spimbot_pks3.s:934: j   bd_j5_loop_start
      630 [0x800008e0]	0x16b90020  bne $21, $25, 128 [bd_return_false-0x800008e0]; spimbot_pks3.s:936: bne $s5, $t9, bd_return_false   # if (count != top_constraint) return false
      578 [0x800008e4]	0x22480001  addi $8, $18, 1                 ; spimbot_pks3.s:938: add $t0, $s2, 1     # GRIDSIZE+1
      578 [0x800008e8]	0x22490002  addi $9, $18, 2                 ; spimbot_pks3.s:939: add $t1, $s2, 2     # GRIDSIZE+2
      578 [0x800008ec]	0x71094002  mul $8, $8, $9                  ; spimbot_pks3.s:940: mul $t0, $t0, $t1       # (GRIDSIZE+1)*(GRIDSIZE+2)
      578 [0x800008f0]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:941: add $t0, $t0, $s4       # (GRIDSIZE+1)*(GRIDSIZE+2) + i
      578 [0x800008f4]	0x21080001  addi $8, $8, 1                  ; spimbot_pks3.s:942: add $t0, $t0, 1     # (GRIDSIZE+1)*(GRIDSIZE+2) + i + 1
      578 [0x800008f8]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:943: mul $t0, $t0, 2
      578 [0x800008fc]	0x71014002  mul $8, $8, $1
      578 [0x80000900]	0x01134020  add $8, $8, $19                 ; spimbot_pks3.s:944: add $t0, $t0, $s3       # &puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
      578 [0x80000904]	0x95190000  lhu $25, 0($8)                  ; spimbot_pks3.s:945: lhu $t9, 0($t0)     # t9 = bottom_constraint = puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
      578 [0x80000908]	0x34150000  ori $21, $0, 0                  ; spimbot_pks3.s:946: li  $s5, 0          # s5 = count = 0
      578 [0x8000090c]	0x34160000  ori $22, $0, 0                  ; spimbot_pks3.s:947: li  $s6, 0          # s6 = last = 0
      578 [0x80000910]	0x2257ffff  addi $23, $18, -1               ; spimbot_pks3.s:949: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
     5202 [0x80000914]	0x02e0082a  slt $1, $23, $0                 ; spimbot_pks3.s:951: blt $s7, $0, bd_j6_loop_end # !(j >= 0)
     5202 [0x80000918]	0x1420000d  bne $1, $0, 52 [bd_j6_loop_end-0x80000918]
     4624 [0x8000091c]	0x72f24002  mul $8, $23, $18                ; spimbot_pks3.s:953: mul $t0, $s7, $s2       # j*GRIDSIZE
     4624 [0x80000920]	0x01144020  add $8, $8, $20                 ; spimbot_pks3.s:954: add $t0, $t0, $s4       # j*GRIDSIZE + i
     4624 [0x80000924]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:955: mul $t0, $t0, 2
     4624 [0x80000928]	0x71014002  mul $8, $8, $1
     4624 [0x8000092c]	0x02084020  add $8, $16, $8                 ; spimbot_pks3.s:956: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     4624 [0x80000930]	0x95080000  lhu $8, 0($8)                   ; spimbot_pks3.s:957: lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
     4624 [0x80000934]	0x02c8082a  slt $1, $22, $8                 ; spimbot_pks3.s:958: ble $t0, $s6, bd_j6_loop_increment  # !(current > last)
     4624 [0x80000938]	0x10200003  beq $1, $0, 12 [bd_j6_loop_increment-0x80000938]
     1638 [0x8000093c]	0x22b50001  addi $21, $21, 1                ; spimbot_pks3.s:959: add $s5, $s5, 1     # count += 1
     1638 [0x80000940]	0x0008b021  addu $22, $0, $8                ; spimbot_pks3.s:960: move    $s6, $t0        # last = current
     4624 [0x80000944]	0x22f7ffff  addi $23, $23, -1               ; spimbot_pks3.s:962: sub $s7, $s7, 1     # -- j
     4624 [0x80000948]	0x08000245  j 0x00000914 [bd_j6_loop_start] ; spimbot_pks3.s:963: j   bd_j6_loop_start
      578 [0x8000094c]	0x16b90005  bne $21, $25, 20 [bd_return_false-0x8000094c]; spimbot_pks3.s:965: bne $s5, $t9, bd_return_false   # if (count != bottom_constraint) return false
      578 [0x80000950]	0x22940001  addi $20, $20, 1                ; spimbot_pks3.s:967: add $s4, $s4, 1
      578 [0x80000954]	0x080001e8  j 0x000007a0 [bd_i2_loop_start] ; spimbot_pks3.s:968: j   bd_i2_loop_start
       22 [0x80000958]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:970: li  $v0, 1          # return true
       22 [0x8000095c]	0x08000259  j 0x00000964 [bd_return]        ; spimbot_pks3.s:971: j   bd_return
      168 [0x80000960]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:973: li  $v0, 0          # return false
      190 [0x80000964]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:975: lw  $ra, 0($sp)
      190 [0x80000968]	0x8fb00004  lw $16, 4($29)                  ; spimbot_pks3.s:976: lw  $s0, 4($sp)
      190 [0x8000096c]	0x8fb10008  lw $17, 8($29)                  ; spimbot_pks3.s:977: lw  $s1, 8($sp)
      190 [0x80000970]	0x8fb2000c  lw $18, 12($29)                 ; spimbot_pks3.s:978: lw  $s2, 12($sp)
      190 [0x80000974]	0x8fb30010  lw $19, 16($29)                 ; spimbot_pks3.s:979: lw  $s3, 
      190 [0x80000978]	0x8fb40014  lw $20, 20($29)                 ; spimbot_pks3.s:980: lw  $s4, 20($sp)
      190 [0x8000097c]	0x8fb50018  lw $21, 24($29)                 ; spimbot_pks3.s:981: lw  $s5, 24($sp)
      190 [0x80000980]	0x8fb6001c  lw $22, 28($29)                 ; spimbot_pks3.s:982: lw  $s6, 28($sp)
      190 [0x80000984]	0x8fb70020  lw $23, 32($29)                 ; spimbot_pks3.s:983: lw  $s7, 32($sp)
      190 [0x80000988]	0x23bd0024  addi $29, $29, 36               ; spimbot_pks3.s:984: add $sp, $sp, 36
      190 [0x8000098c]	0x03e00008  jr $31                          ; spimbot_pks3.s:985: jr $ra
    47384 [0x80000990]	0x10800009  beq $4, $0, 36 [has_single_bit_set_iszero-0x80000990]; spimbot_pks3.s:991: beq     $a0, $0, has_single_bit_set_iszero
    47384 [0x80000994]	0x2082ffff  addi $2, $4, -1                 ; spimbot_pks3.s:992: sub     $v0, $a0, 1             # $v0: b-1
    47384 [0x80000998]	0x00821024  and $2, $4, $2                  ; spimbot_pks3.s:993: and     $v0, $a0, $v0           # $v0: b & (b-1)
    47384 [0x8000099c]	0x00401027  nor $2, $2, $0                  ; spimbot_pks3.s:994: not     $v0, $v0                # $v0: !(b & (b-1))
    47384 [0x800009a0]	0x3c01ffff  lui $1, -1                      ; spimbot_pks3.s:996: bne     $v0, -1, has_single_bit_set_iszero
    47384 [0x800009a4]	0x3421ffff  ori $1, $1, -1
    47384 [0x800009a8]	0x14220003  bne $1, $2, 12 [has_single_bit_set_iszero-0x800009a8]
    45658 [0x800009ac]	0x34020001  ori $2, $0, 1                   ; spimbot_pks3.s:997: li      $v0, 1
    45658 [0x800009b0]	0x0800026e  j 0x000009b8 [has_single_bit_set_done]; spimbot_pks3.s:998: j       has_single_bit_set_done
     1726 [0x800009b4]	0x34020000  ori $2, $0, 0                   ; spimbot_pks3.s:1000: li      $v0, 0
    47384 [0x800009b8]	0x03e00008  jr $31                          ; spimbot_pks3.s:1002: jr      $ra
      188 [0x800009bc]	0x23bdfffc  addi $29, $29, -4               ; spimbot_pks3.s:1010: sub $sp, $sp, 4
      188 [0x800009c0]	0xafbf0000  sw $31, 0($29)                  ; spimbot_pks3.s:1011: sw  $ra, 0($sp) # save $ra on stack
      188 [0x800009c4]	0x34080008  ori $8, $0, 8                   ; spimbot_pks3.s:1013: li  $t0, GRIDSIZE
      188 [0x800009c8]	0x71084002  mul $8, $8, $8                  ; spimbot_pks3.s:1014: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
      188 [0x800009cc]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:1015: mul $a1, $t0, 2
      188 [0x800009d0]	0x71012802  mul $5, $8, $1
      188 [0x800009d4]	0x00852820  add $5, $4, $5                  ; spimbot_pks3.s:1016: add $a1, $a0, $a1               # new_board = old_board + GRIDSIZE*GRIDSIZE
      188 [0x800009d8]	0x0c00027b  jal 0x000009ec [copy_board]     ; spimbot_pks3.s:1018: jal copy_board
      188 [0x800009dc]	0x00021021  addu $2, $0, $2                 ; spimbot_pks3.s:1020: move $v0, $v0                   # // output the output of copy_board
      188 [0x800009e0]	0x8fbf0000  lw $31, 0($29)                  ; spimbot_pks3.s:1021: lw  $ra, 0($sp)
      188 [0x800009e4]	0x23bd0004  addi $29, $29, 4                ; spimbot_pks3.s:1022: add $sp, $sp, 4
      188 [0x800009e8]	0x03e00008  jr $31                          ; spimbot_pks3.s:1023: jr $ra
      232 [0x800009ec]	0x34080008  ori $8, $0, 8                   ; spimbot_pks3.s:1031: li  $t0, GRIDSIZE
      232 [0x800009f0]	0x71084002  mul $8, $8, $8                  ; spimbot_pks3.s:1032: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
      232 [0x800009f4]	0x34090000  ori $9, $0, 0                   ; spimbot_pks3.s:1033: li  $t1, 0                      # i = 0
    15080 [0x800009f8]	0x0128082a  slt $1, $9, $8                  ; spimbot_pks3.s:1035: bge $t1, $t0, ih_done           # i < GRIDSIZE*GRIDSIZE
    15080 [0x800009fc]	0x10200009  beq $1, $0, 36 [ih_done-0x800009fc]
    14848 [0x80000a00]	0x34010002  ori $1, $0, 2                   ; spimbot_pks3.s:1037: mul $t2, $t1, 2                 # i * sizeof(unsigned short)
    14848 [0x80000a04]	0x71215002  mul $10, $9, $1
    14848 [0x80000a08]	0x008a5820  add $11, $4, $10                ; spimbot_pks3.s:1038: add $t3, $a0, $t2               # &old_board[i]
    14848 [0x80000a0c]	0x956b0000  lhu $11, 0($11)                 ; spimbot_pks3.s:1039: lhu $t3, 0($t3)                 # old_board[i]
    14848 [0x80000a10]	0x00aa6020  add $12, $5, $10                ; spimbot_pks3.s:1041: add $t4, $a1, $t2               # &new_board[i]
    14848 [0x80000a14]	0xa58b0000  sh $11, 0($12)                  ; spimbot_pks3.s:1042: sh  $t3, 0($t4)                 # new_board[i] = old_board[i]
    14848 [0x80000a18]	0x21290001  addi $9, $9, 1                  ; spimbot_pks3.s:1044: addi $t1, $t1, 1                # i++
    14848 [0x80000a1c]	0x0800027e  j 0x000009f8 [ih_loop]          ; spimbot_pks3.s:1045: j    ih_loop
      232 [0x80000a20]	0x00051021  addu $2, $0, $5                 ; spimbot_pks3.s:1047: move $v0, $a1
      232 [0x80000a24]	0x03e00008  jr $31                          ; spimbot_pks3.s:1048: jr $ra
