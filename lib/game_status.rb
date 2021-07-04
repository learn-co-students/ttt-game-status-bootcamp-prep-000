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
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] &&
       board[win_combination[1]] == board[win_combination[2]] &&
       position_taken?(board, win_combination[0])
       TRUE
       win_combination
    end
  end
end

def full?(board)
 board.all? {|space| space == "X" || space == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
  TRUE
  else
  FALSE
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    TRUE
  else
    FALSE
  end
end

def winner(board)
  if token = won?(board)
    board[token.first]
  end
end