# This is the only file that will be considered for grading

    #struct ArenaPowerUp{
    #   unsigned short x; 2
    #   unsigned short y; 2
    #   unsigned activation_timestamp; 4
    #   PowerUpType powerUpType; 1 + 3padding
    #}; 12 bytes total
    #
    #struct ArenaPowerupMap{
    #   unsigned length;    4
    #   ArenaPowerUp powerups[NUM_POWERUP]; 4 + 4 = 8
    #};
    
.data
# syscall constants
PRINT_STRING            = 4
PRINT_CHAR              = 11
PRINT_INT               = 1

# memory-mapped I/O
VELOCITY                = 0xffff0010
ANGLE                   = 0xffff0014
ANGLE_CONTROL           = 0xffff0018

BOT_X                   = 0xffff0020
BOT_Y                   = 0xffff0024

GET_TIMER               = 0xffff001c
GET_ARENA_MAP           = 0xffff00dc

REQUEST_PUZZLE          = 0xffff00d0  ## Puzzle
SUBMIT_SOLUTION         = 0xffff00d4  ## Puzzle

BONK_INT_MASK           = 0x1000
BONK_ACK                = 0xffff0060

TIMER_INT_MASK          = 0x8000
TIMER_ACK               = 0xffff006c

REQUEST_PUZZLE_INT_MASK = 0x800       ## Puzzle
REQUEST_PUZZLE_ACK      = 0xffff00d8  ## Puzzle

GET_PAINT_BUCKETS       = 0xffff00e4
SWITCH_MODE             = 0xffff00f0

ENABLE_PAINT_BRUSH      = 0xffff00f0
GET_POWERUP_MAP         = 0xffff00e0

CHECK_POWERUP_MAP_FREQUENCY  = 0x100
    
    
### Puzzle
GRIDSIZE = 8
puzzle:              .half 0:164              
heap:                .half 0:4096
completed_request:   .half 0:1  
last_powerup_check:  .word 0:1  #holds the cycle of the last update to the powerup map
powerup_map:         .word 0:2  #holds length and a pointer to an array of power ups
target_pos:          .word 0:2  #holds x and y position
my_bot_color:        .word 0:1  #this is the color of our team
arena_map:           .half 0:900



	
.text
main:
	# Construct interrupt mask
	li      $t4, 0
	or      $t4, $t4, BONK_INT_MASK                     # request bonk
	or      $t4, $t4, REQUEST_PUZZLE_INT_MASK           # puzzle interrupt bit
	or      $t4, $t4, 1 # global enable
	mtc0    $t4, $12

        #if s0 is set to 0 then we have a pathing target


	li      $t1, 1
	sw      $t1, SWITCH_MODE($0)         #paint mode
    
	li      $t1, 10
	sw      $t1, VELOCITY($0)
	
	#This is going to need to See how many buckets of paint are left and then request a puzzle.
	#$t1 is the number of paint buckets we got
	li      $t3, 1
	sw      $t3, completed_request($0)      #start with this set to 1. Meaning it is ready to request a new puzzle.

	lw      $t1, GET_TIMER($0)              #gets cycle number  
	sw      $t1, last_powerup_check($0)     #store current cycle number to this.

	la      $t3, powerup_map
	sw      $t3, GET_POWERUP_MAP($0)        #get initial powerup map

        la      $a0, arena_map
        sw      $a0, GET_ARENA_MAP($0)

        li      $s0, 0xDEADBEEF         #$s0 is a flag that says whether or not we have a valid target
        li      $s1, 0                  #$s1 holds the color the tile we are currently on
        
        #$s2 is the color of our robot. Also we theres a memory location for it.
        #this bit gets the color of the mybot
        lw      $t0, BOT_X($0)          #determine if we are in the top left or bottom right
        bne     $t0, 5, we_are_the_bottom_right
        move    $s2, $0
        sw      $s2, my_bot_color($0)    
        j       bot_loop
we_are_the_bottom_right:
        li      $s2, 1
        sw      $s2, my_bot_color($0)
        
        
bot_loop:
        
        lw      $a0, BOT_X($0)              #This block just gets the current color we are standing on
        lw      $a1, BOT_Y($0)
        jal     get_arena_map_index
        and     $s1, $v0, 0xFF00            #get the upper byte which is color

        
        #if(the tile we are on is our color)
        bne     $s2, $s1, else_not_my_tile
        sw      $0, SWITCH_MODE($0)     #Tile is our color so sprint
        j       end_color_switch
else_not_my_tile:
        li      $t0, 1
        sw      $t0, SWITCH_MODE($0)     #Tile is enemy color so paint

end_color_switch:
        
        
#Check if we have a target acquired#######################################################
        bne $s0, $0, check_paint_supply     #if we don't have a valid target, check the paint supply

        la  $t0, target_pos
        lw  $a0, 0($t0)
        lw  $a1, 4($t0) 
        jal path_to_target                  #pathing subroutine
            
check_paint_supply:
#check if we have enough paint #########################################################################
	lw	$t1, GET_PAINT_BUCKETS($0)	    	#does what it says.
	add	$t2, $0, 0			    	#load 0 into $t2	
	bgt	$t1, $t2, check_powerup_map           	#if(paint > 0) branch if we have enough paint > 0
	lw      $t3, completed_request($0)      	#check if the puzzle is completed
        
        li      $t0, 1
        sw      $t0, SWITCH_MODE($0)
        
        beq     $s0, $0, have_target_dont_stop          #when $s0 is 0, we have a target
