# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
top_row_win=[0,1,2]
middle_row_win=[3,4,5]
bottom_row_win=[6,7,8]
first_column_win=[0,3,6]
second_column_win=[1,4,7]
third_column_win=[2,5,8]
left_diagnol_win=[2,4,6]
right_diagnol_win=[0,4,8]

WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]

def won? (board)
WIN_COMBINATIONS.each do |win_combination|
  win_index_1=win_combination[0]
  win_index_2=win_combination[1]
  win_index_3=win_combination[2]

  position_1=board[win_index_1]
  position_2=board[win_index_2]
  position_3=board[win_index_3]

  if position_1=="X"&& position_2=="X" && position_3=="X"
    return win_combination
  elsif position_1=="O"&& position_2=="O" && position_3=="O"
    return win_combination
  end
end
 return false
end

def full? (board)
  board.all? do |spaces|
    spaces=="X"||spaces=="O"
  end
end

def draw? (board)
  if full?(board)==true && won?(board)==false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board).class==Array||draw?(board)==true||full?(board)==true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board).class==Array
    return board [won?(board)[0]]
  end
end
