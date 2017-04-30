# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # left columns
  [1,4,7], # middle columns
  [2,5,8], # right column
  [0,4,8], # diag top left to right
  [6,4,2] #diag top right to left
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    (position == "X" || position == "O")
  end
end

def draw?(board)
  return (full?(board) && !(won?(board)))
end

def over?(board)
  return (draw?(board) || won?(board))
end

def winner(board)
  win_combo = won?(board)
  if win_combo == false
    return nil
  else
    winning_position1 = win_combo[0]
    return board[winning_position1]
  end
end