#        sw      $0, VELOCITY($0)                        #set velocity to 0 since we have no paint left
have_target_dont_stop:
        
	beq	$t3, $0, check_powerup_map   		#branch if puzzle is not completed. So it does not request more puzzles
	sw      $0,  completed_request($0)       	#set request to incomplete
	la	$t1, puzzle		                #load puzzle address into $t1
	sw	$t1, REQUEST_PUZZLE($0)		    	#request puzzle with this address
        j       check_powerup_map

        
        
check_powerup_map:
#this finds the closest powerup and paths towards it. ##################################################
	lw  	$t1, GET_TIMER($0)              #gets current cycle number
	li  	$t0, CHECK_POWERUP_MAP_FREQUENCY          #a constant for comparing. If the timer says its been more than CHECK_POWERUP_MAP cycles since last powermap update, then get a new powerup map
	lw  	$t2, last_powerup_check($0)     #gets the cycle number of the last update
	add 	$t0, $t0, $t2                   #add last_powerup_check to last cycle number of update.

	bgt 	$t1, $t0, check_next_thing      #Compare the current cycle number to the (last_powerup_check+CHECK_POWERUP_MAP) and if cycle number is smaller, branch. Because we don't need to update the powerup map

	sw  	$t1, last_powerup_check($0)     #stores the current cycle in it
	la  	$a0, powerup_map    
	sw  	$a0, GET_POWERUP_MAP($0)        #get initial powerup map

        la      $a0, arena_map
        sw      $a0, GET_ARENA_MAP($0)
    
	jal 	get_closest_powerup

	li  	$t0, -1 		        #if get_closest_powerup return -1 == x, then no powerup was found
	beq 	$t0, $v0, set_target_null    	#if no powerup is found, then skip this part 
    
	la  	$t0, target_pos     
	sw  	$v0, 0($t0)                     #set the current target as the closest powerup
	sw	$v1, 4($t0)
	add	$s0, $0, $0                     #signal that we have found a target
	j	check_next_thing
set_target_null:
	li	$s0, 0xDEADBEEF		    	#signal that we have no target.

	
check_next_thing:
	# Check somthing here #####################################
    
    
	j   	bot_loop
    
    
	jr $ra




##################################################################################
# Given Functions ################################################################
##################################################################################
.data
three:  .float  3.0
five:   .float  5.0
PI:     .float  3.141592
F180:   .float  180.0


.text
# -----------------------------------------------------------------------
# euclidean_dist - computes sqrt(x^2 + y^2)
# $a0 - x
# $a1 - y
# returns the distance
# -----------------------------------------------------------------------
euclidean_dist:
        mul	$a0, $a0, $a0	            # x^2
        mul	$a1, $a1, $a1	            # y^2
        add	$v0, $a0, $a1	            # x^2 + y^2
        mtc1	$v0, $f0
        cvt.s.w	$f0, $f0	            # float(x^2 + y^2)
        sqrt.s	$f0, $f0	            # sqrt(x^2 + y^2)
        cvt.w.s	$f0, $f0	            # int(sqrt(...))
        mfc1	$v0, $f0
        jr	$ra


# -----------------------------------------------------------------------
# sb_arctan - computes the arctangent of y / x
# $a0 - x
# $a1 - y
# returns the arctangent
# -----------------------------------------------------------------------
sb_arctan:
	li	$v0, 0		# angle = 0;
	abs	$t0, $a0	# get absolute values
	abs	$t1, $a1
	ble	$t1, $t0, no_TURN_90
	## if (abs(y) > abs(x)) { rotate 90 degrees }
	move	$t0, $a1	# int temp = y;
	neg	$a1, $a0	# y = -x;
	move	$a0, $t0	# x = temp;
	li	$v0, 90		# angle = 90;
no_TURN_90:
	bgez	$a0, pos_x 	# skip if (x >= 0)
	## if (x < 0)
	add	$v0, $v0, 180	# angle += 180;
pos_x:
	mtc1	$a0, $f0
	mtc1	$a1, $f1
	cvt.s.w $f0, $f0	# convert from ints to floats
	cvt.s.w $f1, $f1
	div.s	$f0, $f1, $f0	# float v = (float) y / (float) x;
	mul.s	$f1, $f0, $f0	# v^^2
	mul.s	$f2, $f1, $f0	# v^^3
	l.s	$f3, three	# load 3.0
	div.s 	$f3, $f2, $f3	# v^^3/3
	sub.s	$f6, $f0, $f3	# v - v^^3/3
	mul.s	$f4, $f1, $f2	# v^^5
	l.s	$f5, five	# load 5.0
	div.s 	$f5, $f4, $f5	# v^^5/5
	add.s	$f6, $f6, $f5	# value = v - v^^3/3 + v^^5/5
	l.s	$f8, PI		# load PI
	div.s	$f6, $f6, $f8	# value / PI
	l.s	$f7, F180	# load 180.0
	mul.s	$f6, $f6, $f7	# 180.0 * value / PI
	cvt.w.s $f6, $f6	# convert "delta" back to integer
	mfc1	$t0, $f6
	add	$v0, $v0, $t0	# angle += delta
	jr 	$ra


	
##################################################################################
# My Functions ###################################################################
##################################################################################
# Pointer to the powerup map
# v0 = x_pos, v1 = y_pos	
# this would benefit from using more registers instead of memory access.
# It doesn't run very many iterations of the inner loop so it probably would not speed up that much with SIMD	
	
