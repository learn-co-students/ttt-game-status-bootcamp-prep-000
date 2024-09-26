# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
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
  winner=false
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]]==board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board,win_combination[0])
      winner=true
      return win_combination
    end
  end
  if !winner
    return false
  end
end

def full?(board)
  board.all? do |space|
    space=="X" || space=="O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
