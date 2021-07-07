# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                    [0, 3, 6], [1, 4, 7], [2, 5, 8],
                    [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |nums|
    if nums.all?{|index| board[index] == 'X'} or nums.all?{|index| board[index] == 'O'}
      return nums
    end
  end
  return false
end

def full?(board)
  if (0..8).to_a.all?{|index| position_taken?(board, index)}
    return true
  end
  return false
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  won?(board) or draw?(board) or full?(board)
end

def winner(board)
  winner = won?(board)
  if winner.is_a?(Array)
    return board[winner[0]] == 'X' ? 'X' : 'O'
  end
  return nil
end
