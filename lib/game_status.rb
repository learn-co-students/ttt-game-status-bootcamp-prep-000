# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]]==board[win_combination[1]] && board[win_combination[1]]==board[win_combination[2]])&& position_taken?(board,win_combination[0])
      return win_combination
    end
  end
  return false
end

def full?(board)
  if board.include?(" ") || board.include?(nil) 
    return false
  else
    return TRUE
  end
end

def draw?(board)
  if full?(board)
    if won?(board) == nil || won?(board) == false
      return true
    else
      return false
    end
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end
def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    return nil
  end
end