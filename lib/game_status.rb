# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row 
  [3, 4, 5], #Middle row
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
  [0, 4, 8], #Left diagonal
  [2, 4, 6]  #Right diagonal 
]

def won?(board)
  # WIN_COMBINATIONS.each do |win_combination|
  #   win_index_1 = win_combination[0]
  #   win_index_2 = win_combination[1]
  #   win_index_3 = win_combination[2]
    
  #   position_1 = board[win_index_1]
  #   position_2 = board[win_index_2]
  #   position_3 = board[win_index_3]
    
  #   if position_taken?(board, win_index_1) && position_1 == position_2 && position_2 == position_3
  #     return win_combination
  #   end
  # end
  # false
  
  # A different method using find instead of each 
  # WIN_COMBINATIONS.detect do |win_combination|
  #   win_index_1 = win_combination[0]
  #   win_index_2 = win_combination[1]
  #   win_index_3 = win_combination[2]
    
  #   position_1 = board[win_index_1]
  #   position_2 = board[win_index_2]
  #   position_3 = board[win_index_3]
    
  #   position_taken?(board, win_index_1) && position_1 == position_2 && position_2 == position_3
  # end
  
  # Use destructuring
  WIN_COMBINATIONS.detect do |i, j, k|
    positions = [i, j, k].map { |p| board[p] }
    position_taken?(board, i) && positions.all? { |p| p == positions[0] }
  end
end

def full?(board) 
  board.all? { |position| !(position.nil? || position == " ") }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  win = won?(board)
  board[win[0]] if win
end