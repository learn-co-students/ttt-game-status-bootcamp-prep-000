# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [2, 4, 6],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]

def won?(board)
           WIN_COMBINATIONS.each do |wins|
            if wins.all?{|win_index| 
              board[win_index] == "X"} ||  
              wins.all?{|win_index| 
                board[win_index] == "O"}
                return wins
              end
              end
              return false
          end
          
def full?(board)
    board.all? {|index| index == "X" || index == "O"}
  end

def draw?(board)
  if full?(board) == true &&
    won?(board) == false 
    return true 
  end
end 

def over?(board)
  if won?(board) && !full?(board) ||
    draw?(board) == true ||
    full?(board) == true 
    return true 
  else 
    return false 
  end 
    end

def winner(board)
   x = board.select {|x| x == "X"}
   o = board.select {|o| o == "O"}
   
   if won?(board)  &&
     x.length > o.length 
     return "X"
   elsif won?(board) &&
     o.length > x.length
     return "O"
   else 
     nil 
 end
end