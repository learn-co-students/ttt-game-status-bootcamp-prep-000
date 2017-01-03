# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if board[win_combo[0]]==board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && board[win_combo[0]] != " "
      return win_combo
    end
  end
end

def full?(board)
  board.all? do |full|
    if full == "X" || full == "O"
      true
    end
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
