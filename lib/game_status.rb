# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board(board)

  line = "-----------"
  print " #{board[0]} | #{board[1]} | #{board[2]} \n"
  puts line
  print " #{board[3]} | #{board[4]} | #{board[5]} \n"
  puts line
  print " #{board[6]} | #{board[7]} | #{board[8]} \n"

end



def full?(board)
  board.all? { |letter| !(letter == nil || letter == " ")}
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [2,4,6], [0,4,8], [0,3,6], [1,4,7], [2,5,8]]

def won?(board)

  i=0
  while i < 8
     if board[WIN_COMBINATIONS[i][0]] == "O" && board[WIN_COMBINATIONS[i][1]] == "O" && board[WIN_COMBINATIONS[i][2]] == "O" ||
         board[WIN_COMBINATIONS[i][0]] == "X" && board[WIN_COMBINATIONS[i][1]] == "X" && board[WIN_COMBINATIONS[i][2]] == "X"
       #print WIN_COMBINATIONS[i]
       return WIN_COMBINATIONS[i]
     end
     i += 1
  end

end

def draw?(board)
  if full?(board) and !(won?(board))
    return true
  end
end

def over?(board)
  if won?(board) or draw?(board)
    return true
  end
end

def winner(board)
  if !(won?(board))
    return nil
 elsif board[won?(board)[0]] == "O"
   return  "O"
 else
   return  "X"
 end
end
