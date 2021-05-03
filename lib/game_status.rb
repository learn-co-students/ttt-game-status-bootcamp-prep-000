# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #Horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #Vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #Diagnal
  [0,4,8],
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end



def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return
  else won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else false
  end
end  

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
  
