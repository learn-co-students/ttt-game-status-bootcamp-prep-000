$game_winner = nil

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

def won?(board)
  win_array_X = []
  win_array_O = []
  counter = 0
  counter_X = 0
  counter_O = 0  
  while counter < 9 do
    if board[counter] == "X"
      win_array_X[counter] = counter
    
    elsif board [counter] == "O"
      win_array_O[counter] = counter
    end
      
      counter +=1
  end
  
  match_array_X = []
  match_array_O = []
  WIN_COMBINATIONS.each do |combo|
    combo.each do |ind|
      if win_array_X[ind] == ind
        match_array_X.push(true)
      end
      if win_array_O[ind] == ind
        match_array_O.push(true)
      end
    end
    
    if match_array_X[0] == true && match_array_X[1] == true && match_array_X[2] == true
      $game_winner = "X"
      return combo
    else
      match_array_X.clear()
    end
    if match_array_O[0] == true && match_array_O[1] == true && match_array_O[2] == true
      $game_winner = "O"
      return combo
    else
      match_array_O.clear()
    end
    
  end
     
  
  return nil
#returns nil or winning combo if won  
end

def full? (board)
  counter = 0
  board.each do
    if !position_taken?(board,counter)
      return false
    end
    counter +=1
  end
  return true
#return true if all positions filled
end

def draw? (board)
  if full?(board) == true && (won?(board) == false || won?(board) == nil)
    return true
  else
    return false
  end
#returns true if board is full but not won
end

def over?(board)
  if winner(board) != nil || draw?(board) == true || full?(board) == true
    return true
  end
   
  return false

#returns true if board won, draw, or full
end

def winner (board)
  if won?(board) == nil
    return nil
  else
    return $game_winner
  end
#returns the winner, x or o  
end