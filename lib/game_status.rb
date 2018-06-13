# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
  def won?(board)
    WIN_COMBINATIONS.detect do |combination|
  
      if (board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X") ||
         (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O")
        
        return combination
        
        else
          
        false 
    end
  end
end


def full?(board)
  if board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end

#def full?(board)
#  board.any? {|space| space != " " || nil}
#end

def draw?(board)
  if WIN_COMBINATIONS.any? {|win| win == won?(board)} || full?(board) == false 
    return false
  elsif full?(board) == true
    return true
  end
end

def over?(board)
  
  if full?(board) == true || draw?(board) == true || WIN_COMBINATIONS.any? {|win| win == won?(board)} 
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board).class == Array
    return board[won?(board)[0]]
  else
  return nil
end

end