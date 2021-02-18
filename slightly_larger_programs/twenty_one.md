# PEDAC

## Twenty-one

**Rules/ requirements**

- Start with a normal 52-card deck consisting of the 4 suits
  (hearts, diamonds, clubs, spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 
  9, 10, jack, queen, king, ace.)
- The goal of twenty-one is to try to get as close to 21 as possible,
  without going over. If you go over21, its a "bust" and you lose.
- Setup: the game consists of a "dealer" and a "player". Both are dealt 2
  cards. The player can see their 2 cards but can only see one of the dealer's cards.
- Card values:
  - 2-10 = face value
  - jack, queen, king = 10
  - ace = 1 or 11

  The aces value is determined each time a new card is drawn from the deck. 
  The program will have to determine values of all aces in the hand.
- Player turn: player goes first, decides to 'hit' or stay'
- Dealer turn: when player stays, its the dealer's turn. dealer must follow
  a strict rule for determining whether to hit or stay: hit until the total is atleast 17. If dealer busts, the player wins.
- Comparing cards: when both player and dealer stay, its time to compare 
  the total values of the cards and see who has the highest value.

**Examples**

Dealer has: Ace and unknown card
You have: 2 and 8

You should hit in this scenario.

Dealer has: 7 and unknown card
You have: 10 and 7

You should stay here

Dealer has: 5 and unknown card
You have: Jack and 6

stay and hope dealer busts

**Data Structure**
- Nested array, where each element is itself a 2-element array that
  represents the card's suit and the card's value.
- A hand that contains 2 of hearts, jack of spades, and ace of diamonds
  [['H', '2'], ['S', 'J'], ['D', 'A']]
- 52 card deck, 4 suits, 13 values.
  SUITS = {'H' => 'hearts', 'S' => 'spades', 'D' => 'diamonds', 'C' => 'clubs'}
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'K, 'Q', 'A']



**Algorithm**

1. Initialize deck
  - create a deck with 52 cards in a nested array => [['H', '2'], ['S', 'J'], ['D', 'A']]
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

- Calculating Aces : aces can be worth either 1 or 11, depending on the
  the context. 

- Calculating the total of cards in hand
  - [['H', '2'], ['S', 'J']]
  - store values of the two cards in a variable
  - convert their string value to an integer value of the card.
  - initialize a sum variable to 0
  - add the integer values of each card, add to sum variable