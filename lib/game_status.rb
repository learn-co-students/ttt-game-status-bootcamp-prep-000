# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]


def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    position_1 = win_combo[0]
    position_2 = win_combo[1]
    position_3 = win_combo[2]
    
    if (board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X") || (board[position_1] =="O" && board[position_2] == "O" && board[position_3] == "O")
    return win_combo
    
   end
  end
  return false 
end

def full?(board)
  board.none? {|i| i == " " || i == ""}
end

def draw?(board)
  if (full?(board) == true && won?(board) == false) 
    return true
  end
end

def over?(board)
 
  if (won?(board) != false || full?(board) == true || draw?(board) == true)
    return true
  end
end

def winner(board)
  if (won?(board) != false)
    won?(board).each do|winner|
    if (board[winner] == "O")
      return "O"
    end
    return "X"
  end
 end
end