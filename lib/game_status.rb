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
WIN_COMBINATIONS.detect do |j|

   (board[j[0]] === board[j[1]] && board[j[1]]===board[j[2]]) && (position_taken?(board,j[0] ))

end
end
def full?(board)

    if (board.index(" ") || board.index(" "))
      return false
    end
      return true
   end
def draw?(board)
  return ! won?(board) && full?(board)
end
def over?(board)
  return  won?(board) || full?(board) || draw?(board)
end
def winner(board)
  if won?(board) != nil
    win=won?(board)

    return board[win[0]]
  end

  end
