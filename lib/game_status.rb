# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
 def won?(board)
   
  # set return variable to default value. By default nobody has won.
  return_val = false
  
  #drop down a level in the array of winning combinations
  WIN_COMBINATIONS.each do |comb| 
  
    # pass tests for "X" and "O" to #all? 
    if comb.all? {|space| board[space] == "X"} || comb.all? {|space| board[space] == "O"}
      return_val = comb
    end
  end
  #return new return value
  return_val
 end
   
def full?(board)
  return_val = true
    
    board.each_index do |cell| 
      if !position_taken?(board, cell)
        return_val = false
      end
    end
  return_val
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else 
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  elsif draw?(board)
    board[won?(board)[0]]
  end
end