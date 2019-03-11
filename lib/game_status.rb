# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Row wins
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], # Column wins
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], # Diagonal wins 
  [2, 4, 6] 
]

def won?(board)
  WIN_COMBINATIONS.each do |winc|
    if (board[winc[0]].eql?("X") && board[winc[1]].eql?("X") && board[winc[2]].eql?("X")) || (board[winc[0]].eql?("O") && board[winc[1]].eql?("O") && board[winc[2]].eql?("O"))
      return winc
    end
  end
  return false
end 

def full?(board)
  board.all? do |position|
    !(position.nil? || position == " ")
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combo = won?(board)
  
  win_combo ? board[win_combo[0]] : nil
end