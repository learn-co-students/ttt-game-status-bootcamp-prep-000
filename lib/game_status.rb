# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = ["X", " ", "X", " ", " ", " ", " ", " ", " "]

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

   winner = ""
   counter = 0
   index_count = -1
   winning_index = -1
   winning_array = []
   WIN_COMBINATIONS.each do |win_combination|

     while counter < 3 && winner !="XXX" do
       win_combination.each do |token|
         winner += board[token]
         counter += 1
       end
     end
     index_count += 1
     if winner === "XXX" || winner === "OOO"
       winning_index = index_count
       winning_array.push(winner)
     end
     winner = ""
     counter = 0
   end
   if winning_index === -1
    return false
   else return WIN_COMBINATIONS[winning_index]
   end
   if full?(board)
     return false
   end
 end

 def full?(board)
   board.none?{|token| token === " "}
 end

 def draw?(board)
   WIN_COMBINATIONS.each do |win_combination|
     if won?(board) === win_combination
       puts "SOMEBODY WON YOU FOOL!"
       return false
     end
   end
   full?(board)
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
   if won?(board) == false
     return nil
   end
   if board[won?(board)[0]] === "X"
     return "X"
   elsif board[won?(board)[0]] === "O"
     return "O"
   end
 end
