# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.select do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    winner = [position_1, position_2, position_3]
    if winner == ["X", "X", "X"] || winner == ["O", "O", "O"]
      return win_combination
    end
  end
  false
end

def full?(board)
  full_board = board.none?{|space, value| space == " "}
    full_board
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end


def over?(board)
  if draw?(board) == true
    true
  elsif won?(board) != false
    true
  elsif full?(board) == true
    false
  end
end

def winner(board)
  if WIN_COMBINATIONS.include?(won?(board))
    win_combination = won?(board)
    winner = win_combination[0]
    i = winner.to_i
    return board[i].to_s
  elsif draw?(board) == true || over?(board) == false
     nil
  end
end
