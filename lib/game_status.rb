# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  if board == [" "," "," "," "," "," "," "," "," "]
      return false
  else
    for win_combo in WIN_COMBINATIONS
    #puts win_combo[0] == board.index(board[win_combo[0]])
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      pos_1 = board[win_index_1]
      pos_2 = board[win_index_2]
      pos_3 = board[win_index_3]

      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return win_combo
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return win_combo
      end
    end
    return false
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  !won?(board) && full?(board) ? true : false
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  if over?(board) && board[won?(board)[0]] == "X" && board[won?(board)[1]] == "X" && board[won?(board)[2]] == "X"
    return "X"
  elsif over?(board) && board[won?(board)[0]] == "O" && board[won?(board)[1]] == "O" && board[won?(board)[2]] == "O"
    return "O"
  else
    return nil
  end
end
