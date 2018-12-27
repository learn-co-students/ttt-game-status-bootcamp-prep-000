# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #mid row
  [6, 7, 8], #bottom row
  [0, 3, 6], #column 1
  [1, 4, 7], #column 2
  [2, 5, 8], #column 3
  [0, 4, 8], #diag start L
  [2, 4, 6] #diag start R
]

=begin
  top_row_win = WIN_COMBINATIONS[0]
  mid_row_win = WIN_COMBINATIONS[1]
  bot_row_win = WIN_COMBINATIONS[2]
  left_col_win = WIN_COMBINATIONS[3]
  mid_col_win = WIN_COMBINATIONS[4]
  right_col_win = WIN_COMBINATIONS[5]
  left_diag_win = WIN_COMBINATIONS[6]
  right_diag_win = WIN_COMBINATIONS[7] 
=end   

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_one = win_combination[0]
    win_index_two = win_combination[1]
    win_index_three = win_combination[2]
  
    position_one = board[win_index_one]
    position_two = board[win_index_two]
    position_three = board[win_index_three]
    if position_one == "X" && position_two == "X" && position_three == "X" || position_one == "O" && position_two == "O" && position_three == "O"
      return win_combination
    end  
  end
  else
      return false
end

#position taker helper method?
def full?(board)
  board.all? do |char|
    char == "X" || char == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false 
    return true
  end
end

def winner(board)
  won = won?(board) #won = WIN-COM[won[1, 2, 3]
  if won != false
    return board[won[0]]
  end
end