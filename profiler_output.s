        1 [0x00400000]	0x8fa40000  lw $4, 0($29)                   ; exceptions.s:183: lw $a0 0($sp)		# argc
        1 [0x00400004]	0x27a50004  addiu $5, $29, 4                ; exceptions.s:184: addiu $a1 $sp 4		# argv
        1 [0x00400008]	0x24a60004  addiu $6, $5, 4                 ; exceptions.s:185: addiu $a2 $a1 4		# envp
        1 [0x0040000c]	0x00041080  sll $2, $4, 2                   ; exceptions.s:186: sll $v0 $a0 2
        1 [0x00400010]	0x00c23021  addu $6, $6, $2                 ; exceptions.s:187: addu $a2 $a2 $v0
        1 [0x00400014]	0x0c100009  jal 0x00400024 [main]           ; exceptions.s:188: jal main
        0 [0x00400018]	0x00000000  nop                             ; exceptions.s:189: nop
        0 [0x0040001c]	0x3402000a  ori $2, $0, 10                  ; exceptions.s:191: li $v0 10
        0 [0x00400020]	0x0000000c  syscall                         ; exceptions.s:192: syscall			# syscall 10 (exit)
        1 [0x00400024]	0x340c0000  ori $12, $0, 0                  ; j_spimbot.s:79: li      $t4, 0
        1 [0x00400028]	0x358c1000  ori $12, $12, 4096              ; j_spimbot.s:80: or      $t4, $t4, BONK_INT_MASK                     # request bonk
        1 [0x0040002c]	0x358c0800  ori $12, $12, 2048              ; j_spimbot.s:81: or      $t4, $t4, REQUEST_PUZZLE_INT_MASK           # puzzle interrupt bit
        1 [0x00400030]	0x358c8000  ori $12, $12, -32768            ; j_spimbot.s:82: or      $t4, $t4, TIMER_INT_MASK
        1 [0x00400034]	0x358c0001  ori $12, $12, 1                 ; j_spimbot.s:83: or      $t4, $t4, 1 # global enable
        1 [0x00400038]	0x408c6000  mtc0 $12, $12                   ; j_spimbot.s:84: mtc0    $t4, $12
        1 [0x0040003c]	0x34090001  ori $9, $0, 1                   ; j_spimbot.s:89: li      $t1, 1
        1 [0x00400040]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:90: sw      $t1, SWITCH_MODE($0)         #paint mode
        1 [0x00400044]	0xac2900f0  sw $9, 240($1)
        1 [0x00400048]	0x3409000a  ori $9, $0, 10                  ; j_spimbot.s:92: li      $t1, BOT_VELOCITY
        1 [0x0040004c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:93: sw      $t1, VELOCITY($0)
        1 [0x00400050]	0xac290010  sw $9, 16($1)
        1 [0x00400054]	0x340b0001  ori $11, $0, 1                  ; j_spimbot.s:97: li      $t3, 1
        1 [0x00400058]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:98: sw      $t3, completed_request($0)      #start with this set to 1. Meaning it is ready to request a new puzzle.
        1 [0x0040005c]	0xac2b2148  sw $11, 8520($1)
        1 [0x00400060]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:100: lw      $t1, GET_TIMER($0)              #gets cycle number  
        1 [0x00400064]	0x8c29001c  lw $9, 28($1)
        1 [0x00400068]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:101: sw      $t1, last_powerup_check($0)     #store current cycle number to this.
        1 [0x0040006c]	0xac29214c  sw $9, 8524($1)
        1 [0x00400070]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:102: sw      $t1, heading_timer($0)
        1 [0x00400074]	0xac29286c  sw $9, 10348($1)
        1 [0x00400078]	0x3c011001  lui $1, 4097 [powerup_map]      ; j_spimbot.s:104: la      $t3, powerup_map
        1 [0x0040007c]	0x342b2150  ori $11, $1, 8528 [powerup_map]
        1 [0x00400080]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:105: sw      $t3, GET_POWERUP_MAP($0)        #get initial powerup map
        1 [0x00400084]	0xac2b00e0  sw $11, 224($1)
        1 [0x00400088]	0x3c011001  lui $1, 4097 [arena_map]        ; j_spimbot.s:107: la      $a0, arena_map
        1 [0x0040008c]	0x34242164  ori $4, $1, 8548 [arena_map]
        1 [0x00400090]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:108: sw      $a0, GET_ARENA_MAP($0)
        1 [0x00400094]	0xac2400dc  sw $4, 220($1)
        1 [0x00400098]	0x3c01dead  lui $1, -8531                   ; j_spimbot.s:110: li      $s0, 0xDEADBEEF         #$s0 is a flag that says whether or not we have a valid target
        1 [0x0040009c]	0x3430beef  ori $16, $1, -16657
        1 [0x004000a0]	0x34110000  ori $17, $0, 0                  ; j_spimbot.s:111: li      $s1, 0                  #$s1 holds the color the tile we are currently on
        1 [0x004000a4]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:115: lw      $t0, BOT_X($0)          #determine if we are in the top left or bottom right
        1 [0x004000a8]	0x8c280020  lw $8, 32($1)
        1 [0x004000ac]	0x34010005  ori $1, $0, 5                   ; j_spimbot.s:116: bne     $t0, 5, we_are_the_bottom_right
        1 [0x004000b0]	0x14280005  bne $1, $8, 20 [we_are_the_bottom_right-0x004000b0]
        1 [0x004000b4]	0x34120001  ori $18, $0, 1                  ; j_spimbot.s:117: li      $s2, 1
        1 [0x004000b8]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:118: sw      $s2, my_bot_color($0)    
        1 [0x004000bc]	0xac322160  sw $18, 8544($1)
        1 [0x004000c0]	0x08100034  j 0x004000d0 [bot_loop]         ; j_spimbot.s:119: j       bot_loop
        0 [0x004000c4]	0x34120002  ori $18, $0, 2                  ; j_spimbot.s:121: li      $s2, 2
        0 [0x004000c8]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:122: sw      $s2, my_bot_color($0)
        0 [0x004000cc]	0xac322160  sw $18, 8544($1)
    23233 [0x004000d0]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:127: lw      $a0, BOT_X($0)              #This block just gets the current color we are standing on
    23229 [0x004000d4]	0x8c240020  lw $4, 32($1)
    23230 [0x004000d8]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:128: lw      $a1, BOT_Y($0)
    23233 [0x004000dc]	0x8c250024  lw $5, 36($1)
    23250 [0x004000e0]	0x0c100118  jal 0x00400460 [get_arena_map_index]; j_spimbot.s:129: jal     get_arena_map_index
    23240 [0x004000e4]	0x3051ff00  andi $17, $2, -256              ; j_spimbot.s:130: and     $s1, $v0, 0xFF00            #get the upper byte which is color
    23233 [0x004000e8]	0x16000026  bne $16, $0, 152 [has_no_target-0x004000e8]; j_spimbot.s:145: bne     $s0, $0, has_no_target     #if we don't have a valid target, check the paint supply
    23222 [0x004000ec]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:147: lw      $t1, GET_TIMER($0)      #get timer
    23238 [0x004000f0]	0x8c29001c  lw $9, 28($1)
    23233 [0x004000f4]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:148: lw      $t2, heading_timer($0)  #get time of last heading change
    23230 [0x004000f8]	0x8c2a286c  lw $10, 10348($1)
    23244 [0x004000fc]	0x214a2710  addi $10, $10, 10000            ; j_spimbot.s:149: add     $t2, $t2, HEADING_UPDATE_FREQ   #add the freq.
    23226 [0x00400100]	0x012a082a  slt $1, $9, $10                 ; j_spimbot.s:151: blt     $t1, $t2, dont_update_heading
    23228 [0x00400104]	0x14200006  bne $1, $0, 24 [dont_update_heading-0x00400104]
    23206 [0x00400108]	0x3c011001  lui $1, 4097 [target_pos]       ; j_spimbot.s:152: la      $t0, target_pos
    23225 [0x0040010c]	0x34282158  ori $8, $1, 8536 [target_pos]
    23221 [0x00400110]	0x8d040000  lw $4, 0($8)                    ; j_spimbot.s:153: lw      $a0, 0($t0)
    23214 [0x00400114]	0x8d050004  lw $5, 4($8)                    ; j_spimbot.s:154: lw      $a1, 4($t0) 
    23216 [0x00400118]	0x0c1000ff  jal 0x004003fc [path_to_target] ; j_spimbot.s:155: jal     path_to_target                  #pathing subroutine
    23223 [0x0040011c]	0x3c011001  lui $1, 4097 [target_pos]       ; j_spimbot.s:160: la      $t0, target_pos
    23222 [0x00400120]	0x34282158  ori $8, $1, 8536 [target_pos]
    23224 [0x00400124]	0x8d040000  lw $4, 0($8)                    ; j_spimbot.s:161: lw      $a0, 0($t0)
    23222 [0x00400128]	0x8d050004  lw $5, 4($8)                    ; j_spimbot.s:162: lw      $a1, 4($t0) 
    23224 [0x0040012c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:163: lw      $t0, BOT_X($0)              #This block just gets the current color we are standing on
    23229 [0x00400130]	0x8c280020  lw $8, 32($1)
    23230 [0x00400134]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:164: lw      $t1, BOT_Y($0)
    23220 [0x00400138]	0x8c290024  lw $9, 36($1)
    23239 [0x0040013c]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:165: div     $t0, $t0, 10
    23234 [0x00400140]	0x0101001a  div $8, $1
    23224 [0x00400144]	0x00004012  mflo $8
    23225 [0x00400148]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:166: div     $t1, $t1, 10
    23240 [0x0040014c]	0x0121001a  div $9, $1
    23232 [0x00400150]	0x00004812  mflo $9
    23232 [0x00400154]	0x01045026  xor $10, $8, $4                 ; j_spimbot.s:167: xor     $t2, $t0, $a0           #if these are equal, then $t2 is 0
    23223 [0x00400158]	0x01255826  xor $11, $9, $5                 ; j_spimbot.s:168: xor     $t3, $t1, $a1           #if these equal, xor is 0
    23241 [0x0040015c]	0x014b4025  or $8, $10, $11                 ; j_spimbot.s:169: or      $t0, $t2, $t3           #if either are non zero, set $t0 to non zero
    23232 [0x00400160]	0x15000007  bne $8, $0, 28 [not_yet_at_the_target-0x00400160]; j_spimbot.s:170: bnez    $t0, not_yet_at_the_target
       38 [0x00400164]	0x3c01dead  lui $1, -8531                   ; j_spimbot.s:171: li      $s0, 0xDEADBEEF
       38 [0x00400168]	0x3430beef  ori $16, $1, -16657
       38 [0x0040016c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:172: lw      $t1, GET_TIMER($0)      #get timer
       38 [0x00400170]	0x8c29001c  lw $9, 28($1)
       38 [0x00400174]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:173: sw      $0, PICKUP_POWERUP($0)
       38 [0x00400178]	0xac2000f4  sw $0, 244($1)
    23238 [0x0040017c]	0x08100063  j 0x0040018c [check_paint_supply]; j_spimbot.s:175: j       check_paint_supply
        5 [0x00400180]	0x3408000a  ori $8, $0, 10                  ; j_spimbot.s:177: li      $t0, 10
        5 [0x00400184]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:178: sw      $t0, VELOCITY($0)                        #set velocity to 0 since we have no paint left
        5 [0x00400188]	0xac280010  sw $8, 16($1)
    23239 [0x0040018c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:183: lw	$t1, GET_PAINT_BUCKETS($0)	    	#does what it says.
    23229 [0x00400190]	0x8c2900e4  lw $9, 228($1)
    23236 [0x00400194]	0x200a0000  addi $10, $0, 0                 ; j_spimbot.s:184: add	$t2, $0, 0			    	#load 0 into $t2	
    23235 [0x00400198]	0x0149082a  slt $1, $10, $9                 ; j_spimbot.s:185: bgt	$t1, $t2, we_got_enough_paint           	#if(paint > 0) branch if we have enough paint > 0
    23241 [0x0040019c]	0x14200010  bne $1, $0, 64 [we_got_enough_paint-0x0040019c]
      714 [0x004001a0]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:186: lw      $t3, completed_request($0)      	#check if the puzzle is completed
      714 [0x004001a4]	0x8c2b2148  lw $11, 8520($1)
      714 [0x004001a8]	0x34080001  ori $8, $0, 1                   ; j_spimbot.s:188: li      $t0, 1
      716 [0x004001ac]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:189: sw      $t0, SWITCH_MODE($0)
      714 [0x004001b0]	0xac2800f0  sw $8, 240($1)
      715 [0x004001b4]	0x12000003  beq $16, $0, 12 [have_target_dont_stop-0x004001b4]; j_spimbot.s:191: beq     $s0, $0, have_target_dont_stop          #when $s0 is 0, we have a target
       11 [0x004001b8]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:192: sw      $0, VELOCITY($0)                        #set velocity to 0 since we have no paint left
       11 [0x004001bc]	0xac200010  sw $0, 16($1)
      714 [0x004001c0]	0x1160000a  beq $11, $0, 40 [check_powerup_map-0x004001c0]; j_spimbot.s:195: beq	$t3, $0, check_powerup_map   		#branch if puzzle is not completed. So it does not request more puzzles
       66 [0x004001c4]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:196: sw      $0,  completed_request($0)       	#set request to incomplete
       66 [0x004001c8]	0xac202148  sw $0, 8520($1)
       66 [0x004001cc]	0x3c091001  lui $9, 4097 [puzzle]           ; j_spimbot.s:197: la	$t1, puzzle		                #load puzzle address into $t1
       66 [0x004001d0]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:198: sw	$t1, REQUEST_PUZZLE($0)		    	#request puzzle with this address
       66 [0x004001d4]	0xac2900d0  sw $9, 208($1)
       66 [0x004001d8]	0x0810007a  j 0x004001e8 [check_powerup_map]; j_spimbot.s:199: j       check_powerup_map
    22519 [0x004001dc]	0x3408000a  ori $8, $0, 10                  ; j_spimbot.s:202: li      $t0, BOT_VELOCITY
    22517 [0x004001e0]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:203: sw      $t0, VELOCITY($0)                        #set velocity to 0 since we have no paint left
    22515 [0x004001e4]	0xac280010  sw $8, 16($1)
    23235 [0x004001e8]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:208: lw  	$t1, GET_TIMER($0)              #gets current cycle number
    23239 [0x004001ec]	0x8c29001c  lw $9, 28($1)
    23239 [0x004001f0]	0x34080100  ori $8, $0, 256                 ; j_spimbot.s:209: li  	$t0, CHECK_POWERUP_MAP_FREQUENCY          #a constant for comparing. If the timer says its been more than CHECK_POWERUP_MAP cycles since last powermap update, then get a new powerup map
    23237 [0x004001f4]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:210: lw  	$t2, last_powerup_check($0)     #gets the cycle number of the last update
    23235 [0x004001f8]	0x8c2a214c  lw $10, 8524($1)
    23231 [0x004001fc]	0x010a4020  add $8, $8, $10                 ; j_spimbot.s:211: add 	$t0, $t0, $t2                   #add last_powerup_check to last cycle number of update.
    23229 [0x00400200]	0x0128082a  slt $1, $9, $8                  ; j_spimbot.s:213: blt 	$t1, $t0, check_inventory_for_powerup      #Compare the current cycle number to the (last_powerup_check+CHECK_POWERUP_MAP) and if cycle number is smaller, branch. Because we don't need to update the powerup map
    23240 [0x00400204]	0x14200017  bne $1, $0, 92 [check_inventory_for_powerup-0x00400204]
    21863 [0x00400208]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:215: sw  	$t1, last_powerup_check($0)     #stores the current cycle in it
    21851 [0x0040020c]	0xac29214c  sw $9, 8524($1)
    21865 [0x00400210]	0x3c011001  lui $1, 4097 [arena_map]        ; j_spimbot.s:217: la      $t0, arena_map                  #load the arena_map
    21859 [0x00400214]	0x34282164  ori $8, $1, 8548 [arena_map]
    21863 [0x00400218]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:218: sw      $t0, GET_ARENA_MAP($0)
    21857 [0x0040021c]	0xac2800dc  sw $8, 220($1)
    21857 [0x00400220]	0x3c011001  lui $1, 4097 [powerup_map]      ; j_spimbot.s:220: la  	$a0, powerup_map    
    21849 [0x00400224]	0x34242150  ori $4, $1, 8528 [powerup_map]
    21855 [0x00400228]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:221: sw  	$a0, GET_POWERUP_MAP($0)        #get initial powerup map
    21867 [0x0040022c]	0xac2400e0  sw $4, 224($1)
    21859 [0x00400230]	0x0c1000d4  jal 0x00400350 [get_closest_powerup]; j_spimbot.s:223: jal 	get_closest_powerup
    21842 [0x00400234]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:225: li  	$t0, -1 		        #if get_closest_powerup return -1 == x, then no powerup was found
    21844 [0x00400238]	0x3428ffff  ori $8, $1, -1
    21851 [0x0040023c]	0x11020007  beq $8, $2, 28 [set_target_null-0x0040023c]; j_spimbot.s:226: beq 	$t0, $v0, set_target_null    	#if no powerup is found, then skip this part 
    21852 [0x00400240]	0x3c011001  lui $1, 4097 [target_pos]       ; j_spimbot.s:228: la  	$t0, target_pos     
    21860 [0x00400244]	0x34282158  ori $8, $1, 8536 [target_pos]
    21852 [0x00400248]	0xad020000  sw $2, 0($8)                    ; j_spimbot.s:229: sw  	$v0, 0($t0)                     #set the current target as the closest powerup
    21852 [0x0040024c]	0xad030004  sw $3, 4($8)                    ; j_spimbot.s:230: sw	$v1, 4($t0)
    21855 [0x00400250]	0x00008020  add $16, $0, $0                 ; j_spimbot.s:231: add	$s0, $0, $0                     #signal that we have found a target
    21856 [0x00400254]	0x08100098  j 0x00400260 [check_inventory_for_powerup]; j_spimbot.s:232: j	check_inventory_for_powerup
        0 [0x00400258]	0x3c01dead  lui $1, -8531                   ; j_spimbot.s:234: li	$s0, 0xDEADBEEF		    	#signal that we have no target.
        0 [0x0040025c]	0x3430beef  ori $16, $1, -16657
    23234 [0x00400260]	0x3c011001  lui $1, 4097 [inventory]        ; j_spimbot.s:238: la      $t0, inventory
    23228 [0x00400264]	0x34282870  ori $8, $1, 10352 [inventory]
    23232 [0x00400268]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:239: sw      $t0, GET_INVENTORY($0)
    23235 [0x0040026c]	0xac2800e8  sw $8, 232($1)
    23229 [0x00400270]	0x91080008  lbu $8, 8($8)                   ; j_spimbot.s:240: lbu     $t0, 8($t0)
    23228 [0x00400274]	0x11000003  beq $8, $0, 12 [aint_got_no_powerup-0x00400274]; j_spimbot.s:241: beqz    $t0, aint_got_no_powerup
      113 [0x00400278]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:242: sw      $0, USE_POWERUP($0)
      113 [0x0040027c]	0xac2000ec  sw $0, 236($1)
    23226 [0x00400280]	0x08100034  j 0x004000d0 [bot_loop]         ; j_spimbot.s:246: j   	bot_loop
        0 [0x00400284]	0x03e00008  jr $31                          ; j_spimbot.s:249: jr      $ra
    65570 [0x00400288]	0x70842002  mul $4, $4, $4                  ; j_spimbot.s:272: mul	$a0, $a0, $a0	            # x^2
    65550 [0x0040028c]	0x70a52802  mul $5, $5, $5                  ; j_spimbot.s:273: mul	$a1, $a1, $a1	            # y^2
    65572 [0x00400290]	0x00851020  add $2, $4, $5                  ; j_spimbot.s:274: add	$v0, $a0, $a1	            # x^2 + y^2
    65553 [0x00400294]	0x44820000  mtc1 $2, $f0                    ; j_spimbot.s:275: mtc1	$v0, $f0
    65561 [0x00400298]	0x46800020  cvt.s.w $f0, $f0                ; j_spimbot.s:276: cvt.s.w	$f0, $f0	            # float(x^2 + y^2)
    65583 [0x0040029c]	0x46000004  sqrt.s $f0, $f0                 ; j_spimbot.s:277: sqrt.s	$f0, $f0	            # sqrt(x^2 + y^2)
    65555 [0x004002a0]	0x46000024  cvt.w.s $f0, $f0                ; j_spimbot.s:278: cvt.w.s	$f0, $f0	            # int(sqrt(...))
    65578 [0x004002a4]	0x44020000  mfc1 $2, $f0                    ; j_spimbot.s:279: mfc1	$v0, $f0
    65558 [0x004002a8]	0x03e00008  jr $31                          ; j_spimbot.s:280: jr	$ra
    23208 [0x004002ac]	0x34020000  ori $2, $0, 0                   ; j_spimbot.s:289: li	$v0, 0		# angle = 0;
    23215 [0x004002b0]	0x00044021  addu $8, $0, $4                 ; j_spimbot.s:290: abs	$t0, $a0	# get absolute values
    23216 [0x004002b4]	0x04810002  bgez $4 8
     6454 [0x004002b8]	0x00044022  sub $8, $0, $4
    23219 [0x004002bc]	0x00054821  addu $9, $0, $5                 ; j_spimbot.s:291: abs	$t1, $a1
    23206 [0x004002c0]	0x04a10002  bgez $5 8
     7675 [0x004002c4]	0x00054822  sub $9, $0, $5
    23217 [0x004002c8]	0x0109082a  slt $1, $8, $9                  ; j_spimbot.s:292: ble	$t1, $t0, no_TURN_90
    23212 [0x004002cc]	0x10200005  beq $1, $0, 20 [no_TURN_90-0x004002cc]
    15985 [0x004002d0]	0x00054021  addu $8, $0, $5                 ; j_spimbot.s:294: move	$t0, $a1	# int temp = y;
    15979 [0x004002d4]	0x00042822  sub $5, $0, $4                  ; j_spimbot.s:295: neg	$a1, $a0	# y = -x;
    15981 [0x004002d8]	0x00082021  addu $4, $0, $8                 ; j_spimbot.s:296: move	$a0, $t0	# x = temp;
    15975 [0x004002dc]	0x3402005a  ori $2, $0, 90                  ; j_spimbot.s:297: li	$v0, 90		# angle = 90;
    23215 [0x004002e0]	0x04810002  bgez $4 8 [pos_x-0x004002e0]    ; j_spimbot.s:299: bgez	$a0, pos_x 	# skip if (x >= 0)
     7638 [0x004002e4]	0x204200b4  addi $2, $2, 180                ; j_spimbot.s:301: add	$v0, $v0, 180	# angle += 180;
    23210 [0x004002e8]	0x44840000  mtc1 $4, $f0                    ; j_spimbot.s:303: mtc1	$a0, $f0
    23214 [0x004002ec]	0x44850800  mtc1 $5, $f1                    ; j_spimbot.s:304: mtc1	$a1, $f1
    23216 [0x004002f0]	0x46800020  cvt.s.w $f0, $f0                ; j_spimbot.s:305: cvt.s.w $f0, $f0	# convert from ints to floats
    23222 [0x004002f4]	0x46800860  cvt.s.w $f1, $f1                ; j_spimbot.s:306: cvt.s.w $f1, $f1
    23214 [0x004002f8]	0x46000803  div.s $f0, $f1, $f0             ; j_spimbot.s:307: div.s	$f0, $f1, $f0	# float v = (float) y / (float) x;
    23210 [0x004002fc]	0x46000042  mul.s $f1, $f0, $f0             ; j_spimbot.s:308: mul.s	$f1, $f0, $f0	# v^^2
    23222 [0x00400300]	0x46000882  mul.s $f2, $f1, $f0             ; j_spimbot.s:309: mul.s	$f2, $f1, $f0	# v^^3
    23210 [0x00400304]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:310: l.s	$f3, three	# load 3.0
    23214 [0x00400308]	0xc4232914  lwc1 $f3, 10516($1)
    23216 [0x0040030c]	0x460310c3  div.s $f3, $f2, $f3             ; j_spimbot.s:311: div.s 	$f3, $f2, $f3	# v^^3/3
    23206 [0x00400310]	0x46030181  sub.s $f6, $f0, $f3             ; j_spimbot.s:312: sub.s	$f6, $f0, $f3	# v - v^^3/3
    23218 [0x00400314]	0x46020902  mul.s $f4, $f1, $f2             ; j_spimbot.s:313: mul.s	$f4, $f1, $f2	# v^^5
    23224 [0x00400318]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:314: l.s	$f5, five	# load 5.0
    23214 [0x0040031c]	0xc4252918  lwc1 $f5, 10520($1)
    23208 [0x00400320]	0x46052143  div.s $f5, $f4, $f5             ; j_spimbot.s:315: div.s 	$f5, $f4, $f5	# v^^5/5
    23234 [0x00400324]	0x46053180  add.s $f6, $f6, $f5             ; j_spimbot.s:316: add.s	$f6, $f6, $f5	# value = v - v^^3/3 + v^^5/5
    23224 [0x00400328]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:317: l.s	$f8, PI		# load PI
    23210 [0x0040032c]	0xc428291c  lwc1 $f8, 10524($1)
    23206 [0x00400330]	0x46083183  div.s $f6, $f6, $f8             ; j_spimbot.s:318: div.s	$f6, $f6, $f8	# value / PI
    23212 [0x00400334]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:319: l.s	$f7, F180	# load 180.0
    23223 [0x00400338]	0xc4272920  lwc1 $f7, 10528($1)
    23214 [0x0040033c]	0x46073182  mul.s $f6, $f6, $f7             ; j_spimbot.s:320: mul.s	$f6, $f6, $f7	# 180.0 * value / PI
    23213 [0x00400340]	0x460031a4  cvt.w.s $f6, $f6                ; j_spimbot.s:322: cvt.w.s $f6, $f6	# convert "delta" back to integer
    23208 [0x00400344]	0x44083000  mfc1 $8, $f6                    ; j_spimbot.s:323: mfc1	$t0, $f6
    23208 [0x00400348]	0x00481020  add $2, $2, $8                  ; j_spimbot.s:324: add	$v0, $v0, $t0	# angle += delta
    23215 [0x0040034c]	0x03e00008  jr $31                          ; j_spimbot.s:325: jr 	$ra
    21849 [0x00400350]	0x23bdfffc  addi $29, $29, -4               ; j_spimbot.s:338: sub	$sp, $sp, 4
    21869 [0x00400354]	0xafbf0000  sw $31, 0($29)                  ; j_spimbot.s:339: sw	$ra, 0($sp)
    21853 [0x00400358]	0x8c890000  lw $9, 0($4)                    ; j_spimbot.s:341: lw	$t1, 0($a0)		#get the number of powerups
    21842 [0x0040035c]	0x208a0004  addi $10, $4, 4                 ; j_spimbot.s:342: add	$t2, $a0, 4		#load the pointer to the powerups array
    21838 [0x00400360]	0x340b0000  ori $11, $0, 0                  ; j_spimbot.s:344: li 	$t3, 0			#t3 is the index in the array.
    21850 [0x00400364]	0x3c0100ff  lui $1, 255                     ; j_spimbot.s:345: li	$t6, 0x00FFFFFF		#this is the distance to the closest powerup
    21855 [0x00400368]	0x342effff  ori $14, $1, -1
    21850 [0x0040036c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:347: lw      $t8, BOT_X($0)
    21859 [0x00400370]	0x8c380020  lw $24, 32($1)
    21851 [0x00400374]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:348: lw      $t9, BOT_Y($0)
    21864 [0x00400378]	0x8c390024  lw $25, 36($1)
    21854 [0x0040037c]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:349: div     $t8, $t8, 10
    21857 [0x00400380]	0x0301001a  div $24, $1
    21854 [0x00400384]	0x0000c012  mflo $24
    21848 [0x00400388]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:350: div     $t9, $t9, 10
    21842 [0x0040038c]	0x0321001a  div $25, $1
    21856 [0x00400390]	0x0000c812  mflo $25
    87421 [0x00400394]	0x0169082a  slt $1, $11, $9                 ; j_spimbot.s:354: bge     $t3, $t1, end_iterate_over_powerups
    87438 [0x00400398]	0x1020000d  beq $1, $0, 52 [end_iterate_over_powerups-0x00400398]
    65565 [0x0040039c]	0x954c0000  lhu $12, 0($10)                 ; j_spimbot.s:356: lhu	$t4, 0($t2)		#get x_pos (short) powerup_array[t3*12].x
    65559 [0x004003a0]	0x954d0002  lhu $13, 2($10)                 ; j_spimbot.s:357: lhu	$t5, 2($t2)		#get y_pos (short) powerup_array[t3*12].y
    65556 [0x004003a4]	0x01982022  sub $4, $12, $24                ; j_spimbot.s:359: sub	$a0, $t4, $t8
    65563 [0x004003a8]	0x01b92822  sub $5, $13, $25                ; j_spimbot.s:360: sub	$a1, $t5, $t9
    65571 [0x004003ac]	0x0c1000a2  jal 0x00400288 [euclidean_dist] ; j_spimbot.s:363: jal	euclidean_dist
    65551 [0x004003b0]	0x01c2082b  sltu $1, $14, $2                ; j_spimbot.s:365: bltu	$t6, $v0, dont_set_min_dist 	#if(t6 < v0) branch
    65560 [0x004003b4]	0x14200003  bne $1, $0, 12 [dont_set_min_dist-0x004003b4]
    45557 [0x004003b8]	0x00027021  addu $14, $0, $2                ; j_spimbot.s:366: move	$t6, $v0			#set the smallest distance.
    45562 [0x004003bc]	0x000a7821  addu $15, $0, $10               ; j_spimbot.s:367: move	$t7, $t2			#record the pointer of the powerup for later use.
    65556 [0x004003c0]	0x214a000c  addi $10, $10, 12               ; j_spimbot.s:370: add     $t2, $t2, 12		#increment the pointer by 12 bytes. Due to the size of ArenaPowerup struct
    65559 [0x004003c4]	0x216b0001  addi $11, $11, 1                ; j_spimbot.s:371: add	$t3, $t3, 1
    65569 [0x004003c8]	0x081000e5  j 0x00400394 [iterate_over_powerups]; j_spimbot.s:372: j	iterate_over_powerups
    21840 [0x004003cc]	0x3c0100ff  lui $1, 255                     ; j_spimbot.s:376: li      $t8, 0x00FFFFFF
    21862 [0x004003d0]	0x3438ffff  ori $24, $1, -1
    21846 [0x004003d4]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:377: li      $v0, -1
    21850 [0x004003d8]	0x3422ffff  ori $2, $1, -1
    21850 [0x004003dc]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:378: li      $v1, -1
    21856 [0x004003e0]	0x3423ffff  ori $3, $1, -1
    21844 [0x004003e4]	0x11d80003  beq $14, $24, 12 [got_no_powerups-0x004003e4]; j_spimbot.s:379: beq     $t6, $t8, got_no_powerups
    21844 [0x004003e8]	0x85e20000  lh $2, 0($15)                   ; j_spimbot.s:380: lh	$v0, 0($t7)		#get x_pos (short) powerup_array[min].x
    21846 [0x004003ec]	0x85e30002  lh $3, 2($15)                   ; j_spimbot.s:381: lh	$v1, 2($t7)		#get y_pos (short) powerup_array[min].y
    21862 [0x004003f0]	0x8fbf0000  lw $31, 0($29)                  ; j_spimbot.s:383: lw	$ra, 0($sp)
    21853 [0x004003f4]	0x23bd0004  addi $29, $29, 4                ; j_spimbot.s:384: add	$sp, $sp, 4
    21850 [0x004003f8]	0x03e00008  jr $31                          ; j_spimbot.s:385: jr	$ra
    23208 [0x004003fc]	0x23bdfffc  addi $29, $29, -4               ; j_spimbot.s:398: sub     $sp, $sp, 4
    23216 [0x00400400]	0xafbf0000  sw $31, 0($29)                  ; j_spimbot.s:399: sw      $ra, 0($sp)
    23214 [0x00400404]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:401: lw      $t0, BOT_X($0)  #pix_x
    23218 [0x00400408]	0x8c280020  lw $8, 32($1)
    23214 [0x0040040c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:402: lw      $t1, BOT_Y($0)  #pix_y
    23228 [0x00400410]	0x8c290024  lw $9, 36($1)
    23220 [0x00400414]	0x00086021  addu $12, $0, $8                ; j_spimbot.s:404: move    $t4, $t0
    23208 [0x00400418]	0x00096821  addu $13, $0, $9                ; j_spimbot.s:405: move    $t5, $t1
    23208 [0x0040041c]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:407: mul     $t2, $a0, 10    #(x*10)
    23212 [0x00400420]	0x70815002  mul $10, $4, $1
    23222 [0x00400424]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:408: mul     $t3, $a1, 10    #(y*10)
    23214 [0x00400428]	0x70a15802  mul $11, $5, $1
    23220 [0x0040042c]	0x214a0005  addi $10, $10, 5                ; j_spimbot.s:409: add     $t2, $t2, 5     #x = (x*10) + 5
    23213 [0x00400430]	0x216b0005  addi $11, $11, 5                ; j_spimbot.s:410: add     $t3, $t3, 5     #y = (y*10) + 5
    23214 [0x00400434]	0x01482022  sub $4, $10, $8                 ; j_spimbot.s:413: sub     $a0, $t2, $t0   #dx
    23204 [0x00400438]	0x01692822  sub $5, $11, $9                 ; j_spimbot.s:414: sub     $a1, $t3, $t1   #dy
    23209 [0x0040043c]	0x0c1000ab  jal 0x004002ac [sb_arctan]      ; j_spimbot.s:416: jal     sb_arctan        
    23234 [0x00400440]	0x34080001  ori $8, $0, 1                   ; j_spimbot.s:432: li	$t0, 1          #set angle control to absolute
    23204 [0x00400444]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:433: sw	$t0, ANGLE_CONTROL($0)
    23228 [0x00400448]	0xac280018  sw $8, 24($1)
    36659 [0x0040044c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:434: sw	$v0, ANGLE($0)
    23277 [0x00400450]	0xac220014  sw $2, 20($1)
    23234 [0x00400454]	0x8fbf0000  lw $31, 0($29)                  ; j_spimbot.s:436: lw      $ra, 0($sp)
    23235 [0x00400458]	0x23bd0004  addi $29, $29, 4                ; j_spimbot.s:437: add     $sp, $sp, 4
    23221 [0x0040045c]	0x03e00008  jr $31                          ; j_spimbot.s:438: jr      $ra
    23241 [0x00400460]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:444: div     $t2, $a0, 10
    23231 [0x00400464]	0x0081001a  div $4, $1
    23234 [0x00400468]	0x00005012  mflo $10
    23239 [0x0040046c]	0x3401000a  ori $1, $0, 10                  ; j_spimbot.s:445: div     $t3, $a1, 10
    23237 [0x00400470]	0x00a1001a  div $5, $1
    23227 [0x00400474]	0x00005812  mflo $11
    23251 [0x00400478]	0x3c011001  lui $1, 4097 [arena_map]        ; j_spimbot.s:446: la      $t0, arena_map
    23247 [0x0040047c]	0x34282164  ori $8, $1, 8548 [arena_map]
    23249 [0x00400480]	0x3401001e  ori $1, $0, 30                  ; j_spimbot.s:447: mul     $t1, $t2, 30            #30*a0
    23227 [0x00400484]	0x71414802  mul $9, $10, $1
    23241 [0x00400488]	0x012b4820  add $9, $9, $11                 ; j_spimbot.s:448: add     $t1, $t1, $t3           #30*a0 + a1
    23235 [0x0040048c]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:449: mul     $t1, $t1, 2             #2*((30*a0) + a1)
    23243 [0x00400490]	0x71214802  mul $9, $9, $1
    23231 [0x00400494]	0x01284820  add $9, $9, $8                  ; j_spimbot.s:450: add     $t1, $t1, $t0           #(&arena_map) + 2*((30*a0) + a1)
    23221 [0x00400498]	0x85220000  lh $2, 0($9)                    ; j_spimbot.s:452: lh      $v0, 0($t1)
    23241 [0x0040049c]	0x03e00008  jr $31                          ; j_spimbot.s:453: jr      $ra


kernel text segment

    18524 [0x80000180]	0x0001d821  addu $27, $0, $1                ; j_spimbot.s:466: move    $k1, $at        # Save $at
    18524 [0x80000184]	0x3c019000  lui $1, -28672 [chunkIH]        ; j_spimbot.s:468: la      $k0, chunkIH
    18524 [0x80000188]	0x343a0208  ori $26, $1, 520 [chunkIH]
    18524 [0x8000018c]	0xaf440000  sw $4, 0($26)                   ; j_spimbot.s:469: sw      $a0, 0($k0)        # Restore saved registers
    18524 [0x80000190]	0xaf450004  sw $5, 4($26)                   ; j_spimbot.s:470: sw      $a1, 4($k0)        # Restore saved registers
    18524 [0x80000194]	0xaf460008  sw $6, 8($26)                   ; j_spimbot.s:471: sw      $a2, 8($k0)        # Restore saved registers
    18524 [0x80000198]	0xaf47000c  sw $7, 12($26)                  ; j_spimbot.s:472: sw      $a3, 12($k0)       # Restore saved registers
    18524 [0x8000019c]	0xaf420010  sw $2, 16($26)                  ; j_spimbot.s:473: sw      $v0, 16($k0)
    18524 [0x800001a0]	0xaf480014  sw $8, 20($26)                  ; j_spimbot.s:474: sw      $t0, 20($k0)
    18524 [0x800001a4]	0xaf490018  sw $9, 24($26)                  ; j_spimbot.s:475: sw      $t1, 24($k0)
    18524 [0x800001a8]	0xaf4a001c  sw $10, 28($26)                 ; j_spimbot.s:476: sw      $t2, 28($k0)
    18524 [0x800001ac]	0xaf4b0020  sw $11, 32($26)                 ; j_spimbot.s:477: sw      $t3, 32($k0)
    18524 [0x800001b0]	0xaf4c0024  sw $12, 36($26)                 ; j_spimbot.s:478: sw      $t4, 36($k0)
    18524 [0x800001b4]	0xaf4d0028  sw $13, 40($26)                 ; j_spimbot.s:479: sw      $t5, 40($k0)
    18524 [0x800001b8]	0xaf4e002c  sw $14, 44($26)                 ; j_spimbot.s:480: sw      $t6, 44($k0)
    18524 [0x800001bc]	0xaf4f0030  sw $15, 48($26)                 ; j_spimbot.s:481: sw      $t7, 48($k0)
    18524 [0x800001c0]	0xaf580034  sw $24, 52($26)                 ; j_spimbot.s:482: sw      $t8, 52($k0)
    18524 [0x800001c4]	0xaf590038  sw $25, 56($26)                 ; j_spimbot.s:483: sw      $t9, 56($k0)        
    18524 [0x800001c8]	0xaf5f003c  sw $31, 60($26)                 ; j_spimbot.s:484: sw      $ra, 60($k0)
    18524 [0x800001cc]	0x401a6800  mfc0 $26, $13                   ; j_spimbot.s:486: mfc0    $k0, $13             # Get Cause register
    18524 [0x800001d0]	0x001a2082  srl $4, $26, 2                  ; j_spimbot.s:487: srl     $a0, $k0, 2
    18524 [0x800001d4]	0x3084000f  andi $4, $4, 15                 ; j_spimbot.s:488: and     $a0, $a0, 0xf        # ExcCode field
    18524 [0x800001d8]	0x14040056  bne $0, $4, 344 [non_intrpt-0x800001d8]; j_spimbot.s:489: bne     $a0, 0, non_intrpt
    37049 [0x800001dc]	0x401a6800  mfc0 $26, $13                   ; j_spimbot.s:494: mfc0    $k0, $13        # Get Cause register, again
    37049 [0x800001e0]	0x101a0058  beq $0, $26, 352 [done-0x800001e0]; j_spimbot.s:495: beq     $k0, 0, done        # handled all outstanding interrupts
    18526 [0x800001e4]	0x33441000  andi $4, $26, 4096              ; j_spimbot.s:497: and     $a0, $k0, BONK_INT_MASK    # is there a bonk interrupt?
    18526 [0x800001e8]	0x1404000a  bne $0, $4, 40 [bonk_interrupt-0x800001e8]; j_spimbot.s:498: bne     $a0, 0, bonk_interrupt
       66 [0x800001ec]	0x33448000  andi $4, $26, -32768            ; j_spimbot.s:500: and     $a0, $k0, TIMER_INT_MASK    # is there a timer interrupt?
       66 [0x800001f0]	0x1404004d  bne $0, $4, 308 [timer_interrupt-0x800001f0]; j_spimbot.s:501: bne     $a0, 0, timer_interrupt
       66 [0x800001f4]	0x33440800  andi $4, $26, 2048              ; j_spimbot.s:503: and     $a0, $k0, REQUEST_PUZZLE_INT_MASK
       66 [0x800001f8]	0x14040037  bne $0, $4, 220 [request_puzzle_interrupt-0x800001f8]; j_spimbot.s:504: bne     $a0, 0, request_puzzle_interrupt
        0 [0x800001fc]	0x34020004  ori $2, $0, 4                   ; j_spimbot.s:506: li      $v0, PRINT_STRING    # Unhandled interrupt types
        0 [0x80000200]	0x3c019000  lui $1, -28672 [unhandled_str]  ; j_spimbot.s:507: la      $a0, unhandled_str
        0 [0x80000204]	0x34240261  ori $4, $1, 609 [unhandled_str]
        0 [0x80000208]	0x0000000c  syscall                         ; j_spimbot.s:508: syscall
        0 [0x8000020c]	0x080000d0  j 0x00000340 [done]             ; j_spimbot.s:509: j    done
    18460 [0x80000210]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:512: sw 	$0, BONK_ACK
    18460 [0x80000214]	0xac200060  sw $0, 96($1)
    18460 [0x80000218]	0x20080001  addi $8, $0, 1                  ; j_spimbot.s:514: add     $t0, $0, 1
    18460 [0x8000021c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:515: sw      $t0, SWITCH_MODE($0)         #paint mode
    18460 [0x80000220]	0xac2800f0  sw $8, 240($1)
    18460 [0x80000224]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:517: lw      $t0, ANGLE($0)
    18460 [0x80000228]	0x8c280014  lw $8, 20($1)
    18460 [0x8000022c]	0x2901002e  slti $1, $8, 46                 ; j_spimbot.s:519: bgt     $t0, 45, check_if_less_than_135
    18460 [0x80000230]	0x10200003  beq $1, $0, 12 [check_if_less_than_135-0x80000230]
     2812 [0x80000234]	0x34080000  ori $8, $0, 0                   ; j_spimbot.s:521: li      $t0, 0  #round $t0 to 0 degrees
     2812 [0x80000238]	0x0800009f  j 0x0000027c [end_rounding_switch]; j_spimbot.s:522: j       end_rounding_switch
    15648 [0x8000023c]	0x29010088  slti $1, $8, 136                ; j_spimbot.s:524: bgt     $t0, 135, check_if_less_than_225
    15648 [0x80000240]	0x10200003  beq $1, $0, 12 [check_if_less_than_225-0x80000240]
     8235 [0x80000244]	0x3408005a  ori $8, $0, 90                  ; j_spimbot.s:526: li      $t0, 90  #round $t0 to 90 degrees
     8235 [0x80000248]	0x0800009f  j 0x0000027c [end_rounding_switch]; j_spimbot.s:527: j       end_rounding_switch
     7413 [0x8000024c]	0x290100e2  slti $1, $8, 226                ; j_spimbot.s:529: bgt     $t0, 225, check_if_less_than_315
     7413 [0x80000250]	0x10200003  beq $1, $0, 12 [check_if_less_than_315-0x80000250]
     4328 [0x80000254]	0x340800b4  ori $8, $0, 180                 ; j_spimbot.s:531: li      $t0, 180  #round $t0
     4328 [0x80000258]	0x0800009f  j 0x0000027c [end_rounding_switch]; j_spimbot.s:532: j       end_rounding_switch
     3085 [0x8000025c]	0x2901013c  slti $1, $8, 316                ; j_spimbot.s:534: bgt     $t0, 315, check_if_less_than_405
     3085 [0x80000260]	0x10200003  beq $1, $0, 12 [check_if_less_than_405-0x80000260]
     2131 [0x80000264]	0x3408010e  ori $8, $0, 270                 ; j_spimbot.s:536: li      $t0, 270  #round $t0
     2131 [0x80000268]	0x0800009f  j 0x0000027c [end_rounding_switch]; j_spimbot.s:537: j       end_rounding_switch
      954 [0x8000026c]	0x29010196  slti $1, $8, 406                ; j_spimbot.s:539: bgt     $t0, 405, end_rounding_switch
      954 [0x80000270]	0x10200003  beq $1, $0, 12 [end_rounding_switch-0x80000270]
      954 [0x80000274]	0x34080000  ori $8, $0, 0                   ; j_spimbot.s:541: li      $t0, 0  #round $t0
      954 [0x80000278]	0x0800009f  j 0x0000027c [end_rounding_switch]; j_spimbot.s:542: j       end_rounding_switch
    18460 [0x8000027c]	0x340a005a  ori $10, $0, 90                 ; j_spimbot.s:545: li      $t2, 90
    18460 [0x80000280]	0x3c019000  lui $1, -28672                  ; j_spimbot.s:547: lw      $t1, bonk_counter($0)
    18460 [0x80000284]	0x8c29027c  lw $9, 636($1)
    18460 [0x80000288]	0x29210300  slti $1, $9, 768                ; j_spimbot.s:548: blt     $t1, DIRECTION_SWITCH_FREQ, turn_right_on_bonk
    18460 [0x8000028c]	0x14200002  bne $1, $0, 8 [turn_right_on_bonk-0x8000028c]
     9216 [0x80000290]	0x000a5022  sub $10, $0, $10                ; j_spimbot.s:549: neg     $t2, $t2
    18460 [0x80000294]	0x21290001  addi $9, $9, 1                  ; j_spimbot.s:551: add     $t1, $t1, 1
    18460 [0x80000298]	0x29210600  slti $1, $9, 1536               ; j_spimbot.s:552: blt     $t1, DIRECTION_SWITCH_RESET, dont_reset_bonk_counter
    18460 [0x8000029c]	0x14200002  bne $1, $0, 8 [dont_reset_bonk_counter-0x8000029c]
       12 [0x800002a0]	0x00004821  addu $9, $0, $0                 ; j_spimbot.s:553: move    $t1, $0
    18460 [0x800002a4]	0x01485020  add $10, $10, $8                ; j_spimbot.s:556: add     $t2, $t2, $t0
    18460 [0x800002a8]	0x340b0001  ori $11, $0, 1                  ; j_spimbot.s:557: li	$t3, 1
    18460 [0x800002ac]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:558: sw	$t3, ANGLE_CONTROL($0)
    18460 [0x800002b0]	0xac2b0018  sw $11, 24($1)
    18460 [0x800002b4]	0x3c019000  lui $1, -28672                  ; j_spimbot.s:559: sw      $t1, bonk_counter($0) #increment counter
    18460 [0x800002b8]	0xac29027c  sw $9, 636($1)
    18460 [0x800002bc]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:560: sw	$t2, ANGLE($0)
    18460 [0x800002c0]	0xac2a0014  sw $10, 20($1)
    18460 [0x800002c4]	0x3408000a  ori $8, $0, 10                  ; j_spimbot.s:562: li	$t0, BOT_VELOCITY
    18460 [0x800002c8]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:563: sw	$t0, VELOCITY($0)
    18460 [0x800002cc]	0xac280010  sw $8, 16($1)
    18460 [0x800002d0]	0x08000077  j 0x000001dc [interrupt_dispatch]; j_spimbot.s:565: j       interrupt_dispatch    # see if other interrupts are waiting
       66 [0x800002d4]	0x3c010001  lui $1, 1                       ; j_spimbot.s:568: li	$t0, 69420
       66 [0x800002d8]	0x34280f2c  ori $8, $1, 3884
       66 [0x800002dc]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:569: sw 	$t0, REQUEST_PUZZLE_ACK($0)
       66 [0x800002e0]	0xac2800d8  sw $8, 216($1)
       66 [0x800002e4]	0x3c041001  lui $4, 4097 [puzzle]           ; j_spimbot.s:573: la 	$a0, puzzle
       66 [0x800002e8]	0x3c011001  lui $1, 4097 [heap]             ; j_spimbot.s:574: la	$a1, heap
       66 [0x800002ec]	0x34250148  ori $5, $1, 328 [heap]
       66 [0x800002f0]	0x0c000289  jal 0x00000a24 [copy_board]     ; j_spimbot.s:575: jal 	copy_board
       66 [0x800002f4]	0x3c011001  lui $1, 4097 [heap]             ; j_spimbot.s:577: la	$a0, heap
       66 [0x800002f8]	0x34240148  ori $4, $1, 328 [heap]
       66 [0x800002fc]	0x34050000  ori $5, $0, 0                   ; j_spimbot.s:578: li	$a1, 0				#dimensions are 8 by 8
       66 [0x80000300]	0x34060000  ori $6, $0, 0                   ; j_spimbot.s:579: li	$a2, 0
       66 [0x80000304]	0x3c071001  lui $7, 4097 [puzzle]           ; j_spimbot.s:580: la	$a3, puzzle
       66 [0x80000308]	0x0c0000e4  jal 0x00000390 [solve_puzzle]   ; j_spimbot.s:581: jal 	solve_puzzle 
       65 [0x8000030c]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:582: sw	$a3, SUBMIT_SOLUTION($0)	#submit puzzle
       65 [0x80000310]	0xac2700d4  sw $7, 212($1)
       65 [0x80000314]	0x340b0001  ori $11, $0, 1                  ; j_spimbot.s:584: li      $t3, 1
       65 [0x80000318]	0x3c011001  lui $1, 4097                    ; j_spimbot.s:585: sw      $t3, completed_request($0)      #set the puzzle to completed
       65 [0x8000031c]	0xac2b2148  sw $11, 8520($1)
       65 [0x80000320]	0x08000077  j 0x000001dc [interrupt_dispatch]; j_spimbot.s:586: j	interrupt_dispatch
        0 [0x80000324]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:589: sw      $0, TIMER_ACK
        0 [0x80000328]	0xac20006c  sw $0, 108($1)
        0 [0x8000032c]	0x08000077  j 0x000001dc [interrupt_dispatch]; j_spimbot.s:591: j        interrupt_dispatch    # see if other interrupts are waiting
        0 [0x80000330]	0x34020004  ori $2, $0, 4                   ; j_spimbot.s:594: li      $v0, PRINT_STRING
        0 [0x80000334]	0x3c019000  lui $1, -28672 [non_intrpt_str] ; j_spimbot.s:595: la      $a0, non_intrpt_str
        0 [0x80000338]	0x34240248  ori $4, $1, 584 [non_intrpt_str]
        0 [0x8000033c]	0x0000000c  syscall                         ; j_spimbot.s:596: syscall                # print out an error message
    18523 [0x80000340]	0x3c019000  lui $1, -28672 [chunkIH]        ; j_spimbot.s:600: la      $k0, chunkIH
    18523 [0x80000344]	0x343a0208  ori $26, $1, 520 [chunkIH]
    18523 [0x80000348]	0x8f440000  lw $4, 0($26)                   ; j_spimbot.s:601: lw      $a0, 0($k0)        # Restore saved registers
    18523 [0x8000034c]	0x8f450004  lw $5, 4($26)                   ; j_spimbot.s:602: lw      $a1, 4($k0)        # Restore saved registers
    18523 [0x80000350]	0x8f460008  lw $6, 8($26)                   ; j_spimbot.s:603: lw      $a2, 8($k0)        # Restore saved registers
    18523 [0x80000354]	0x8f47000c  lw $7, 12($26)                  ; j_spimbot.s:604: lw      $a3, 12($k0)        # Restore saved registers
    18523 [0x80000358]	0x8f420010  lw $2, 16($26)                  ; j_spimbot.s:605: lw      $v0, 16($k0)
    18523 [0x8000035c]	0x8f480014  lw $8, 20($26)                  ; j_spimbot.s:606: lw      $t0, 20($k0)
    18523 [0x80000360]	0x8f490018  lw $9, 24($26)                  ; j_spimbot.s:607: lw      $t1, 24($k0)
    18523 [0x80000364]	0x8f4a001c  lw $10, 28($26)                 ; j_spimbot.s:608: lw      $t2, 28($k0)
    18523 [0x80000368]	0x8f4b0020  lw $11, 32($26)                 ; j_spimbot.s:609: lw      $t3, 32($k0)
    18523 [0x8000036c]	0x8f4c0024  lw $12, 36($26)                 ; j_spimbot.s:610: lw      $t4, 36($k0)
    18523 [0x80000370]	0x8f4d0028  lw $13, 40($26)                 ; j_spimbot.s:611: lw      $t5, 40($k0)
    18523 [0x80000374]	0x8f4e002c  lw $14, 44($26)                 ; j_spimbot.s:612: lw      $t6, 44($k0)
    18523 [0x80000378]	0x8f4f0030  lw $15, 48($26)                 ; j_spimbot.s:613: lw      $t7, 48($k0)
    18523 [0x8000037c]	0x8f580034  lw $24, 52($26)                 ; j_spimbot.s:614: lw      $t8, 52($k0)
    18523 [0x80000380]	0x8f590038  lw $25, 56($26)                 ; j_spimbot.s:615: lw      $t9, 56($k0)
    18523 [0x80000384]	0x8f5f003c  lw $31, 60($26)                 ; j_spimbot.s:616: lw      $ra, 60($k0)
    18523 [0x80000388]	0x001b0821  addu $1, $0, $27                ; j_spimbot.s:618: move    $at, $k1        # Restore $at
    18523 [0x8000038c]	0x42000018  eret                            ; j_spimbot.s:620: eret
       66 [0x80000390]	0x23bdffdc  addi $29, $29, -36              ; j_spimbot.s:626: sub     $sp, $sp, 36
       66 [0x80000394]	0xafbf0000  sw $31, 0($29)                  ; j_spimbot.s:627: sw      $ra, 0($sp)
       66 [0x80000398]	0xafb00004  sw $16, 4($29)                  ; j_spimbot.s:628: sw      $s0, 4($sp)
       66 [0x8000039c]	0xafb10008  sw $17, 8($29)                  ; j_spimbot.s:629: sw      $s1, 8($sp)
       66 [0x800003a0]	0xafb2000c  sw $18, 12($29)                 ; j_spimbot.s:630: sw      $s2, 12($sp)
       66 [0x800003a4]	0xafb30010  sw $19, 16($29)                 ; j_spimbot.s:631: sw      $s3, 16($sp)
       66 [0x800003a8]	0xafb40014  sw $20, 20($29)                 ; j_spimbot.s:632: sw      $s4, 20($sp)
       66 [0x800003ac]	0xafb50018  sw $21, 24($29)                 ; j_spimbot.s:633: sw      $s5, 24($sp)
       66 [0x800003b0]	0xafb6001c  sw $22, 28($29)                 ; j_spimbot.s:634: sw      $s6, 28($sp)
       66 [0x800003b4]	0xafb70020  sw $23, 32($29)                 ; j_spimbot.s:635: sw      $s7, 32($sp)
       66 [0x800003b8]	0x34170008  ori $23, $0, 8                  ; j_spimbot.s:636: li   $s7, GRIDSIZE
       66 [0x800003bc]	0x00058021  addu $16, $0, $5                ; j_spimbot.s:637: move $s0, $a1     # row
       66 [0x800003c0]	0x00068821  addu $17, $0, $6                ; j_spimbot.s:638: move $s1, $a2     # col
       66 [0x800003c4]	0x00049021  addu $18, $0, $4                ; j_spimbot.s:640: move $s2, $a0     # current_board
       66 [0x800003c8]	0x00079821  addu $19, $0, $7                ; j_spimbot.s:641: move $s3, $a3     # puzzle
       66 [0x800003cc]	0x0217082a  slt $1, $16, $23                ; j_spimbot.s:643: bge  $s0, $s7, solve_done_check  # row >= GRIDSIZE
       66 [0x800003d0]	0x10200004  beq $1, $0, 16 [solve_done_check-0x800003d0]
       66 [0x800003d4]	0x0237082a  slt $1, $17, $23                ; j_spimbot.s:644: bge  $s1, $s7, solve_done_check  # col >= GRIDSIZE
       66 [0x800003d8]	0x10200002  beq $1, $0, 8 [solve_done_check-0x800003d8]
       66 [0x800003dc]	0x08000102  j 0x00000408 [solve_not_done]   ; j_spimbot.s:645: j solve_not_done
        0 [0x800003e0]	0x00122021  addu $4, $0, $18                ; j_spimbot.s:647: move $a0, $s2     # current_board
        0 [0x800003e4]	0x00132821  addu $5, $0, $19                ; j_spimbot.s:648: move $a1, $s3     # puzzle
        0 [0x800003e8]	0x0c0001be  jal 0x000006f8 [board_done]     ; j_spimbot.s:649: jal board_done
        0 [0x800003ec]	0x10400000  beq $2, $0, 0 [solve_done_false-0x800003ec]; j_spimbot.s:651: beq $v0, $0, solve_done_false  # if (done)
        0 [0x800003f0]	0x0002b821  addu $23, $0, $2                ; j_spimbot.s:652: move $s7, $v0     # save done
        0 [0x800003f4]	0x00122021  addu $4, $0, $18                ; j_spimbot.s:653: move $a0, $s2     # current_board
        0 [0x800003f8]	0x00132821  addu $5, $0, $19                ; j_spimbot.s:654: move $a1, $s3     # puzzle // same as puzzle->board
        0 [0x800003fc]	0x0c000289  jal 0x00000a24 [copy_board]     ; j_spimbot.s:655: jal copy_board
        0 [0x80000400]	0x00171021  addu $2, $0, $23                ; j_spimbot.s:657: move $v0, $s7     # $v0: done
        0 [0x80000404]	0x08000115  j 0x00000454 [solve_done]       ; j_spimbot.s:659: j solve_done
       66 [0x80000408]	0x00122021  addu $4, $0, $18                ; j_spimbot.s:663: move $a0, $s2 # current_board
       66 [0x8000040c]	0x0c00027d  jal 0x000009f4 [increment_heap] ; j_spimbot.s:664: jal increment_heap
       66 [0x80000410]	0x00029021  addu $18, $0, $2                ; j_spimbot.s:665: move $s2, $v0 # update current_board
       66 [0x80000414]	0x34020000  ori $2, $0, 0                   ; j_spimbot.s:667: li  $v0, 0 # changed = false
      237 [0x80000418]	0x00122021  addu $4, $0, $18                ; j_spimbot.s:670: move $a0, $s2
      237 [0x8000041c]	0x0c000122  jal 0x00000488 [rule1]          ; j_spimbot.s:673: jal rule1          # changed = rule1(current_board);
      236 [0x80000420]	0x0002b021  addu $22, $0, $2                ; j_spimbot.s:674: move $s6, $v0      # done
      236 [0x80000424]	0x00122021  addu $4, $0, $18                ; j_spimbot.s:676: move $a0, $s2      # current_board
      236 [0x80000428]	0x1440fffc  bne $2, $0, -16 [solve_start_do-0x80000428]; j_spimbot.s:682: bne $v0, $0, solve_start_do # while (changed)
       65 [0x8000042c]	0x00122021  addu $4, $0, $18                ; j_spimbot.s:684: move $a0, $s2     # current_board
       65 [0x80000430]	0x00132821  addu $5, $0, $19                ; j_spimbot.s:685: move $a1, $s3     # puzzle
       65 [0x80000434]	0x0c0001be  jal 0x000006f8 [board_done]     ; j_spimbot.s:686: jal board_done
       65 [0x80000438]	0x0002b821  addu $23, $0, $2                ; j_spimbot.s:688: move $s7, $v0     # save done
       65 [0x8000043c]	0x00122021  addu $4, $0, $18                ; j_spimbot.s:689: move $a0, $s2     # current_board
       65 [0x80000440]	0x00132821  addu $5, $0, $19                ; j_spimbot.s:690: move $a1, $s3     # puzzle // same as puzzle->board
       65 [0x80000444]	0x0c000289  jal 0x00000a24 [copy_board]     ; j_spimbot.s:691: jal copy_board
       65 [0x80000448]	0x00171021  addu $2, $0, $23                ; j_spimbot.s:693: move $v0, $s7     # $v0: done
       65 [0x8000044c]	0x08000115  j 0x00000454 [solve_done]       ; j_spimbot.s:694: j   solve_done
        0 [0x80000450]	0x34020000  ori $2, $0, 0                   ; j_spimbot.s:697: li  $v0, 0        # done = false
       65 [0x80000454]	0x8fbf0000  lw $31, 0($29)                  ; j_spimbot.s:700: lw  $ra, 0($sp)
       65 [0x80000458]	0x8fb00004  lw $16, 4($29)                  ; j_spimbot.s:701: lw  $s0, 4($sp)
       65 [0x8000045c]	0x8fb10008  lw $17, 8($29)                  ; j_spimbot.s:702: lw  $s1, 8($sp)
       65 [0x80000460]	0x8fb2000c  lw $18, 12($29)                 ; j_spimbot.s:703: lw  $s2, 12($sp)
       65 [0x80000464]	0x8fb30010  lw $19, 16($29)                 ; j_spimbot.s:704: lw  $s3, 16($sp)
       65 [0x80000468]	0x8fb40014  lw $20, 20($29)                 ; j_spimbot.s:705: lw  $s4, 20($sp)
       65 [0x8000046c]	0x8fb50018  lw $21, 24($29)                 ; j_spimbot.s:706: lw  $s5, 24($sp)
       65 [0x80000470]	0x8fb6001c  lw $22, 28($29)                 ; j_spimbot.s:707: lw  $s6, 28($sp)
       65 [0x80000474]	0x8fb70020  lw $23, 32($29)                 ; j_spimbot.s:708: lw  $s7, 32($sp)
       65 [0x80000478]	0x23bd0024  addi $29, $29, 36               ; j_spimbot.s:709: add $sp, $sp, 36
       65 [0x8000047c]	0x03e00008  jr $31                          ; j_spimbot.s:710: jr      $ra
        0 [0x80000480]	0x34020001  ori $2, $0, 1                   ; j_spimbot.s:713: li $v0, 1
        0 [0x80000484]	0x08000115  j 0x00000454 [solve_done]       ; j_spimbot.s:714: j solve_done
      237 [0x80000488]	0x23bdffe8  addi $29, $29, -24              ; j_spimbot.s:745: sub     $sp, $sp, 24
      237 [0x8000048c]	0xafbf0000  sw $31, 0($29)                  ; j_spimbot.s:746: sw      $ra, 0($sp)
      237 [0x80000490]	0xafb00004  sw $16, 4($29)                  ; j_spimbot.s:747: sw      $s0, 4($sp)
      237 [0x80000494]	0xafb10008  sw $17, 8($29)                  ; j_spimbot.s:748: sw      $s1, 8($sp)
      237 [0x80000498]	0xafb2000c  sw $18, 12($29)                 ; j_spimbot.s:749: sw      $s2, 12($sp)
      237 [0x8000049c]	0xafb30010  sw $19, 16($29)                 ; j_spimbot.s:750: sw      $s3, 16($sp)
      237 [0x800004a0]	0xafb40014  sw $20, 20($29)                 ; j_spimbot.s:751: sw      $s4, 20($sp)
      237 [0x800004a4]	0x34100008  ori $16, $0, 8                  ; j_spimbot.s:752: li      $s0, GRIDSIZE                  # $s0: GRIDSIZE = 4
      237 [0x800004a8]	0x00048821  addu $17, $0, $4                ; j_spimbot.s:753: move    $s1, $a0                # $s1: board
      237 [0x800004ac]	0x34120000  ori $18, $0, 0                  ; j_spimbot.s:754:         # s2 = GRIDSIZE
      237 [0x800004b0]	0x34130000  ori $19, $0, 0                  ; j_spimbot.s:755: li      $s3, 0                  # $s3: y = 0
     2131 [0x800004b4]	0x0270082a  slt $1, $19, $16                ; j_spimbot.s:757: bge     $s3, $s0, r1_for_y_end  # for: y < GRIDSIZE
     2131 [0x800004b8]	0x1020002f  beq $1, $0, 188 [r1_for_y_end-0x800004b8]
     1895 [0x800004bc]	0x34140000  ori $20, $0, 0                  ; j_spimbot.s:758: li      $s4, 0                  # $s4: x = 0
    17048 [0x800004c0]	0x0290082a  slt $1, $20, $16                ; j_spimbot.s:760: bge     $s4, $s0, r1_for_x_end  # for: x < GRIDSIZE
    17048 [0x800004c4]	0x1020002a  beq $1, $0, 168 [r1_for_x_end-0x800004c4]
    15154 [0x800004c8]	0x72702002  mul $4, $19, $16                ; j_spimbot.s:761: mul     $a0, $s3, $s0           # $a0: y*GRIDSIZE
    15154 [0x800004cc]	0x00942020  add $4, $4, $20                 ; j_spimbot.s:762: add     $a0, $a0, $s4           # $a0: y*GRIDSIZE + x
    15154 [0x800004d0]	0x00042040  sll $4, $4, 1                   ; j_spimbot.s:763: sll     $a0, $a0, 1             # $a0: 2*(y*GRIDSIZE + x)
    15154 [0x800004d4]	0x00912020  add $4, $4, $17                 ; j_spimbot.s:764: add     $a0, $a0, $s1           # $a0: &board[y*GRIDSIZE+x]
    15154 [0x800004d8]	0x94840000  lhu $4, 0($4)                   ; j_spimbot.s:765: lhu     $a0, 0($a0)             # $a0: value = board[y*GRIDSIZE+x]
    15154 [0x800004dc]	0x0004b021  addu $22, $0, $4                ; j_spimbot.s:766: move    $s6, $a0                # $s6: value
    15154 [0x800004e0]	0x0c000272  jal 0x000009c8 [has_single_bit_set]; j_spimbot.s:767: jal     has_single_bit_set
    15154 [0x800004e4]	0x10020020  beq $0, $2, 128 [r1_for_x_inc-0x800004e4]; j_spimbot.s:768: beq     $v0, 0, r1_for_x_inc    # if(has_single_bit_set(value))
    13230 [0x800004e8]	0x34150000  ori $21, $0, 0                  ; j_spimbot.s:769: li      $s5, 0                  # $s5: k = 0
    13230 [0x800004ec]	0x34180000  ori $24, $0, 0                  ; j_spimbot.s:773: li      $t8, 0
    13230 [0x800004f0]	0x7270c002  mul $24, $19, $16               ; j_spimbot.s:774: mul     $t8, $s3, $s0           # $t0: y*GRIDSIZE
    13230 [0x800004f4]	0x0315c020  add $24, $24, $21               ; j_spimbot.s:775: add     $t8, $t8, $s5           # $t0: y*GRIDSIZE + k
    13230 [0x800004f8]	0x0018c040  sll $24, $24, 1                 ; j_spimbot.s:776: sll     $t8, $t8, 1             # $t0: 2*(y*GRIDSIZE + k)
    13230 [0x800004fc]	0x0311c020  add $24, $24, $17               ; j_spimbot.s:777: add     $t8, $t8, $s1           # $t0: &board[y*GRIDSIZE+k]
   119070 [0x80000500]	0x02b0082a  slt $1, $21, $16                ; j_spimbot.s:783: bge     $s5, $s0, r1_for_k_end  # for: k < GRIDSIZE
   119070 [0x80000504]	0x10200018  beq $1, $0, 96 [r1_for_k_end-0x80000504]
   105840 [0x80000508]	0x12b40008  beq $21, $20, 32 [r1_if_kx_end-0x80000508]; j_spimbot.s:784: beq     $s5, $s4, r1_if_kx_end  # if (k != x)
    92610 [0x8000050c]	0x97090000  lhu $9, 0($24)                  ; j_spimbot.s:786: lhu     $t1, 0($t8)             # $t1: board[y*GRIDSIZE + k]
    92610 [0x80000510]	0x01365024  and $10, $9, $22                ; j_spimbot.s:787: and     $t2, $t1, $s6           # $t2: board[y*GRIDSIZE + k] & value
    92610 [0x80000514]	0x100a0005  beq $0, $10, 20 [r1_if_kx_end-0x80000514]; j_spimbot.s:788: beq     $t2, 0, r1_if_kx_end    # if (board[y*GRIDSIZE + k] & value)
     4958 [0x80000518]	0x02c05827  nor $11, $22, $0                ; j_spimbot.s:789: not     $t3, $s6                # $t3: ~value
     4958 [0x8000051c]	0x012b4824  and $9, $9, $11                 ; j_spimbot.s:790: and     $t1, $t1, $t3           # $t1:  board[y*GRIDSIZE + k] & ~value
     4958 [0x80000520]	0xa7090000  sh $9, 0($24)                   ; j_spimbot.s:791: sh      $t1, 0($t8)             # board[y*GRIDSIZE + k] &= ~value
     4958 [0x80000524]	0x34120001  ori $18, $0, 1                  ; j_spimbot.s:794: li      $s2, 1                  # changed = true
   105840 [0x80000528]	0x12b3000c  beq $21, $19, 48 [r1_if_ky_end-0x80000528]; j_spimbot.s:796: beq     $s5, $s3, r1_if_ky_end  # if (k != y)
    92610 [0x8000052c]	0x72b04002  mul $8, $21, $16                ; j_spimbot.s:797: mul     $t0, $s5, $s0           # $t0: k*GRIDSIZE
    92610 [0x80000530]	0x01144020  add $8, $8, $20                 ; j_spimbot.s:798: add     $t0, $t0, $s4           # $t0: k*GRIDSIZE + x
    92610 [0x80000534]	0x00084040  sll $8, $8, 1                   ; j_spimbot.s:799: sll     $t0, $t0, 1             # $t0: 2*(k*GRIDSIZE + x)
    92610 [0x80000538]	0x01114020  add $8, $8, $17                 ; j_spimbot.s:800: add     $t0, $t0, $s1           # $t0: &board[k*GRIDSIZE+x]
    92610 [0x8000053c]	0x95090000  lhu $9, 0($8)                   ; j_spimbot.s:801: lhu     $t1, 0($t0)             # $t1: board[k*GRIDSIZE + x]
    92610 [0x80000540]	0x01365024  and $10, $9, $22                ; j_spimbot.s:802: and     $t2, $t1, $s6           # $t2: board[k*GRIDSIZE + x] & value
    92610 [0x80000544]	0x100a0005  beq $0, $10, 20 [r1_if_ky_end-0x80000544]; j_spimbot.s:803: beq     $t2, 0, r1_if_ky_end    # if (board[k*GRIDSIZE + x] & value)
     5150 [0x80000548]	0x02c05827  nor $11, $22, $0                ; j_spimbot.s:804: not     $t3, $s6                # $t3: ~value
     5150 [0x8000054c]	0x012b4824  and $9, $9, $11                 ; j_spimbot.s:805: and     $t1, $t1, $t3           # $t1:  board[k*GRIDSIZE + x] & ~value
     5150 [0x80000550]	0xa5090000  sh $9, 0($8)                    ; j_spimbot.s:806: sh      $t1, 0($t0)             # board[k*GRIDSIZE + x] &= ~value
     5150 [0x80000554]	0x34120001  ori $18, $0, 1                  ; j_spimbot.s:807: li      $s2, 1                  # changed = true
   105840 [0x80000558]	0x22b50001  addi $21, $21, 1                ; j_spimbot.s:809: add     $s5, $s5, 1             # for: k++
   105840 [0x8000055c]	0x23180002  addi $24, $24, 2                ; j_spimbot.s:810: add     $t8, $t8, 2
   105840 [0x80000560]	0x08000140  j 0x00000500 [r1_for_k_start]   ; j_spimbot.s:811: j       r1_for_k_start
    15154 [0x80000564]	0x22940001  addi $20, $20, 1                ; j_spimbot.s:814: add     $s4, $s4, 1             # for: x++
    15154 [0x80000568]	0x08000130  j 0x000004c0 [r1_for_x_start]   ; j_spimbot.s:815: j       r1_for_x_start  
     1894 [0x8000056c]	0x22730001  addi $19, $19, 1                ; j_spimbot.s:818: add     $s3, $s3, 1             # for: y++
     1894 [0x80000570]	0x0800012d  j 0x000004b4 [r1_for_y_start]   ; j_spimbot.s:819: j       r1_for_y_start
      236 [0x80000574]	0x00121021  addu $2, $0, $18                ; j_spimbot.s:821: move    $v0, $s2                # return changed
      236 [0x80000578]	0x8fbf0000  lw $31, 0($29)                  ; j_spimbot.s:823: lw      $ra, 0($sp)
      236 [0x8000057c]	0x8fb00004  lw $16, 4($29)                  ; j_spimbot.s:824: lw      $s0, 4($sp)
      236 [0x80000580]	0x8fb10008  lw $17, 8($29)                  ; j_spimbot.s:825: lw      $s1, 8($sp)
      236 [0x80000584]	0x8fb2000c  lw $18, 12($29)                 ; j_spimbot.s:826: lw      $s2, 12($sp)
      236 [0x80000588]	0x8fb30010  lw $19, 16($29)                 ; j_spimbot.s:827: lw      $s3, 16($sp)
      236 [0x8000058c]	0x8fb40014  lw $20, 20($29)                 ; j_spimbot.s:828: lw      $s4, 20($sp)
      236 [0x80000590]	0x23bd0018  addi $29, $29, 24               ; j_spimbot.s:829: add     $sp, $sp, 24
      236 [0x80000594]	0x03e00008  jr $31                          ; j_spimbot.s:830: jr      $ra
        0 [0x80000598]	0x23bdfffc  addi $29, $29, -4               ; j_spimbot.s:836: sub $sp, $sp, 4                       #Store ra onto stack and initialize GRIDSIZE
        0 [0x8000059c]	0xafbf0000  sw $31, 0($29)                  ; j_spimbot.s:837: sw $ra, 0($sp)
        0 [0x800005a0]	0x34080008  ori $8, $0, 8                   ; j_spimbot.s:838: li $t0, GRIDSIZE                               # GRIDSIZE
        0 [0x800005a4]	0x34090001  ori $9, $0, 1                   ; j_spimbot.s:839: li $t1, 1
        0 [0x800005a8]	0x01094804  sllv $9, $9, $8                 ; j_spimbot.s:840: sll $t1, $t1, $t0
        0 [0x800005ac]	0x2529ffff  addiu $9, $9, -1                ; j_spimbot.s:841: subu $t1, $t1, 1                         #int ALL_VALUES = (1 << GRIDSIZE) - 1;
        0 [0x800005b0]	0x34020000  ori $2, $0, 0                   ; j_spimbot.s:842: li $v0, 0                               #bool changed = false
        0 [0x800005b4]	0x340a0000  ori $10, $0, 0                  ; j_spimbot.s:843: li $t2, 0                               #i = 0
        0 [0x800005b8]	0x0148082a  slt $1, $10, $8                 ; j_spimbot.s:845: bge $t2, $t0, rule2iloopend
        0 [0x800005bc]	0x1020004c  beq $1, $0, 304 [rule2iloopend-0x800005bc]
        0 [0x800005c0]	0x340b0000  ori $11, $0, 0                  ; j_spimbot.s:846: li $t3, 0                               #j = 0
        0 [0x800005c4]	0x0168082a  slt $1, $11, $8                 ; j_spimbot.s:848: bge $t3, $t0, rule2jloopend
        0 [0x800005c8]	0x10200047  beq $1, $0, 284 [rule2jloopend-0x800005c8]
        0 [0x800005cc]	0x71486002  mul $12, $10, $8                ; j_spimbot.s:850: mul $t4, $t2, $t0
        0 [0x800005d0]	0x018b6020  add $12, $12, $11               ; j_spimbot.s:851: add $t4, $t4, $t3
        0 [0x800005d4]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:852: mul $t4, $t4, 2                     #sizeof(unsigned short)*(i*GRIDSIZE + j)
        0 [0x800005d8]	0x71816002  mul $12, $12, $1
        0 [0x800005dc]	0x008c6020  add $12, $4, $12                ; j_spimbot.s:853: add $t4, $a0, $t4                   #address of board[i*GRIDSIZE+j]
        0 [0x800005e0]	0x958c0000  lhu $12, 0($12)                 ; j_spimbot.s:854: lhu $t4, 0($t4)                     #board[i*GRIDSIZE + j]
        0 [0x800005e4]	0x23bdffe8  addi $29, $29, -24              ; j_spimbot.s:856: sub $sp, $sp, 24                    # Allocate stack 
        0 [0x800005e8]	0xafa40000  sw $4, 0($29)                   ; j_spimbot.s:857: sw $a0, 0($sp)
        0 [0x800005ec]	0xafa80004  sw $8, 4($29)                   ; j_spimbot.s:858: sw $t0, 4($sp)
        0 [0x800005f0]	0xafa90008  sw $9, 8($29)                   ; j_spimbot.s:859: sw $t1, 8($sp)
        0 [0x800005f4]	0xafaa000c  sw $10, 12($29)                 ; j_spimbot.s:860: sw $t2, 12($sp)
        0 [0x800005f8]	0xafab0010  sw $11, 16($29)                 ; j_spimbot.s:861: sw $t3, 16($sp)
        0 [0x800005fc]	0xafa20014  sw $2, 20($29)                  ; j_spimbot.s:862: sw $v0, 20($sp)                     #Store all necessary variables on stack
        0 [0x80000600]	0x000c2021  addu $4, $0, $12                ; j_spimbot.s:863: move $a0, $t4
        0 [0x80000604]	0x0c000272  jal 0x000009c8 [has_single_bit_set]; j_spimbot.s:864: jal has_single_bit_set
        0 [0x80000608]	0x8fa40000  lw $4, 0($29)                   ; j_spimbot.s:865: lw $a0, 0($sp)
        0 [0x8000060c]	0x8fa80004  lw $8, 4($29)                   ; j_spimbot.s:866: lw $t0, 4($sp)
        0 [0x80000610]	0x8fa90008  lw $9, 8($29)                   ; j_spimbot.s:867: lw $t1, 8($sp)
        0 [0x80000614]	0x8faa000c  lw $10, 12($29)                 ; j_spimbot.s:868: lw $t2, 12($sp)
        0 [0x80000618]	0x8fab0010  lw $11, 16($29)                 ; j_spimbot.s:869: lw $t3, 16($sp)
        0 [0x8000061c]	0x00026021  addu $12, $0, $2                ; j_spimbot.s:870: move $t4, $v0                       # Save $v0 into $t4
        0 [0x80000620]	0x8fa20014  lw $2, 20($29)                  ; j_spimbot.s:871: lw $v0, 20($sp)                     # Restore variables
        0 [0x80000624]	0x23bd0018  addi $29, $29, 24               ; j_spimbot.s:872: add $sp, $sp, 24                    # Deallocate stack
        0 [0x80000628]	0x1580002d  bne $12, $0, 180 [rule2continuestatement-0x80000628]; j_spimbot.s:874: bne $t4, $0, rule2continuestatement #if (has_single_bit_set(value)) continue;
        0 [0x8000062c]	0x340d0000  ori $13, $0, 0                  ; j_spimbot.s:876: li $t5, 0                           #isum = 0
        0 [0x80000630]	0x340e0000  ori $14, $0, 0                  ; j_spimbot.s:877: li $t6, 0                           #jsum = 0
        0 [0x80000634]	0x340c0000  ori $12, $0, 0                  ; j_spimbot.s:878: li $t4, 0                           #k = 0, t2 = i, t3 = j, t4 = k
        0 [0x80000638]	0x0188082a  slt $1, $12, $8                 ; j_spimbot.s:880: bge $t4, $t0, rule2kloopend
        0 [0x8000063c]	0x10200013  beq $1, $0, 76 [rule2kloopend-0x8000063c]
        0 [0x80000640]	0x118b0008  beq $12, $11, 32 [rule2kequalsj-0x80000640]; j_spimbot.s:881: beq $t4, $t3, rule2kequalsj
        0 [0x80000644]	0x71487802  mul $15, $10, $8                ; j_spimbot.s:882: mul $t7, $t2, $t0           #i*GRIDSIZE
        0 [0x80000648]	0x01ec7820  add $15, $15, $12               ; j_spimbot.s:883: add $t7, $t7, $t4           #i*GRIDSIZE+k
        0 [0x8000064c]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:884: mul $t7, $t7, 2
        0 [0x80000650]	0x71e17802  mul $15, $15, $1
        0 [0x80000654]	0x008f7820  add $15, $4, $15                ; j_spimbot.s:885: add $t7, $a0, $t7           #&board[i*GRIDSIZE + k]
        0 [0x80000658]	0x95ef0000  lhu $15, 0($15)                 ; j_spimbot.s:886: lhu $t7, 0($t7)
        0 [0x8000065c]	0x01cf7025  or $14, $14, $15                ; j_spimbot.s:887: or $t6, $t6, $t7            #jsum |= board[i*GRIDSIZE + k];
        0 [0x80000660]	0x118a0008  beq $12, $10, 32 [rule2kequalsi-0x80000660]; j_spimbot.s:889: beq $t4, $t2, rule2kequalsi     
        0 [0x80000664]	0x71887802  mul $15, $12, $8                ; j_spimbot.s:890: mul $t7, $t4, $t0           #k*GRIDSIZE
        0 [0x80000668]	0x01eb7820  add $15, $15, $11               ; j_spimbot.s:891: add $t7, $t7, $t3           #k*GRIDSIZE+j
        0 [0x8000066c]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:892: mul $t7, $t7, 2
        0 [0x80000670]	0x71e17802  mul $15, $15, $1
        0 [0x80000674]	0x008f7820  add $15, $4, $15                ; j_spimbot.s:893: add $t7, $a0, $t7           #&board[k*GRIDSIZE + j]
        0 [0x80000678]	0x95ef0000  lhu $15, 0($15)                 ; j_spimbot.s:894: lhu $t7, 0($t7)
        0 [0x8000067c]	0x01af6825  or $13, $13, $15                ; j_spimbot.s:895: or $t5, $t5, $t7            #isum |= board[k*GRIDSIZE + j];
        0 [0x80000680]	0x218c0001  addi $12, $12, 1                ; j_spimbot.s:897: add $t4, $t4, 1
        0 [0x80000684]	0x0800018e  j 0x00000638 [rule2kloopstart]  ; j_spimbot.s:898: j rule2kloopstart
        0 [0x80000688]	0x112e000b  beq $9, $14, 44 [rule2allvalequalsjsum-0x80000688]; j_spimbot.s:900: beq $t1, $t6, rule2allvalequalsjsum
        0 [0x8000068c]	0x01c07027  nor $14, $14, $0                ; j_spimbot.s:901: not $t6, $t6                    # ~jsum
        0 [0x80000690]	0x012e7024  and $14, $9, $14                ; j_spimbot.s:902: and $t6, $t1, $t6               #ALL_VALUES & ~jsum
        0 [0x80000694]	0x710a7802  mul $15, $8, $10                ; j_spimbot.s:903: mul $t7, $t0, $t2               # i*GRIDSIZE
        0 [0x80000698]	0x01eb7820  add $15, $15, $11               ; j_spimbot.s:904: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
        0 [0x8000069c]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:905: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
        0 [0x800006a0]	0x71e17802  mul $15, $15, $1
        0 [0x800006a4]	0x008f7820  add $15, $4, $15                ; j_spimbot.s:906: add $t7, $a0, $t7
        0 [0x800006a8]	0xa5ee0000  sh $14, 0($15)                  ; j_spimbot.s:907: sh $t6, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~jsum;
        0 [0x800006ac]	0x34020001  ori $2, $0, 1                   ; j_spimbot.s:908: li $v0, 1
        0 [0x800006b0]	0x080001b7  j 0x000006dc [rule2continuestatement]; j_spimbot.s:909: j rule2continuestatement
        0 [0x800006b4]	0x112d000a  beq $9, $13, 40 [rule2continuestatement-0x800006b4]; j_spimbot.s:911: beq $t1, $t5, rule2continuestatement
        0 [0x800006b8]	0x01a06827  nor $13, $13, $0                ; j_spimbot.s:912: not $t5, $t5                    # ~isum
        0 [0x800006bc]	0x012d6824  and $13, $9, $13                ; j_spimbot.s:913: and $t5, $t1, $t5               #ALL_VALUES & ~isum;
        0 [0x800006c0]	0x710a7802  mul $15, $8, $10                ; j_spimbot.s:914: mul $t7, $t0, $t2               # i*GRIDSIZE
        0 [0x800006c4]	0x01eb7820  add $15, $15, $11               ; j_spimbot.s:915: add $t7, $t7, $t3               #[i*GRIDSIZE+j]
        0 [0x800006c8]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:916: mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
        0 [0x800006cc]	0x71e17802  mul $15, $15, $1
        0 [0x800006d0]	0x008f7820  add $15, $4, $15                ; j_spimbot.s:917: add $t7, $a0, $t7
        0 [0x800006d4]	0xa5ed0000  sh $13, 0($15)                  ; j_spimbot.s:918: sh $t5, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~isum;
        0 [0x800006d8]	0x34020001  ori $2, $0, 1                   ; j_spimbot.s:919: li $v0, 1
        0 [0x800006dc]	0x216b0001  addi $11, $11, 1                ; j_spimbot.s:921: add $t3, $t3, 1
        0 [0x800006e0]	0x08000171  j 0x000005c4 [rule2jloopstart]  ; j_spimbot.s:922: j rule2jloopstart                   #continue; iterates to next index of jloop
        0 [0x800006e4]	0x214a0001  addi $10, $10, 1                ; j_spimbot.s:924: add $t2, $t2, 1
        0 [0x800006e8]	0x0800016e  j 0x000005b8 [rule2iloopstart]  ; j_spimbot.s:925: j rule2iloopstart
        0 [0x800006ec]	0x8fbf0000  lw $31, 0($29)                  ; j_spimbot.s:928: lw $ra, 0($sp)
        0 [0x800006f0]	0x23bd0004  addi $29, $29, 4                ; j_spimbot.s:929: add $sp, $sp, 4
        0 [0x800006f4]	0x03e00008  jr $31                          ; j_spimbot.s:930: jr $ra
       65 [0x800006f8]	0x23bdffdc  addi $29, $29, -36              ; j_spimbot.s:938: sub $sp, $sp, 36
       65 [0x800006fc]	0xafbf0000  sw $31, 0($29)                  ; j_spimbot.s:939: sw  $ra, 0($sp)
       65 [0x80000700]	0xafb00004  sw $16, 4($29)                  ; j_spimbot.s:940: sw  $s0, 4($sp)
       65 [0x80000704]	0xafb10008  sw $17, 8($29)                  ; j_spimbot.s:941: sw  $s1, 8($sp)
       65 [0x80000708]	0xafb2000c  sw $18, 12($29)                 ; j_spimbot.s:942: sw  $s2, 12($sp)
       65 [0x8000070c]	0xafb30010  sw $19, 16($29)                 ; j_spimbot.s:943: sw  $s3, 16($sp)
       65 [0x80000710]	0xafb40014  sw $20, 20($29)                 ; j_spimbot.s:944: sw  $s4, 20($sp)
       65 [0x80000714]	0xafb50018  sw $21, 24($29)                 ; j_spimbot.s:945: sw  $s5, 24($sp)
       65 [0x80000718]	0xafb6001c  sw $22, 28($29)                 ; j_spimbot.s:946: sw  $s6, 28($sp)
       65 [0x8000071c]	0xafb70020  sw $23, 32($29)                 ; j_spimbot.s:947: sw  $s7, 32($sp)
       65 [0x80000720]	0x00048021  addu $16, $0, $4                ; j_spimbot.s:949: move    $s0, $a0        # s0 = current_board
       65 [0x80000724]	0x00058821  addu $17, $0, $5                ; j_spimbot.s:950: move    $s1, $a1        # s1 = puzzle
       65 [0x80000728]	0x34120008  ori $18, $0, 8                  ; j_spimbot.s:951: li  $s2, GRIDSIZE              # s2 = GRIDSIZE
       65 [0x8000072c]	0x34080001  ori $8, $0, 1                   ; j_spimbot.s:952: li  $t0, 1
       65 [0x80000730]	0x02484004  sllv $8, $8, $18                ; j_spimbot.s:953: sll $t0, $t0, $s2       # 1 << GRIDSIZE
       65 [0x80000734]	0x2113ffff  addi $19, $8, -1                ; j_spimbot.s:954: sub $s3, $t0, 1     # s3 = ALL_VALUES = (1 << GRIDSIZE) - 1
       65 [0x80000738]	0x34140000  ori $20, $0, 0                  ; j_spimbot.s:956: li  $s4, 0          # s4 = i = 0
      517 [0x8000073c]	0x0292082a  slt $1, $20, $18                ; j_spimbot.s:958: bge $s4, $s2, bd_i1_loop_end    # !(i < GRIDSIZE)
      517 [0x80000740]	0x10200025  beq $1, $0, 148 [bd_i1_loop_end-0x80000740]
      462 [0x80000744]	0x34150000  ori $21, $0, 0                  ; j_spimbot.s:960: li  $s5, 0          # s5 = acc = 0
      462 [0x80000748]	0x34160000  ori $22, $0, 0                  ; j_spimbot.s:961: li  $s6, 0          # s6 = j = 0
     4158 [0x8000074c]	0x02d2082a  slt $1, $22, $18                ; j_spimbot.s:963: bge $s6, $s2, bd_j1_loop_end    # !(j < GRIDSIZE)
     4158 [0x80000750]	0x1020000d  beq $1, $0, 52 [bd_j1_loop_end-0x80000750]
     3696 [0x80000754]	0x72924002  mul $8, $20, $18                ; j_spimbot.s:965: mul $t0, $s4, $s2       # i*GRIDSIZE
     3696 [0x80000758]	0x01164020  add $8, $8, $22                 ; j_spimbot.s:966: add $t0, $t0, $s6       # i*GRIDSIZE + j
     3696 [0x8000075c]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:967: mul $t0, $t0, 2         # sizeof(unsigned short)*(i*GRIDSIZE + j)
     3696 [0x80000760]	0x71014002  mul $8, $8, $1
     3696 [0x80000764]	0x02084020  add $8, $16, $8                 ; j_spimbot.s:968: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     3696 [0x80000768]	0x95170000  lhu $23, 0($8)                  ; j_spimbot.s:969: lhu $s7, 0($t0)         # s7 = value = current_board[i*GRIDSIZE + j]
     3696 [0x8000076c]	0x00172021  addu $4, $0, $23                ; j_spimbot.s:971: move    $a0, $s7
     3696 [0x80000770]	0x0c000272  jal 0x000009c8 [has_single_bit_set]; j_spimbot.s:972: jal has_single_bit_set
     3696 [0x80000774]	0x10400002  beq $2, $0, 8 [bd_j1_loop_increment-0x80000774]; j_spimbot.s:973: beq $v0, $0, bd_j1_loop_increment   # if (!hsbs(value)) continue
     3684 [0x80000778]	0x02b7a826  xor $21, $21, $23               ; j_spimbot.s:974: xor $s5, $s5, $s7
     3696 [0x8000077c]	0x22d60001  addi $22, $22, 1                ; j_spimbot.s:977: add $s6, $s6, 1     # ++ j
     3696 [0x80000780]	0x080001d3  j 0x0000074c [bd_j1_loop_start] ; j_spimbot.s:978: j   bd_j1_loop_start
      462 [0x80000784]	0x16b30085  bne $21, $19, 532 [bd_return_false-0x80000784]; j_spimbot.s:980: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
      456 [0x80000788]	0x34150000  ori $21, $0, 0                  ; j_spimbot.s:982: li  $s5, 0          # s5 = acc = 0
      456 [0x8000078c]	0x34160000  ori $22, $0, 0                  ; j_spimbot.s:983: li  $s6, 0          # s6 = j = 0
     4104 [0x80000790]	0x02d2082a  slt $1, $22, $18                ; j_spimbot.s:985: bge $s6, $s2, bd_j2_loop_end    # !(j < GRIDSIZE)
     4104 [0x80000794]	0x1020000d  beq $1, $0, 52 [bd_j2_loop_end-0x80000794]
     3648 [0x80000798]	0x72d24002  mul $8, $22, $18                ; j_spimbot.s:987: mul $t0, $s6, $s2       # j*GRIDSIZE
     3648 [0x8000079c]	0x01144020  add $8, $8, $20                 ; j_spimbot.s:988: add $t0, $t0, $s4       # j*GRIDSIZE + i
     3648 [0x800007a0]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:989: mul $t0, $t0, 2
     3648 [0x800007a4]	0x71014002  mul $8, $8, $1
     3648 [0x800007a8]	0x02084020  add $8, $16, $8                 ; j_spimbot.s:990: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     3648 [0x800007ac]	0x95170000  lhu $23, 0($8)                  ; j_spimbot.s:991: lhu $s7, 0($t0)     # s7 = value = current_board[j*GRIDSIZE + i]
     3648 [0x800007b0]	0x00172021  addu $4, $0, $23                ; j_spimbot.s:993: move    $a0, $s7
     3648 [0x800007b4]	0x0c000272  jal 0x000009c8 [has_single_bit_set]; j_spimbot.s:994: jal has_single_bit_set
     3648 [0x800007b8]	0x10400002  beq $2, $0, 8 [bd_j2_loop_increment-0x800007b8]; j_spimbot.s:995: beq $v0, $0, bd_j2_loop_increment   # if (!hsbs(value)) continue
     3640 [0x800007bc]	0x02b7a826  xor $21, $21, $23               ; j_spimbot.s:996: xor $s5, $s5, $s7
     3648 [0x800007c0]	0x22d60001  addi $22, $22, 1                ; j_spimbot.s:999: add $s6, $s6, 1     # ++ j
     3648 [0x800007c4]	0x080001e4  j 0x00000790 [bd_j2_loop_start] ; j_spimbot.s:1000: j   bd_j2_loop_start
      456 [0x800007c8]	0x16b30074  bne $21, $19, 464 [bd_return_false-0x800007c8]; j_spimbot.s:1002: bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
      452 [0x800007cc]	0x22940001  addi $20, $20, 1                ; j_spimbot.s:1005: add $s4, $s4, 1     # ++ i
      452 [0x800007d0]	0x080001cf  j 0x0000073c [bd_i1_loop_start] ; j_spimbot.s:1006: j   bd_i1_loop_start
       55 [0x800007d4]	0x34140000  ori $20, $0, 0                  ; j_spimbot.s:1008: li  $s4, 0          # s4 = i = 0
      495 [0x800007d8]	0x0292082a  slt $1, $20, $18                ; j_spimbot.s:1010: bge $s4, $s2, bd_i2_loop_end    # !(i < GRIDSIZE)
      495 [0x800007dc]	0x1020006d  beq $1, $0, 436 [bd_i2_loop_end-0x800007dc]
      440 [0x800007e0]	0x34080002  ori $8, $0, 2                   ; j_spimbot.s:1012: li  $t0, 2          # sizeof(short)
      440 [0x800007e4]	0x71124002  mul $8, $8, $18                 ; j_spimbot.s:1013: mul $t0, $t0, $s2
      440 [0x800007e8]	0x71124002  mul $8, $8, $18                 ; j_spimbot.s:1014: mul $t0, $t0, $s2       # sizeof(unsigned short board[GRIDSIZE*GRIDSIZE])
      440 [0x800007ec]	0x02289820  add $19, $17, $8                ; j_spimbot.s:1015: add $s3, $s1, $t0       # s3 = &(puzzle->constraints)
      440 [0x800007f0]	0x22880001  addi $8, $20, 1                 ; j_spimbot.s:1017: add $t0, $s4, 1     # i+1
      440 [0x800007f4]	0x22490002  addi $9, $18, 2                 ; j_spimbot.s:1018: add $t1, $s2, 2     # GRIDSIZE+2
      440 [0x800007f8]	0x71094002  mul $8, $8, $9                  ; j_spimbot.s:1019: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
      440 [0x800007fc]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1020: mul $t0, $t0, 2
      440 [0x80000800]	0x71014002  mul $8, $8, $1
      440 [0x80000804]	0x01134020  add $8, $8, $19                 ; j_spimbot.s:1021: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
      440 [0x80000808]	0x95190000  lhu $25, 0($8)                  ; j_spimbot.s:1022: lhu $t9, 0($t0)     # t9 = left_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
      440 [0x8000080c]	0x34150000  ori $21, $0, 0                  ; j_spimbot.s:1023: li  $s5, 0          # s5 = count = 0
      440 [0x80000810]	0x34160000  ori $22, $0, 0                  ; j_spimbot.s:1024: li  $s6, 0          # s6 = last = 0
      440 [0x80000814]	0x34170000  ori $23, $0, 0                  ; j_spimbot.s:1026: li  $s7, 0          # s7 = j = 0
     3960 [0x80000818]	0x02f2082a  slt $1, $23, $18                ; j_spimbot.s:1028: bge $s7, $s2, bd_j3_loop_end    # !(j < GRIDSIZE)
     3960 [0x8000081c]	0x1020000d  beq $1, $0, 52 [bd_j3_loop_end-0x8000081c]
     3520 [0x80000820]	0x72924002  mul $8, $20, $18                ; j_spimbot.s:1030: mul $t0, $s4, $s2       # i*GRIDSIZE
     3520 [0x80000824]	0x01174020  add $8, $8, $23                 ; j_spimbot.s:1031: add $t0, $t0, $s7       # i*GRIDSIZE + j
     3520 [0x80000828]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1032: mul $t0, $t0, 2
     3520 [0x8000082c]	0x71014002  mul $8, $8, $1
     3520 [0x80000830]	0x02084020  add $8, $16, $8                 ; j_spimbot.s:1033: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     3520 [0x80000834]	0x95080000  lhu $8, 0($8)                   ; j_spimbot.s:1034: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
     3520 [0x80000838]	0x02c8082a  slt $1, $22, $8                 ; j_spimbot.s:1035: ble $t0, $s6, bd_j3_loop_increment  # !(current > last)
     3520 [0x8000083c]	0x10200003  beq $1, $0, 12 [bd_j3_loop_increment-0x8000083c]
     1209 [0x80000840]	0x22b50001  addi $21, $21, 1                ; j_spimbot.s:1036: add $s5, $s5, 1     # count += 1
     1209 [0x80000844]	0x0008b021  addu $22, $0, $8                ; j_spimbot.s:1037: move    $s6, $t0        # last = current
     3520 [0x80000848]	0x22f70001  addi $23, $23, 1                ; j_spimbot.s:1039: add $s7, $s7, 1     # ++ j
     3520 [0x8000084c]	0x08000206  j 0x00000818 [bd_j3_loop_start] ; j_spimbot.s:1040: j   bd_j3_loop_start
      440 [0x80000850]	0x16b90052  bne $21, $25, 328 [bd_return_false-0x80000850]; j_spimbot.s:1042: bne $s5, $t9, bd_return_false   # if (count != left_constraint) return false
      440 [0x80000854]	0x22880001  addi $8, $20, 1                 ; j_spimbot.s:1044: add $t0, $s4, 1     # i+1
      440 [0x80000858]	0x22490002  addi $9, $18, 2                 ; j_spimbot.s:1045: add $t1, $s2, 2     # GRIDSIZE+2
      440 [0x8000085c]	0x71094002  mul $8, $8, $9                  ; j_spimbot.s:1046: mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
      440 [0x80000860]	0x01124020  add $8, $8, $18                 ; j_spimbot.s:1047: add $t0, $t0, $s2       # (i+1)*(GRIDSIZE+2) + GRIDSIZE
      440 [0x80000864]	0x21080001  addi $8, $8, 1                  ; j_spimbot.s:1048: add $t0, $t0, 1     # (i+1)*(GRIDSIZE+2) + GRIDSIZE + 1
      440 [0x80000868]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1049: mul $t0, $t0, 2
      440 [0x8000086c]	0x71014002  mul $8, $8, $1
      440 [0x80000870]	0x01134020  add $8, $8, $19                 ; j_spimbot.s:1050: add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
      440 [0x80000874]	0x95190000  lhu $25, 0($8)                  ; j_spimbot.s:1051: lhu $t9, 0($t0)     # t9 = right_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
      440 [0x80000878]	0x34150000  ori $21, $0, 0                  ; j_spimbot.s:1052: li  $s5, 0          # s5 = count = 0
      440 [0x8000087c]	0x34160000  ori $22, $0, 0                  ; j_spimbot.s:1053: li  $s6, 0          # s6 = last = 0
      440 [0x80000880]	0x2257ffff  addi $23, $18, -1               ; j_spimbot.s:1055: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
     3960 [0x80000884]	0x02e0082a  slt $1, $23, $0                 ; j_spimbot.s:1057: blt $s7, $0, bd_j4_loop_end # !(j >= 0)
     3960 [0x80000888]	0x1420000d  bne $1, $0, 52 [bd_j4_loop_end-0x80000888]
     3520 [0x8000088c]	0x72924002  mul $8, $20, $18                ; j_spimbot.s:1059: mul $t0, $s4, $s2       # i*GRIDSIZE
     3520 [0x80000890]	0x01174020  add $8, $8, $23                 ; j_spimbot.s:1060: add $t0, $t0, $s7       # i*GRIDSIZE + j
     3520 [0x80000894]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1061: mul $t0, $t0, 2
     3520 [0x80000898]	0x71014002  mul $8, $8, $1
     3520 [0x8000089c]	0x02084020  add $8, $16, $8                 ; j_spimbot.s:1062: add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
     3520 [0x800008a0]	0x95080000  lhu $8, 0($8)                   ; j_spimbot.s:1063: lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
     3520 [0x800008a4]	0x02c8082a  slt $1, $22, $8                 ; j_spimbot.s:1064: ble $t0, $s6, bd_j4_loop_increment  # !(current > last)
     3520 [0x800008a8]	0x10200003  beq $1, $0, 12 [bd_j4_loop_increment-0x800008a8]
     1206 [0x800008ac]	0x22b50001  addi $21, $21, 1                ; j_spimbot.s:1065: add $s5, $s5, 1     # count += 1
     1206 [0x800008b0]	0x0008b021  addu $22, $0, $8                ; j_spimbot.s:1066: move    $s6, $t0        # last = current
     3520 [0x800008b4]	0x22f7ffff  addi $23, $23, -1               ; j_spimbot.s:1068: sub $s7, $s7, 1     # -- j
     3520 [0x800008b8]	0x08000221  j 0x00000884 [bd_j4_loop_start] ; j_spimbot.s:1069: j   bd_j4_loop_start
      440 [0x800008bc]	0x16b90037  bne $21, $25, 220 [bd_return_false-0x800008bc]; j_spimbot.s:1071: bne $s5, $t9, bd_return_false   # if (count != right_constraint) return false
      440 [0x800008c0]	0x22880001  addi $8, $20, 1                 ; j_spimbot.s:1072: add $t0, $s4, 1     # i+1
      440 [0x800008c4]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1073: mul $t0, $t0, 2
      440 [0x800008c8]	0x71014002  mul $8, $8, $1
      440 [0x800008cc]	0x01134020  add $8, $8, $19                 ; j_spimbot.s:1074: add $t0, $t0, $s3       # &puzzle->constraints[i + 1]
      440 [0x800008d0]	0x95190000  lhu $25, 0($8)                  ; j_spimbot.s:1075: lhu $t9, 0($t0)     # t9 = top_constraint = puzzle->constraints[i + 1]
      440 [0x800008d4]	0x34150000  ori $21, $0, 0                  ; j_spimbot.s:1076: li  $s5, 0          # s5 = count = 0
      440 [0x800008d8]	0x34160000  ori $22, $0, 0                  ; j_spimbot.s:1077: li  $s6, 0          # s6 = last = 0
      440 [0x800008dc]	0x34170000  ori $23, $0, 0                  ; j_spimbot.s:1079: li  $s7, 0          # s7 = j = 0
     3960 [0x800008e0]	0x02f2082a  slt $1, $23, $18                ; j_spimbot.s:1081: bge $s7, $s2, bd_j5_loop_end    # !(j < GRIDSIZE)
     3960 [0x800008e4]	0x1020000d  beq $1, $0, 52 [bd_j5_loop_end-0x800008e4]
     3520 [0x800008e8]	0x72f24002  mul $8, $23, $18                ; j_spimbot.s:1083: mul $t0, $s7, $s2       # j*GRIDSIZE
     3520 [0x800008ec]	0x01144020  add $8, $8, $20                 ; j_spimbot.s:1084: add $t0, $t0, $s4       # j*GRIDSIZE + i
     3520 [0x800008f0]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1085: mul $t0, $t0, 2
     3520 [0x800008f4]	0x71014002  mul $8, $8, $1
     3520 [0x800008f8]	0x02084020  add $8, $16, $8                 ; j_spimbot.s:1086: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     3520 [0x800008fc]	0x95080000  lhu $8, 0($8)                   ; j_spimbot.s:1087: lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
     3520 [0x80000900]	0x02c8082a  slt $1, $22, $8                 ; j_spimbot.s:1088: ble $t0, $s6, bd_j5_loop_increment  # !(current > last)
     3520 [0x80000904]	0x10200003  beq $1, $0, 12 [bd_j5_loop_increment-0x80000904]
     1247 [0x80000908]	0x22b50001  addi $21, $21, 1                ; j_spimbot.s:1089: add $s5, $s5, 1     # count += 1
     1247 [0x8000090c]	0x0008b021  addu $22, $0, $8                ; j_spimbot.s:1090: move    $s6, $t0        # last = current
     3520 [0x80000910]	0x22f70001  addi $23, $23, 1                ; j_spimbot.s:1092: add $s7, $s7, 1     # ++ j
     3520 [0x80000914]	0x08000238  j 0x000008e0 [bd_j5_loop_start] ; j_spimbot.s:1093: j   bd_j5_loop_start
      440 [0x80000918]	0x16b90020  bne $21, $25, 128 [bd_return_false-0x80000918]; j_spimbot.s:1095: bne $s5, $t9, bd_return_false   # if (count != top_constraint) return false
      440 [0x8000091c]	0x22480001  addi $8, $18, 1                 ; j_spimbot.s:1097: add $t0, $s2, 1     # GRIDSIZE+1
      440 [0x80000920]	0x22490002  addi $9, $18, 2                 ; j_spimbot.s:1098: add $t1, $s2, 2     # GRIDSIZE+2
      440 [0x80000924]	0x71094002  mul $8, $8, $9                  ; j_spimbot.s:1099: mul $t0, $t0, $t1       # (GRIDSIZE+1)*(GRIDSIZE+2)
      440 [0x80000928]	0x01144020  add $8, $8, $20                 ; j_spimbot.s:1100: add $t0, $t0, $s4       # (GRIDSIZE+1)*(GRIDSIZE+2) + i
      440 [0x8000092c]	0x21080001  addi $8, $8, 1                  ; j_spimbot.s:1101: add $t0, $t0, 1     # (GRIDSIZE+1)*(GRIDSIZE+2) + i + 1
      440 [0x80000930]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1102: mul $t0, $t0, 2
      440 [0x80000934]	0x71014002  mul $8, $8, $1
      440 [0x80000938]	0x01134020  add $8, $8, $19                 ; j_spimbot.s:1103: add $t0, $t0, $s3       # &puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
      440 [0x8000093c]	0x95190000  lhu $25, 0($8)                  ; j_spimbot.s:1104: lhu $t9, 0($t0)     # t9 = bottom_constraint = puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
      440 [0x80000940]	0x34150000  ori $21, $0, 0                  ; j_spimbot.s:1105: li  $s5, 0          # s5 = count = 0
      440 [0x80000944]	0x34160000  ori $22, $0, 0                  ; j_spimbot.s:1106: li  $s6, 0          # s6 = last = 0
      440 [0x80000948]	0x2257ffff  addi $23, $18, -1               ; j_spimbot.s:1108: sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
     3960 [0x8000094c]	0x02e0082a  slt $1, $23, $0                 ; j_spimbot.s:1110: blt $s7, $0, bd_j6_loop_end # !(j >= 0)
     3960 [0x80000950]	0x1420000d  bne $1, $0, 52 [bd_j6_loop_end-0x80000950]
     3520 [0x80000954]	0x72f24002  mul $8, $23, $18                ; j_spimbot.s:1112: mul $t0, $s7, $s2       # j*GRIDSIZE
     3520 [0x80000958]	0x01144020  add $8, $8, $20                 ; j_spimbot.s:1113: add $t0, $t0, $s4       # j*GRIDSIZE + i
     3520 [0x8000095c]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1114: mul $t0, $t0, 2
     3520 [0x80000960]	0x71014002  mul $8, $8, $1
     3520 [0x80000964]	0x02084020  add $8, $16, $8                 ; j_spimbot.s:1115: add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
     3520 [0x80000968]	0x95080000  lhu $8, 0($8)                   ; j_spimbot.s:1116: lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
     3520 [0x8000096c]	0x02c8082a  slt $1, $22, $8                 ; j_spimbot.s:1117: ble $t0, $s6, bd_j6_loop_increment  # !(current > last)
     3520 [0x80000970]	0x10200003  beq $1, $0, 12 [bd_j6_loop_increment-0x80000970]
     1185 [0x80000974]	0x22b50001  addi $21, $21, 1                ; j_spimbot.s:1118: add $s5, $s5, 1     # count += 1
     1185 [0x80000978]	0x0008b021  addu $22, $0, $8                ; j_spimbot.s:1119: move    $s6, $t0        # last = current
     3520 [0x8000097c]	0x22f7ffff  addi $23, $23, -1               ; j_spimbot.s:1121: sub $s7, $s7, 1     # -- j
     3520 [0x80000980]	0x08000253  j 0x0000094c [bd_j6_loop_start] ; j_spimbot.s:1122: j   bd_j6_loop_start
      440 [0x80000984]	0x16b90005  bne $21, $25, 20 [bd_return_false-0x80000984]; j_spimbot.s:1124: bne $s5, $t9, bd_return_false   # if (count != bottom_constraint) return false
      440 [0x80000988]	0x22940001  addi $20, $20, 1                ; j_spimbot.s:1126: add $s4, $s4, 1
      440 [0x8000098c]	0x080001f6  j 0x000007d8 [bd_i2_loop_start] ; j_spimbot.s:1127: j   bd_i2_loop_start
       55 [0x80000990]	0x34020001  ori $2, $0, 1                   ; j_spimbot.s:1129: li  $v0, 1          # return true
       55 [0x80000994]	0x08000267  j 0x0000099c [bd_return]        ; j_spimbot.s:1130: j   bd_return
       10 [0x80000998]	0x34020000  ori $2, $0, 0                   ; j_spimbot.s:1132: li  $v0, 0          # return false
       65 [0x8000099c]	0x8fbf0000  lw $31, 0($29)                  ; j_spimbot.s:1134: lw  $ra, 0($sp)
       65 [0x800009a0]	0x8fb00004  lw $16, 4($29)                  ; j_spimbot.s:1135: lw  $s0, 4($sp)
       65 [0x800009a4]	0x8fb10008  lw $17, 8($29)                  ; j_spimbot.s:1136: lw  $s1, 8($sp)
       65 [0x800009a8]	0x8fb2000c  lw $18, 12($29)                 ; j_spimbot.s:1137: lw  $s2, 12($sp)
       65 [0x800009ac]	0x8fb30010  lw $19, 16($29)                 ; j_spimbot.s:1138: lw  $s3, 16($sp)
       65 [0x800009b0]	0x8fb40014  lw $20, 20($29)                 ; j_spimbot.s:1139: lw  $s4, 20($sp)
       65 [0x800009b4]	0x8fb50018  lw $21, 24($29)                 ; j_spimbot.s:1140: lw  $s5, 24($sp)
       65 [0x800009b8]	0x8fb6001c  lw $22, 28($29)                 ; j_spimbot.s:1141: lw  $s6, 28($sp)
       65 [0x800009bc]	0x8fb70020  lw $23, 32($29)                 ; j_spimbot.s:1142: lw  $s7, 32($sp)
       65 [0x800009c0]	0x23bd0024  addi $29, $29, 36               ; j_spimbot.s:1143: add $sp, $sp, 36
       65 [0x800009c4]	0x03e00008  jr $31                          ; j_spimbot.s:1144: jr $ra
    22498 [0x800009c8]	0x10800009  beq $4, $0, 36 [has_single_bit_set_iszero-0x800009c8]; j_spimbot.s:1150: beq     $a0, $0, has_single_bit_set_iszero
    22498 [0x800009cc]	0x2082ffff  addi $2, $4, -1                 ; j_spimbot.s:1151: sub     $v0, $a0, 1             # $v0: b-1
    22498 [0x800009d0]	0x00821024  and $2, $4, $2                  ; j_spimbot.s:1152: and     $v0, $a0, $v0           # $v0: b & (b-1)
    22498 [0x800009d4]	0x00401027  nor $2, $2, $0                  ; j_spimbot.s:1153: not     $v0, $v0                # $v0: !(b & (b-1))
    22498 [0x800009d8]	0x3c01ffff  lui $1, -1                      ; j_spimbot.s:1155: bne     $v0, -1, has_single_bit_set_iszero
    22498 [0x800009dc]	0x3421ffff  ori $1, $1, -1
    22498 [0x800009e0]	0x14220003  bne $1, $2, 12 [has_single_bit_set_iszero-0x800009e0]
    20554 [0x800009e4]	0x34020001  ori $2, $0, 1                   ; j_spimbot.s:1156: li      $v0, 1
    20554 [0x800009e8]	0x0800027c  j 0x000009f0 [has_single_bit_set_done]; j_spimbot.s:1157: j       has_single_bit_set_done
     1944 [0x800009ec]	0x34020000  ori $2, $0, 0                   ; j_spimbot.s:1159: li      $v0, 0
    22498 [0x800009f0]	0x03e00008  jr $31                          ; j_spimbot.s:1161: jr      $ra
       66 [0x800009f4]	0x23bdfffc  addi $29, $29, -4               ; j_spimbot.s:1169: sub $sp, $sp, 4
       66 [0x800009f8]	0xafbf0000  sw $31, 0($29)                  ; j_spimbot.s:1170: sw  $ra, 0($sp) # save $ra on stack
       66 [0x800009fc]	0x34080008  ori $8, $0, 8                   ; j_spimbot.s:1172: li  $t0, GRIDSIZE
       66 [0x80000a00]	0x71084002  mul $8, $8, $8                  ; j_spimbot.s:1173: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
       66 [0x80000a04]	0x34010002  ori $1, $0, 2                   ; j_spimbot.s:1174: mul $a1, $t0, 2
       66 [0x80000a08]	0x71012802  mul $5, $8, $1
       66 [0x80000a0c]	0x00852820  add $5, $4, $5                  ; j_spimbot.s:1175: add $a1, $a0, $a1               # new_board = old_board + GRIDSIZE*
       66 [0x80000a10]	0x0c000289  jal 0x00000a24 [copy_board]     ; j_spimbot.s:1177: jal copy_board
       66 [0x80000a14]	0x00021021  addu $2, $0, $2                 ; j_spimbot.s:1179: move $v0, $v0                   # // output the output of copy_board
       66 [0x80000a18]	0x8fbf0000  lw $31, 0($29)                  ; j_spimbot.s:1180: lw  $ra, 0($sp)
       66 [0x80000a1c]	0x23bd0004  addi $29, $29, 4                ; j_spimbot.s:1181: add $sp, $sp, 4
       66 [0x80000a20]	0x03e00008  jr $31                          ; j_spimbot.s:1182: jr $ra
      197 [0x80000a24]	0x34080008  ori $8, $0, 8                   ; j_spimbot.s:1190: li  $t0, GRIDSIZE
      197 [0x80000a28]	0x71084002  mul $8, $8, $8                  ; j_spimbot.s:1191: mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
      197 [0x80000a2c]	0x00044821  addu $9, $0, $4                 ; j_spimbot.s:1192: move  $t1, $a0                      # i = 0
      197 [0x80000a30]	0x00055021  addu $10, $0, $5                ; j_spimbot.s:1193: move  $t2, $a1
      197 [0x80000a34]	0x340c0000  ori $12, $0, 0                  ; j_spimbot.s:1194: li  $t4, 0
     6501 [0x80000a38]	0x0188082a  slt $1, $12, $8                 ; j_spimbot.s:1196: bge $t4, $t0, ih_done           # i < GRIDSIZE*GRIDSIZE
     6501 [0x80000a3c]	0x10200007  beq $1, $0, 28 [ih_done-0x80000a3c]
     6304 [0x80000a40]	0x8d2b0000  lw $11, 0($9)                   ; j_spimbot.s:1200: lw $t3, 0($t1)                 # old_board[i]
     6304 [0x80000a44]	0xad4b0000  sw $11, 0($10)                  ; j_spimbot.s:1203: sw  $t3, 0($t2)                 # new_board[i] = old_board[i]
     6304 [0x80000a48]	0x21290004  addi $9, $9, 4                  ; j_spimbot.s:1205: addi $t1, $t1, 4                # i++
     6304 [0x80000a4c]	0x214a0004  addi $10, $10, 4                ; j_spimbot.s:1206: addi $t2, $t2, 4
     6304 [0x80000a50]	0x218c0002  addi $12, $12, 2                ; j_spimbot.s:1207: addi $t4, $t4, 2
     6304 [0x80000a54]	0x0800028e  j 0x00000a38 [ih_loop]          ; j_spimbot.s:1208: j    ih_loop
      197 [0x80000a58]	0x00051021  addu $2, $0, $5                 ; j_spimbot.s:1210: move $v0, $a1
      197 [0x80000a5c]	0x03e00008  jr $31                          ; j_spimbot.s:1211: jr $ra
