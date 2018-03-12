# Helper Method
def position_taken?(board, index)
  
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top
  [3,4,5], # Middle
  [6,7,8], # Bottom
  [0,4,8], # L->R diag 
  [2,4,6], # R->L diag 
  [0,3,6], # L column
  [1,4,7], # Centre column
  [2,5,8]  # R column
  ]

def won?(board)
    oBoard = board.each {|position|  position != "O" ? position = " ": position = "O"}
    puts oBoard
    winOidx = ( WIN_COMBINATIONS.index do |combos|
    combos.all? {|positions|
    position_taken?(oBoard,positions)}end)
    
    xBoard = board.each {|position| position != "X" ? position = " ": position = "X"}
    winXidx = ( WIN_COMBINATIONS.index do |combos|
    combos.all? {|positions|
    position_taken?(xBoard,positions)}end)
  
    if !(board.include?("X") || board.include?("O"))
      return false # empty board
    elsif !winOidx.nil? 
      return WIN_COMBINATIONS[winOidx]
    elsif !winXidx.nil?
      return WIN_COMBINATIONS[winXidx]
    else
      return false  #no winning combos = draw
    end
end
