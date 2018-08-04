# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],   #top row
  [3, 4, 5],   #middle row
  [6, 7, 8],   #bottom row
  [0, 3, 6],   #left column
  [1, 4, 7],   #middle column
  [2, 5, 8],   #right column
  [0, 4, 8],   #diagonal 1
  [2, 4, 6]   #diagonal 2
]

def won?(array)
  winning_move = nil
  WIN_COMBINATIONS.each do | combo |
    first_position = combo[0]
    second_position = combo[1]
    third_position = combo[2]

    first_mark = array[first_position]
    second_mark = array[second_position]
    third_mark = array[third_position]
    if (first_mark == second_mark) && (first_mark == third_mark) && position_taken?(array, first_position)
      winning_move = combo
    end
  end
  winning_move
end

def full?(array)
  !array.any?{|i| i == " "}
end

def draw?(array)
  full?(array) && !won?(array)
end

def over?(array)
  draw?(array) || won?(array)
end

def winner(array)
  winning_move = won?(array)
  if (winning_move)
    array[winning_move[0]]
  else
    winning_move
  end
end
