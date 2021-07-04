# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#probability
WIN_COMBINATIONS = [
                    [0,1,2], 
                    [3,4,5], 
                    [6,7,8], 
                    [0,4,8], 
                    [2,4,6],
                    [0,3,6],
                    [2,5,8],
                    [1,4,7]]

def won?(board)
  WIN_COMBINATIONS.each do |wi|
    index_1 = wi[0]
    index_2 = wi[1]
    index_3 = wi[2]
    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return wi
    elsif
      position_1 == "O" && position_2 == "O" && position_3 == "O"
        return wi
    end 
  end
  return false
end

def full?(board)
  !board.any?{|a| a.nil? || a == " " || a == ""}
end

def draw?(board)
  !won?(board) && full?(board) ? true : false
end

def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

def winner(board)
  win = won?(board)
  win ? board[win[0]] : nil
end