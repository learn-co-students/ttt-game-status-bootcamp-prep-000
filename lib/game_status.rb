# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  
  WIN_COMBINATIONS.each do |combo|
    if combo.all? { |index| board[index] == "X"}
      return combo
    elsif combo.all? { |index| board[index] == "O"}
      return combo
    end
  end
  return false
end

def full?(board)
  board.each do |ele|
    if ele == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  
  return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if isWinner = won?(board)
    return board[isWinner[0]]
  end
end