# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
BOARD = ["X","X","X","X","O","X"," ","O","X"]
WIN_COMBINATIONS =[
    [0,1,2], #top row 
    [3,4,5],
    [6,7,8], 
    [0,3,6],  #left Column
    [1,4,7], 
    [2,5,8], 
    [0,4,8], #left diagnol 
    [2,4,6]
  ]

# def ind(board)
#   sam = []
#   counter = 0 
#   board.each do |index|
#     if index == "X"
#       sam.push(counter)
#     end
#     counter+=1
#   end
#   sam
# end

def won?(board)
  sam_ex = []
  sam_oh = []
  i = 0
  board.each do |index|
    if index == "X"
      sam_ex.push(i)
    elsif index == "O"
      sam_oh.push(i)
    end
    i+=1
  end
  WIN_COMBINATIONS.each do |combination|
    if combination&sam_oh == combination || combination&sam_ex ==combination
    return  combination
    end
  end
nil
end


def full?(board)
  if board.all?{|token| token == "X" || token =="O"}
    true #if all elements of board have a token that = X or O return true for a draw
  else 
    false  #game is in progress 
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end
  
def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  won?(board)
  if won?(board)
   board[won?(board)[0]]
  end
end  


#Judson like carbs
def number_of_turns_taken(board)
  counter = 0
  board.each do |token| 
    if token == "X" || token =="O"
      counter +=1
    end
  end
  counter
end