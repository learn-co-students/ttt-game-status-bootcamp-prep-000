# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #horizontal rows
  [0,1,2],
  [3,4,5],
  [6,7,8],
  
  #diagonall rows
  [0,4,8],
  [2,4,6],
  
  #vertical rows
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
#Check for a winning combination
def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    end
  end
  return FALSE
end

#Check to see if the board is full
def full?(board)
  board.each do |position|
    if (position == "" || position == " ")
      return FALSE
    end
  end
  return TRUE
end 

#Detect if a game is in a draw
def draw?(board)
  if (full?(board) == TRUE && won?(board) == FALSE)
    return TRUE
  else
    return FALSE
  end
end

#Detect if a game is over
def over?(board)
  if (won?(board) != FALSE)
    return TRUE
    
  elsif (draw?(board) == TRUE)
    return TRUE
    
  elsif (full?(board) == TRUE)
    return TRUE
  
  else 
    return FALSE
  end
end
  
#Check which player is the winner
def winner(board)
  
  if (won?(board) == FALSE)
    return NIL
  end
  
  winning_combination = won?(board)
  win_player = board[winning_combination[0]]
  
  if (win_player == "X")
    return "X"
  else 
    return "O"
  end
end  
  
  
  
    
    
