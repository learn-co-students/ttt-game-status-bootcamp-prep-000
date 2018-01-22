require "pry"# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]





def won?(board)
  WIN_COMBINATIONS.each do |combination|
    index1=combination[0]
    index2=combination[1]
    index3=combination[2]

    if board[index1]=="X" && board[index3]=="X" && board[index2]=="X"
        return combination

    elsif board[index1]=="O" && board[index3]=="O" && board[index2]=="O"
        return combination
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
    index=="X"||index=="O"
  end
end

def draw?(board)
  if full?(board)== true && won?(board)== false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board)!= false || draw?(board)== true || full?(board)== true
    return true
  else
    return false
  end
end

def winner(board)
  if win = won?(board)
    board[win[0]]
  #elsif won?(board).each do |index|
   #board[index]== "X"
    #end
    #return "X"

  #else
    #return "O"
  end
end
