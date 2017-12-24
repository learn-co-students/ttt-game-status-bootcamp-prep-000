# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    # win by rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    # win by columns
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    # win by diangonal
    [0, 4, 8],
    [6, 4, 2]
]
def won?(board)
  result = nil
  WIN_COMBINATIONS.each do |win_combination|
    count = 0
    first_index = win_combination.first
    if position_taken?(board, first_index)
      #position co token roi
      token = board[first_index]

      win_combination.each do |index|
        count +=1 if board[index] == token
      end

      result = win_combination if count == 3

    else
      #position empty
      next
    end
  end
  return result
end

def full?(board)
  count = 0
  board.each do |element|
    count += 1 if element == 'X' || element == 'O'
  end
  count == board.length
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  board[won?(board).first] if !won?(board).nil?
end
