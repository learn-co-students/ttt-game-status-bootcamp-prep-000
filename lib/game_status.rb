# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row
#diagonals
  [0,4,8], #left diag
  [2,4,6], #right diag
# up and down
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  stuff = WIN_COMBINATIONS.each do |win|
    # puts win
    won_X = win.all? do |index|
      board[index] == 'X'
    end
    # puts won_X
    won_O = win.all? do |index|
      board[index] == 'O'
    end
    # puts won_O
    if won_O || won_X
      # puts 'return'
      return win
      # break
    end
  end
  # puts 'none found'
  return false
end

def full?(board)
  board.count(" ") == 0
  # board.all? do |space|
  #   position_taken?(board, space)
  # end
end

def draw?(board)
  full?(board)&&!won?(board)
end

def over?(board)
  draw?(board) || won?(board)!=false
end

def winner(board)
  status = won?(board)
  if status != false
    return board[status[0]]
  end
end

# #####    TESTS
#
# board = ["X", "X", "O",
#          "O", "O", "X",
#          "X", "X", "O"]
# puts "board full?"
# puts full?(board)
# puts 'won?'
# puts won?(board)
# puts 'draw?'
# puts draw?(board)
# puts 'over?'
# puts over?(board)
# puts "winner or nil"
# puts winner(board).nil?

# WIN_COMBINATIONS.each do |win|
#   puts win
#
#   won_X = win.all? do |index|
#     board[index] == 'X'
#   end
#   puts won_X
#
#   won_O = win.all? do |index|
#     board[index] == 'O'
#   end
#   puts won_O
#   if won_X || won_O
#     puts 'return'
#     puts win
#     break
#   end
# end
