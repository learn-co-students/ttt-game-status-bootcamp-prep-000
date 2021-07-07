# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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
   board.any?{|token| (token === "X" || token === "O")}

   WIN_COMBINATIONS.each do |win_combination|
     win_combination.each do |win_index|
       position_1 = win_combination[win_index]
       position_2 = win_combination[win_index]
       position_3 = win_combination[win_index]
       if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination[win_index]
       else
         false
       end
     end
   end
   if full?(board)
     return false
   end
 end

 def full?(board)
   board.none?{|token| token === " "}
 end

 def draw?(board)
   if full?(board) === true
     return true
   end
 end

 def over?(board)
   if draw?(board)
     return true
   end
   if won?(board)
     return true
   end
 end

 def winner(board)
   if draw?(board)
     return nil
   end
 end
