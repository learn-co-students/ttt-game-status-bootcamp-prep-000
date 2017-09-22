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
  puts "FIRST STEP"
  WIN_COMBINATIONS.each do |combination|
    board_test = []
    if (position_taken?(board, combination[0]) && position_taken?(board, combination[1]) && position_taken?(board, combination[2]))
      combination.each do |i|
        board_test << board[i]
        puts "added #{board[i]} to array"
      end #combination.each
      token = board_test[0]
      if board_test.all? { |space| space == token }
        return combination
      end #if board_test.all?
    end #if position_taken
  end #WIN_COMBINATIONS.each
  false
end #def

def full?(board)
  !board.detect{|i| i == " "}
end

def winner(board)
  result = won?(board)
  if result
    return board[result[0]]
  end
end

def draw?(board)
  over?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end
