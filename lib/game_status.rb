# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # 1 Top row
  [3,4,5], # 2 Middle row
  [6,7,8], # 3 Bottom row
  [0,3,6], # 4 First column
  [1,4,7], # 5 Second column
  [2,5,8], # 6 Third column
  [0,4,8], # 7 Right slope diagonal
  [2,4,6]  # 8 Left slop diagonal
]

def won?(board)
  win_elements=[]
  board_elements = []
  WIN_COMBINATIONS.each do |win_combination|
    board_elements = []
    win_elements = []
    win_combination.each do |index|
      board_elements << board[index]
      win_elements << index
    end
    if (board_elements.all?{|c| c == "X"} ==  true) || (board_elements.all?{|c| c == "O"} ==  true)
      #win_elements
      break
    else
      win_elements = false
    end
  end

  return win_elements
 end

 def full?(board)
   board.all? do |index|
     index == "X" || index == "O"
   end
 end

def draw?(board)
  if (full?(board) == true) && (won?(board) == false)
    return true
  else
    return false
  end
end

def over?(board)
  if (draw?(board) == true) || (won?(board) != false)
    return true
  else
    return false
  end
end

def winner(board)
  win_array = []
  board_win_array = []
  if won?(board) != false
    win_array = won?(board)
    win_array.each do |index|
      board_win_array << board[index]
    end
    if (board_win_array.all?{|c| c == "X"} == true)
      return "X"
    elsif (board_win_array.all?{|c| c == "O"} == true)
      return "O"
    else
      nil
    end
  end
end
