# check if position is not empty
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# key/win combinations array
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

# return win_combinations matches array if it occurs false otherwise
def won?(board)
  WIN_COMBINATIONS.find do |subarray|
  board[subarray[0]] == board[subarray[1]] && board[subarray[1]] == board[subarray[2]] && board[subarray[0]] != " "
  end
end

#return true if board full ; false is its not
def full?(board)
  return board.none? { |i| i == " "}
end

#return true for a draw
def draw?(board)
  return !won?(board) && full?(board)
end

#return true if game is over by win, draw
def over?(board)
  return won?(board) || draw?(board)
end

#return winner token 
def winner(board)
  return board[won?(board)[0]] if won?(board)
end