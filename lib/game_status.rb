# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  result=false
  WIN_COMBINATIONS.each do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3=="X") ||
      position_1 == "O" && position_2 == "O" && position_3=="O"
      result = win_combination
      return result
    else
      result = false
    end
  end
  result
end

def full?(board)
  board.none?{|el| el==" " || el == ""}
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  # elsif !full?(board)
  #   false
  else
    false
  end
end

def winner(board)


  if  won?(board)
    combination = won?(board)
    position_1 = combination[0]
    return board[position_1]
  end

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
