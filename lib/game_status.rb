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

def empty?(board)
    board.all? { |pos| (pos.nil? || pos == " " )} # if this is always true, the spot is empty, return true
end

def full?(board)
  # returns true for a FULL board (a draw)
  # the all? method returns true if the block never returns false or nil for any element passed to it:
  
  empty_spot = board.any? { |pos| (pos.nil? || pos == " " )}  # if either of these are true, the spot is empty
  if empty_spot
    return false
  else 
    return true
  end  
end

def won?(board)
  # return false/nil if there is no win combination or draw
  # return the winning combination indexes as an array if there is a win.


  # The all? method returns true if the block never returns false or nil for any element passed to it:
  # first indwill be 
  
  pos_winners = []
  WIN_COMBINATIONS.each do |win_combo|  
      all_3_taken = false

      all_3_taken = win_combo.all? do |index|   
        position_taken?(board, index)       # Will evaluate to true if all indexes are occupied.
      end
      if all_3_taken 
        puts "all_3 ...", win_combo
        pos_winners.push(win_combo)
      end
  end  # WIN_COMBINATIONS.each loop end  
  
  # Now have an array with the possible winners ...  
  puts "HOW MANY? " 
  puts pos_winners.length
  print pos_winners
  puts "\n?????????????????????"
  
  pos_winners.each do |pos_combo| 
    puts "Possible Winner evaluating ..."
    print pos_combo
    x_wins = pos_combo.all? { |i| board[i] == "X"}
      print "X Wins : "
      puts x_wins
      puts "--------------------------------"
      if x_wins
        return pos_combo
      end  
      
    o_wins = pos_combo.all? { |i| board[i] == "O"}
      print "O Wins : "
      puts o_wins  
      if o_wins
        return pos_combo
      end  
    
  end # pos_winners each loop  
end  # this is the won? function end

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

#          0    1    2    3    4    5    6    7    8
#board = ["X", "X", "X", "O", "O", " ", " ", " ", " "] #top row
 board = ["X", " ", "O", " ", "X", "O", " ", " ", "X"] #left diagonal
puts "START"
won?(board)
