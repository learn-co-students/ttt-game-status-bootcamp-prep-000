# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS=[
  [0,1,2], #top horizontal win
  [3,4,5], #Middle horizontal win
  [6,7,8], #Bottomr horizontal win
  [0,3,6], #Left Vert win
  [1,4,7], #Middle Vert win
  [2,5,8], #Right Vert Win
  [0,4,8], #Diagonal win
  [2,4,6] #Diagonal win
]

  def won?(board)
     WIN_COMBINATIONS.detect do |combo|
       board[combo[0]] == board[combo[1]] &&
       board[combo[1]] == board[combo[2]] &&
       position_taken?(board, combo[0])
     end
   end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)

   if (full?(board) && !won?(board))
      true
   else
      false
   end
 end


 def over?(board)
    won?(board) || draw?(board) || full?(board)
  end

def winner(board)
   WIN_COMBINATIONS.each do |win_combination|
  if board [win_combination[0]] == "X" && board [win_combination[1]] == "X" && board [win_combination[2]] == "X"
   return "X"
  elsif board [win_combination[0]] == "O" && board [win_combination[1]] == "O" && board [win_combination[2]] == "O"
  return "O"
  else
   end
  end
  nil
 end
