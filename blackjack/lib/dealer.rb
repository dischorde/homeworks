require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(_, _)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    while @hand.points < 17
      @hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, bet|
      if player.hand.beats?(@hand)
        player.pay_winnings(2 * bet)
      end
    end
  end
end
