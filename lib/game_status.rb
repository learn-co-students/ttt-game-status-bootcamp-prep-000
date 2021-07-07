# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #row 1
  [3, 4, 5], #row 2
  [6, 7, 8], #row 3
  [0, 3, 6], #column 1
  [1, 4, 7], #column 2
  [2, 5, 8], #column 3
  [0, 4, 8], #diagonal top left to bottom right
  [2, 4, 6] #diagonal top right to bottom left
]

def won?(board)
  if !(board.include?("X") || board.include?("O"))
    return false
  end
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    if (position_taken?(board, win_index_1) && (board[win_index_1] == board[win_index_2]) && (board[win_index_1] == board[win_index_3]))
      puts "#{board[win_index_1]}, #{board[win_index_2]}, #{board[win_index_3]}"
      return win_combination
    end
  end
  false
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  return (!won?(board) && full?(board))
end

def over?(board)
  return (won?(board) || draw?(board) || full?(board))
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
