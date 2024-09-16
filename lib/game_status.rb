# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left Column
  [1,4,7],  # Middle Column
  [2,5,8],  # Right Column
  [0,4,8],  # Diagnoal L to R
  [2,4,6]  # Diagnoal R to L
]

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[2]] && board[win[1]] == board[win[2]] && position_taken?(board, win[0])
  end
end

def full?(board)
  if board.any? { |i| i == " " }
    false
  else
    true
  end
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  draw?(board)  ||  full?(board) || won?(board)
end

def winner(board)
  winning_array = won?(board)
  if won?(board)
    if board[winning_array[0]] == "X"
      "X"
    else
      "O"
    end
  end
end
