def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = ["X", "X", "X", "O", "O", " ", " ", " ", " "]
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [6,7,8] # Bottom row
]

# The all? method returns true if the block never returns false or nil for any element passed to it:
  WIN_COMBINATIONS.each do |win_combo|
      all_taken = win_combo.all? do |index|   # grab each index from the win_combo that composes a win.
            #  [0,1,2]                        # see if all winning positions are occupied in THIS combo ...
         position_taken?(board, index)        # Will evaluate to true if all indexes are occupied.
      end
      puts all_taken
  end
