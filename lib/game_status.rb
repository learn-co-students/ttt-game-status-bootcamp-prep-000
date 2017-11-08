# Helper Method
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
  win = nil
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if ((position_1 == "X" && position_2 == "X" and position_3 == "X") || (position_1 == "O" && position_2 == "O" and position_3 == "O"))
      win = [win_index_1, win_index_2, win_index_3]
      return win
    end
  end
  if (win == nil)
    false
  end
end

def full?(board)
  board.none?{|location| location == " "}
end

def draw?(board)
  if (!won?(board) && full?(board))
    true
  end
end

def over?(board)
 if (won?(board) || full?(board) || draw?(board))
   true
 end
end

def winner(board)
 if (won?(board))
   index = won?(board)[1]
   return board[index]
 end
end
