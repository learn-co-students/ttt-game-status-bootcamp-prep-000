# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top
  [3,4,5], # Middle
  [6,7,8], # Bottom
  [0,4,8], # L->R diag 
  [2,4,6], # R->L diag 
  [0,3,6], # L column
  [1,4,7], # Centre column
  [2,5,8]  # R column
  ]

def won?(board)
  #No X or O = Empty -> return false 
  if !(board.include?("X") || board.include?("O"))
    return false
  else #there are values! check for winners
    #start with exit
    puts WIN_COMBINATIONS.select do |combos|
      var x = 0 
      var o = 0
      
      combos.all? do |position|
        if board(position) == "X"
          x += 1
          if x == 3
            return true
          end
        elsif board(position) == "O"
          o += 1
          if o == 3
            return true
          end
        elsif board(position) != "O" && board(position) != "X" 
        #if neither then can't win
          return false
        else 
          return false
        end
      end
    end
  end
end
