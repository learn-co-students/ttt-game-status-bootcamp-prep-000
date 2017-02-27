# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? do |index|
        board[index] == "X"
      end
      return combination
    elsif combination.all? do |index|
        board[index] == "O"
      end
      return combination
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if position == " " || position.nil?
      return false
    end
  end
  return true
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_array = won?(board)
  if win_array == false
    return nil
  elsif board[win_array[0]] == "X"
    return "X"
  elsif board[win_array[0]] == "O"
    return "O"
  end
end
