# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # bottom row
  [0,3,6], # left vertical row
  [1,4,7], # middle vertical row
  [2,5,8], # right vertical row
  [0,4,8], # 1st diagonal row
  [2,4,6]  # 2nd diagonal row
]

def won?(board)
  if !board.all? {|empty| empty == " " || empty == ""}
    WIN_COMBINATIONS.detect do |win_combination|
      position_1 = board[win_combination[0]]
      position_2 = board[win_combination[1]]
      position_3 = board[win_combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
 else
   return false
 end
end

def full?(board)
  if board.include?(" ") || board.include?("") || board.include?(nil)
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
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
  if won?(board)
    winner = won?(board)[0]
    return board[winner]
  else
    return nil
  end
end
