def won?(board)
  WIN_COMBINATIONS.each do |combo|
     win_index_1 = combo[0]
     win_index_2 = combo[1]
     win_index_3 = combo[2]
     potential_win = [board[win_index_1], board[win_index_2], board[win_index_3]]
     if potential_win.all? {|el| el == "X"} || potential_win.all? { |el| el == 'O'}
       return combo
     end
  end
  false
end

# def won?(board)
#   WIN_COMBINATIONS.each do |combo|
#     if combo.map { |i| board[i] }.all? { |el| el == 'X' } ||
#        combo.map { |i| board[i] }.all? { |el| el == 'O' }
#        return combo
#      end
#   end
#   false
# end


def full?(board)
  board.all? { |pos| pos != " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
