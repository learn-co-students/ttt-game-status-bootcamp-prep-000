def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def full?(board)
  # returns true for a FULL board (a draw)
  # the all? method returns true if the block never returns false or nil for any element passed to it:
  
  board.each do |this_pos|
    if (this_pos.nil? || this_pos == " " ) # if either of these are true, the spot is empty, return false.
      return false
    end
    return true
  end
end

board = [" ", "", "X", "O", "O", " ", " ", " ", " "]
#board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

isFull = full?(board)
puts "full? is: "
puts isFull







