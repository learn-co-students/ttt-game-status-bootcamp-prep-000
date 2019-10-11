# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Diaonal 1
  [6,4,2]  # Diagonal 2
]

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

def won?(board)
  # return false/nil if there is no win combination or draw
  # return the winning combination indexes as an array if there is a win.

  if 
  # The all? method returns true if the block never returns false or nil for any element passed to it:
  # first indwill be 
  WIN_COMBINATIONS.each do |win_combo|  # in_combo =>  [0,1,2] 
      all_3_taken = win_combo.all? do |index|   
        # grab each index from the win_combo and see if
        # all winning positions are OCCUPIED in THIS combo ...
        position_taken?(board, index)   # Will evaluate to true if all indexes are occupied.
      end
      x_wins = false
      o_wins = false
      if all_3_taken
        puts "THERE IS A POSSIBLE WINNER"
        puts win_combo
        # now make sure they are the same "X" or "O".
        x_wins = win_combo.all? { |i| board[i] == "X"}
        puts "X ", x_wins 
        o_wins = win_combo.all? { |i| board[i] == "O"}
        puts "O ", o_wins
        if (x_wins || o_wins)
          puts "There is a WINNNER!"
          return win_combo
        elsif
          full?(board)
          return false
        end  
      end  
    end
  end
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

def draw?(board)
  if full?(board)  #returns true for a draw
    return true
  end  
end

def over?(board)
  if full?(board) ||  won?(board)  #returns true for a WIN OR Draw
    return true
  end
  return false
end

board = ["X", "X", "X", "O", "O", " ", " ", " ", " "]
puts "START"
won?(board)
