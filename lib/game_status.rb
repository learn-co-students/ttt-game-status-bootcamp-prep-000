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

def full?(board)
  board.all? {|space| space == "X" || space == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def won?(board)
  win_comb = []
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo[0])
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
        win_comb = combo
      end
    end
  end
  if win_comb != []
    return win_comb
  else
    return false
  end
end

def winner(board)
  winner = won?(board)
  if winner
    return board[winner[0]]
  else
    return nil
  end
end

def over?(board)
  if won?(board) || draw?(board) ||full?(board)
    return true
  else
    return false
  end
end
