# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    pos1 = board[win_combo[0]]
    pos2 = board[win_combo[1]]
    pos3 = board[win_combo[2]]
    if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
      win_combo
    end
  end
end

def full?(board)
  board.all? do |e|
    e == "X" || e == "O"
  end
end

def draw?(board)
  full?(board)&& !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if !won?(board)
    nil
  else
    won?(board).all? do |i|
      board[i] == "X" || board[i] == "O"
      return board[i]
    end
  end
end
