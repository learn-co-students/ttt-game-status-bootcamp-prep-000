# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won(board)
  WIN_COMBINATIONS.each do |winning_combinations|
  if board[winning_combinations[0]] = board[winning_combinations[1]] = board[winning_combinations[2]]
    return winning_combinations
  else
    return false
  end
end
end
