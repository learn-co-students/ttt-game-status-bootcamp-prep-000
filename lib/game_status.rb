# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS =  [[0,1,2],   #top_row_win[0,1,2]
					[3,4,5],   #middle_row_win[3,4,5]
					[6,7,8],   #bottom_row_win[6,7,8]
					[0,3,6],   #left_column_win[0,3,6]
					[1,4,7],  #middle_column_win[1,4,7
					[2,5,8],   #right_column_win[2,5,8]
					[0,4,8],   #left_diagonal_win[0,4,8]
					[2,4,6]] #right_diagonal_win[2,4,6]
	

def won?(board)

WIN_COMBINATIONS.each do |win_combination|

	win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    
    
 	 
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  
  
  

  			if 		position_1 == "X" && 
  					position_2 == "X" &&
  				    position_3 == "X" 
  				    
		  		 	#(position_4 == "X" && position_5 == "X" && position_6 == "X") || 
		  			#(position_7 == "X" &&  position_8 == "X")
    	return win_combination
    	
    elsif           position_1 == "O" && 
  					position_2 == "O" &&
  				    position_3 == "O" 
    	  	  return win_combination 
    	  	  
    	  	else false
		end
	end
		
	
		if position_taken?(board, 0)
			return false
		

		end
end

def full?(board)
	if position_taken?(board, 1)
	return true
	#else  return draw?(board)
		
	end
end


def draw?(board)
 if !won?(board) && full?(board)
 	return true
 elsif !won?(board) && !full?(board)
 	return false
 elsif won?(board)
 	return false
 		
 end
end

def over?(board)
	if won?(board) 
	return true
elsif draw?(board)
	return true
elsif full?(board)
	return true
else return false
		
		
	end
end

def winner(board)
  position = []
  position = won?(board)
  if !won?(board)
  	return nil
elsif board[position[2]] == "X"
      return "X"
  else return "O"
  
      	end
	end

#win_index_4 = win_combination[3]
    #win_index_5 = win_combination[4]
    #win_index_6 = win_combination[5]
	#win_index_7 = win_combination[6]
    #win_index_8 = win_combination[7]




#position_4 = board[win_index_4] # load the value of the board at win_index_1
  #position_5 = board[win_index_5] # load the value of the board at win_index_2
  #position_6 = board[win_index_6]
  #position_7 = board[win_index_7] # load the value of the board at win_index_1
  #position_8 = board[win_index_8] # load the value of the board at win_index_2

# Define your WIN_COMBINATIONS constant
