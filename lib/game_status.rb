# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [2,4,6]  #Right start diagonal
]

def won?(board)
winner = []
WIN_COMBINATIONS.each do |sub_array|
  if sub_array.all? { |value| board[value] =="X" }
       winner = sub_array
  elsif sub_array.all? { |value| board[value] == "O" }
    winner = sub_array
    end
  end
  winner
end
