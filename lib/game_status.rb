# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],            #top row 
  [3,4,5],            #middle row
  [6,7,8],            #bottom row
  
  [0,3,6],            #left column
  [1,4,7],            #middle column
  [2,5,8],            #right column
  
  [0,4,8],            #TL-BR diagonal
  [2,4,6],            #TR-BL diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    positions = []
    counter = 0
    
    combo.each do |i|
      positions[counter] = i
      counter += 1
    end
  
    positions.all? do |n|
      position_taken?(board,n)
    end
    
    if board[positions[0]] == "X"
      positions.all? do |m|
        board[m] == "X"
      end
    elsif board[positions[0]] == "O"
      positions.all? do |q|
        board[q] == "O"
      end
    end
  end
end

def full?(board)
  board.all? do |i|
    position_taken?(board, board.index(i))
  end
end
      
def draw?(board)
  if won?(board) == nil
        if full?(board) == true
            return true
        elsif full?(board) == false
            return false
        end
    elsif won?(board) 
        return false
    end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  elsif won?(board) == nil
    return nil
  end
end
    
    
    
    
    
    
