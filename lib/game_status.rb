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
  [2,4,6],
  [0,4,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
    elsif
      board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
    end
  end
    return false
end

def full?(board)
  return true unless board.include?(" ")
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board) && board[won?(board)[0]]  == "X"
    return "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    return "O"
  end
  return nil
end