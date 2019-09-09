# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

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

#def won?(board) 
#  if 
#  WIN_COMBINATIONS.each do |win_combo_array|
#    win_combo_array.each do |win_combo_element|
#      win_index_1 = win_combo_element[0]
#      win_index_2 = win_combo_element[1]
#      win_index_3 = win_combo_element[2]
#    
#      position_1 = board[win_index_1]
#      position_2 = board[win_index_2]
#      position_3 = board[win_index_3]
#    
#      if position_1 == "X" && position_2 == "X" && position_3 == "X"
#        win_combo_array
#      else
#        false
#      end
#    end
#  end
#end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|item| item == "X" || item == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  end
end