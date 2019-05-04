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
  b_size = board.size - 1
  (0..b_size).each do |pos|
    if position_taken?(board, pos)
      marker = board[pos]
      WIN_COMBINATIONS.each do |combo|
        if combo[0] == pos
          if combo.all? {|i| board[i] == marker}
            return combo
          end
        end
      end
    end
  end
  false
end

def full?(board)
  board.all? {|pos| pos == "X" || pos == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
  false
end

def winner(board)
  win = won?(board)
  if win
    return board[win[0]]
  end
end