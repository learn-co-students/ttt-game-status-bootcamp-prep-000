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
  x_win = ["X", "X", "X"]
  o_win = ["O", "O", "O"]

    WIN_COMBINATIONS.each do |win_combo|
      win_array = []
         win_combo.each do |win|
           if position_taken?(board, win)
                win_array<<board[win]
              if win_array == x_win || win_array == o_win
                return win_combo
              end
            end
         end
       end
    return false
  end

  def full?(board)
      board.all? do |position|
      position == "X" || position == "O"
      end
  end

  def draw? (board)
    if full?(board) == true && won?(board) == false
      return true
    else return false
    end
  end

  def winner(board)
    if won?board
    winning_combo = won?(board)
    return board[winning_combo[0]]
  else
    return nil
  end
  end

  def over?(board)
      if won?(board)
        return true
      elsif draw?(board)
        return true
      elsif full?(board)
        return true
      else
        return false
      end

  end
