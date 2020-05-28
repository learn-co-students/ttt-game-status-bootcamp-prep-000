require "pry"
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #1st row
  [3,4,5],  #2nd row
  [6,7,8],  #3rd row
  [0,3,6],  #1st column
  [1,4,7],  #2nd column
  [2,5,8],  #3rd column
  [0,4,8],  #\ diagonal
  [2,4,6]   #/ diagonal
]


def won?(board)
  WIN_COMBINATIONS.detect do |winning_array|
    board[winning_array[0]] == board[winning_array[1]] && 
    board[winning_array[1]] == board[winning_array[2]] &&
    position_taken?(board, winning_array[0])
  end  
end

def full?(board)
  board.each_index.all? do |index|
    if board[index] == "X" || board[index] == "O" 
      true 
    else
      false  
    end
  end
end

# def full?(board)
#   board.each_index.all? do |index|
#     position_taken?(board, index)
#   end 
# end

def draw?(board)
  #true if the board has not been won but is full
  #false if the board is not won and the board is not full
  #false if the board is won
  
  board.each_index.include? do |index|
    true if full?(board) && !won?(board)
    board.each_index.any? do |index|
      false if !full?(board) && won?(board)
      board.each_index.any? do |index|
        false if full?(board) && won?(board)
      end  
    end
  end
end

def over?(board)
  
end

def winner(board)
  
end







