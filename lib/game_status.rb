#require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  #horizontal wins
   [0,1,2],
   [3,4,5],
   [6,7,8],

  #vertical wins
   [0,3,6],
   [1,4,7],
   [2,5,8],
  
  #diagonal wins
   [0,4,8],
   [2,4,6]
    
  ] #closes WIN_COMBINATIONS array
  
def won? (board)
  WIN_COMBINATIONS.find do |combo|
    #binding.pry
    board[combo[0]] == board[combo[1]] && #=> true
    board[combo[1]] == board[combo[2]] && # true
    position_taken?(board, combo[0]) #true
    
    #returns the winning combination (see list above)
  end
end  
  
def full? (board)
  
  #method should:
  #return true if board is full and there's a draw
  #return false if game is still in progress and there are spaces available


  board.none? {|index| index == " "}
  
  
  
  #Less-efficient code. High-level iterators are better.
  # no_match = true
  #     board.each do |index|
  #           if index == " "
  #             no_match = false
  #           end
  #     end  
  # return no_match    
  
end #ends #full? (board)


def draw? (board)
  
  #returns *true* if the board has not been won and is full
  if ( won?(board) == nil ) && ( full?(board) == true )
    return true
  end  
    
  #returns *false* if the board is not won and not full
  if ( won?(board) == nil ) && ( full?(board) == false ) 
      return false
  end
  
  #returns *false* if the board is won
  if won?(board) != nil
      return false
  end  
  
end  

def over? (board)
  #returns *true* if the board has been won, is a draw or full
  
  if ( won?(board) != nil ) || ( draw?(board) == true ) || ( full?(board) == true )
    return true
  
  else
    return false
  
  end  
end  

def winner (board)
  
  #won?(board) is only method to return non-boolean value, so it must be the method hinted at in instructions.
  #won?(board) will return an array with three values (created in the WIN_COMBINATIONS above)
  #set a new array to hold this new flat array for personal clarity
  
  winning_combo = ( won?(board))
  
  
  
  
  #if winning_combo is not nil, that means a winning combination exists (and that one team must have won the game.) 
  
  if winning_combo != nil

      # winning_combo[x] (only 0, 1 and 2 will work because this array is only 3 units long) will have a value that indicates a location on... 
      #...the board array that helped the respective team win.
      
      #by calling this value inside board (i.e. indexing board), it will search the board array and...  
      #...return the value (X, O, or nil/" ") that occupies this winning combination
      
      #if it is equal to "X" that means the X team won.
      
      #same logic applies to first elsif statement for "O"
      if ( board[winning_combo[0]] == "X" )
        return "X"
      
      elsif ( board[winning_combo[0]] == "O" ) 
        return "O"
        
       end  
  
  #if winning_combo is nil, that means it was a draw and there is no winner.
  else
    return nil
  end  

end  