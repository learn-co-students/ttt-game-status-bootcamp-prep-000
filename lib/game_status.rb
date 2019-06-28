# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
    board[win_array[0]] == board[win_array[1]] &&
    board[win_array[1]] == board[win_array[2]] && 
    position_taken?(board,win_array[0])
  end
end

def full?(board)
  board.all?{ |element| element == "X" || element == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  if player = won?(board)
    return board[player.first]
  end
end

