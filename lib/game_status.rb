# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
def won?(board)
 WIN_COMBINATIONS.each do |win_index| #interates thru list of win combinations array

   x_win = win_index.all? do |spot| #interates thru individual win array

     board[spot] == "X"

   end

   o_win = win_index.all? do |spot|

     board[spot] == "O"

   end

        if x_win || o_win

          return win_index

        end
    end
  else
    false
end


WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #left diagnonal win
  [2,4,6], #right diagonal win
]

def full?(board)
  !board.find { |i| i == " " || i == ""}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board);
end

def winner(board)
 won = won?(board)
  if won
   return board[won[0]]
 end
end
