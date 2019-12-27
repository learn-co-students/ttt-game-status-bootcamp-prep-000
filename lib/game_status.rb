# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#board = [ "0 ", "1 ", "2 ",
          #"3 ", "4 ", "5 ", 
          #"6 ", "7", "8"]

WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]]

 wr = []
 temp = []
def won?(board)
    # check win combinations
      WIN_COMBINATIONS.each do |combination| 
        win_index_1 = combination[0]
        win_index_2 = combination[1]
        win_index_3 = combination[2]
        position_1 = board[win_index_1] 
        position_2 = board[win_index_2] 
        position_3 = board[win_index_3] 
        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          
          return combination 
        else 
          false
        end 
  end
  false
end

def full?(board)
      if     (board.all? do |element|
             element == " " || element == nil || element==""
             end)
         # puts "borad empty"
         return false
      elsif (board.any?{|element| element ==" " || element== nil})#=> true
        # puts "borad in progress"
         return false 
      else
         puts "borad full"
        true
      end 
      # return true
end

def draw?(board)
   !((!won?(board) && !full?(board)) ||(won?(board)))
end

def over?(board)
  won?(board) || draw?(board) || full?(board) 
end

def winner(board)
    if over?(board)
            countX = 0 
            countO = 0 
            WIN_COMBINATIONS.each do |combination| 
                win_index_1 = combination[0]
                win_index_2 = combination[1]
                win_index_3 = combination[2]
                position_1 = board[win_index_1] 
                position_2 = board[win_index_2] 
                position_3 = board[win_index_3] 
                if (position_1 == "X" && position_2 == "X" && position_3 == "X") 
                    countX +=  1 
                elsif
                    (position_1 == "O" && position_2 == "O" && position_3 == "O")
                    countO += 1
                    
                    # return combination 
                else 
                    false
                end
            end 
            if countX>countO
                    return "X"
                elsif countX<countO
                    return "O"
                else    
                    return #"no winner"
            end
            
    end
    # return false
end 