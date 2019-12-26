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
                 
def won(board)
  #chech if all position are taken
      # check win combinations
  # board.each do |position|
    # position_taken?(board, )
end

def full(board)
    all_busy = board.all? do |element|
      element=="X"|| element =="O" 
    end
    return all_busy
end

def draw()
end

def over()
end

def winner()
end 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 