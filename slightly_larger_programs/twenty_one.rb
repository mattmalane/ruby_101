SUITS = ['H', 'D', 'C', 'S']
VALUES = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def initial_card_deal(player_cards, dealer_cards, deck)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def total(cards)
  sum = cards.map do |card|
          if card[1] == card[1].to_i.to_s
            card[1].to_i
          elsif card[1] =~ /[JQK]/
            10
          elsif card[1] =~ /[A]/
            11
          end
        end

  if sum.inject(:+) > 21 && sum.include?(11)
    return sum.inject(:+) - 10 * sum.count(11)
  else
    return sum.inject(:+)
  end
end

def hit_me!(player_cards, deck)
  player_cards << deck.pop
end

def busted?(cards)
  total(cards) > 21
end

def detect_results(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_results(dealer_cards, player_cards)
  result = detect_results(dealer_cards, player_cards)

  case result
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player        then prompt "You win!"
  when :dealer        then prompt "Dealer Wins!"
  when :tie           then prompt "It's a tie!"
  end
end

def play_again?
  puts "+++++++++++++++"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  prompt "Welcome to Twenty-one!"
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  initial_card_deal(player_cards, dealer_cards, deck)

  prompt "Dealer has #{dealer_cards[0][1]} and ?"
  prompt "You have #{player_cards[0][1]} and #{player_cards[1][1]}."
  prompt "You have a total of #{total(player_cards)}."

  # Player turn
  loop do
    answer = nil
    loop do # validation
      prompt "Do you want to hit or stay?"
      answer = gets.chomp
      break if ['hit', 'stay'].include?(answer)
      prompt 'You must choose to hit or stay'
    end
    
    if answer == 'hit'
      hit_me!(player_cards, deck)
      prompt "You chose to hit!"
      prompt "You now have #{player_cards}."
      prompt "Your total is #{total(player_cards)}"
    end
    
    break if answer == 'stay' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_results(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You chose to stay at #{total(player_cards)}"
  end

  # Dealer turn
  prompt "Dealer turn...."

  loop do
    break if total(dealer_cards) >= 17
    prompt "Dealer hits"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now #{dealer_cards}."
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now #{total(dealer_cards)}."
    display_results(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  # Both stay
  puts "+++++++++++++++"
  prompt "Dealer has #{dealer_cards}, for a total of #{total(dealer_cards)}"
  prompt "Player has #{player_cards}. for a total of #{total(player_cards)}"
  puts "+++++++++++++++"

  display_results(dealer_cards, player_cards)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One!"


 