get_closest_powerup:
	sub	$sp, $sp, 4
	sw	$ra, 0($sp)
	
	lw	$t1, 0($a0)		#get the number of powerups
	add	$t2, $a0, 4		#load the pointer to the powerups array

	li 	$t3, 0			#t3 is the index in the array.
	li	$t6, 0xFFFFFFFF		#this is the distance to the closest powerup
	
iterate_over_powerups:			#This is a for loop. for(t3 = 0; t3 < t1; t3++)
	bge	    $t3, $t1, end_iterate_over_powerups

	lhu	    $t4, 0($t2)		#get x_pos (short) powerup_array[t3*12].x
	lhu	    $t5, 2($t2)		#get y_pos (short) powerup_array[t3*12].y

	move	$a0, $t4
	move	$a1, $t5

	#im gunna do what called a pro-gamer move and not save my temporaries
	jal	euclidean_dist
	
	bltu	$t6, $v0, dont_set_min_dist 	#if(t6 < v0) branch
	move	$t6, $v0			#set the smallest distance.
	move	$t7, $t2			#record the pointer of the powerup for later use.

dont_set_min_dist:	
	add	    $t2, $t2, 12		#increment the pointer by 12 bytes. Due to the size of ArenaPowerup struct
	add	    $t3, $t3, 1
	j	    iterate_over_powerups
	
end_iterate_over_powerups:

        li  $t8, 0xFFFFFFFF
        li  $v0, -1
        li  $v1, -1
        beq $t6, $t8, got_no_powerups
        lh	$v0, 0($t7)		#get x_pos (short) powerup_array[min].x
        lh	$v1, 2($t7)		#get y_pos (short) powerup_array[min].y
got_no_powerups:
        lw	$ra, 0($sp)
	add	$sp, $sp, 4
	jr	$ra


######### pathing function #####################################
    # $a0 is x position
    # $a1 is y position
    # returns nothing but it drives to the target
path_to_target:
        
        
        jr      $ra

######### get_arena_map_index ####################################
# just does return arena_map[a0][a1]
get_arena_map_index:
        div     $t2, $a0, 10
        div     $t3, $a1, 10
        la      $t0, arena_map
        mul     $t1, $t2, 30            #30*a0
        add     $t1, $t1, $t3           #30*a0 + a1
        mul     $t1, $t1, 2             #2*((30*a0) + a1)
        add     $t1, $t1, $t0           #(&arena_map) + 2*((30*a0) + a1)
        
        lh      $v0, 0($t1)
        jr      $ra


######### Interupts ############################################	
.kdata
chunkIH:    .space 32
non_intrpt_str:    .asciiz "Non-interrupt exception\n"
unhandled_str:    .asciiz "Unhandled interrupt type\n"
.ktext 0x80000180
interrupt_handler:
.set noat
        move      $k1, $at        # Save $at
.set at
        la        $k0, chunkIH
        sw        $a0, 0($k0)        # Get some free registers
        sw        $v0, 4($k0)        # by storing them to a global variable
        sw        $t0, 8($k0)
        sw        $t1, 12($k0)
        sw        $t2, 16($k0)
        sw        $t3, 20($k0)
        sw $t4, 24($k0)
        sw $t5, 28($k0)

        mfc0      $k0, $13             # Get Cause register
        srl       $a0, $k0, 2
        and       $a0, $a0, 0xf        # ExcCode field
        bne       $a0, 0, non_intrpt



interrupt_dispatch:            # Interrupt:
        mfc0       $k0, $13        # Get Cause register, again
        beq        $k0, 0, done        # handled all outstanding interrupts
        
        and        $a0, $k0, BONK_INT_MASK    # is there a bonk interrupt?
        bne        $a0, 0, bonk_interrupt

        and        $a0, $k0, TIMER_INT_MASK    # is there a timer interrupt?
        bne        $a0, 0, timer_interrupt

        and     $a0, $k0, REQUEST_PUZZLE_INT_MASK
        bne     $a0, 0, request_puzzle_interrupt

        li        $v0, PRINT_STRING    # Unhandled interrupt types
        la        $a0, unhandled_str
        syscall
        j    done

bonk_interrupt:
	sw 	$0, BONK_ACK

	add $t0, $0, 1
	sw  $t0, SWITCH_MODE($0)         #paint mode 
	li	$t0, 67
	sw	$t0, ANGLE($0)
	
	li	$t0, 0
	sw	$t0, ANGLE_CONTROL($0)
	
	li	$t0, 10
	sw	$t0, VELOCITY($0)
	
	j       interrupt_dispatch    # see if other interrupts are waiting

request_puzzle_interrupt:
	li	$t0, 69420
	sw 	$t0, REQUEST_PUZZLE_ACK($0)

	
	
	la 	$a0, puzzle
	la	$a1, heap
	jal 	copy_board

	la	$a0, heap
	li	$a1, 0				#dimensions are 8 by 8
	li	$a2, 0
	la	$a3, puzzle
	jal 	solve_puzzle 
	sw	$a3, SUBMIT_SOLUTION($0)	#submit puzzle

	li  $t3, 1
	sw  $t3, completed_request($0)      #set the puzzle to completed
	j	interrupt_dispatch
    
timer_interrupt:
        sw      $0, TIMER_ACK
        #Fill in your code here
        j        interrupt_dispatch    # see if other interrupts are waiting

non_intrpt:                # was some non-interrupt
        li        $v0, PRINT_STRING
        la        $a0, non_intrpt_str
        syscall                # print out an error message
        # fall through to done

