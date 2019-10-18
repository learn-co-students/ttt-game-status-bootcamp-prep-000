# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  
  WIN_COMBINATIONS.each do |x|
    
    return x if x.all? { |y| board[y] == "X" }
    return x if x.all? { |y| board[y] == "O" }

  end
    
  false 

    
end

def full?(board) board.count(" ") == 0 end

def draw?(board) full?(board) && !(won?(board)) end

def over?(board) won?(board) || full?(board) || draw?(board) end

def winner(board) won?(board) == false ? nil : board[won?(board)[0]] end  