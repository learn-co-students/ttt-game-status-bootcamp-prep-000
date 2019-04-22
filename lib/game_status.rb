# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]

def won?(board)
WIN_COMBINATIONS.each do |comb|
  return comb if board[comb[0]] == board[comb[1]] && board[comb[0]] == board[comb[2]] && (board[comb[0]] == "X" || board[comb[0]] == "O")
  end
  return false
end

def full?(board)
  board.all? {|place| place == "X" || place == "O"}
end

def draw?(board)
  !won?(board) if full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end