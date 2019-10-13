
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
  [2,4,6]  # Diagonal 2
]

def empty?(board)
    board.all? { |pos| (pos.nil? || pos == " " || pos == ""  )} # if these are always true, the board is empty, return true
end

def won?(board)
  winner = false
  pos_winners = []
  print board
  puts ""
  puts "|||||||||||||||||||||"
  # return false on empty board
  # return false/nil if there is no win combination 
  # return false/nil if there is a draw
  # return the win_combo as an array if there is a win
  
  return false if empty?(board)  # Nice Short-Cut!!

  
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
      puts "Number of possible winners: "
      puts pos_winners.length
  end  # WIN_COMBINATIONS.each loop end  
  
  # Now have an array with the possible winners ...  
  
  # no winner, BAIL, return nil per test!!!
    if pos_winners.length == 0 
      puts "NO WINNER!"
      return pos_winners[98] # returning nil, duh. 
    end

  # Now see if any pos_winner is "ALL THE SAME" and return it.  
  # That's it !!!
  winning_combo = false
  pos_winners.each do |pos_combo|
    print "--------------->"
    print pos_combo
    print board[pos_combo[0]], board[pos_combo[1]], board[pos_combo[2]]
    puts " "
    if 
      (board[pos_combo[0]] == board[pos_combo[1]]) && (board[pos_combo[0]] == board[pos_combo[2]])
      puts "Winning Combo is: "
      print pos_combo
      puts ""
      winning_combo = pos_combo
    end  
  end # pos_winners each loop
  return winning_combo
end  # this is the won? function end

def full?(board)
  board.none? {|this_pos| (this_pos.nil? || this_pos == " " || this_pos == "")} 
end

def draw?(board)
  return true if !(won?(board)) && full?(board)
  return false if !(won?(board)) && !(full?(board))
  return false if won?(board)
end

def over?(board)
  if full?(board) ||  won?(board)  #returns true for a WIN OR Dra
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    winner = board[win_combo[0]]   #The first value will be "X" or "O" - the WINNER!
    puts "WINNER from #winner IS: "
    winner
    return winner
  end
end  
 


puts "START"
#          0    1    2    3    4    5    6    7    8
#board = ["X", "X", "X", "O", "O", " ", " ", " ", " "] # top row
#board = ["X", " ", "O", " ", "X", "O", " ", " ", "X"] # right column
#board = [" ", "", "", " ", " ", " ", " ", " ", " "]  # mixed Empty board
#board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"] # no winner
board = ["X", " ", "X", " ", "X", " ", "O", "O", "X"] # diagonal X
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]  # DRAW
#board = ["X", " ", "O", "X", "O", " ", "O", " ", " "] # right diagonal O
#board = ["X", " ", "O", " ", "X", "O", " ", " ", "X"] # left diagonal X

#out = won?(board)
#puts out
