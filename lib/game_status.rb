# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|a| board[a] == "O"}
      winner = "O"
      return combination
    elsif combination.all? {|a| board[a] == "X"}
      winner = "X"
      return combination
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if position == " "
      return false
    end
    true
  end
end

def draw?(board)
  if full?(board) &&  !won?(board)
    true
  else false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]] #Grabs the value from the first element in the winning array...
  else return nil
  end
end
