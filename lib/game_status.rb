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
   WIN_COMBINATIONS.detect do |win_combo|
     board[win_combo[0]] == board[win_combo[1]] &&
     board[win_combo[1]] == board[win_combo[2]] &&
     position_taken?(board, win_combo[0])
   end
 end

def full?(board)
  full_board = board.none?{|token| token == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end
