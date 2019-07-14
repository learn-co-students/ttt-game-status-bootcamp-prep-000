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
  won_check = false
    WIN_COMBINATIONS.each do |combination|
      first_index = combination[0]
      second_index = combination[1]
      third_index = combination[2]

      position_1 = board[first_index]
      position_2 = board[second_index]
      position_3 = board[third_index]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X" ) ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O" )
          return combination
          won_check = true
      end
    end
  won_check
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    true
  end
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end
