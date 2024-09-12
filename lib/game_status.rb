# Helper Method
def position_taken?(board, index)
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
  won = false
  combo_counter = -1
  WIN_COMBINATIONS.each do |combo|
      arr = []
      combo_counter += 1
      combo.each { |x| arr.push(board[x])}
      if arr.all? {|m| m == "O" }
        return WIN_COMBINATIONS[combo_counter]
      elsif arr.all? {|m| m == "X" }
        return WIN_COMBINATIONS[combo_counter]
      else
        won = false
      end
  end
  return won
end

def full? (board)
   board.none? {|x| x == " "}
end

def draw? (board)
  if full?(board) && !(won?(board))
    true
  else
    false
  end
end

def over? (board)
  if !(draw?(board)) && !(won?(board))
    false
  else
    true
  end
end

def winner (board)
  if won? (board)
    arr = won?(board)
    winning_player = board[arr[0]]
  else
    nil
  end
end
