def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [
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
  WIN_COMBINATIONS.each do |win|
    if ( win.all?{|i| board[i] == "O"} || win.all?{|i| board[i] == "X"} )
      return win
    end
  end
   false
end

def full?(board)
  board.all?{|i| i != " "}
end

def draw?(board)
  won?(board) == false && full?(board)
end

def over?(board)
  won?(board) != false || draw?(board)
end

def winner(board)
  if win = won?(board)
    board[win[0]]
  end
end
