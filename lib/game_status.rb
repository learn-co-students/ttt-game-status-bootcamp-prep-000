# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[2, 4, 6],
[0, 4, 8]
]

def won?(board)

  WIN_COMBINATIONS.find do |combination|
    board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board, combination[0])
  end
end

def full?(board)
  ##WIN_COMBINATIONS.all? do |index|
    ##board[index[0]] == "X" || board[index[0]] == "O"
##  end

!board.include?(" ")
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
