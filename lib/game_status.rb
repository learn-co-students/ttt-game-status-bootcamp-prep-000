# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Diagonal \
  [2, 4, 6], # Diagonal /
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]
    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  false
end

def full?(board)
  # board.all? { |position| position_taken?(board, position) }
  board.all? { |position| position != nil && position != " " }
  # full = true
  # i = 0
  # board.each { |position|
  #   puts "#{i}: #{board[i]}"
  #   if !position_taken?(board, 0)
  #     full = false
  #   end
  # }
  # full
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  full?(board) || won?(board) || draw?(board) ? true : false
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination[0]]
  end
end
