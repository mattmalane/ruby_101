VALID_CHOICES = { 'rock' => 'r',
                  'paper' => 'p',
                  'scissors' => 's',
                  'lizard' => 'l',
                  'spock' => 'sp' }

MOVES = { 'rock' => ['scissors', 'lizard'],
          'paper' => ['rock', 'spock'],
          'scissors' => ['paper', 'lizard'],
          'lizard' => ['spock', 'paper'],
          'spock' => ['scissors', 'rock'] }

SCORE = { player: 0,
          computer: 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  MOVES[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("Computer won this round!")
  else
    prompt("It's a tie!")
  end
end

def update_score(player, computer)
  if win?(player, computer)
    SCORE[:player] = SCORE[:player] + 1
  elsif win?(computer, player)
    SCORE[:computer] = SCORE[:computer] + 1
  end
end

def show_score
  prompt("You have #{SCORE[:player]} points.")
  prompt("The computer has #{SCORE[:computer]} points.")
end

def grand_winner
  if SCORE[:player] == 5
    prompt("You are the grand winner!")
  elsif SCORE[:computer] == 5
    prompt("The computer is the grand winner!")
  end
end

def welcome_message
  puts <<-MSG
  Welcome to Rock Paper Scissors Lizard Spock!
  First to five points wins!
  Choose one: #{VALID_CHOICES.keys.to_a.join(', ')}
  You can also use the first letter of the move for your choice!
  rock = r, paper = p, scissors = s, lizard = s, spock = sp
  MSG
end

welcome_message
loop do
  prompt("Choose one: rock(r), paper(p), scissors(s), lizard(l), spock(sp)")

  choice = ''
  loop do
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_CHOICES.value?(choice)
      choice = VALID_CHOICES.key(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.keys.to_a.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)
  update_score(choice, computer_choice)
  show_score

  break if SCORE.value?(5)
end

grand_winner

prompt("Thank you for playing. Good bye!")
