# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top horizontal row
  [3, 4, 5], #middle horizontal row
  [6, 7, 8], #bottom horizontal row
  [0, 3, 6], #left vertical column
  [1, 4, 7], #middle vertical column
  [2, 5, 8], #right vertical column
  [0, 4, 8], #diagonal top-left to bottom-right
  [2, 4, 6]  #diagonal top-right to bottom-left
]

def won? board
  WIN_COMBINATIONS.find do |wincombo|
    position_taken?(board, wincombo[0]) &&
    board[wincombo[0]] == board[wincombo[1]] &&
    board[wincombo[1]] == board[wincombo[2]] 
  end
end

def full? board
  board.none?{|board| board == " "}
end

def draw? board
  if(full?(board) && !won?(board))
    true
  else 
    false
  end
end

def over? board
  if(full?(board) || won?(board) || draw?(board))
    true
  else
    false
  end
end

def winner board
  wincombo = won?(board)
  if(wincombo == nil)
    return nil
  elsif(board[wincombo[0]] == "X")
    return "X"
  else
    return "O"
  end
end