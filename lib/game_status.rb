
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  # ETC, an array for each win combination
]
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
return false
end


def full?(board)
 !board.any? { |x| x == " " }
end

def draw?(board)
  if won?(board) == nil & full?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    index = won?(board).first
    return board[index]
  end
end

o_win_center_column = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
puts winner(o_win_center_column)

no_winner_board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
puts winner(no_winner_board)
