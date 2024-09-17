
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
$the_winner = ""

def won?(board)
  is_winner = false
  WIN_COMBINATIONS.each do |combo|
      if combo.all? do |pos|
        board[pos] == "X"
      end
      is_winner = true
    elsif combo.all? do |pos|
        board[pos] == "O"
      end
      is_winner = true
    else
      next
    end
  end
  if is_winner == true
    xwin = WIN_COMBINATIONS.select do |combo|
        combo.all? do |pos|
          board[pos] == "X"
        end
      end
    owin = WIN_COMBINATIONS.select do |combo|
        combo.all? do |pos|
          board[pos] == "O"
        end
      end
      if xwin == []
        $the_winner = "O"
        owin[0]
      else
        $the_winner = "X"
        xwin[0]
      end
  else
    false
  end
end

def full?(board)
  board.all? do |pos|
    pos == "X" || pos == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    true
  end
end

def winner(board)
  if draw?(board) || !over?(board)
    nil
  else
    $the_winner
  end
end
