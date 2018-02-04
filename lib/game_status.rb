# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal back
  [6,4,2], #diagonal forward
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    result = []
    win_combination.each do |i|
      result << board[i]
    end
    if result == ["X","X","X"] || result == ["O","O","O"]
      return win_combination
    end
  end
    return false
end






#won?
# def won?(board)
#   WIN_COMBINATIONS.each do |win_combination|
#     win_combination.all? do |i|
#       if
#         board[i] == "X"
#         return win_combination
#       elsif
#         board[i] == "O"
#         return win_combination
#       end
#     end
#     return false
#   end
# end
# def won?(board)
#   WIN_COMBINATIONS.each do |win_combination|
#       if win_combination.all? do |i|
#         board[i] == "X"
#         end
#         return win_combination
#       elsif win_combination.all? do |i|
#         board[i] == "Y"
#         end
#       return win_combination
#       else
#         return false
#       end
#   end
# end

# def won?(board)
#   WIN_COMBINATIONS.each do |win_combination|
#     space1 = win_combination[0]
#     space2 = win_combination[1]
#     space3 = win_combination[2]
#
#     check1 = board[space1]
#     check2 = board[space2]
#     check3 = board[space3]
#
#     if check1 == "X" && check2 == "X" && check3 == "X"
#       return win_combination
#     elsif condition
#       check1 == "Y" && check2 == "Y" && check3 == "Y"
#       return win_combination
#     end
#   end
# end



#full?
def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

#draw?
# def draw?(board)
#   if full?(board) && !won?(board)
#   end
# end

def draw?(board)
  (full?(board) && !won?(board)) ? true : false
end

#over?
# def over?(board)
#   if won?(board) || draw?(board)
#   end
# end

def over?(board)
  (won?(board) || draw?(board)) ? true : false
end

#winner?
def winner(board)
  if won?(board)
    test = won?(board)[0]
    if board[test] == "X"
      return "X"
    elsif board[test] == "O"
      return "O"
    end
  else
    return nil
  end
end
