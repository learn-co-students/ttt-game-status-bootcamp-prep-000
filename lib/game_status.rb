# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] != " ")
end

# Define your WIN_COMBINATIONS constant

 WIN_COMBINATIONS =
  [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]


def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    potential_win = [board[win_index_1], board[win_index_2], board[win_index_3]]
    if potential_win.all? { |el| el == "X" } || potential_win.all? { |el| el == "O" }
      return combo
    end
  end
  false
end

def full?(board)
  board.all? { |pos| pos != " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  # !won?(board) ? nil : board[won?(board)[0]]
  if !won?(board)
    nil
  else
    board[won?(board)[0]]
  end
end