done:
        la      $k0, chunkIH
        lw      $a0, 0($k0)        # Restore saved registers
        lw      $v0, 4($k0)
        lw      $t0, 8($k0)
        lw      $t1, 12($k0)
        lw      $t2, 16($k0)
        lw      $t3, 20($k0)
        lw      $t4, 24($k0)
        lw      $t5, 28($k0)
.set noat
        move    $at, $k1        # Restore $at
.set at
        eret


	
# Given Puzzle Code ################################################################################################################################################
# bool solve(unsigned short *current_board, unsigned row, unsigned col, Puzzle* puzzle) {
#     if (row >= GRIDSIZE || col >= GRIDSIZE) {
#         bool done = board_done(current_board, puzzle);
#         if (done) {
#             copy_board(current_board,puzzle->board);
#         }
#
#         return done;
#     }
#     current_board = increment_heap(current_board, puzzle);
#
#     bool changed;
#     do {
#         changed = rule1(current_board);
#         changed |= rule2(current_board);
#         //changed |= rule3(board); //rule3 not done
#     } while (changed);

#     //added:
#     bool done = board_done(current_board, puzzle);
#     if (done) {
#         copy_board(current_board,puzzle->board);
#     }
#
#
#     short possibles = current_board[row*GRIDSIZE + col];
#     for(char number = 0; number < GRIDSIZE; ++number) {
#         if ((1 << number) & possibles) {
#             current_board[row*GRIDSIZE + col] = 1 << number;
#             unsigned next_row = ((col == GRIDSIZE-1) ? row + 1 : row);
#             if (solve(current_board, next_row, (col + 1) % GRIDSIZE, puzzle)) {
#                 return true;
#             }
#             current_board[row*GRIDSIZE + col] = possibles;
#         }
#     }
#     return false;
# }
	
solve_puzzle:
    sub     $sp, $sp, 36
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)
    sw      $s2, 12($sp)
    sw      $s3, 16($sp)
    sw      $s4, 20($sp)
    sw      $s5, 24($sp)
    sw      $s6, 28($sp)
    sw      $s7, 32($sp)
    li   $s7, GRIDSIZE
    move $s0, $a1     # row
    move $s1, $a2     # col

    move $s2, $a0     # current_board
    move $s3, $a3     # puzzle

    bge  $s0, $s7, solve_done_check  # row >= GRIDSIZE
    bge  $s1, $s7, solve_done_check  # col >= GRIDSIZE
    j solve_not_done
solve_done_check:
    move $a0, $s2     # current_board
    move $a1, $s3     # puzzle
    jal board_done

    beq $v0, $0, solve_done_false  # if (done)
    move $s7, $v0     # save done
    move $a0, $s2     # current_board
    move $a1, $s3     # puzzle // same as puzzle->board
    jal copy_board

    move $v0, $s7     # $v0: done

    j solve_done

solve_not_done:

    move $a0, $s2 # current_board
    jal increment_heap
    move $s2, $v0 # update current_board

    li  $v0, 0 # changed = false
solve_start_do:

    move $a0, $s2


    jal rule1          # changed = rule1(current_board);
    move $s6, $v0      # done

    move $a0, $s2      # current_board
    jal rule2

    or   $v0, $v0, $s6 # changed |= rule2(current_board);

    bne $v0, $0, solve_start_do # while (changed)

    move $a0, $s2     # current_board
    move $a1, $s3     # puzzle
    jal board_done

    beq $v0, $0, solve_board_not_done_after_dowhile  # if (done)
    move $s7, $v0     # save done
    move $a0, $s2     # current_board
    move $a1, $s3     # puzzle // same as puzzle->board
    jal copy_board

    move $v0, $s7     # $v0: done
    j   solve_done

solve_board_not_done_after_dowhile:


    mul $t0, $s0, $s7  # row*GRIDSIZE
    add $t0, $t0, $s1  # row*GRIDSIZE + col
    mul $t0, $t0, 2    # sizeof(unsigned short) * (row*GRIDSIZE + col)
    add $s4, $t0, $s2  # &current_board[row*GRIDSIZE + col]
    lhu $s6, 0($s4)    # possibles = current_board[row*GRIDSIZE + col]

    li $s5, 0 # char number = 0
solve_start_guess:
    bge $s5, $s7, solve_start_guess_end # number < GRIDSIZE
    li $t0, 1
    sll $t1, $t0, $s5 # (1 << number)
    and $t0, $t1, $s6 # (1 << number) & possibles
    beq $t0, $0, solve_start_guess_else
    sh  $t1, 0($s4)   # current_board[row*GRIDSIZE + col] = 1 << number;
    
    move $a0, $s2     # current_board
    move $a1, $s0     # next_row = row
    sub  $t0, $s7, 1  # GRIDSIZE-1
    bne  $s1, $t0, solve_start_guess_same_row # col < GRIDSIZE // col==GRIDSIZE-1
    addi $a1, $a1, 1  # row + 1
solve_start_guess_same_row:
    move $a2, $s1     # col
    addu $a2, $a2, 1  # col + 1
    divu $a2, $s7
    mfhi $a2          # (col + 1) % GRIDSIZE
    move $a3, $s3     # puzzle
    jal solve_puzzle         # solve(current_board, next_row, (col + 1) % GRIDSIZE, puzzle)
    
    bne  $v0, $0, solve_done_true # if done {return true}
    sh   $s6, 0($s4)  # current_board[row*GRIDSIZE + col] = possibles;
solve_start_guess_else:
    addi $s5, $s5, 1
    j solve_start_guess

solve_done_false:
solve_start_guess_end:
    li  $v0, 0        # done = false

