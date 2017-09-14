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
  WIN_COMBINATIONS.each do |combinations|
    if combinations.all? { |win_combination| board[win_combination] == "X" } ||
       combinations.all? { |win_combination| board[win_combination] == "O" }
      return combinations
    end
  end
  return false
end

def full?(board)
  board.all? {|value| value != " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || ( won?(board) && full?(board) ) || ( won?(board) && !full?(board) )
    true
  else
    false
  end
end
def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |combinations|
      if combinations.all? { |win_combination| board[win_combination] == "X" }
        return "X"
      end
      if combinations.all? { |win_combination| board[win_combination] == "O" }
        return "O"
      end
    end
  else
    return nil
  end
end
