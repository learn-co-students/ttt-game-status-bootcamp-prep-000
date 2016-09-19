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
    if win_combination.all?{|space | board[space] == "X"} ||
       win_combination.all?{|space | board[space] == "O"}
      return [win_combination[0], win_combination[1], win_combination[2]]
    else
      false
    end
  end
  return false
end

def full?(board)
  return board.all?{|element| element == "X" || element == "O"}
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end 
end
