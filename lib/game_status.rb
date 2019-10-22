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
WIN_COMBINATIONS.detect do |el|
 board[el[0]] == board[el[1]] &&
 board[el[1]] == board[el[2]] &&
 position_taken?(board, el[1])
end
end

def full?(board)
 board.all? {|el| position_taken?(board, board.index(el))}
end
def draw?(board)
 !won?(board) == true && full?(board) == true ? true : false
end
def over?(board)
 if won?(board).kind_of?(Array) == true
   true
elsif draw?(board) == true
  true
 end
end
def winner(board)
 over?(board)  == true ? board[won?(board)[1]] : nil
end
