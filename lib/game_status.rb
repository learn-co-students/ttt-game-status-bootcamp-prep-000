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
  result = []
WIN_COMBINATIONS.each do |win_combination|
win_combination.all? do |i|
  board[i]=="X" || board[i]=="O"
  result << win_combination[i]
end
end
else
  false

end
