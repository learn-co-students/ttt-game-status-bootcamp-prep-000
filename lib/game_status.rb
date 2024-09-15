require 'pry'

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
  [0,4,8], # Diagonal
  [2,4,6]  # Diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do | win_combination |
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    end
    
  end
  return false
end

def full?(board)
  return board.all? do | spot |
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  return true if full?(board) && !won?(board)
  return false if !full?(board) && !won?(board)
  return false if won?(board)
end

def over?(board)
  return true if full?(board) || won?(board) || draw?(board)
  return false
end

def winner(board)
  return nil if won?(board) == false
  winning_array = won?(board)
  return board[winning_array[0]]
end


