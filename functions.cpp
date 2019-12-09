bool rule1(unsigned short* board) {
  bool changed = false;
   for (int y = 0 ; y < GRIDSIZE ; y++) {
      for (int x = 0 ; x < GRIDSIZE ; x++) {
        unsigned value = board[y*GRIDSIZE + x];
        if (has_single_bit_set(value)) {
          for (int k = 0 ; k < GRIDSIZE ; k++) {
            // eliminate from row
            if (k != x) {
              if (board[y*GRIDSIZE + k] & value) {
                board[y*GRIDSIZE + k] &= ~value;
                changed = true;
              }
            }
            // eliminate from column
            if (k != y) {
              if (board[k*GRIDSIZE + x] & value) {
                board[k*GRIDSIZE + x] &= ~value;
                changed = true;
              }
            }
          }
        }
      }
    }
    return changed;
}


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------



bool solve(unsigned short *current_board, unsigned row, unsigned col, Puzzle* puzzle) {
    if (row >= GRIDSIZE || col >= GRIDSIZE) {
        bool done = board_done(current_board, puzzle);
        if (done) {
            copy_board(current_board,puzzle->board);
        }

        return done;
    }
    current_board = increment_heap(current_board, puzzle);

    bool changed;
    do {
        changed = rule1(current_board);
        changed |= rule2(current_board);
        //changed |= rule3(board); //rule3 not done
    } while (changed);

    //added:
    bool done = board_done(current_board, puzzle);
    if (done) {
        copy_board(current_board,puzzle->board);
    }


    short possibles = current_board[row*GRIDSIZE + col];
    for(char number = 0; number < GRIDSIZE; ++number) {
        if ((1 << number) & possibles) {
            current_board[row*GRIDSIZE + col] = 1 << number;
            unsigned next_row = ((col == GRIDSIZE-1) ? row + 1 : row);
            if (solve(current_board, next_row, (col + 1) % GRIDSIZE, puzzle)) {
                return true;
            }
            current_board[row*GRIDSIZE + col] = possibles;
        }
    }
    return false;
}


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------



bool board_done(unsigned short *current_board, Puzzle* puzzle) {
    // Check if all columns and rows are unique
    int ALL_VALUES = (1 << GRIDSIZE) - 1;
    for (int i = 0 ; i < GRIDSIZE; ++ i) {
        short acc = 0;
        for (int j = 0 ; j < GRIDSIZE ; ++ j) {
            unsigned value = current_board[i*GRIDSIZE + j];
            if (!has_single_bit_set(value)) {
                continue;
            }
            acc = acc ^ value;
        }
        // check if all bits in rows are unique
        if (acc != ALL_VALUES) {
            // printf("Row %d unique failed %d - %d\n", i, acc, ALL_VALUES);
            return false;
        }
        acc = 0;
        for (int j = 0 ; j < GRIDSIZE ; ++ j) {
            unsigned value = current_board[j*GRIDSIZE + i];
            if (!has_single_bit_set(value)) {
                continue;
            }
            acc ^= value;
        }
        // check if all bits in cols are unique
        if (acc != ALL_VALUES) {
            return false;
        }
    }

    for (int i = 0 ; i < GRIDSIZE; ++ i) {
        short left_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + 0];
        int count = 0;
        int last = 0;
        for (int j = 0; j < GRIDSIZE; ++ j) {
            int current = current_board[i*GRIDSIZE + j];
            if (current > last) {
                count += 1;
                last = current;
            }
        }
        if (count != left_constraint) {
            return false;
        }

        short right_constraint = puzzle->constraints[(i+1)*(GRIDSIZE+2) + GRIDSIZE + 1];
        count = 0;
        last = 0;
        for (int j = GRIDSIZE-1; j >= 0; --j) {
            int current = current_board[i*GRIDSIZE + j];
            if (current > last) {
                count += 1;
                last = current;
            }
        }
        if (count != right_constraint) {
            return false;
        }

        short top_constraint = puzzle->constraints[i + 1];
        count = 0;
        last = 0;
        for (int j = 0; j < GRIDSIZE; ++ j) {
            int current = current_board[j*GRIDSIZE + i];
            if (current > last) {
                count += 1;
                last = current;
            }
        }
        if (count != top_constraint) {
            return false;
        }

        short bottom_constraint = puzzle->constraints[(GRIDSIZE+1)*(GRIDSIZE+2) + i + 1];
        count = 0;
        last = 0;
        for (int j = GRIDSIZE-1; j >= 0; --j) {
            int current = current_board[j*GRIDSIZE + i];
            if (current > last) {
                count += 1;
                last = current;
            }
        }
        if (count != bottom_constraint) {
            return false;
        }
    }

    return true;
}
