# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diag 1
  [2,4,6], # Diag 2
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8]  # Right column
]

$win_token = nil

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    pos1 = win_combo[0]
    pos2 = win_combo[1]
    pos3 = win_combo[2]

    if board[pos1] == "X" && board[pos2] == "X" && board[pos3] == "X"
      $win_token = "X"
      return win_combo
    elsif board[pos1] == "O" && board[pos2] == "O" && board[pos3] == "O"
      $win_token = "O"
      return win_combo
    end
  end
  return false
end

def full?(board)
  board.all? {|pos| pos.strip != ""}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return $win_token
  end
end
