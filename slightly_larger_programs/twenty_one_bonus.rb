require 'pry'

SUITS = ['H', 'C', 'S', 'D']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WINNING_SCORE = 5
WINNING_TOTAL = 21
DEALER_STAY = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'],....]
  values = cards.map { |card| card[1] }
  # values = ['3', 'Q', .....]
  sum = 0
  values.each do |value|
    sum = if value == 'A'
            sum + 11
          elsif value.to_i == 0
            sum + 10
          else
            sum + value.to_i
          end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > WINNING_TOTAL
  end

  sum
end

def busted?(*totals)
  totals[0] > WINNING_TOTAL
end

def detect_result(dealer_total, player_total)
  if player_total > WINNING_TOTAL
    :player_busted
  elsif dealer_total > WINNING_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_results(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt("You busted! Dealer wins!")
  when :dealer_busted
    prompt("Dealer busted! You win!")
  when :player
    prompt("You win!")
  when :dealer
    prompt("Dealer wins!")
  when :tie
    prompt("It's a tie!")
  end
end

def update_score(dealer_total, player_total, score)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    score[:dealer_score] += 1
  when :dealer_busted
    score[:player_score] += 1
  when :player
    score[:player_score] += 1
  when :dealer
    score[:dealer_score] += 1
  when :tie
    nil
  end
end

def display_score(scr)
  prompt "Your score is #{scr[:player_score]}"
  prompt "Dealers score is #{scr[:dealer_score]}"
end

def display_end_game
  puts '-------------------------'
  prompt "The game is over...."
end

def display_next_round
  puts '-------------------------'
  prompt "Get ready for the next round...."
  sleep 3
end

def grand_output(dealer_cards, dealer_total, player_cards, player_total)
  puts "======================================================"
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "======================================================"
end

def display_grand_winner(scr)
  if scr[:player_score] == WINNING_SCORE
    prompt "You have reached #{WINNING_SCORE} points. You are the Grand Winner!"
  else
    prompt "Dealer has reached #{WINNING_SCORE} points. You lost!"
  end
end

def winner?(scr)
  scr[:player_score] == WINNING_SCORE ||
    scr[:dealer_score] == WINNING_SCORE
end

def validate_answer
  player_answer = nil
  loop do
    prompt "Do you want to hit or stay? Enter 'h' for hit, 's' for stay."
    player_answer = gets.chomp
    break if ['h', 's'].include?(player_answer)
    prompt "Sorry, you must choose to hit(h) or stay(s)."
  end
  player_answer
end

def dealer_turn_and_total(dealer_cards, dealer_total, deck)
  loop do
    break if dealer_total >= DEALER_STAY

    prompt("Dealer hits!")
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt("The dealers cards are #{dealer_cards}")
  end
  dealer_total
end

def player_hit(player_cards, player_total, deck, player_answer)
  if player_answer == 'h'
    player_cards << deck.pop
    player_total = total(player_cards)
    prompt("You chose to hit!")
    prompt("Your cards are now #{player_cards}")
    prompt("You have a total of #{player_total}")
  end
  player_total
end

score = { player_score: 0, dealer_score: 0 }
prompt("Welcome to Twenty-One!")
prompt("First to win 5 rounds is the grand winner.")

loop do
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt("Dealing cards.....")
  sleep 3

  prompt("Dealer has #{dealer_cards[0][1]} and ?")
  prompt("You have #{player_cards[0][1]} and #{player_cards[1][1]}")
  prompt("You have a total of #{player_total}")

  loop do
    player_answer = validate_answer
    system 'clear'
    player_total = player_hit(player_cards, player_total, deck, player_answer)
    break if player_answer == 's' || busted?(player_total)
  end

  if busted?(player_total)
    display_results(dealer_total, player_total)
    update_score(dealer_total, player_total, score)
    grand_output(dealer_cards, dealer_total, player_cards, player_total)
    display_score(score)
    display_end_game if winner?(score)
    display_next_round if !winner?(score)
    next unless winner?(score)
    break if winner?(score)
  else
    prompt("You chose to stay!")
    prompt("You stayed with a total of #{player_total}")
  end

  system 'clear'
  prompt("Dealer turn....")
  sleep 3

  dealer_total = dealer_turn_and_total(dealer_cards, dealer_total, deck)

  if busted?(dealer_total)
    prompt "Dealer total is now #{dealer_total}"
    display_results(dealer_total, player_total)
    update_score(dealer_total, player_total, score)
    grand_output(dealer_cards, dealer_total, player_cards, player_total)
    display_score(score)
    display_end_game if winner?(score)
    display_next_round if !winner?(score)
    next unless winner?(score)
    break if winner?(score)
  else
    prompt("Dealer stays at #{dealer_total}")
  end
  sleep 3

  grand_output(dealer_cards, dealer_total, player_cards, player_total)
  display_results(dealer_total, player_total)
  update_score(dealer_total, player_total, score)
  display_score(score)
  display_end_game if winner?(score)
  display_next_round if !winner?(score)

  break if winner?(score)
end

display_grand_winner(score)
prompt("Thank you for playing! Goodbye!")
