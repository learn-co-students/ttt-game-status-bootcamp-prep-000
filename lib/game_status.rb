# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def win?(board)

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  WIN_COMBINATIONS.each do |w|
    index_1 = w[0]
    index_2 = w[1]
    index_3 = w[2]

        position_1 = board[index_1]
        position_2 = board[index_2]
        position_3 = board[index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return w
  else
    position_1 == "0" && position_2 == "O" && position_3 == "O"
    return w
      end
    end
    return false
  end
