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
  all_empty = board.all? do |item|
    item == " "
  end
  
  if all_empty
    return false
  end
  
  result = false
  
  WIN_COMBINATIONS.each do |combination|
    if (board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X") || (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O")
      result = combination
    end
  end
  
  result
end

def full?(board)
  return board.all? do |item|
    item == "X" || item == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def winner(board)
  winner = won?(board)
  
  if winner
    board[winner[0]]
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end