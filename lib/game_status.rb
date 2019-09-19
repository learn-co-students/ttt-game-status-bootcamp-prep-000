# Helper Method


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8], [0, 4, 8], [6,4,2]]

def won? (board)

  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = board[win_combination[0]]
    win_index_2 = board[win_combination[1]]
    win_index_3 = board[win_combination[2]]

    if win_index_1 == win_index_2 && win_index_2 == win_index_3 && win_index_1 != " "
      return win_combination
    end
  end
end

def full? (board)
  board.all?{|number| number == "X" || number == "O"}
end

def draw? (board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  draw?(board)|| won?(board)? true : false
end

def winner(board)
  the_winner = won?(board)
  if the_winner
    return board[the_winner[0]]
  end
end
