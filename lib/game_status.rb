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
    WIN_COMBINATIONS.each do |win_con|
      i=0
      markers=[" ", " ", " "]
      win_con.each do |index|
        markers[i] = board[index]
        i += 1
      end
      
      if markers == ["X", "X", "X"] || markers == ["O", "O", "O"]
        return win_con
      end
    end
    return false
  end
  
  def full?(board)
    board.none?{|marker| marker == " "}
  end
  
  def draw?(board)
    if won?(board) == false && full?(board) == TRUE
      return TRUE
    else
      return false
    end
  end
  
  def over?(board)
    if won?(board) or full?(board) or draw?(board)
      return true
    else
      return false
    end
  end
  
  def winner(board)
    if won?(board)
      index = won?(board)
      return board[index[0]]
    end
  end
