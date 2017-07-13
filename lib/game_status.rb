# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
[0,1,2], # top row
[3,4,5], # middle row
[6,7,8], # bottom row
[0,3,6], # left column
[1,4,7], # middle column
[2,5,8], # right column
[0,4,8], # top left to bottom right diagonal
[6,4,2]
] # bottom left to top right diagonal

def won?(board)
  WIN_COMBINATIONS.find do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    position_taken?(board, win_index_1) && position_1 == position_2 && position_2 == position_3
  end
end


def full?(board)
  board.all? {|spaces|
    spaces != (nil || " ")}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !won?(board) && !full?(board) || won?(board)
    false
  else nil
  end
end

def over?(board)
  draw?(board) == true || won?(board) != nil
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end
