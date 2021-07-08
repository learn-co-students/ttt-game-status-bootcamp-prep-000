# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [6,4,2], # Diagonal left bottom to right Top
  [0,4,8]  # Diagonal left top to right bottom
]

def won?(board)
  
  def winning_combo?(combination)
    combination.all? {|position| position == "X"} || combination.all? {|position| position == "O"}
  end
  
  WIN_COMBINATIONS.detect do |win_combination|
    # Get index for each winning combination
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    # Get board position at each winning index position
    # so we can compare
    board_position_1 = board[win_index_1]
    board_position_2 = board[win_index_2]
    board_position_3 = board[win_index_3]
    
    board_combination = [board_position_1, board_position_2, board_position_3]
    
    winning_combo?(board_combination)
  end
end

def full?(board)
  # Return false if there are any empty spaces
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    winning_positions = [board[win_index_1], board[win_index_2], board[win_index_3]]
    
    if winning_positions.all? {|position| position == "X"}
      return "X"
    elsif winning_positions.all? {|position| position == "O"}
      return "O"
    end
  end
end