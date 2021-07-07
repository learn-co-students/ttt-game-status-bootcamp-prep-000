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
  result = nil
  WIN_COMBINATIONS.each do |combo|
    pos_1 = board[combo[0]]
    pos_2 = board[combo[1]]
    pos_3 = board[combo[2]]
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      result = combo
    end
  end
  result
end

def full?(board)
  board.all? {|space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if combo = won?(board)
    board[combo[0]]
  else
    nil
  end
end