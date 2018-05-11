# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)

=begin
1. loop through win WIN_COMBINATIONS

2. match the win combination values with board indexes

3. compare those values to see if they're all X or O's

4. if so return the matching WIN_COMBINATION
=end

result = false

WIN_COMBINATIONS.each do |set|
  if board[set[0]] == "X" && board[set[1]] == "X" && board[set[2]] == "X"
    result = set
  elsif board[set[0]] == "O" && board[set[1]] == "O" && board[set[2]] == "O"
    result = set
  end
end

result
end

def full?(board)
end

def draw?(board)
end

def over?(board)
end

def winner(board)
end
