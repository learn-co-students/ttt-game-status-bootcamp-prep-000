# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
def turn_count(board)
  count = 0
  board.each.with_index  { |cell,i| count+=1 if position_taken?(board,i)}
 count
end


WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                  [0,4,8],[2,4,6]]



def won? board

  if (0..8).all? do |i|
    !position_taken?(board,i)
  end
  return false
else
  p board
  id= 0

   while id < 8 do
     i,j,k = WIN_COMBINATIONS[id]

     if board[i] == "X" && board[j] == "X" && board[k]== "X" ||
      board[i] == "O" && board[j] == "O" && board[k]== "O"
      return   [i,j,k]
    end
    id+=1
  end
    return false
  end
end


def full? board
  turn_count(board) == 9
end

def draw? board
  full?( board) && !won?( board)
end

def over? board
  draw?(board ) || won?(board)
end

def winner board
  index = won? board
  if index
    board[index[0]]
  end
end
