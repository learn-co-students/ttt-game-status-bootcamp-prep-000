# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row  
  [3,4,5], #mid row
  [6,7,8], #bottom row
  [0,4,8], #diag top left
  [2,4,6], #diag top right
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8]  #right col
]

def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    ["X","O"].each do |char|
      if win_array.all? do |position|
          board[position] == char
        end
        return win_array
      end
    end
  end
  false
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end