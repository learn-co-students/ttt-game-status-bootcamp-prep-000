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
  WIN_COMBINATIONS.each do |array|
    if (board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X") || (board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O")
      return array
    end
  end
  return false
end

def full?(board)
  return !board.any?{|entry| entry == " " || entry == ""}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  if (won?(board) || (!won?(board) && !full?(board)))
    return false
  end
end

def over?(board)
  return (won?(board) || full?(board) || draw?(board))
end

def winner(board)
  if !won?(board)
    return nil
  end
  return board[won?(board)[0]]
end
