def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.each do |combination|
    if (board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X") || (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O")
      return combination
    end
  end
  false
end

def full?(board)
  board.all? do |position|
    !(position.nil? || position == " ")
  end
end

def draw?(board)
  (full?(board) && !won?(board)) ? true : false
end

def over?(board)
  (draw?(board) || won?(board)) ? true : false
end

def winner(board)
  if won?(board)
    if (won?(board).all? do |position| board[position] == "X" end)
      "X"
    else
      "O"
    end
  else
    nil
  end
end
