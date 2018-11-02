require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left-vert row
  [1,4,7], #Middle-vert row
  [2,5,8], #Right-vert row
  [0,4,8], #Left-diagnol row
  [2,4,6] #Right-diagnol row
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |arrays|
    #takes the index of the winning array
    win_index_1 = arrays[0]
    win_index_2 = arrays[1]
    win_index_3 = arrays[2]
    
    #inserts the index into the board and saves in variable to compare later
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    #compares the winning indexes of the board to see if it meets this conditional. If the indexes equal each other and the positon is taken by 'X' or 'O' it returns the array of winning indexes
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, arrays[0])
       arrays
    else
      false
    end
  end
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
   full?(board) && !won?(board) 
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end
  
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
  