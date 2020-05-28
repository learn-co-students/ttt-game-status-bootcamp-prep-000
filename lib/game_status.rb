require "pry"
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #1st row
  [3,4,5],  #2nd row
  [6,7,8],  #3rd row
  [0,3,6],  #1st column
  [1,4,7],  #2nd column
  [2,5,8],  #3rd column
  [0,4,8],  #\ diagonal
  [2,4,6]   #/ diagonal
]


def won?(board)
  WIN_COMBINATIONS.detect do |winning_array|
    board[winning_array[0]] == board[winning_array[1]] && 
    board[winning_array[1]] == board[winning_array[2]] &&
    position_taken?(board, winning_array[0])
  end  
end

def full?(board)
  board.each_index.all? do |index|
    if board[index] == "X" || board[index] == "O" 
      true 
    else
      false  
    end
  end
end

# def full?(board)
#   board.each_index.all? do |index|
#     position_taken?(board, index)
#   end 
# end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end


# def winner(board)
#   winning_array = won?(board)
#   board[winning_array[0]]
    
# end
  
  #binding.pry
  
  
def winner(board) 
  winning_array = won?(board)
    if won?(board)
      if board.at(winning_array[0]) === "X"  
        return "X" 
      elsif board.at(winning_array[0]) === "O"
        return "O"
      end
    end
  return nil
end



