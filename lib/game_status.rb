# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #TopRow
  [3,4,5],  #MiddleRow
  [6,7,8], #bottomRow
  [0,3,6], #firstVertical
  [1,4,7], #SecondVert
  [2,5,8], #ThirdVert
  [0,4,8], #FirstDia
  [2,4,6] #SecondDia
]

def won?(board)
WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] 
  position_2 = board[win_index_2] 
  position_3 = board[win_index_3]
  empty_board = board.all? {|x| x == " "}
  full_board = board.none? {|x| x == " "}
  if empty_board
      return false
  elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  elsif full_board
      return false
  else
    false
  end
  end
end

#Full? Method
def full?(board)
  board.none? {|x| x == " "}
end

#Draw? Method
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
end
end

#over?
def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

