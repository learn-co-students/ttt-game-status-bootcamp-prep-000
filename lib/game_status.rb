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
   win_status = false
   WIN_COMBINATIONS.each do |array|
     if array.all?{|x| board[x] == "X"} || array.all?{|x| board[x] == "O"}
       win_status = array
     end
  end
  return win_status
end
   
   
def full?(board)
  !board.any? { |x| x == " " }
end


def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end


def over?(board)
  if won?(board) || draw?(board)
    true
  end
end


def winner(board)
  if won?(board)
    winning = won?(board)
    board[winning.first]
  elsif !won?(board)
    nil
  end
end