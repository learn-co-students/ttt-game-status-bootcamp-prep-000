# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

# in the below method, |combo| represents the array inside of WIN_COMBINATIONS. In the original argument, the position_taken? function was being passed 2 arrays. In the final argument, we're passing in two arrays, but one of the arrays has a specified value. Therefore we're not referenceing WIN_COMBINATIONS[0] we're actually calling in WIN_COMBINATIONS [0][0]
def won?(board)
  WIN_COMBINATIONS.find do |combo|
    # original argument "position_taken?(board, combo)"
    position_taken?(board, combo[0]) &&
    board[combo[0]] == board[combo[1]] &&
    board[combo[0]] == board[combo[2]]
  end
end

def full?(board)
  board.all? do |index|
    index != " "
  end
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
   return board[over?(board)[0]]
  end
end
