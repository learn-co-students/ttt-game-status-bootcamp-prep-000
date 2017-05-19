# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

def board_empty?(board)
  board.all? { | position | position.strip.empty? }
end

def inprogress?(board)
  board.any? { | position | position.strip.empty? }
end

def won?(board)
  for i in 0..WIN_COMBINATIONS.length-1 do
    combo =  WIN_COMBINATIONS[i]
    one = combo[0]
    two = combo[1]
    three = combo[2]
    if (board[one]=="X"||board[one]=="O") &&  board[one]==board[two] && board[two] == board[three]
      return [one,two,three]
    end
  end
  return false
end

def full?(board)
   !inprogress? board
end

def draw?(board)
   !won? board
end

def over?(board)
    ((draw? board) || (won? board)) && !(inprogress? board)
end

def winner(board)
  if won? board
    board[(won? board)[0]]
  else
    nil
  end
end
