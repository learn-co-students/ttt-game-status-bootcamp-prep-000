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
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_0 = combo[0]
    win_index_1 = combo[1]
    win_index_2 = combo[2]
    win_position_0 = board[win_index_0]
    win_position_1 = board[win_index_1]
    win_position_2 = board[win_index_2]
    if ( (win_position_0 == "X" && win_position_1 == "X" && win_position_2 == "X") ||  (win_position_0 == "O" && win_position_1 == "O" && win_position_2 == "O") )
        return combo
      else
        return false
    end
  end
end

