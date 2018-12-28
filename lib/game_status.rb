# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left Column
  [1,4,7],  # Middle Column
  [2,5,8],  # Right Column
  [0,4,8],  # Left to right
  [2,4,6]   # Right to left
]

def won?( board )
  WIN_COMBINATIONS.detect{|win_combination| board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?( board, win_combination[0] )}
end

def full? ( board )
  board.all?{|element| element == "X" || element == "O"}
end

def draw? ( board )
  full?( board ) && !won?( board )
end

def over? ( board )
  won?(board) || draw?(board) || full?(board)
end

def winner ( board )
  if win_combination = won?(board)
    board[win_combination[0]]
  end
end