solve_done:
    lw  $ra, 0($sp)
    lw  $s0, 4($sp)
    lw  $s1, 8($sp)
    lw  $s2, 12($sp)
    lw  $s3, 16($sp)
    lw  $s4, 20($sp)
    lw  $s5, 24($sp)
    lw  $s6, 28($sp)
    lw  $s7, 32($sp)
    add $sp, $sp, 36
    jr      $ra

solve_done_true:
    li $v0, 1
    j solve_done

# // bool rule1(unsigned short* board) {
# //   bool changed = false;
# //   for (int y = 0 ; y < GRIDSIZE ; y++) {
# //     for (int x = 0 ; x < GRIDSIZE ; x++) {
# //       unsigned value = board[y*GRIDSIZE + x];
# //       if (has_single_bit_set(value)) {
# //         for (int k = 0 ; k < GRIDSIZE ; k++) {
# //           // eliminate from row
# //           if (k != x) {
# //             if (board[y*GRIDSIZE + k] & value) {
# //               board[y*GRIDSIZE + k] &= ~value;
# //               changed = true;
# //             }
# //           }
# //           // eliminate from column
# //           if (k != y) {
# //             if (board[k*GRIDSIZE + x] & value) {
# //               board[k*GRIDSIZE + x] &= ~value;
# //               changed = true;
# //             }
# //           }
# //         }
# //       }
# //     }
# //   }
# //   return changed;
# // }
#a0: board
rule1:
        sub     $sp, $sp, 36
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)
        sw      $s1, 8($sp)
        sw      $s2, 12($sp)
        sw      $s3, 16($sp)
        sw      $s4, 20($sp)
        sw      $s5, 24($sp)
        sw      $s6, 28($sp)
        sw      $s7, 32($sp)
        li      $s0, GRIDSIZE                  # $s0: GRIDSIZE = 4
        move    $s1, $a0                # $s1: board
        li      $s2, 0                  # $s2: changed = false
        li      $s3, 0                  # $s3: y = 0
r1_for_y_start:
        bge     $s3, $s0, r1_for_y_end  # for: y < GRIDSIZE
        li      $s4, 0                  # $s4: x = 0
r1_for_x_start:
        bge     $s4, $s0, r1_for_x_end  # for: x < GRIDSIZE
        mul     $a0, $s3, $s0           # $a0: y*GRIDSIZE
        add     $a0, $a0, $s4           # $a0: y*GRIDSIZE + x
        sll     $a0, $a0, 1             # $a0: 2*(y*GRIDSIZE + x)
        add     $a0, $a0, $s1           # $a0: &board[y*GRIDSIZE+x]
        lhu     $a0, 0($a0)             # $a0: value = board[y*GRIDSIZE+x]
        move    $s6, $a0                # $s6: value
        jal     has_single_bit_set
        beq     $v0, 0, r1_for_x_inc    # if(has_single_bit_set(value))
        li      $s5, 0                  # $s5: k = 0
r1_for_k_start:
        bge     $s5, $s0, r1_for_k_end  # for: k < GRIDSIZE
        beq     $s5, $s4, r1_if_kx_end  # if (k != x)
        mul     $t0, $s3, $s0           # $t0: y*GRIDSIZE
        add     $t0, $t0, $s5           # $t0: y*GRIDSIZE + k
        sll     $t0, $t0, 1             # $t0: 2*(y*GRIDSIZE + k)
        add     $t0, $t0, $s1           # $t0: &board[y*GRIDSIZE+k]
        lhu     $t1, 0($t0)             # $t1: board[y*GRIDSIZE + k]
        and     $t2, $t1, $s6           # $t2: board[y*GRIDSIZE + k] & value
        beq     $t2, 0, r1_if_kx_end    # if (board[y*GRIDSIZE + k] & value)
        not     $t3, $s6                # $t3: ~value
        and     $t1, $t1, $t3           # $t1:  board[y*GRIDSIZE + k] & ~value
        sh      $t1, 0($t0)             # board[y*GRIDSIZE + k] &= ~value
        li      $s2, 1                  # changed = true
r1_if_kx_end:   
        beq     $s5, $s3, r1_if_ky_end  # if (k != y)
        mul     $t0, $s5, $s0           # $t0: k*GRIDSIZE
        add     $t0, $t0, $s4           # $t0: k*GRIDSIZE + x
        sll     $t0, $t0, 1             # $t0: 2*(k*GRIDSIZE + x)
        add     $t0, $t0, $s1           # $t0: &board[k*GRIDSIZE+x]
        lhu     $t1, 0($t0)             # $t1: board[k*GRIDSIZE + x]
        and     $t2, $t1, $s6           # $t2: board[k*GRIDSIZE + x] & value
        beq     $t2, 0, r1_if_ky_end    # if (board[k*GRIDSIZE + x] & value)
        not     $t3, $s6                # $t3: ~value
        and     $t1, $t1, $t3           # $t1:  board[k*GRIDSIZE + x] & ~value
        sh      $t1, 0($t0)             # board[k*GRIDSIZE + x] &= ~value
        li      $s2, 1                  # changed = true
r1_if_ky_end:
        add     $s5, $s5, 1             # for: k++
        j       r1_for_k_start
r1_for_k_end:
r1_for_x_inc:
        add     $s4, $s4, 1             # for: x++
        j       r1_for_x_start  
r1_for_x_end:           
r1_for_y_inc:  
        add     $s3, $s3, 1             # for: y++
        j       r1_for_y_start
r1_for_y_end:
        move    $v0, $s2                # return changed
