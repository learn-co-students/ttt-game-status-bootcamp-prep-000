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

def indices_of_n(array, n)
  counter = 0
  indices = []
  array.each do |element|
    if element == n
      indices << counter
    end
    counter += 1
  end
  indices
end
=begin
def won?(board)
  indices_of_X = indices_of_n(board, 'X')
  indices_of_O = indices_of_n(board, 'O')
  #go thru each win combination.  if all its elements are in x_indexes or o_indexes, win.  If no such win combination, no win.
  result = false
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| indices_of_X.include?(index)} || win_combo.all? {|index| indices_of_O.include?(index)}
      result = win_combo
      break
    end
  end
  result
end
=end
#simpler, better version
def won?(board)
  result = false
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| board[index] == 'X'} || win_combo.all? {|index| board[index] == 'O'}
      result = win_combo
      break
    end
  end
  result
end

def valid_ttt_character?(thing)
  !(thing.nil? || thing == " ")
end

def full?(board)
  board.all? {|element| valid_ttt_character?(element)}
end

def draw?(board)
  if full?(board)
    !won?(board)
  else false
  end
end

=begin
This code works but shouldn't, since over should return true in the case that board is won but not full.  Test is not specific enough.
def over?(board)
  full?(board)
end
=end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  indices_of_X = indices_of_n(board, 'X')
  indices_of_O = indices_of_n(board, 'O')
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| indices_of_X.include?(index)}
      return 'X'
    elsif win_combo.all? {|index| indices_of_O.include?(index)}
      return 'O'
    end
  end
  nil
end

  
        