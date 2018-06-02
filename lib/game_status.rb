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
  [0, 4, 8], 
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |array|
    if position_taken?(board, array[0]) == true && board[array[0]] == board[array[1]] && board[array[2]] == board[array[0]]
      return array 
    end
  end 
  return false
end 

def full?(board)
  status = board.select{ |cell| cell == "X" || cell == "O" }
  if status.length == 9
    return true
  else 
    return false
  end 
end 

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
end

def over?(board)
  return draw?(board) || won?(board)  # returns draw?board. if draw?board is false, return won?board
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


