require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # diagonal
    [2,4,6] # diagonal
  ]

  def won?(board)
    WIN_COMBINATIONS.detect do |combo| # iterate thru each combo
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position1 = board[win_index_1]
      position2 = board[win_index_2]
      position3 = board[win_index_3]

      if position1 == "X" && position2 == "X" && position3 == "X"
        return combo
      elsif position1 == "O" && position2 == "O" && position3 == "O"
        return combo
      else
        false
      end
    end
  end

  def full?(board)
    board.all? {|i| i == "X" || i == "O"} # all spaces occupied by either X or O, no empty strings
  end

def draw?(board) # draw == no one won
    if !won?(board) && full?(board)
      true
    else
      false
    end
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board) # if there is a winner
    return board[won?(board)[0]]
  else
    return nil
  end
end
