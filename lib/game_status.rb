# Helper Method
def position_taken?(board, index)
 !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

def won?(board)
  marker = nil
  WIN_COMBINATIONS.select do|combo|
  
    if(position_taken?(board, combo[0]))
      
      marker = board[combo[0]]
      combo.all? {|i|board[i].include?(marker)}
      
    end
  end.pop
end

def full?(board)
  board.all? do|pos| 
    position_taken?(board, board.index(pos))
  end
end

def draw?(board)
  !won?(board)&&full?(board)
end

def over?(board)
  won?(board)||draw?(board)
end

def winner(board)
 won?(board) ?board[won?(board)[0]]:nil
end