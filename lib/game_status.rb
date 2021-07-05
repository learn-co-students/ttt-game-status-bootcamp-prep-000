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
  WIN_COMBINATIONS.detect do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    # puts position_1 + "," + position_2 + "," + position_3

    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||
        position_1 == "O" && position_2 == "O" && position_3 == "O")
      true
    else
      false
    end
  end
end

def full?(board)
  #all_full = board.all? do |cell|
  #              cell == "X" || cell == "O"
  #            end
  board.all?{|cell| cell == "X" || cell == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif !full?(board) && !won?(board)
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board) && full?(board)
    true
  elsif won?(board) && !full?(board)
    true
  else
    false
  end
end

def winner(board)
  if over?(board)
    winning_line = won?(board)
    cell = winning_line[0]
    char = board[cell]
    char
  else
    nil
  end
end
