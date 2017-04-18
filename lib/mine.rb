def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  board.all? {|element| position_taken?(board, element)}
end

board0 = ['x', 'y', 'z']
board1 = ['x', ' ', 'z']
board2 = []

puts full?(board0)
puts full?(board1)
puts full?(board2)