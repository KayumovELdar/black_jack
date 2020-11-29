# frozen_string_literal: true

require_relative 'cards'
require_relative 'player'
class Player
  attr_accessor :cards_player, :money_player
  attr_reader :score

  def initialize
    @money_player = 100
    @cards_player = {}
    @score = 0
  end

  def counting(key)
    @score += @cards_player[key]
    @score -= 10 if @score > 21 && ([key] & ['[T✝]', '[T♦]', '[T♥]', '[T♠]']) == ''
  end

  def give(namber)
    namber.times do |_x|
      key = $card.give_rard
      cards_player.merge!(key => $card.cards_hash[key])
      counting(key)
    end
  end

  def reset
    @cards_player = {}
    @score = 0
  end
end
