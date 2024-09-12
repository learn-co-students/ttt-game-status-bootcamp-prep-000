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
  WIN_COMBINATIONS.each do |win|
    if (board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X") ||
       (board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O")
      return win
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O" ?
    true : false
  end
end

def draw?(board)
 !(won?(board) || !full?(board))
end

def over?(board)
  (won?(board) || draw?(board))
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
