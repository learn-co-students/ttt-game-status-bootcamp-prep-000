# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]
    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]
    if position_1 == "X" and position_2 == "X" and position_3 == "X"
      return combo
    elsif position_1 == "O" and position_2 == "O" and position_3 == "O"
      return combo
    end
  end
  return FALSE
end

def full?(board)
  board.all?{|spot| spot.include?("X") || spot.include?("O")}
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    wincombo = won?(board)
    return board[wincombo[0]]
  else
    return nil
  end
end

