# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1 , 2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]


]

def won?(board)
 winning_combo = WIN_COMBINATIONS.select do |combo|
    if combo.all? do |space| position_taken?(board, space) end
      if [ board[combo[0]], board[combo[1]], board[combo[2]] ].all? do |square| square == "X" end || [ board[combo[0]], board[combo[1]], board[combo[2]] ].all? do |square| square == "O" end
        combo
      end
    end
  end[0]
end

def full?(board)
  board.none? do |space| space == "" || space == " " end
end

def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  won = won?(board)
  if won
    board[won[0]]
  end
end
