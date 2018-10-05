# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [ 0, 1, 2],
  [ 3, 4, 5],
  [ 6, 7, 8],
  [ 0, 3, 6],
  [ 1, 4, 7],
  [ 2, 5, 8],
  [ 0, 4, 8],
  [ 2, 4, 6],
  ]
  
  def draw? (board)
    (full?(board) && !won?(board))
  end
  
  def won? (board) 
    # x_board = board.each_index.select do |index|
    #   board[index] == "X"
    # end
    
    # o_board = board.each_index.select do |index|
    #   board[index] == "O"
    # end
    
    WIN_COMBINATIONS.each do |index_lst|
      if (
        index_lst.all? do |index|
          board[index] == "X"
        end
        )
        return index_lst;
      end
      if(
        index_lst.all? do |index|
          board[index] == "O"
        end
        ) 
        return index_lst;
      end
    end
    return false;
  end
  
  def full? (board)
    board.each_index.all? do |index|
      position_taken?(board, index);
    end
  end
  
  def over? (board)
    if (draw?(board) || won?(board))
      winner(board)
      return true;
    end
  end
  
  def winner (board)
    if (won?(board))
      return board[won?(board)[0]];
    else
      return nil;
    end
  end