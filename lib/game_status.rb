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
  WIN_COMBINATIONS.each do |wincombo|
    win_index_1 = wincombo[0]
    win_index_2 = wincombo[1]
    win_index_3 = wincombo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return wincombo
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return wincombo
    end
  end
  return false
end

def full?(board)
  return board.all? {|pos| pos == "X" || pos == "O"}
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  end
  return false
end

def over?(board)
  if (won?(board) || full?(board))
    return true
  end
  return false
end

def winner(board)
  if (won?(board))
    winner = board[won?(board)[0]]
    return winner
  end
end