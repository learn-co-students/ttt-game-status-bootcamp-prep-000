# Helper Method
WIN_COMBINATIONS = [
  [0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2],
]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |arr|
   if  arr.all?  {|ele|  board[ele] == "X"}

     return arr
   elsif arr.all?  {|ele|   board[ele] == "O"}

     return arr
   else

   end
  end
    false
end

def full?(board)
  count=0
  board.each {|str| count += 1 unless str == " " }
  return true if count == board.length
  false
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif (won?(board) == false && full?(board) == false) || won?(board)
    return false
  end
end

def over?(board)
  return true if (won?(board) || draw?(board) || full?(board))
end

def winner(board)
  return board[won?(board)[0]] if won?(board)
  return nil
end
# Define your WIN_COMBINATIONS constant
