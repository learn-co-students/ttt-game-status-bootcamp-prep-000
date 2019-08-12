# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top_row_win
  [3,4,5], #middle_row_win
  [6,7,8], #bottom_row_win
  [0,3,6], #first_column_win
  [1,4,7], #second_column_win
  [2,5,8], #third_column_win
  [0,4,8], #diagonal_left_to_right_win
  [2,4,6]  #diagonal_right_to_left_win
]

#define WON method  to check a board.
#return true if there is a win and false if not.
#won accepts a board as argument, return false/nil if no win combo.
#return winning combo indexes as array if there's a win.
def won?(board)
  WIN_COMBINATIONS.detect do | combination |
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board,combination[0])
    end
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if grand_winner = won?(board)
    board[grand_winner.first]
  end
end
