# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  #Top row
  [0, 1, 2],
  #Middle row
  [3, 4, 5],
  #bottom row
  [6, 7, 8],
  #left Column
  [0, 3 ,6],
  #Middle Column
  [1, 4, 7],
  #Right Column
  [2, 5, 8],
  #Diagonal 1
  [0, 4, 8],
  #Diagonal 2
  [2, 4, 6]
  ]
  
def won? (board)
 #Iterates through winning combinations list
  WIN_COMBINATIONS.each do |combination|
    
    #creates counters which reset with every new combination
    x_count = 0
    o_count = 0
    
    #iterates through every combation
     combination.each do |space|
       #checks to for matching X
       if  board[space] == "X"
         x_count += 1
         
        #checks for Matching O 
         elsif board[space] == "O"
         o_count += 1
       end
       
       #checks to see if there is 3 matches of either kind
       if (x_count == 3 || o_count ==3)
         return combination
       end
    end 
  end
  return false
end


def full? (board)
board.all? do |space|
  space == "X" || space == "O"
end 
end 


def draw?(board)
  if won?(board)
    return false
    elsif full?(board)
    return true 
  end 
end 

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
end 
end 

def winner(board)
  combination = won?(board)
  if combination == false
    return nil
  elsif board[combination[1]] == "X"
    return "X"
  else 
    return "O"
  end 
end 
  


      
      
