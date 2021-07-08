# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  WIN_COMBINATIONS.detect do |arr|
    board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]] &&
    position_taken?(board, arr[0])
  end
end

def full?(board)
  board.none? { |spot| spot == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if combo = won?(board)
    board[combo.first]
  end
end
