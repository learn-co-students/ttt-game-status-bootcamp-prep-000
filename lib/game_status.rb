# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # diagonal one
  [2,4,6]  # diagonal two
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  board[win_combination[0]] == board[win_combination[1]] &&
  board[win_combination[1]] == board[win_combination[2]] &&
  position_taken?(board, win_combination[0])
end
end

def full?(board)
   board.all? {|board| board== "X"|| board== "O"}
  end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
   won?(board) || full?(board)
end

def winner(board)
 if win_row = won?(board)
  board[win_row[0]]
end
end
