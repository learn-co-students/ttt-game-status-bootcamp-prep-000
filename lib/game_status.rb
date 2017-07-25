# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    #does any win in board have all x's or all o's?
    occupants = [board[win[0]], board[win[1]], board[win[2]]]
    if occupants.all? {|p| p == "X"} || occupants.all? {|p| p == "O"}
      return win
    end
  end
  return nil
end

def full?(board)
  return board.all? {|p| p == "X" || p == "O"}
end

def draw?(board)
  #board full and not won means draw
  return full?(board) && !won?(board)
end

def over?(board)
  return won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
