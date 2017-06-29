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
  [2,4,6],
]

def won?(board)
    WIN_COMBINATIONS.each do |win_comb|
      position_1 = board[win_comb[0]]
      position_2 = board[win_comb[1]]
      position_3 = board[win_comb[2]]
      return win_comb if (position_1 != " ") && ((position_1 == position_2) && (position_1 == position_3))
    end
    return false
end

def full?(board)
    board.all? do |chr|
      chr != " "
    end
end

def draw?(board)
    if (won?(board) == false) && full?(board)
      return true
    elsif (won?(board) == false) && !full?(board)
      return false
    elsif won?(board)
      return false
    end
end

def over?(board)
    if won?(board) || draw?(board) || full?(board)
      return true
    else
      return false
    end
end

def winner(board)
    WIN_COMBINATIONS.each do |win_comb|
      position_1 = board[win_comb[0]]
      position_2 = board[win_comb[1]]
      position_3 = board[win_comb[2]]
      return position_1 if (position_1 != " ") && ((position_1 == position_2) && (position_1 == position_3))
    end
    return nil
end
