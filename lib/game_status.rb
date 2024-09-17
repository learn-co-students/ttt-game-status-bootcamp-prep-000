#learn open ttt-game-status-bootcamp-prep-000
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top_row_win
  [3,4,5], #mid_row_win
  [6,7,8], #bot_row_win
  [0,3,6], #left_colom_win
  [1,4,7], #mid_colom_win
  [2,5,8], #right_colom_win
  [0,4,8], #top_left_bot_right_diagonla_win
  [2,4,6]  #top_right_bot_left_diagonla_win
]

def won?(board)
  WIN_COMBINATIONS.each { |win_com|
  if(win_com.all? {|index| board[index] == "X" || board[index] == "x"})
    return win_com
  elsif(win_com.all? {|index| board[index] == "O" || board[index] == "o"})
    return win_com
  end
  }
  return false
end

def full?(board)
  board.each { |element|
    if( element == nil || element == " " || element == "")
      return false
    end
  }
  return true
end

def draw?(board)
  if(full?(board) && !won?(board))
    return true
  end
end

def over?(board)
  if((full?(board) && won?(board)) || draw?(board))
    return true
  end
end

def winner(board)
  WIN_COMBINATIONS.each { |win_com|
  if(win_com.all? {|index| board[index] == "X" || board[index] == "x"})
    return "X"
  elsif(win_com.all? {|index| board[index] == "O" || board[index] == "o"})
    return "O"
  end
  }
  return nil
end
