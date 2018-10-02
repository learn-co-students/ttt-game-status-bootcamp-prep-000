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
  for i in WIN_COMBINATIONS 
    if (board[i[0]] == 'X' && board[i[1]] == 'X' && board[i[2]] == 'X') || (board[i[0]] == 'O' && board[i[1]] == 'O' && board[i[2]] == 'O')
      return i
    end
  end
  return false 
end

#i is the win combination - singular, with 3 indexes. 

def full?(board)
  for x in board 
    if x == " "
      return false
    end
  end
  return true
end 

def draw?(board)
 !won?(board) && full?(board)
end  

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
   winning_combination = won?(board) 
    if winning_combination
      return board[winning_combination[0]]
    end
end 
  