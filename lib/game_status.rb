# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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





def won?(array)
  WIN_COMBINATIONS.each do   |element| 
    if ( ( (array[(element[0])] == "X") ) && ( (array[(element[1])]  == "X") ) && ( (array[(element[2])]  == "X") ) )
      return [ element[0], element[1], element[2] ]
    elsif ( ( (array[(element[0])] == "O") ) && ( (array[(element[1])]  == "O") ) && ( (array[(element[2])]  == "O") ) )
      return [ element[0], element[1], element[2] ]
    end
  end
  return false        # I think return false works here.  else return false @ end of the block did not work
end








def full?(array)
  array.none? do |position|  (position == " " || position == "  " || position == "" )
  end
end




def draw?(array)
  if (full?(array) == true) && ( won?(array) == false) 
    return true
  else 
    return false
  end
end


# Error  : returns true for a won game when the board is not full
# Should return true for won? whether board full or not. 
# Control flow issue.   was: if(full) == t || (won?) == t. changing order. 
# Changing order did not matter. 
# ITS BECAUSE WON? DOESN'T RETURN TRUE, IT RETURNS AN ARRAY!  WHY?!!



def over?(array)
  if won?(array) != false 
    return true
  elsif (full?(array) == true) && (won?(array) == false)
    return true
  else 
    return false
  end
end 






#return nil if no winner

def winner(array)

  win_x_combo = nil
  win_o_combo = nil
  xs = []
  os = []

    def x_extractor_helper(array, index)  
      array.select.with_index.select do |j, index|     
        j == "X" || j == " X "
      end
    end

    def o_extractor_helper(array, index)  
      array.select.with_index.select do |j, index|      #// or each_with_index
        j == "O" || j == " O "
      end
    end

    def array_dividing_helper_method(array)     # need to go a level deeper in array to access ["a", 1] ?!
      output_array = []
      array.each do  | index0 |
        output_array << index0[1]         # need output_array to be local variable??! 
      end 
      #end            # OLD ending to array_dividing_helper_method
      return output_array
    end             # ends array_dividing_helper_method


  xs = array_dividing_helper_method(x_extractor_helper(array, array))
  os = array_dividing_helper_method(o_extractor_helper(array, array))

  WIN_COMBINATIONS.each do |combo|
      #os.all?          # Instead, try "os contains WIN_COMBINATIONS[i][0] and WIN_COMBINATIONS[i][1] and [i][2] "
    if ( ( xs.include?(combo[0]) ) && ( xs.include?(combo[1]) ) )       # was win_x_combo, not xs
      if  ( xs.include?(combo[2]) )
        #puts "Winning X Combo is  #{combo}    "
        win_x_combo = combo
        #return combo
      else puts "No x Win Combination. current combo is #{combo}"
      end
    end
  end
  
  WIN_COMBINATIONS.each do |combo|
    if ( ( os.include?(combo[0]) ) && ( os.include?(combo[1]) ) )     
     if  ( os.include?(combo[2]) )
       #puts "Winning O Combo is  #{combo}    "
           win_o_combo = combo
           #return combo
         #else puts "No o Win Combination"
     end
    end
  end  


  if ( win_x_combo != nil )
    puts " X Won!"
    return "X"
  end

  if ( win_o_combo != nil )
    puts " O Won!"
    return "O"
  else puts ("No winner") and
    return nil
  end


end   # ends WINNER?


