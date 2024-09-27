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
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|index| position_taken?(board, index)}

      first_value = board[combo[0]]
      second_value = board[combo[1]]
      third_value = board[combo[2]]

      if first_value == second_value && first_value == third_value
        return combo
      end
    end
  end
  return false
end

def full?(board)
  board.all?{|element| !(element == " ")}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  end
end

def over?(board)
  if full?(board)
    return true
  end

  if draw?(board)
    return true
  end

  if won?(board)
    return true
  end
end

def winner(board)
  if over?(board)
    winning_positions = won?(board)
    value = board[winning_positions[0]]
    if value.include?('X')
      return 'X'
    elsif value.include?('O')
      return 'O'
    else
      return nil
    end
  end
end
