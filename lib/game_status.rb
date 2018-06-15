# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Botton row
  
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  
  [0, 4, 8], # Left diagonal
  [2, 4, 6] # Right diagonal
]


def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3] 
    
    if (position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)) && (position_1 == position_2) && (position_2 == position_3) && (position_1 == position_3)
      return combo
    end
  end
  return false
end

def full?(board)
  is_full = board.all? do |index|
    (index == "X" || index == "O")
  end
  return is_full
end

def draw?(board)
  return (!won?(board) && full?(board))
end

def over?(board)
  return (won?(board) || full?(board) || draw?(board))
end

def winner(board)
  if(over?(board) && won?(board))
    combo = won?(board)
    return board[combo[0]]
  else
    return nil
  end
end