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
   WIN_COMBINATIONS.find do |combination_array|
    if combination_array.all? do |index|
         board[index]=="X"
       end
         true
    elsif combination_array.all? do |index|
            board[index]=="O"
          end
           true
    else
       false
    end
  end
end


def full?(board)
  if board.any? do |index|
    index == " " || index == "" || index == nil
    end
    return false
  else
    return true
  end
 end


 def draw?(board)
   if full?(board) && won?(board)
     return false
   elsif full?(board) && !won?(board)
     return true
   end
 end


 def over?(board)
   if draw?(board) || full?(board) || won?(board)
     return true
   else
     return false
   end
 end

 def winner(board)
   if over?(board)
     winning_array = won?(board)
     current_position = winning_array[0]
     current_winner = board[current_position]
     return current_winner
   else
     nil
   end


 end
