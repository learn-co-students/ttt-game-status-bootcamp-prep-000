# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
def won?(board)
  players=["X","O"]
  WIN_COMBINATIONS.each do|combination|
    players.each do|player|
      if (board[combination[0]]===player && board[combination[1]]===player && board[combination[2]]===player )
       # puts "won!"
        return combination
      end
    end
  end
  return false
end

def full?(board)
  num_positions=board.select do|positions|
    positions=="X"||positions=="O"
  end
  num_positions.length==9 ? true :false
end


def draw?(board)
full?(board)&&!won?(board) ? true : false
end
  
def over?(board)  
draw?(board)||won?(board) ? true : false 
end

def winner(board)
  won?(board).kind_of?(Array) ? board[won?(board)[0]] : nil
end

board = [" ", " ", "O", "X", "X", "X", " ", " ", " "]
winner=winner(board)
puts won?(board)
puts "Winner is #{winner(board)}"
