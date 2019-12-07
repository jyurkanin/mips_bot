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