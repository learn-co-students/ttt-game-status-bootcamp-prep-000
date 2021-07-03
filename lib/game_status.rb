# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
 WIN_COMBINATIONS.each do |combos|
  if ((board[combos[0]] == "X" && board[combos[1]] == "X" && board[combos[2]] == "X") ||
    (board[combos[0]] == "O" && board[combos[1]] == "O" && board[combos[2]] == "O"))
     return combos
   end
 end
 return false
end

def full?(board)
  board.none? {|characters| characters == " "}
end

def draw?(board)
  if full?(board)
     if won?(board)
       return false
     else
       return true
     end
   else
    return false
  end
end

def over?(board)
  (draw?(board) || won?(board) || full?(board))?
  true : false
end

def winner(board)
  if won?(board)
    (board[won?(board)[0]] == "X")?
    "X" : "O"
  else
    nil
  end
end
