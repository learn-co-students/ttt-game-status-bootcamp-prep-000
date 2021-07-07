# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)

  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    puts "Empty board"
    return false
  end

  WIN_COMBINATIONS.each do |winning_combo|
    if board[winning_combo[0]] == board[winning_combo[1]] &&
       board[winning_combo[1]] == board[winning_combo[2]] &&
       position_taken?(board, winning_combo[0])
       puts "The game has been won!"
       return winning_combo
    end
  end
  false
end

def full?(board)
  board.none? {|element| element.to_s.strip == ""}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
