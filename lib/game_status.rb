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
  if board.all?{|i| i == "" || i == " "}
    false
  else
    WIN_COMBINATIONS.each do |combo|
      position_1 = combo[0]
      position_2 = combo[1]
      position_3 = combo[2]

      if (board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X") ||
        (board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O")
        return combo
      end
    end
    false
  end
end

def full?(board)
  board.all?{|i| i =="X" || i == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
