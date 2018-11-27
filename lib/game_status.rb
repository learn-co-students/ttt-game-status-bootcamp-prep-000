# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],            #TOP
  [3, 4, 5],            #MIDDLE
  [6, 7, 8],            #BOTTOM
  [0, 3, 6],            #FIRST
  [1, 4, 7],            #SECOND
  [2, 5, 8],            #THIRD
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_comb_arr|
    if (board[win_comb_arr[0]] == "X" && board[win_comb_arr[1]] == "X" && board[win_comb_arr[2]] == "X") ||
       (board[win_comb_arr[0]] == "O" && board[win_comb_arr[1]] == "O" && board[win_comb_arr[2]] == "O")
      return win_comb_arr
    end
  end
  return false
end

def full?(board)
  counter = 0
  board.each do |index|
    if index.count("a-zA-Z") > 0
      counter += 1
    end
  end
  if counter == 9
    return true
  end
  return false
end

def draw?(board)
  return false if won?(board).class == Array
  return true if full?(board)
end

def over?(board)
  return true if draw?(board) || won?(board).class == Array
end

def winner board
  winner_comb = won?(board)
  return nil if winner_comb == false
  return board[winner_comb[0]]
end
