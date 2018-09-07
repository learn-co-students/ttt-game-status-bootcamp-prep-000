# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
    # Horizontal Rows
    [0,1,2],
    [3,4,5],
    [6,7,8],
    
    # Vertical Rows
    [0,3,6],
    [1,4,7],
    [2,5,8],
    
    # Diagonal Rows
    [0,4,8],
    [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    holder = []
    combination.each do |space|
      holder << board[space]
    end
    if holder[0] == holder[1] && holder[0] == holder[2] && holder[0] != " "
      return combination
      break
    end
  end
  FALSE
end


def full? (board)
  !board.include?(" ")
end

def draw? (board)
  if won?(board)
    return FALSE
  elsif full?(board)
      return TRUE
  else
      return FALSE
  end
end

def over? (board)
  if won?(board) || draw?(board) || full?(board)
    return TRUE
  else
    return FALSE
  end
end

def winner (board)
  if won?(board).is_a?(Array)
    return board[won?(board)[0]]
  end
end