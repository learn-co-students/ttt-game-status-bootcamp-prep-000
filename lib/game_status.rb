# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    index_1 = combination[0]
    index_2 = combination[1]
    index_3 = combination[2]
    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    if position_taken?(board, index_1) && position_2 == position_1 && position_3 == position_1
      return combination
    end
  end
  return false
end

def full?(board)
  status = board.select{ |cell| cell == "X" || cell == "O" }
  return status.length == 9
end

def draw?(board)
  return full?(board) && !won?(board)
end
 
def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    an_index = won?(board)[0]
    board[an_index]
  end
end




