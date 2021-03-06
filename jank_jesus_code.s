.data
puzzle:      .half 0:164              
heap:        .half 0:50000

my_flag:     .word 0

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

PICKUP_POWERUP          = 0xffff00f4
USE_POWERUP            = 0xffff00ec

### Puzzle
GRIDSIZE = 8

.text
main:
# Construct interrupt mask
li      $t4, 0
or      $t4, $t4, BONK_INT_MASK # request bonk
or      $t4, $t4, REQUEST_PUZZLE_INT_MASK	       # puzzle interrupt bit
or      $t4, $t4, 1 # global enable
mtc0    $t4, $12

#Fill in your code here

li	$t1, 1
    sw  $t1, SWITCH_MODE($0)         #paint mode
    li      $t1, 0
    sw      $t1, ANGLE_CONTROL($0)

    li      $t0, 1
    sw      $t0, my_flag($0)


loop:
    lw      $t0, my_flag($0)
    beq     $t0, 0, loop

    li      $t9, 10
    sw      $t9, VELOCITY($0)
    sw      $t9, PICKUP_POWERUP

    sw      $0, USE_POWERUP($0)

    la	    $t0, puzzle	
    sw      $t0, REQUEST_PUZZLE($0)

    
    #li      $t9, 10
    #sw      $t9, VELOCITY($0)

    li      $t0, 0
    sw      $t0, my_flag($0)

    j       loop

end:
jr $ra

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

and $a0, $k0, REQUEST_PUZZLE_INT_MASK
bne $a0, 0, request_puzzle_interrupt

    li        $v0, PRINT_STRING    # Unhandled interrupt types
    la        $a0, unhandled_str
    syscall
    j    done

bonk_interrupt:
sw $0, BONK_ACK
    #Fill in your code here

    

    li	$t1, 1
    sw  $t1, SWITCH_MODE($0)         #paint mode

        li      $t9, 100
    sw      $t9, VELOCITY($0)
    sw      $t9, PICKUP_POWERUP

    lw      $t0, ANGLE
    #ble     $t0, 0, done
    add     $t0, $t0, -72
    sw      $t0, ANGLE
    li      $t0, 1
    sw      $t0, ANGLE_CONTROL

    j       interrupt_dispatch    # see if other interrupts are waiting

request_puzzle_interrupt:
sw $0, REQUEST_PUZZLE_ACK
#Fill in your code here

    li      $t9, 10
    sw      $t9, VELOCITY($0)

    li      $t0, 1
    sw      $t0, my_flag($0)

    la      $a0, puzzle
    la      $a1, heap
    jal     copy_board

    la      $a0, heap
    li      $a1, 0
    li      $a2, 0

    la      $a3, puzzle
    jal     solve_puzzle

    la      $t0, puzzle
    sw      $t0, SUBMIT_SOLUTION($0)

j	interrupt_dispatch

timer_interrupt:
sw $0, TIMER_ACK
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






























#ORIGINAL Performance
# 238 tiles painted
# 16 paint buckets left


#Performance improvement #1
#286 tiles painted
#13 paint buckets left

#Performance improvement #2
#445 tiles painted
#14 paint buckets left


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


    beq $v0, $0, solve_done_false  # if (done)
    move $s7, $v0     # save done
    move $a0, $s2     # current_board
    move $a1, $s3     # puzzle // same as puzzle->board
    jal copy_board

    move $v0, $s7     # $v0: done

    j solve_done

solve_not_done:

    move $a0, $s2 # current_board
    #jal increment_heap
    move $s2, $v0 # update current_board

    li  $v0, 0 # changed = false
solve_start_do:

    move $a0, $s2


    jal rule1          # changed = rule1(current_board);
    move $s6, $v0      # done

    move $a0, $s2      # current_board

    #TODO - Check if this breaks code
    #jal rule2
    #or   $v0, $v0, $s6 # changed |= rule2(current_board);

    bne $v0, $0, solve_start_do # while (changed)



    move $s7, $v0     # save done
    move $a0, $s2     # current_board
    move $a1, $s3     # puzzle // same as puzzle->board
    jal copy_board

    move $v0, $s7     # $v0: done
    j   solve_done

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
        sub     $sp, $sp, 24
        sw      $ra, 0($sp)
        sw      $s0, 4($sp)
        sw      $s1, 8($sp)
        sw      $s2, 12($sp)
        sw      $s3, 16($sp)
        sw      $s4, 20($sp)
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

        #---- Custom code ------
        #for k!=x
        li      $t8, 0
        mul     $t8, $s3, $s0           # $t0: y*GRIDSIZE
        add     $t8, $t8, $s5           # $t0: y*GRIDSIZE + k
        sll     $t8, $t8, 1             # $t0: 2*(y*GRIDSIZE + k)
        add     $t8, $t8, $s1           # $t0: &board[y*GRIDSIZE+k]


        #---- Custom code ------

r1_for_k_start:
        bge     $s5, $s0, r1_for_k_end  # for: k < GRIDSIZE
        beq     $s5, $s4, r1_if_kx_end  # if (k != x)
        #deleted old code from here
        lhu     $t1, 0($t8)             # $t1: board[y*GRIDSIZE + k]
        and     $t2, $t1, $s6           # $t2: board[y*GRIDSIZE + k] & value
        beq     $t2, 0, r1_if_kx_end    # if (board[y*GRIDSIZE + k] & value)
        not     $t3, $s6                # $t3: ~value
        and     $t1, $t1, $t3           # $t1:  board[y*GRIDSIZE + k] & ~value
        sh      $t1, 0($t8)             # board[y*GRIDSIZE + k] &= ~value

        
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
        add     $t8, $t8, 2
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
        add     $sp, $sp, 24
        jr      $ra


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
    move  $t1, $a0                      # i = 0
    move  $t2, $a1
    li  $t4, 0
ih_loop:
    bge $t4, $t0, ih_done           # i < GRIDSIZE*GRIDSIZE

    #mul $t2, $t1, 2                 # i * sizeof(unsigned short)
    #add $t3, $a0, $t2               # &old_board[i]
    lw $t3, 0($t1)                 # old_board[i]

    #add $t4, $a1, $t2               # &new_board[i]
    sw  $t3, 0($t2)                 # new_board[i] = old_board[i]

    addi $t1, $t1, 4                # i++
    addi $t2, $t2, 4
    addi $t4, $t4, 2
    j    ih_loop
ih_done:
    move $v0, $a1
    jr $ra