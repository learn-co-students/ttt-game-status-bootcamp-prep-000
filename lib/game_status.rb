# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
 [0, 1, 2],
 [3, 4, 5],
 [6, 7, 8],
 [0, 3, 6],
 [1, 4, 7],
 [2, 5, 8],
 [0, 4, 8],
 [2, 4, 6],
]

def won?(board)
  if
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = win_combination[0]
    position_2 = win_combination[1]
    position_3 = win_combination[2]
     if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
       return win_combination
     elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
       return win_combination
   end
 end
 else
   return false
 end
end

def full?(board)
 board.all? do |index|
   !(index == nil || index == " " || index == "")
 end
end

def empty?(board)
  board.all? do |index|
    (index == nil || index == " " || index == "")
  end
 end



def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if !won?(board)
    return nil
  else
    won?(board).each do |index|
      return board[index]
    end
  end
end






board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]