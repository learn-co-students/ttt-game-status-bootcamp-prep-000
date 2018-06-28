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
  

def won?(board) 
  if 
      #WIN_COMBINATIONS.each do 
  end
end
 

def full?(board)
  board.none? {|input| input == "" || input == " "}
end

=begin
def draw?(board)
  if !win?(board) && !full?(board)
    return true 
  end
end
=end 