r1_return:
        lw      $ra, 0($sp)
        lw      $s0, 4($sp)
        lw      $s1, 8($sp)
        lw      $s2, 12($sp)
        lw      $s3, 16($sp)
        lw      $s4, 20($sp)
        lw      $s5, 24($sp)
        lw      $s6, 28($sp)
        lw      $s7, 32($sp)
        add     $sp, $sp, 36
        jr      $ra

# rule2 #####################################################
#
# argument $a0: pointer to current board
rule2:
    sub $sp, $sp, 4                       #Store ra onto stack and initialize GRIDSIZE
    sw $ra, 0($sp)
    li $t0, GRIDSIZE                               # GRIDSIZE
    li $t1, 1
    sll $t1, $t1, $t0
    subu $t1, $t1, 1                         #int ALL_VALUES = (1 << GRIDSIZE) - 1;
    li $v0, 0                               #bool changed = false
    li $t2, 0                               #i = 0
rule2iloopstart:
    bge $t2, $t0, rule2iloopend
    li $t3, 0                               #j = 0
    rule2jloopstart:
        bge $t3, $t0, rule2jloopend
        
        mul $t4, $t2, $t0
        add $t4, $t4, $t3
        mul $t4, $t4, 2                     #sizeof(unsigned short)*(i*GRIDSIZE + j)
        add $t4, $a0, $t4                   #address of board[i*GRIDSIZE+j]
        lhu $t4, 0($t4)                     #board[i*GRIDSIZE + j]
        
        sub $sp, $sp, 24                    # Allocate stack 
        sw $a0, 0($sp)
        sw $t0, 4($sp)
        sw $t1, 8($sp)
        sw $t2, 12($sp)
        sw $t3, 16($sp)
        sw $v0, 20($sp)                     #Store all necessary variables on stack
        move $a0, $t4
        jal has_single_bit_set
        lw $a0, 0($sp)
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        lw $t2, 12($sp)
        lw $t3, 16($sp)
        move $t4, $v0                       # Save $v0 into $t4
        lw $v0, 20($sp)                     # Restore variables
        add $sp, $sp, 24                    # Deallocate stack

        bne $t4, $0, rule2continuestatement #if (has_single_bit_set(value)) continue;
        
        li $t5, 0                           #isum = 0
        li $t6, 0                           #jsum = 0
        li $t4, 0                           #k = 0, t2 = i, t3 = j, t4 = k
        rule2kloopstart:
            bge $t4, $t0, rule2kloopend
            beq $t4, $t3, rule2kequalsj
                mul $t7, $t2, $t0           #i*GRIDSIZE
                add $t7, $t7, $t4           #i*GRIDSIZE+k
                mul $t7, $t7, 2
                add $t7, $a0, $t7           #&board[i*GRIDSIZE + k]
                lhu $t7, 0($t7)
                or $t6, $t6, $t7            #jsum |= board[i*GRIDSIZE + k];
        rule2kequalsj:
            beq $t4, $t2, rule2kequalsi     
                mul $t7, $t4, $t0           #k*GRIDSIZE
                add $t7, $t7, $t3           #k*GRIDSIZE+j
                mul $t7, $t7, 2
                add $t7, $a0, $t7           #&board[k*GRIDSIZE + j]
                lhu $t7, 0($t7)
                or $t5, $t5, $t7            #isum |= board[k*GRIDSIZE + j];
        rule2kequalsi:
            add $t4, $t4, 1
            j rule2kloopstart
        rule2kloopend:
        beq $t1, $t6, rule2allvalequalsjsum
            not $t6, $t6                    # ~jsum
            and $t6, $t1, $t6               #ALL_VALUES & ~jsum
            mul $t7, $t0, $t2               # i*GRIDSIZE
            add $t7, $t7, $t3               #[i*GRIDSIZE+j]
            mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
            add $t7, $a0, $t7
            sh $t6, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~jsum;
            li $v0, 1
            j rule2continuestatement
        rule2allvalequalsjsum:
        beq $t1, $t5, rule2continuestatement
            not $t5, $t5                    # ~isum
            and $t5, $t1, $t5               #ALL_VALUES & ~isum;
            mul $t7, $t0, $t2               # i*GRIDSIZE
            add $t7, $t7, $t3               #[i*GRIDSIZE+j]
            mul $t7, $t7, 2                 #(i*GRIDSIZE+j)*sizeof(unsigned short)
            add $t7, $a0, $t7
            sh $t5, 0($t7)                  #board[i*GRIDSIZE + j] = ALL_VALUES & ~isum;
            li $v0, 1
    rule2continuestatement:
        add $t3, $t3, 1
        j rule2jloopstart                   #continue; iterates to next index of jloop
    rule2jloopend:
    add $t2, $t2, 1
    j rule2iloopstart
rule2iloopend:

    lw $ra, 0($sp)
    add $sp, $sp, 4
    jr $ra


# board done ##################################################
#
# argument $a0: pointer to current board to check
# argument $a1: pointer to puzzle struct
board_done:
    sub $sp, $sp, 36
    sw  $ra, 0($sp)
    sw  $s0, 4($sp)
    sw  $s1, 8($sp)
    sw  $s2, 12($sp)
    sw  $s3, 16($sp)
    sw  $s4, 20($sp)
    sw  $s5, 24($sp)
    sw  $s6, 28($sp)
    sw  $s7, 32($sp)
    
    move    $s0, $a0        # s0 = current_board
    move    $s1, $a1        # s1 = puzzle
    li  $s2, GRIDSIZE              # s2 = GRIDSIZE
    li  $t0, 1
    sll $t0, $t0, $s2       # 1 << GRIDSIZE
    sub $s3, $t0, 1     # s3 = ALL_VALUES = (1 << GRIDSIZE) - 1
    
    li  $s4, 0          # s4 = i = 0
