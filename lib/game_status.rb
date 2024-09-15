# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    return combo if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
    return combo if board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  end
  false
end

def full?(board)
  board.each {|ch| return false if ch == " "}
  true
end

def draw?(board)
  return false if won?(board) || !full?(board)
  true
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  return nil if !combo
  board[combo[0]]
end
