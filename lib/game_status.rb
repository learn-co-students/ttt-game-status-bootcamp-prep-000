# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # Left column
[1,4,7], # Middle column
[2,5,8], # Right column
[0,4,8], # Left diagonal
[2,4,6] # Right diagonal
]

board = []
# Define won?(board)

def won?(board)
        WIN_COMBINATIONS.detect do |winning_array|
          board[winning_array[0]] != " " && board[winning_array[0]] != "" &&
          board[winning_array[0]] == board[winning_array[1]] &&
          board[winning_array[1]] == board[winning_array[2]]
        end
end

def full?(board)
  board.all? do |letter|
    letter == "X" || letter == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    return true
  end
end

def over?(board)
  if full?(board) == true || won?(board) != nil
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == nil
    return nil
  else
    return board[won?(board)[1]]
  end
end
