def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    positions = [board[win_index_1], board[win_index_2], board[win_index_3]]

    if positions == ["X", "X", "X"] || positions == ["O", "O", "O"]
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? { |e| e != " " && e != "" }
end

def draw?(board)
  if won?(board) != false
    return false
  elsif won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  (won?(board) != false || full?(board) == true || draw?(board) == true)?
    true : false
end

def winner(board)
  result = won?(board)
  if result != false
    return board[result[0]]
  end
end
