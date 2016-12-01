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
  [2,4,6],
]


def won?(board)
  WIN_COMBINATIONS.each do |win_arr|
     test = win_arr.all? do |ele|
      board[ele] == "X" || win_arr.all? do |ele|
       board[ele] == "O"
     end
    end
    if test == true
    return win_arr
    end
  end
  false
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) == true && won?(board) == false
end

def over?(board)
  full?(board) == true || draw?(board) == true || won?(board) == true
end

def winner(board)
  won?(board) != false ? board[won?(board)[1]].to_s : nil
end
