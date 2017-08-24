# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left col
  [1,4,7], # mid col
  [2,5,8], # right col
  [0,4,8], # first diag
  [2,4,6] # 2nd diag
]

def won?(board)
  WIN_COMBINATIONS.each do |wcombo|
    win_index_1 = wcombo[0]
    win_index_2 = wcombo[1]
    win_index_3 = wcombo[2]

    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]

    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return wcombo # winning combination indices
    end
  end
  false
end

def full?(board)
  empty_spaces = board.find {|pos| pos == " "}
  empty_spaces == nil
end


def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !full?(board) && !won?(board)
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  wcombo = won?(board)
  if !(wcombo == false)
    winner = board[wcombo[0]]
  end
end
