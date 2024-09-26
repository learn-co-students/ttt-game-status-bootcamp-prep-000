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
  [0,4,8], # Diagonal from top left to bottom right
  [2,4,6]  # Diagonal from top right to bottom left
  ]
  
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  FALSE
end

def full?(board)
  board.none?{|item| item.nil? || item == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    TRUE
  elsif !won?(board) && !full?(board)
    FALSE
  else
    FALSE
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board).kind_of?(Array)
    TRUE
  else
    FALSE
  end
end

def winner(board)
  winning_array = won?(board)
  
  if winning_array.kind_of?(Array)
    board[winning_array[0]]
  else
    nil
  end
end