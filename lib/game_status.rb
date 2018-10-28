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
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]].strip == board[combo[1]].strip &&
        board[combo[0]].strip == board[combo[2]].strip &&
        !(board[combo[0]].strip.empty?))
      return combo
    end
  end
  false
end

def full?(board)
  board.none? { |position| position.strip.empty? }
end

def draw?(board)
  if won?(board) || (full?(board) == false && won?(board) == false)
    false
  elsif won?(board) == false and full?(board)
    true
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
