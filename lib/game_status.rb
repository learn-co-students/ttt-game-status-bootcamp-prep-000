# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[0,4,8],[0,3,6],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    else 
      false
    end
  end 
  false
end

def full?(board) 
  (board.reject{|i| i == " "}.length ==9)
end

def draw?(board) 
  if !won?(board) && full?(board)
    true
  elsif (!won?(board) && !full?(board)) || won?(board)
    false
  end
end

def over?(board) 
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end