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
  
  # it 'returns an array of matching indexes for a top row win' do
  #     board = ["X", "X", "X", "O", "O", " ", " ", " ", " "]

  #     expect(won?(board)).to match_array([0,1,2])
  #   end

def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
      board[win_array[0]] == board[win_array[1]] && board[win_array[1]] == board[win_array[2]] && position_taken?(board,win_array[0])
    end 
end 

def full?(board)
  board.all? {|element| element == "X" || element == "O" } 
end 

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true 
  end 
end 


# def winner(board)
# winner = nil 
#   arr = won?(board)
#     if board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X" 
#         winner = "X"
#     elsif board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O" 
#         winner = "O"
#     end 
#     winner
# end 



def winner(board)
  WIN_COMBINATIONS.each do |win_array|
    if win_array.all? {|index| board[index] == "X"}
      return "X"
    elsif win_array.all? {|index| board[index] == "O"}
      return "O"
    end 
  end 
   nil  
end

