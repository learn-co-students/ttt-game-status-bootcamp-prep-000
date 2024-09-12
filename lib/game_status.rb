# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  x_plays = []
  o_plays = []
  counter = 0
  board.each do |play|
    if (play.include? "X")
      x_plays << counter
    elsif (play.include? "O")
      o_plays << counter
    end
    counter = counter + 1
  end

  WIN_COMBINATIONS.each do |win|
    if  (x_plays.detect {|play| play == win[0]}) && (x_plays.detect {|play| play == win[1]}) && (x_plays.detect {|play| play == win[2]})
      puts "WINNER"
      return win
    elsif  (o_plays.detect {|play| play == win[0]}) && (o_plays.detect {|play| play == win[1]}) && (o_plays.detect {|play| play == win[2]})
      puts "WINNER"
      return win
    end
  end
  puts "x_plays #{x_plays}"
  puts "o_plays #{o_plays}"
  return false
end

def full?(board)
  if (board.detect{|i| i.include?(" ")})
    return false
  else
    return true
  end
end

def draw?(board)
  if (full?(board) && (!won?(board)))
    return true
  else
    return false
  end
end

def over?(board)
  if (draw?(board))
    return true
  elsif (won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  i = won?(board)
  if (i)
    return board[i[0]]
  end
end
