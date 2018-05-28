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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo[0]) &&
       position_taken?(board, combo[1]) &&
       position_taken?(board, combo[2]) &&
       board[combo[0]] == board[combo[1]] &&
       board[combo[1]] == board[combo[2]]
      return combo
    end
  end
  return false
end

def full?(board)
  return !board.any?{|c| c == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  combo = won?(board)
  
  if combo
    return board[combo[0]]
  end
  return nil
end


