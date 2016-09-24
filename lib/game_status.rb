# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)

WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X"  && position_2 == "X"  && position_3 == "X"
      return win_combination
  elsif position_1 == "O"  && position_2 == "O"  && position_3 == "O"
   return win_combination

  end
 end
    false  # false is out of the loop becasue when we use each it return the array at the end after returning whatever
 end            #  we wanted to return ...so false is outside becasue if none of the confitions work then give falselear

def full?(board)
  board_full = true
  board.each do |index|
    if index == "" || index == " "
     board_full = false
end
end
board_full
end

def draw?(board)
 if !(won?(board)) && full?(board)
   true
 elsif !(won?(board) && full?(board))
   false
 else
   false

 end

end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    true
end
end

def winner(board)
  won = won?(board)
  if won != false
    return board[won[0]]
end
nil
end
