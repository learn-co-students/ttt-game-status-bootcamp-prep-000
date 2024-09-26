## I realize this is horrendously sloppy... I figure I'll learn with hindsight as I progress through the lessons.

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

win = nil

def won?(board)
  false if board.each == " " || board.each == "" || board.each == nil
  check_win = false
  i = 0
  counter = 0
  array = []
  while i < WIN_COMBINATIONS.size
    array = WIN_COMBINATIONS[i]
    array.each do |idx|
      if board[idx] == "O"
        counter += 1
      end
    end
    if counter == 3
      check_win = true
      break
    else
      counter = 0
      i += 1
    end
  end
  if check_win
    win = "O"
    array
  else
    counter = 0
    i = 0
    while i < WIN_COMBINATIONS.size
      array = WIN_COMBINATIONS[i]
      array.each do |idx|
        if board[idx] == "X"
          counter += 1
        end
      end
      if counter == 3
        check_win = true
        break
      else
        counter = 0
        i += 1
      end
    end
    if check_win
      win = "X"
      array
    else
      false
    end
  end
end

def full?(board)
  board.all? do |idx|
    idx == "X" || idx == "O"
  end
end

def draw?(board)
  if won?(board)
    false
  elsif !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  elsif full?(board)
    true
  else
    false
  end
end

def winner(board)
  false if board.each == " " || board.each == "" || board.each == nil
  check_win = false
  i = 0
  counter = 0
  array = []
  while i < WIN_COMBINATIONS.size
    array = WIN_COMBINATIONS[i]
    array.each do |idx|
      if board[idx] == "O"
        counter += 1
      end
    end
    if counter == 3
      check_win = true
      break
    else
      counter = 0
      i += 1
    end
  end
  if check_win
    "O"
  else
    counter = 0
    i = 0
    while i < WIN_COMBINATIONS.size
      array = WIN_COMBINATIONS[i]
      array.each do |idx|
        if board[idx] == "X"
          counter += 1
        end
      end
      if counter == 3
        check_win = true
        break
      else
        counter = 0
        i += 1
      end
    end
    if check_win
      "X"
    else
      nil
    end
  end
end
