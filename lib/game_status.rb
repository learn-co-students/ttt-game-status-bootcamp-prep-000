
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]


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
  xcounter = 0
  ocounter = 0
  WIN_COMBINATIONS.each do |combo|
#    puts "combo: " + combo.inspect
    combo.each do |el|
#      puts el
      if board[el] == "X"
        xcounter += 1
      end

      if board[el] == "O"
        ocounter += 1
      end

      puts xcounter

      if ocounter == 3 || xcounter == 3
        return combo
      end

    end
    xcounter = 0
    ocounter = 0

  end
false
end

puts won?(board).inspect

def full?(board)
  board.none? do |el|
    board[el.to_i - 1] == " "
  end
end


def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  nil
end


puts "full section"
puts full?(board)
