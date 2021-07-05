# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6],  # left column
  [1,4,7], # middle column
  [2,5,8],  # right column
  [0,4,8], # diagonal one
  [2,4,6]  # diagonal two
]
def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    all_items = win_array.all? do |index|
      position_taken?(board, index) && board[index] == "X"
    end
    if all_items
      return win_array
    else
      all_items = win_array.all? do |index|
        position_taken?(board, index) && board[index] == "O"
    end
    if all_items
      return win_array
    end
   end
  end
   return false
end

def full?(board)
  index = [0,1,2,3,4,5,6,7,8]
  index.all? { |index| position_taken?(board, index) }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    array = won?(board)
    return board[array[0]]
  end
end
