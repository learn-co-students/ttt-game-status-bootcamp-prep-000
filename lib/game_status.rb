require "pry"
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
#won_array = [] # user .each for iteration.
  WIN_COMBINATIONS.find do |combination|
    if position_taken?(board, combination[0]) && position_taken?(board, combination[1]) && position_taken?(board, combination[2]) && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
      won_array = combination
    end
  end
  #won_array
end #end of method

def full?(board)
  board.find.with_index do |position, index|
    if position_taken?(board, index) == false
      return  false
    end
  end
  return true
end #end of method

def draw?(board)
  !won?(board) && !full?(board) != true
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil

end
