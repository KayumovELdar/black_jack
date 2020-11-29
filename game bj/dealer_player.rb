# frozen_string_literal: true

require_relative 'player'

class Dealer_player < Player
  def dealer_logic
    give(1) if @score <= 17
  end
end
