# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #top row win
[3,4,5], #middle row win
[6,7,8], #bottom row win
[0,3,6], #leftmost win
[1,4,7], #middle win
[2,5,8], #rightmost win
[0,4,8], #left-to-right win
[2,4,6]  #right-to-left win
]

def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end

  WIN_COMBINATIONS.detect do |i|
    index_1 = i[0]
    index_2 = i[1]
    index_3 = i[2]
    if board[index_1] == "X" && board[index_2] == "X" && board[index_3] == "X" ||
       board[index_1] == "O" && board[index_2] == "O" && board[index_3] == "O"
         true
      else
         false
        end
    end
end
def full?(board)
  board.none? do |index|
    index == " "
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) == true || full?(board) == true
      true
  else
      false
    end
end

def winner(board)
  if won?(board) == nil
    return nil
  end
  index_check = won?(board)[0]
  board_check = board[index_check]
  if board_check == "X"
    return "X"
  elsif board_check == "O"
    return "O"
  end
end
