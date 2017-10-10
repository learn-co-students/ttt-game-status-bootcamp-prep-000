# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |arr|
    if board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X" ||
      board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O"
      return arr
    end
  end
  return false
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
  if !won?(board)
    return nil
  elsif won?(board).all? { |spot| board[spot] == "X" }
    return "X"
  elsif won?(board).all? { |spot| board[spot] == "O" }
    return "O"
  end
end
