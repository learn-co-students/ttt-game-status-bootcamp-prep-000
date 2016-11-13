# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,4,8], #Diagonal 1
  [2,4,6], #Diagonal 2
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_x = combo.all?{|index| board[index] == "X"}
    win_o = combo.all?{|index| board[index] == "O"}
    if win_x == true || win_o == true
      return combo
    end
  end
  false
end

def full?(board)
  full = !board.include?(" ")
  full
end

def draw?(board)
  if won?(board) != false
    false
  elsif won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    nil
  end
end
