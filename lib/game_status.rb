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
  if board.all? { |element| element == ' ' }
    return false
  else 
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |element| board[element] == 'X' }
        return combination
      elsif combination.all? { |element| board[element] == 'O' }
        return combination
      end
    end
  end
  return false
end

def full?(board)
  board.none? { |element| element == ' ' }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end