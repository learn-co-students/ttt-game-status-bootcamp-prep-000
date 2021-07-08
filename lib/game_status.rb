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
[2,4,6],
]
def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
 if winning_combination = won?(board)
   board[winning_combination.first]
  end
end 
