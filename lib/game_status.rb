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

  WIN_COMBINATIONS.each do |win_combo|
    #
    all_taken = win_combo.all? do |index|
      position_taken?(board, index)
    end #end all taken.all

    if all_taken
      # puts "full combo #{win_combo}"

      all_X = win_combo.all? do |index|
        board[index] == 'X'
      end  #end all X

      all_O = win_combo.all? do |index|
        board[index] == 'O'
      end  #end all O

    end #end if all taken
    #
    if all_X || all_O
      # puts "allX #{all_X} or All O #{all_O}"
      return win_combo
      return all_X
      return all_O
    end #end if all_X

  end #end WIN_COMBINATIONS each
  return false
end #end won?

def full?(board)
  board.all? do |index|
    !(index.nil? || index == " ")
    #position_taken?(board, index)
  end
  # puts full
end

def draw?(board)
  full = full?(board)
  won = won?(board)

  if full && !won
    return true
  end

  if !full && !won
    return false
  end

  if won
    return false
  end
end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  win_combo = won?(board)
  if win_combo != false

    if win_combo.all?{|index| board[index] == 'X'}
      return 'X'
    end

    if win_combo.all?{|index| board[index] == 'O'}
      return 'O'
    end
  end
end
