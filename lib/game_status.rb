# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  # WIN_COMBINATIONS.find {|w| w if board[w[0]] == board[w[1]] && board[w[1]] == board[w[2]] && board[w[0]] != " "}
  WIN_COMBINATIONS.detect do |win_combination| # detect returns an element or false
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    # board[win_combination[0]] == board[win_combination[1]]
    if position_1 ==  position_2 && position_2 == position_3 && position_1 != " "
      win_combination
    end
  end # since detect returns the element or false, this is the last thing the method reads so it automatically gets returned.
end

def full?(board)
  board.all? {|i| i != " "} #checks each index in the board array to see whether they are all equal to something other than blank
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    won?(board).each do |i|
      if board[i] == "X"
        return "X"
      elsif board[i] == "O"
        return "O"
      end
    end
  end
end
