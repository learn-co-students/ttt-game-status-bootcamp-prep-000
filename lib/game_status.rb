# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[2,4,6]]

def won?(board)
  win = []
  WIN_COMBINATIONS.each do |win_combo|
  
    if((board[win_combo[0]] == "X" && board[win_combo[1]] == "X" &&              board[win_combo[2]] == "X") ||
      (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" &&
       board[win_combo[2]] == "O"))
      win = win_combo
    end
  end
  if(!win.empty?)
    win
  end
end

def full?(board)
  board.all?  do |space| 
    space == "X" || space == "O"
  end
end

def draw?(board)
    if(full?(board) && !won?(board))
      true
    end
end

def over?(board)
  if(won?(board) || draw?(board))
    true
  end
end

def winner(board)
    if winner = won?(board)
      board[winner.first]
    else
      nil
    end
end