# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left Diagonal
  [2,4,6]  # Right Diagonal
]

def win_combinations_array(board)
  win_array = []
  WIN_COMBINATIONS.each do |win_combinations|
    temp_array=[]
    win_combinations.each do |index|
      temp_array << board[index]
    end
    win_array << temp_array
  end
  win_array
end

#def match_win_combination(win_combination_array)
 #returns winner X or O or nil when there is no winner
  #x = win_combination_array.all? do |match|
  #  match == "X"
  #end

  #o = win_combination_array.all? do |match|
  #  match == "O"
  #end
  #  if x
  #    "X"
  #  elsif o
  #    "O"
  #  else
  #    nil
  #  end
  #end
 #x = win_combination_array.all? do |match|
  # match == "X" || match == "O"
   #puts x
 #end
  # win_combination_array
#end
def get_section_board(board,section,player)
  match=[]
  section.each do |index|
    match << board[index]
  end
  match.all? do |match|
    match == player
  end
end


def won? (board)
  won = false
  if !board.include?("X" || "O") then false end


  WIN_COMBINATIONS.each do |win_combination|
  x = get_section_board(board,win_combination,"X")
  o = get_section_board(board,win_combination,"O")
  x == true ? won = win_combination: false
  o == true ? won = win_combination: false
end
won
end


def full? (board)
  is_full = board.detect do |full|
    full == " "
end
is_full !=" " ? true:false
end

def draw?(board)
  !won?(board) && full?(board) ? true : false
end

def over?(board)
  if draw?(board) then return true end
  if won?(board) then return true end

end

def winner(board)
  winner = won?(board)
  winner ? board[winner[0]] : nil
end
