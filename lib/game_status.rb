# DEFINE constant capitalized, 8 ways to win
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle
  [6,7,8], # Bottom
  [0,3,6], # Left Column
  [1,4,7], # Middle
  [2,5,8], # Right
  [0,4,8], # Falling Diag
  [2,4,6]  # Rising Diag
]

def display_board(
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
)
  puts 'display_board'
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end






def check_win_combination?(board, player, win_combo)
  # win_combo.all? do |position|
  #   board[position] == player
  win_index_1 = win_combo[0]
  win_index_2 = win_combo[1]
  win_index_3 = win_combo[2]

  position_1 = board[win_index_1] # load value of board at win_index_1
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  if position_1 == player && position_2 == player && position_3 == player
    return win_combo
  end
end

# WON?
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return win_combo
    elsif check_win_combination?(board, 'O', win_combo)
      return win_combo
    else
      return false
    end
  end
end







# HELPER METHOD
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# FULL?
def full?(board)
  if board.include?(" ") || board.include?("")
    return false
  else
    return true
  end
end

# DRAW?
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

# OVER?
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    puts 'not over, keep going'
    return false
  end
end

# WINNER
def winner(board)
  if !won?(board)
    return nil
  else WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return 'X'
    elsif check_win_combination(board, 'O', win_combo)
      return 'O'
    end
  end
end
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
      puts 'valid move'
      return true
  else
      return false
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
   if space == "X" || space == "O"
     counter +=1
   end
 end
 return counter
end

def player(board)
  if turn_count(board) % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

# def move(board,index,token)
  # board[index] = token
  # play(board)
# end

# def input_to_index(n)
#   index = n.to_i - 1
#   index
# end

# def turn(board)
#   puts 'Enter a number 1-9:'
#   user_input = gets.strip
#   index = input_to_index(user_input)
#   token = current_player(board)
#
#   if valid_move?(board,index) #### call
#     puts 'valid move!'
#     move(board,index,token)
#     display_board(board)
#   else
#     puts 'not valid, try again'
#     turn(board)
#   end
#
#   display_board
# end

# def play(board)
#   until over?(board) == true || won?(board) != false
#     puts 'turn'
#     turn(board)
#   end
#   if winner(board)
#     puts 'Congrats'
#   elsif draw?(board)
#     puts 'Draw!'
#   else
#     return nil
#   end
# end
