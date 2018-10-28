# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=
[
  [0,1,2], #top row [0]
  [3,4,5], #middle row [1]
  [6,7,8], #bottom row [2]
  [0,4,8], #diagonal left to right [3]
  [2,4,6], #diagonal right to left [4]
  [0,3,6], #left column [5]
  [1,4,7], #middle column [6]
  [2,5,8]  #right column [7]
]



def won?(board)
  WIN_COMBINATIONS.detect do |win_indexes_array|
    index_one=win_indexes_array[0]
    index_two=win_indexes_array[1]
    index_three=win_indexes_array[2]
      if board[index_one]=="X" && board[index_two]=="X" && board[index_three]=="X"
      return win_indexes_array
      elsif board[index_one]=="O" && board[index_two]=="O" && board[index_three]=="O"
      return win_indexes_array
      else
          false
    end
  end
end



def full?(board)
  board.all? do |x|
    if x=="X" || x=="O"
      true
    else
      false
    end
  end
end



def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end



def over?(board)
  if draw?(board)
    true
  elsif won?(board) && full?(board)
    true
  elsif won?(board) && !full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end
