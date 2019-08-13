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
  WIN_COMBINATIONS.each do |combo|
   return combo if combo.all?{|x| board[x] == 'X'} || combo.all?{|x| board[x] == 'O'}
 end
 false
end

def full?(board)
  board.all?{|char| char == 'X' || char == 'O'}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.each{|combo| return 'X' if combo.all?{|x| board[x] == 'X'}} 
  return nil if !won?(board)
  'O'
end
 
      
      
