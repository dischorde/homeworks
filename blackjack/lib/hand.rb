class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    cards = deck.take(2)
    self.new(cards)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    total = 0
    num_aces = 0

    @cards.each do |card|
      if card.value == :ace
        total += 11
        num_aces += 1
      else
        total += card.blackjack_value
      end
    end

    if num_aces > 0 && total > 21
      until num_aces == 0 || total < 22
        total -= 10
        num_aces -= 1
      end
    end

    total
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    points > other_hand.points || other_hand.busted?
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
