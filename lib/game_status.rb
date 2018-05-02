# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]
  
def won?(board)
    WIN_COMBINATIONS.find do |win_combination|
      ['X','O'].any? { |player| win_combination.all? { |slot| board[slot] == player}}
    end
end

def full?(board)
  board.all? {|slot| slot == 'X' || slot == 'O'}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : NIL
end