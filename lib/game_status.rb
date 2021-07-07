# Helper Method
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
   winning = WIN_COMBINATIONS.detect{ |combo| combo.all? { |position| board[position] == "X"} || combo.all? { |position| board[position] == "O"}}
   if winning == []
     return false
   else
     return winning
   end
end

def full?(board)
  (0..8).all? {|x| position_taken?(board, x)}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
end

def winner(board)
  winner = won?(board)
    if winner
      return board[winner[0]]
    end
end
# Define your WIN_COMBINATIONS constant
