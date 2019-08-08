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
[6,4,2],
]
# def won?(board)
#     WIN_COMBINATIONS.each do |combo|
#
#        if (board[combo[0]] === board[combo[1]] && board[combo[1]]===board[combo[2]]) && (position_taken?(board,board[combo[0]] ))
#          return combo
#
#       end
#     end
#     end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    # check for an "X" win
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    # check for an "O" win
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
    # check for an empty board
      elsif board.all? do |i|
        i == " "
      end
        return false
      end
  end
    return false
end



def full?(board)
board.all? do |i|
i == "X" || i == "O"
end
end



def draw?(board)
if !won?(board) && full?(board)
return true
elsif !won?(board) && !full?(board)
return false
end
end

def over?(board)
if won?(board) || draw?(board) || full?(board)
return true
end
end

def winner(board)
    if won?(board).is_a?(Array)
    combo = won?(board)
    return board[combo[0]]
  else
    nil
  end
end
