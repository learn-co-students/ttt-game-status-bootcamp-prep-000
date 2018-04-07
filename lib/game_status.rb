# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |w|
    w_1 = w[0]
    w_2 = w[1]
    w_3 = w[2]
    
    p_1 = board[w_1]
    p_2 = board[w_2]
    p_3 = board[w_3]
    
    if p_1 == "X" && p_2 == "X" && p_3 == "X" || p_1 == "O" && p_2 == "O" && p_3 == "O"
      return w
    end
  end
  if full?(board)
    false
  end
  false
end

def full?(board)
  board.none? do |pos|
    pos.nil? || pos == " "
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !full?(board) && !won?(board)
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    true
  end
  
end

def winner(board)
  if !won?(board)
    return nil
  end
  board[won?(board)[0]]
end

puts winner(["O", " ", " ", " ", "X", " ", " ", " ", "X"])
