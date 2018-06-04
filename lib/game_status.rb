# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # up-down diagonal
  [6,4,2]  # down-up diagonal
  ]

def won?(board)
  WIN_COMBINATIONS.each do | win_combo |
    board_values = board.values_at(*win_combo)
    if board_values.all? { |a| a == "X" } || board_values.all? { |a| a == "O" }
      return win_combo
    end
  end
  false
end

def full?(board)
  true if board.all? { |a| a == "X" || a == "O" }
end

def draw?(board)
  true if full?(board) && !won?(board)
end

def over?(board)
  true if full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board) then
    return board[won?(board)[0]]
  end
end


      