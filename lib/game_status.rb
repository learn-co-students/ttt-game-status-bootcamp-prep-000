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
  WIN_COMBINATIONS.each do |comb|
    if (board[comb[0]] == "X" && board[comb[1]] == "X" && board[comb[2]] =="X") ||
      (board[comb[0]] =="O" && board[comb[1]] == "O" && board[comb[2]] =="O")
      return comb
    end
  end
  return false
end
 
def full?(board)
 full = board.all? do |square|
    ["X","O"].include?(square)
  end
  return full
end
  
def draw?(board)  
  if full?(board) && !won?(board)
    return TRUE
  else return false
  end  
end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return TRUE
  else false
  end
end

def winner(board)
  winner = won?(board)
  if winner
    return board[winner[0]]
  else return nil
  end
end