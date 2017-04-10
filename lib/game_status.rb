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
  WIN_COMBINATIONS.each do |combinations|
    winning_combo =( combinations.all? do |combo_part|
        board[combo_part] =="X"
      end ||
      combinations.all? do |combo_part|
        board[combo_part]=="O"
      end)
      if winning_combo 
        return combinations
      end
    end
  return false
end

def full?(board)
  board.all? do |square|
    square == "X" || square =="O"
  end
end



def draw?(board)
  return(full?(board)&&!won?(board))
end

def over?(board)
  return(draw?(board) || won?(board))
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]       #value in first index of winning combo == winner
  end
  return nil
end

