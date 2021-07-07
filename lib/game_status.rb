# Helper Method
def won?(board)
  if board.none?{|i| i=='X'} && board.none?{|i| i=='O'}
    return false
  elsif
  WIN_COMBINATIONS.each do |potential_winner|
    win_index1=potential_winner[0]
    win_index2=potential_winner[1]
    win_index3=potential_winner[2]
    if board[win_index1] == 'X' && board[win_index2] == 'X' && board[win_index3] == 'X'
      return array = [win_index1,win_index2,win_index3]
    elsif board[win_index1] == 'O' && board[win_index2] == 'O' && board[win_index3] == 'O'
      return array = [win_index1,win_index2,win_index3]
    end
                        end
  end
else
  return false

end

def full?(board)
  board.none? do |what|
    what == " "
  end
end

def draw?(board)
  if (full?(board)==true && won?(board)==false)

    return true
  else
    return nil
  end
end

def over?(board)
  if (won?(board) != false)
    return true
  elsif (full?(board)==true)
    return "Game Over"
  elsif (draw?(board)==true)
    return "Game Over"
  else
    return nil
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else

    WIN_COMBINATIONS.each do |potential_winner|
      win_index1=potential_winner[0]
      win_index2=potential_winner[1]
      win_index3=potential_winner[2]
      if board[win_index1] == 'X' && board[win_index2] == 'X' && board[win_index3] == 'X'
        return winner = 'X'
      elsif board[win_index1] == 'O' && board[win_index2] == 'O' && board[win_index3] == 'O'
        return winner = 'O'
      end
    end


  end
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



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
