# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # diagonal top left to bottom right
  [2,4,6]  # other diagonal!
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    pos1 = combination[0]
    pos2 = combination[1]
    pos3 = combination[2]
    if (board[pos1] == "X" && board[pos2] =="X" && board[pos3] =="X") || (board[pos1] == "O" && board[pos2] =="O" && board[pos3] =="O")
      return combination
    end
    end
    return false # because will only get here if have not "returned" due to finding a win combination
  end

def full?(board)
  board.all?{|i| i == "X" || i =="O"}
end

def draw?(board)
  full?(board) && !won?(board)
  end

def over?(board)
  won?(board) || draw?(board) ||full?(board)
end

def winner(board)
  winning_player = won?(board)
  if winning_player == false
    return nil
  else board[winning_player[0]] # simply access the first element of the winning combination
  end
end