bd_i1_loop_start:
    bge $s4, $s2, bd_i1_loop_end    # !(i < GRIDSIZE)
bd_i1_loop_body:
    li  $s5, 0          # s5 = acc = 0
    li  $s6, 0          # s6 = j = 0
bd_j1_loop_start:
    bge $s6, $s2, bd_j1_loop_end    # !(j < GRIDSIZE)
bd_j1_loop_body:
    mul $t0, $s4, $s2       # i*GRIDSIZE
    add $t0, $t0, $s6       # i*GRIDSIZE + j
    mul $t0, $t0, 2         # sizeof(unsigned short)*(i*GRIDSIZE + j)
    add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
    lhu $s7, 0($t0)         # s7 = value = current_board[i*GRIDSIZE + j]
    
    move    $a0, $s7
    jal has_single_bit_set
    beq $v0, $0, bd_j1_loop_increment   # if (!hsbs(value)) continue
    xor $s5, $s5, $s7
    
bd_j1_loop_increment:
    add $s6, $s6, 1     # ++ j
    j   bd_j1_loop_start
bd_j1_loop_end:
    bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
    
    li  $s5, 0          # s5 = acc = 0
    li  $s6, 0          # s6 = j = 0
bd_j2_loop_start:
    bge $s6, $s2, bd_j2_loop_end    # !(j < GRIDSIZE)
bd_j2_loop_body:
    mul $t0, $s6, $s2       # j*GRIDSIZE
    add $t0, $t0, $s4       # j*GRIDSIZE + i
    mul $t0, $t0, 2
    add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
    lhu $s7, 0($t0)     # s7 = value = current_board[j*GRIDSIZE + i]
    
    move    $a0, $s7
    jal has_single_bit_set
    beq $v0, $0, bd_j2_loop_increment   # if (!hsbs(value)) continue
    xor $s5, $s5, $s7
    
bd_j2_loop_increment:
    add $s6, $s6, 1     # ++ j
    j   bd_j2_loop_start
bd_j2_loop_end:
    bne $s5, $s3, bd_return_false   # if (acc != ALL_VALUES) return false
    
bd_i1_loop_increment:
    add $s4, $s4, 1     # ++ i
    j   bd_i1_loop_start
bd_i1_loop_end:
    li  $s4, 0          # s4 = i = 0
bd_i2_loop_start:
    bge $s4, $s2, bd_i2_loop_end    # !(i < GRIDSIZE)
bd_i2_loop_body:
    li  $t0, 2          # sizeof(short)
    mul $t0, $t0, $s2
    mul $t0, $t0, $s2       # sizeof(unsigned short board[GRIDSIZE*GRIDSIZE])
    add $s3, $s1, $t0       # s3 = &(puzzle->constraints)
    
    add $t0, $s4, 1     # i+1
    add $t1, $s2, 2     # GRIDSIZE+2
    mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
    mul $t0, $t0, 2
    add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
    lhu $t9, 0($t0)     # t9 = left_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0]
    li  $s5, 0          # s5 = count = 0
    li  $s6, 0          # s6 = last = 0
    
    li  $s7, 0          # s7 = j = 0
bd_j3_loop_start:
    bge $s7, $s2, bd_j3_loop_end    # !(j < GRIDSIZE)
bd_j3_loop_body:
    mul $t0, $s4, $s2       # i*GRIDSIZE
    add $t0, $t0, $s7       # i*GRIDSIZE + j
    mul $t0, $t0, 2
    add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
    lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
    ble $t0, $s6, bd_j3_loop_increment  # !(current > last)
    add $s5, $s5, 1     # count += 1
    move    $s6, $t0        # last = current
bd_j3_loop_increment:
    add $s7, $s7, 1     # ++ j
    j   bd_j3_loop_start
bd_j3_loop_end:
    bne $s5, $t9, bd_return_false   # if (count != left_constraint) return false
    
    add $t0, $s4, 1     # i+1
    add $t1, $s2, 2     # GRIDSIZE+2
    mul $t0, $t0, $t1       # (i+1)*(GRIDSIZE+2)
    add $t0, $t0, $s2       # (i+1)*(GRIDSIZE+2) + GRIDSIZE
    add $t0, $t0, 1     # (i+1)*(GRIDSIZE+2) + GRIDSIZE + 1
    mul $t0, $t0, 2
    add $t0, $t0, $s3       # &puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
    lhu $t9, 0($t0)     # t9 = right_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1]
    li  $s5, 0          # s5 = count = 0
    li  $s6, 0          # s6 = last = 0
    
    sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
bd_j4_loop_start:
    blt $s7, $0, bd_j4_loop_end # !(j >= 0)
bd_j4_loop_body:
    mul $t0, $s4, $s2       # i*GRIDSIZE
    add $t0, $t0, $s7       # i*GRIDSIZE + j
    mul $t0, $t0, 2
    add $t0, $s0, $t0       # &current_board[i*GRIDSIZE + j]
    lhu $t0, 0($t0)     # t0 = current = current_board[i*GRIDSIZE + j]
    ble $t0, $s6, bd_j4_loop_increment  # !(current > last)
    add $s5, $s5, 1     # count += 1
    move    $s6, $t0        # last = current
bd_j4_loop_increment:
    sub $s7, $s7, 1     # -- j
    j   bd_j4_loop_start
