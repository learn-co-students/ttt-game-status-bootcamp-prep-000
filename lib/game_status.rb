# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [6, 4, 2], #bottom-left to top-right diagonal
  [0, 4, 8] #top-left to bottom-right diagonal
  ]
  
  def won?(board)
    WIN_COMBINATIONS.detect do |i|
      win_index_1 = i[0]
      win_index_2 = i[1]
      win_index_3 = i[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
    end
  end
  
  def full?(board)
    board.all? do |i|
       i == "X" || i == "O"
    end
  end
  
  def draw?(board)
    if (full?(board) && !(won?(board)))
      return true
    elsif
      (!(full?(board)) && !(won?(board)))
      return false
    elsif !(won?(board))
      return false
    end
  end
  
  def over?(board)
    draw?(board) || won?(board)
  end
  
  def winner(board)
    if (won?(board))
    winning_array = won?(board)
    return board[winning_array[0]]
  else
    return nil
  end
  end