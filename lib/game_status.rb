# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row
  [6, 7, 8],  #Bottom row
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.detect {|winning_array|
    board[winning_array[0]] == board[winning_array[1]] &&
    board[winning_array[1]] == board[winning_array[2]] &&
    position_taken?(board, winning_array[0])
  }
end

def full?(board)
  board.none? {|i| i == " " || i == ""}
end

def draw?(board)

  full?(board) == true && winner(board) == nil
end

def over?(board)
  full?(board) == true || won?(board) == true || draw?(board) == true
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
