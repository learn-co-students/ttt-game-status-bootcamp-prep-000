# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [0, 4, 8], [2, 4, 6], [1, 4, 7], [2, 5, 8]]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    index_1 = win[0]
    index_2 = win[1]
    index_3 = win[2]
    if board[index_1] == "X" && board[index_2] == "X" && board[index_3] == "X"
      return win
    elsif board[index_1] == "O" && board[index_2] == "O" && board[index_3] == "O"
      return win
    end
  end
  return nil
end

def full?(board)
  board.each do |position|
    if position == " "
      return false
    end
  end
  true
end

def draw?(board)
  (full?(board) && !won?(board))?
    true : false 
end 

def over?(board)
  (draw?(board) || won?(board))?
    true : false 
end
  
def winner(board)
  WIN_COMBINATIONS.each do |win|
    index_1 = win[0]
    index_2 = win[1]
    index_3 = win[2]
    if board[index_1] == "X" && board[index_2] == "X" && board[index_3] == "X"
      return "X"
    elsif board[index_1] == "O" && board[index_2] == "O" && board[index_3] == "O"
      return "O"
    end
  end
  return nil
end
  