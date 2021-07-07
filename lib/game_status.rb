# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)

    #for each win_combination in WIN_COMBINATIONS

    WIN_COMBINATIONS.detect do |win_combination|

    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win, and load the value of the board at position x

    position_1 = board[win_combination[0]] # load the value of the board at win_index_1
    position_2 = board[win_combination[1]] # load the value of the board at win_index_2
    position_3 = board[win_combination[2]] # load the value of the board at win_index_3

    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_combination[0])
  end
end

def full?(board)
  !board.include?(' ')
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
      board[won?(board)[0]]
  end
end
