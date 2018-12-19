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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] \
    and board[combo[1]] == board[combo[2]] \
    and position_taken?(board, combo[0])
  end
end

def full?(board)
 board.all?{|place| place == "X" or place == "O"}
end

def draw?(board)
  full?(board) and !won?(board)
end

def over?(board)
  won?(board) or full?(board)
end

def winner(board)
  if win = won?(board)
     board[win.first]
  end
end