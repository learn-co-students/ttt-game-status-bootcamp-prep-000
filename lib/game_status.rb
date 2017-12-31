# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]  # M,iddle row
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination
    end
  end
  false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if won?(board) == false && full?(board)
    true
  else
    false
  end
end

def winner(board)
  value = won?(board)
  if value != false
    board[value[0]]
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
   true
  else
    false
  end
end
