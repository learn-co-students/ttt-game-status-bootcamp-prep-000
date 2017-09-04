WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  players = ["X","O"]
  players.each do |player|
    WIN_COMBINATIONS.each do |combination|
      if board[combination[0]] == player && board[combination[1]] == player && board[combination[2]] == player
        return combination
      end
    end
  end
  nil
end

def full?(board)
  board.all? do |cell|
    !(cell.nil? || cell == " ")
  end
end

def draw?(board)
  if won?(board) != nil
    false
  elsif !full?(board)
    false
  else
    true
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winpos = won?(board)
  if winpos
    board[winpos[0]]
  else
    winpos
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
