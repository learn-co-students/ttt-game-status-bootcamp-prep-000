# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  # you can't check won?(board) == false
  # you can check it with !won?(board) or won?(board) == nil
WIN_COMBINATIONS.find do |win_combination|
  win_combination.all? {|i| board[i]=="X"} ||
  win_combination.all? {|i| board[i]=="O"}
end
end

def full?(board)
  board.all? do |entry|
    entry=="X" || entry=="O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    won?(board).each do |i|
      if board[i]=="X"
        return "X"
      else
        return "O"
     end
   end
 end
end
