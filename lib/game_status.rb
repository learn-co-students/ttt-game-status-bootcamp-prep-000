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
    x = WIN_COMBINATIONS.select do |combo|
    (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && (board[combo[2]] == "X" || board[combo[2]] == "O"))
    end
    return x[0]
end

def full?(board)
  return board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  return (full?(board) && !won?(board)) ? true : false
end

def over?(board)
  return (draw?(board) || won?(board)) ? true : false
end

def winner(board)
  if(over?(board) && won?(board))
    return board[won?(board)[0]]
  end
end
