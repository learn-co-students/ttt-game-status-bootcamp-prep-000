# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(array)
  WIN_COMBINATIONS.detect do |win_combination|
    num_1 = win_combination[0]
    num_2 = win_combination[1]
    num_3 = win_combination[2]
    pos_1 = array[num_1]
    pos_2 = array[num_2]
    pos_3 = array[num_3]
    
    if pos_1 == pos_2 && pos_2 == pos_3 && position_taken?(array, num_1)
      return win_combination
    else
     false
    end
  end
end


def full?(array)
  array.all? do |space|
    if space == " "
      false
    else
      true
    end
  end
end

def draw?(array)
  if full?(array) && !(won?(array))
    true
  else
    false
  end
end
  
def over?(array)
  if draw?(array) || won?(array)
    true
  else
    false
  end
end

def winner(array)
  WIN_COMBINATIONS.detect do |win_combination|
    num_1 = win_combination[0]
    num_2 = win_combination[1]
    num_3 = win_combination[2]
    pos_1 = array[num_1]
    pos_2 = array[num_2]
    pos_3 = array[num_3]
    
    if pos_1 == pos_2 && pos_2 == pos_3 && position_taken?(array, num_1)
      return pos_1
    else
     false
    end
  end
end
    