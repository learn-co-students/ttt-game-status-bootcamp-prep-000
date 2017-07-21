# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6],
  [0, 3, 6], [1, 4, 7], [2, 5, 8]]

def won?(board)
  WIN_COMBINATIONS.each do |line|
    combo = []
    line.each do |index|
      combo << board[index]
    end

    all_x = combo.all? do |spot|
      spot == "X"
    end

    all_o = combo.all? do |spot|
      spot == "O"
    end

    if all_x == true || all_o == true
      return line
    end

  end
  false
end

def full?(board)
  board.none? do |position|
    position == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    winning_line = won?(board)
    return board[winning_line[0]]
  end
  nil
end
