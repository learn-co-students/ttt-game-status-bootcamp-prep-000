# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  winning_array = []
  WIN_COMBINATIONS.each do |wincombo|
    if board[wincombo[0]] == "X" && board[wincombo[1]] == "X" && board[wincombo[2]] == "X"
      return wincombo
    elsif board[wincombo[0]] == "O" && board[wincombo[1]] == "O" && board[wincombo[2]] == "O"
      return wincombo
    else
      winning_array = nil
    end
  end
  return winning_array
end

def full?(board)
  full_board = board.none? do |index|
    index == " "
  end
  return full_board
end

def draw?(board)
  if won?(board) != nil
    return FALSE
  elsif full?(board) == TRUE
    return TRUE
  else
    return FALSE
  end
end

def over?(board)
  if won?(board) != nil
    return TRUE
  elsif draw?(board) == TRUE
    return TRUE
  else
    return FALSE
  end
end


def winner(board)
  WIN_COMBINATIONS.each do |wincombo|
    if board[wincombo[0]] == "X" && board[wincombo[1]] == "X" && board[wincombo[2]] == "X"
      return "X"
    elsif board[wincombo[0]] == "O" && board[wincombo[1]] == "O" && board[wincombo[2]] == "O"
      return "O"
    else
    
    end
  end
  return nil
end