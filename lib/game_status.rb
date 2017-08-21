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
  [6,4,2]
]

def won?(board)
  final = []
  WIN_COMBINATIONS.each do |row|
    if board[row[0]] == "X" && board[row[1]] == "X" && board[row[2]] == "X"
      final << row
    elsif board[row[0]] == "O" && board[row[1]] == "O" && board[row[2]] == "O"
      final << row
    end
  end

  if final.empty?
    return false
  else
    return final[0]
  end

end

def full?(board)
  return true if board.none?{|el| el == " "} && !won?(board)
end

def draw?(board)
  if full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  return true if draw?(board)
  return true if full?(board)
  return true if won?(board)
  return false
end

def winner(board)
  winning_row = won?(board)
  return nil if winning_row == false
  return "O" if board[winning_row[0]] == "O"
  return "X" if board[winning_row[0]] == "X"

end
