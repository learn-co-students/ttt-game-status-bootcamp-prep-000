def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def moves_completed(board)
  move_count = x_slots(board) + o_slots(board)
end

def x_slots(board)
  x_count = board.select{|board_space| board_space == "X"}.length
end

def o_slots(board)
  o_count = board.select{|board_space| board_space == "O"}.length
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def full?(board)
  moves_completed(board) == 9
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if(won?(board))
    if(x_slots(board) > o_slots(board))
      return "X"
    else
      return "O"
    end
  else
    nil
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    if board[index_0] == "X" && board[index_1] == "X" && board[index_2] == "X"
      return win_combo
    elsif board[index_0] == "O" && board[index_1] == "O" && board[index_2] == "O"
      return win_combo
    end
  end
  return false
end