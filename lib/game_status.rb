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

def won?(board)
  # return false/nil if there is no win combination.
  # return the winning combination indexes as an array if there is a win.
  
  if 
  # The all? method returns true if the block never returns false or nil for any element passed to it:
  WIN_COMBINATIONS.each do |win_combo|
      all_taken = win_combo.all? do |index|   # grab each index from the win_combo that composes a win.
            #  [0,1,2]                        # see if all winning positions are occupied in THIS combo ...
         position_taken?(board, index)        # Will evaluate to true if all indexes are occupied.
      end
      puts all_taken
      if all_taken
        puts win_combo
        return win_combo
      end
    end  
  end
end


board = ["X", "X", "X", "O", "O", " ", " ", " ", " "]
won?(board)

#########################################
def full?(board)
  puts "full"
end

def draw?(board)
  puts "draw"
end

def over?(board)
  puts "over"
end
