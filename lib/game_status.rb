# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

# #if board if grid like this
# __0__|__1__|__2__
# __3__|__4__|__5__
#   6  |  7  |  8

#remember to -1 all cell nums for index
#winning combos are when X or O fills:
# Horizontals: *0,1,2 *3,4,5 *6,7,8 
# Verticals: *0,3,6 *1,4,7 *2,5,8
# Diagonals: *6,4,2 *0,4,8

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], 
[2,5,8], [6,4,2], [0,4,8]]

def won? (board)
  WIN_COMBINATIONS.each do |combo|
    
    win_index_1 = combo[0] # 0
    win_index_2 = combo[1] # 3 
    win_index_3 = combo[2] # 6
    pos_1 = board[win_index_1] #board[0]
    pos_2 = board[win_index_2] #board[3]
    pos_3 = board[win_index_3] #board[6]
    
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return combo
    end
  end
  false
end

def full? (board)
  #should return true IF all elements have X or O
  all_filled = board.all? { |cell| cell == "X" || cell == "O"}
    if all_filled == true
    return true
  else
    false
  end
end

def draw? (board)
#returns true IF board !won? && board = full
#meaning returns false IF won?
#returns false IF !won? && !full
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif !won?(board)
    false
  end
end

def over?(board)
  if (won?(board) && full?(board)) || (won?(board) && !full?(board)) || draw?(board)
  true
  else
  false
  end
end
  
def winner(board)
  #won? returns array of numbers
  #Need to take this array of indexes and iterate through it to see if board at those indexes equals X
  if won?(board) && won?(board).all? {|ele| board[ele] == "X"}
    return "X"
  elsif won?(board) && won?(board).all? {|ele| board[ele] == "O"}
    return "O"
  end
  nil
end