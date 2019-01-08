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
#meet all conditions:same value and not empty                   
def won?(board)
  WIN_COMBINATIONS.detect do |array|
  board[array[0]] == board[array[1]] && board[array[0]] == board[array[2]] && position_taken?(board,array[0])
  end
end

def full?(board)
  board.none? do |index|
    index == " "
  end
end

def draw?(board)
  return (full?(board) && !won?(board))? true : false
end

def over?(board)
  return (won?(board) || full?(board) || draw?(board))? true : false
end

# won?(board) return an array from WIN_COMBINATIONS, 
# we can use 0,1, or 2(they are the same value) to get the actual
# index in the board
def winner(board)
return (won?(board))? board[won?(board)[0]] : nil
end