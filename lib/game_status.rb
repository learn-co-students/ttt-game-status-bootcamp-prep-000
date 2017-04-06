def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal ul-br
  [2,4,6] #diagonal ur-bl
]

def won2?(board) #original version
  WIN_COMBINATIONS.each do |combination|
    index1 = combination[0]
    index2 = combination[1]
    index3 = combination[2]
    position1 = board[index1]
    position2 = board[index2]
    position3 = board[index3]
    if position1 == "X" && position2 == "X" && position3 == "X"
      return combination
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return combination
    end
  end
  false
end

def won?(board) #refactored
  WIN_COMBINATIONS.detect do |combination|
    position_arr = []
    combination.each do |position|
      position_arr << board[position]
    end
    position_arr == ["X","X","X"] || position_arr == ["O","O","O"]
  end
end

def full2?(board) #original
  board.each do |i|
    if i != "X" && i != "O"
      return false
    end
    true
  end
end

def full?(board) #refactored
  board.none?{|i| i == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
  end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
