# Helper Method
def position_taken?(board, index)

  # is index is not nil or empty string then it is taken
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
  #iterates through "WIN_COMBINATIONS" and brings back the first elemnt that is true
WIN_COMBINATIONS.detect do |win_combination|
  #.detect brings back the elements for win_combination that match and if win_combination[0], [1] and [2]
  # and the position is taken.
        board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] &&
        #since 'win_combination[0]' is already matching the other 2 we only place the 1 argument to check the one index
        #to make sure the position isnt an empty string.
        position_taken?(board, win_combination[0])
    end
end

def full?(board)
  # if board does not include empty string the board is full
  !board.include?(" ")
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
if  winning_combo = won?(board)
    board[winning_combo.first]
  else
    nil
end
end
