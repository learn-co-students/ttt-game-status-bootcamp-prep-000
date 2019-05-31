# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],  #top row 
  [0, 3, 6],  #left column 
  [0, 4, 8],  #diagonal
  [1, 4, 7],  #middle column 
  [2, 4, 6],  #diagonal
  [2, 5, 8],  #right column
  [3, 4, 5],  #middle row
  [6, 7, 8]   #bottom row
  ]

def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end}
     return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end
  
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  windex = []
  windex = won?(board)
  
  if windex == false
    return nil
    elsif board[windex[0]] == "X"
      return "X"
    else
      return "O"
  end
end