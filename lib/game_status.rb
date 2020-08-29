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
  WIN_COMBINATIONS.any? do |win|
    index_1 = win[0]
    index_2 = win[1]
    index_3 = win[2]
    
    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win
    else
      false
    end
  end
end

def full?(board)
  board.all? do |move|
    move == "X" || move == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || (!won?(board) && full?(board)) || full?(board)
    return true
  end
end

def winner(board)
  winningCombo = won?(board)
  if winningCombo
    if winningCombo.any? {|win| board[win] == "X"}
      return "X"
    else 
      return "O"
    end
  end
end 