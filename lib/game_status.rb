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

def won?(board)

  WIN_COMBINATIONS.each do |win_index|
    win_position_1 = win_index[0]
    win_position_2 = win_index[1]
    win_position_3 = win_index[2]

    if (board[win_position_1] == "X" && board[win_position_2] == "X" && board[win_position_3] == "X") || (board[win_position_1] == "O" && board[win_position_2] == "O" && board[win_position_3] == "O")
      return win_index
    else
      false
    end

  end

  false
end

def full?(board)
  board.all? { |move| move == "X" || move == "O"}

end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end

end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end


end

def winner(board)
  if won?(board)
    position_1 = won?(board)[0]
    board[position_1]
  else
    nil
  end

end
