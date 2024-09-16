# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  status = false
    if board.all? {|square| square === " "}
      return status
    end
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O")
         status = true
        return win_combination # return the win_combination indexes that won.
      else
        status = false
      end
    end
    return status
end

def full?(board)
  if board.all? {|square| square == "X" || square == "O"}
    true
  else false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true ||  won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    if board.count("X") > board.count("O")
      winner = "X"
    else
      winner = "O"
    end       
  end
end
