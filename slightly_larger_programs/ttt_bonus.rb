require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
CHOOSE = ['Computer', 'Player']

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  
end
# rubocop:enable Metrics/AbcSize

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

   # offense
  
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  

  if !square # defense second
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = 5 if brd[5] == INITIAL_MARKER
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(winner, score)
  if winner == 'Player'
    score[:player_score] += 1
  elsif winner == 'Computer'
    score[:computer_score] += 1
  end
end

def end_game_prompt(score)
  if score[:player_score] == 5
    prompt "You have reached 5 points. You are the winner!"
  elsif score[:computer_score] == 5
    prompt "Computer has reached 5 points. You lose!"
  end
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    return 'Computer'
  else
    return 'Player'
  end
end

def choose_first_player
  prompt "Pick who goes first: Computer, or Player"
  answer = gets.chomp.capitalize
  
  loop do
    case answer
    when 'Computer' then CHOOSE[0]
    when 'Player'   then CHOOSE[1]
    else            prompt "You have to choose 'Computer' or 'Player'"
    end
    break if answer == 'Computer' || answer == 'Player'
  end
end

score = {player_score: 0, computer_score: 0}
loop do
  board = initialize_board
  current_player = choose_first_player
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
  else
    prompt "It's a tie!"
  end

  update_score(detect_winner(board), score)
  prompt "Your score is #{score[:player_score]}. The computer's score is #{score[:computer_score]}."
  sleep 4
  break if score[:player_score] == 5 || score[:computer_score] == 5
end

end_game_prompt(score)
prompt "Thanks for playing Tic Tac Toe! Goodbye!"