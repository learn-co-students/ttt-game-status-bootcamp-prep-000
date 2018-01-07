# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == ' ')
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
].freeze

def won?(board)
  WIN_COMBINATIONS.find do |combo|
      board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
          position_taken?(board, combo[0])
  end
end

def full?(board)
  board.none? { |place| place == ' ' }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  # Must be a winning board
  # Must return X or O if a winning board
  winning_combination = won?(board)
  board[winning_combination.first] if winning_combination
end

#ask julian how to begin disecting what the question is really asking
#What are the context clues I should be looking for?
#How do I make sense of what exactly they are asking?
