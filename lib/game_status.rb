# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #rows
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #columns
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonals
  [0,4,8],
  [2,4,6]
]

def won?(board)

  players = ["X", "O"]
  winner = false
  
  players.each do |player|
    WIN_COMBINATIONS.each do |combo|
      #simplify with all? or detect?
      if board[combo[0]] == player &&  board[combo[1]] == player && board[combo[2]] == player
        winner = combo
      end 
    end
  end
  return winner
end

def full?(board)
  board.none? do |place|
    place == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if !(won?(board) || draw?(board))
    return false
  else
    return true
  end
end

def winner(board)
  winning_combo = won?(board)
  if over?(board)
    return board[winning_combo[0]]
  end
end
