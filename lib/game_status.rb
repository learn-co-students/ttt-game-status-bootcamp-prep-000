# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  winning_positions = nil

  WIN_COMBINATIONS.each do |combination|
    c1 = combination[0]
    c2 = combination[1]
    c3 = combination[2]
    
    if(position_taken?(board, c1))
      b1 = board[c1]
      b2 = board[c2]
      b3 = board[c3]
    
      row_symbol = b1
      if row_symbol == b2 && row_symbol == b3
        winning_positions = combination        
      end
    end
  end
  
  return winning_positions
end

def full?(board)
  (0..8).all? do |index|
    position_taken?(board, index)
  end
end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  winning_positions = won?(board)
  if(winning_positions)
    return board[winning_positions[0]]
  else
    return nil
  end
end
