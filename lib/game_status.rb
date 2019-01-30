require 'pry'

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

def won? board
  WIN_COMBINATIONS.each do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]

    position1 = board[win_index1]
    position2 = board[win_index2]
    position3 = board[win_index3]

    if position1 == 'X' && position2 == 'X' && position3 == 'X' || position1 == 'O' && position2 == 'O' && position3 == 'O'
      return win_combination
    end
  end
  false
end

def full? board
  board.each do |space|
    if space == ' '
      return false
    end
  end
  true
end

def draw? board
  if full?(board) && won?(board) || won?(board)
    return false
  end
  true
end

def over? board
  # if draw?(board) || won?(board)
  if !full?(board) && won?(board)
    return true
  elsif !full?(board)
    return false
  end
  true
end

def winner board
  if won?(board)
    winning_positions = won?(board)
    first_winning_position = winning_positions[0]
    return winning_character = board[first_winning_position]
  end
  nil
end
