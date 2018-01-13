# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


def won?(board)
  WIN_COMBINATIONS.each do |combo|
    pos_1 = board[combo[0]]
    pos_2 = board[combo[1]]
    pos_3 = board[combo[2]]

    winning_array = [pos_1, pos_2, pos_3]

    if  (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        return combo
    end
  end
  return false
end



def full?(board)
  spaces = board.each_with_index.collect do |space, index|
    index
  end
  spaces.all? do |position|
    position_taken?(board, position)
  end
end

def draw?(board)
  full?(board) && won?(board) == false
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board) != false && (full?(board) == true || full?(board) == false)
    true
  end
end

def winner(board)
  if won?(board) == false
    nil
  else won?(board).all? do |i|
      if board[i] == "X"
        return "X"
      elsif board[i] == "O"
        return "O"
      end
    end
  end
end
