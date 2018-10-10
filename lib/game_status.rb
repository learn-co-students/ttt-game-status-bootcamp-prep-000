def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = 
[
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
  WIN_COMBINATIONS.detect do |win_combination|
  if
      board[win_combination[0]] == "X" &&
      board[win_combination[1]] == "X" &&
      board[win_combination[2]] == "X"
    won = win_combination
  elsif
      board[win_combination[0]] == "O" &&
      board[win_combination[1]] == "O"  &&
      board[win_combination[2]] == "O"
    won = win_combination
  else
    won = false
  end
won 
end
end

def full?(board)  
board.none?{|i| i == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !full?(board) && !won?(board)
    false
  else 
    false
end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    true
  end
end

def winner(board)
 if won?(board)
   winner = won?(board)[0]
   board[winner]
 end
end


  