bd_j4_loop_end:
    bne $s5, $t9, bd_return_false   # if (count != right_constraint) return false
    add $t0, $s4, 1     # i+1
    mul $t0, $t0, 2
    add $t0, $t0, $s3       # &puzzle->constraints[i + 1]
    lhu $t9, 0($t0)     # t9 = top_constraint = puzzle->constraints[i + 1]
    li  $s5, 0          # s5 = count = 0
    li  $s6, 0          # s6 = last = 0
    
    li  $s7, 0          # s7 = j = 0
bd_j5_loop_start:
    bge $s7, $s2, bd_j5_loop_end    # !(j < GRIDSIZE)
bd_j5_loop_body:
    mul $t0, $s7, $s2       # j*GRIDSIZE
    add $t0, $t0, $s4       # j*GRIDSIZE + i
    mul $t0, $t0, 2
    add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
    lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
    ble $t0, $s6, bd_j5_loop_increment  # !(current > last)
    add $s5, $s5, 1     # count += 1
    move    $s6, $t0        # last = current
bd_j5_loop_increment:
    add $s7, $s7, 1     # ++ j
    j   bd_j5_loop_start
bd_j5_loop_end:
    bne $s5, $t9, bd_return_false   # if (count != top_constraint) return false
    
    add $t0, $s2, 1     # GRIDSIZE+1
    add $t1, $s2, 2     # GRIDSIZE+2
    mul $t0, $t0, $t1       # (GRIDSIZE+1)*(GRIDSIZE+2)
    add $t0, $t0, $s4       # (GRIDSIZE+1)*(GRIDSIZE+2) + i
    add $t0, $t0, 1     # (GRIDSIZE+1)*(GRIDSIZE+2) + i + 1
    mul $t0, $t0, 2
    add $t0, $t0, $s3       # &puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
    lhu $t9, 0($t0)     # t9 = bottom_constraint = puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1]
    li  $s5, 0          # s5 = count = 0
    li  $s6, 0          # s6 = last = 0
    
    sub $s7, $s2, 1     # s7 = j = GRIDSIZE - 1
bd_j6_loop_start:
    blt $s7, $0, bd_j6_loop_end # !(j >= 0)
bd_j6_loop_body:
    mul $t0, $s7, $s2       # j*GRIDSIZE
    add $t0, $t0, $s4       # j*GRIDSIZE + i
    mul $t0, $t0, 2
    add $t0, $s0, $t0       # &current_board[j*GRIDSIZE + i]
    lhu $t0, 0($t0)     # t0 = current = current_board[j*GRIDSIZE + i]
    ble $t0, $s6, bd_j6_loop_increment  # !(current > last)
    add $s5, $s5, 1     # count += 1
    move    $s6, $t0        # last = current
bd_j6_loop_increment:
    sub $s7, $s7, 1     # -- j
    j   bd_j6_loop_start
bd_j6_loop_end:
    bne $s5, $t9, bd_return_false   # if (count != bottom_constraint) return false
bd_i2_loop_increment:
    add $s4, $s4, 1
    j   bd_i2_loop_start
bd_i2_loop_end:
    li  $v0, 1          # return true
    j   bd_return
bd_return_false:
    li  $v0, 0          # return false
bd_return:
    lw  $ra, 0($sp)
    lw  $s0, 4($sp)
    lw  $s1, 8($sp)
    lw  $s2, 12($sp)
    lw  $s3, 16($sp)
    lw  $s4, 20($sp)
    lw  $s5, 24($sp)
    lw  $s6, 28($sp)
    lw  $s7, 32($sp)
    add $sp, $sp, 36
    jr $ra

# has single bit set ###########################################
#
# argument $a0: bit mask
has_single_bit_set:
    beq     $a0, $0, has_single_bit_set_iszero
    sub     $v0, $a0, 1             # $v0: b-1
    and     $v0, $a0, $v0           # $v0: b & (b-1)
    not     $v0, $v0                # $v0: !(b & (b-1))
    # if $v0 is zero, return zero
    bne     $v0, -1, has_single_bit_set_iszero
    li      $v0, 1
    j       has_single_bit_set_done
has_single_bit_set_iszero:
    li      $v0, 0
has_single_bit_set_done:
    jr      $ra



# increment heap ###############################################
#
# argument $a0: pointer to current board to check
increment_heap:
    sub $sp, $sp, 4
    sw  $ra, 0($sp) # save $ra on stack

    li  $t0, GRIDSIZE
    mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
    mul $a1, $t0, 2
    add $a1, $a0, $a1               # new_board = old_board + GRIDSIZE*GRIDSIZE

    jal copy_board

    move $v0, $v0                   # // output the output of copy_board
    lw  $ra, 0($sp)
    add $sp, $sp, 4
    jr $ra


# copy board ###################################################
#
# argument $a0: pointer to old board
# argument $a1: pointer to new board
copy_board:
    li  $t0, GRIDSIZE
    mul $t0, $t0, $t0               # GRIDSIZE * GRIDSIZE
    li  $t1, 0                      # i = 0
ih_loop:
    bge $t1, $t0, ih_done           # i < GRIDSIZE*GRIDSIZE

    mul $t2, $t1, 2                 # i * sizeof(unsigned short)
    add $t3, $a0, $t2               # &old_board[i]
    lhu $t3, 0($t3)                 # old_board[i]

    add $t4, $a1, $t2               # &new_board[i]
    sh  $t3, 0($t4)                 # new_board[i] = old_board[i]

    addi $t1, $t1, 1                # i++
    j    ih_loop
ih_done:
    move $v0, $a1
    jr $ra
