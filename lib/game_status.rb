# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
]
def won?(board)
  oplayer = board.each_index.select{|i| board[i] == 'O'}
  xplayer = board.each_index.select{|i| board[i] == 'X'}
  WIN_COMBINATIONS.find{|winningMove| (winningMove- oplayer).empty?|| (winningMove-xplayer).empty?}
end

def full?(board)
  board.find{|e| e!='X' && e !="O"}.nil?
end

def draw?(board)
  (won?(board).nil?) && full?(board)
end
def over?(board)
  (!won?(board).nil?) || draw?(board) || full?(board)
end
def winner(board)
  winningmove = won?(board)
  !winningmove.nil? ? board[winningmove[0]] : nil
end
p won?(['X','O','O']) == false
  