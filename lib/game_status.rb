# Helper Method
def position_taken?(board, index)
  return !(board[index].nil? || board[index] == " ")
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
  if board.all?(" ")
    return false
  end

  WIN_COMBINATIONS.each do |win_combination|

    if position_taken?(board, win_combination[0]) && position_taken?(board, win_combination[1]) && position_taken?(board, win_combination[2]) && board[win_combination[0]] != board[win_combination[1]] && board[win_combination[1]] != board[win_combination[2]]
      puts "draw false"
      return false
    end
    all_taken = win_combination.none? do |i|
            board[i] == " "
          end
    if all_taken && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
      if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && board[win_combination[0]] != " " && board[win_combination[1]] != " " && board[win_combination[2]] != " "
        puts "win combination"
        return win_combination
      else
        puts "win combination false"
        puts "win comb1  #{win_combination[0]}"
        puts "win comb2 #{win_combination[1]}"
        puts "win comb3 #{win_combination[2]}"
        return false
      end
    end
  end
  return false
end

def full?(board)
  if board.none?(" ")
    return true
  else
    return false
  end
end

def draw?(board)
    WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
      return false
    end
  end
  if won?(board) == false && board.none?(" ")
    return true
  elsif won?(board) == false && board.any?(" ") || won?(board) != false && board.none?(" ")
    return false
  end
end

def over?(board)

  if won?(board) != false || draw?(board) || full?(board)
    puts "draw #{draw?(board)}"
    puts "won #{won?(board)}"
    puts "full #{full?(board)}"
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)==false
    return nil
  else
  return board[won?(board)[0]]
end
end
# def draw?(board)
#   if won?(board)==false && full?(board)
#     return true
#   elsif won?(board)
#     return false
#   end
# end
#
#
# def won?(board)
#   if board.all?(" ")
#     return false
#   end
#   WIN_COMBINATIONS.each do |win_combination|
#     # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
#     # grab each index from the win_combination that composes a win.
#
#       # load the value of the board at win_index_3
#       all_taken = win_combination.none? do |i|
#         board[i] == " "
#       end
#       if all_taken
#       if board[win_combination[0]] == board[win_combination[1]]&& board[win_combination[1]] == board[win_combination[2]]
#
#         return win_combination # return the win_combination indexes that won.
#       else
#          return false
#       end
#     end
#   end
# end
#
# def full?(board)
#   if board.any?(" ")
#     return false
#   else
#     true
#   end
# end
#
# def over?(board)
#   if won?(board) || full?(board) || draw?(board)
#     return true
#   else
#     return false
#   end
# end
#
# def winner(board)
#   if won?(board) != false
#     return board[won?(board)[0]]
#   elsif won?(board) == false
#     return nil
#   else
#     return nil
#   end
# end
