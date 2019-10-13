# THIS PASSES ALL THE TESTS ...

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
  return false if empty?(board)  # Nice Short-Cut!!

  pos_winners = []
  WIN_COMBINATIONS.each do |win_combo|  
      all_3_taken = false

      all_3_taken = win_combo.all? do |index|   
        position_taken?(board, index)       # true if all indexes are occupied.
      end
      if all_3_taken 
        pos_winners.push(win_combo)
      end
  end  # WIN_COMBINATIONS.each loop end  
  
  # Now have an array with the possible winners ...  
    if pos_winners.length == 0   # no winner, BAIL
      puts "NO WINNER!"
      return pos_winners[98]  # returning nil, duh. 
    end

  # Now see if any pos_winner is "ALL THE SAME" and return it.  
  winning_combo = false
  pos_winners.each do |pos_combo|
    if 
      (board[pos_combo[0]] == board[pos_combo[1]]) && (board[pos_combo[0]] == board[pos_combo[2]])
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

#          0    1    2    3    4    5    6    7    8
#board = ["X", " ", "O", " ", "X", "O", " ", " ", "X"] # left diagonal X

#out = won?(board)
#puts out
