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
  [6,4,2]
]

def won?(board)

  won = WIN_COMBINATIONS.detect do |combo|
    all_full = combo.all? do |position|
      position_taken?(board,position.to_i)
    end
    if(all_full)
      if(board[combo[0]]==board[combo[1]] && board[combo[0]]==board[combo[2]])
        combo
      end
    end
  end
  if(won==[])
    false
  else
    won
  end
end


def full?(board)
  full = board.all? do |position|
    (position=="O" || position=="X")
  end
end

def draw?(board)
  draw = (!won?(board)&&full?(board))
  draw
end

def over?(board)
  over = (draw?(board)||full?(board)||won?(board))
  over
end

def winner(board)
  if(won?(board).nil?)
    nil
  else
    board[won?(board)[0]]
  end
end
