#while loop - Fail
i = 0
while i < 8
  if board[WIN_COMBINATIONS[i][0]] == board[WIN_COMBINATIONS[i][1]] &&
    board[WIN_COMBINATIONS[i][1]] == board[WIN_COMBINATIONS[i][2]]
    return WIN_COMBINATIONS[i]
    i += 1
  end
end

# Not empty
if board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  return false
end
