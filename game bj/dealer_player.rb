require_relative 'player'

class Dealer_player < Player
  def dealer_logic
    if @score <= 17
      give(1)
    end
  end
end
