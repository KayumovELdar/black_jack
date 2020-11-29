# frozen_string_literal: true

class Cards
  attr_reader :cards_hash

  def initialize
    @namber = 0
    @cards_hash = {}
    @cards_mas = []
    card_suit = ['✝', '♦', '♥', '♠']
    card_namber = %w[2 3 4 5 6 7 8 9 10]
    card_jqk = %w[J Q K]
    card_t = ['T']
    cards_create(card_suit, card_namber, false)
    cards_create(card_suit, card_jqk, 10)
    cards_create(card_suit, card_t, 11)
  end

  def cards_create(card_suit, card_namber, key)
    card_suit.each do |x|
      card_namber.each do |y|
        if key
          @cards_hash.merge!("[#{y}#{x}]" => key)
        else
          @cards_hash.merge!("[#{y}#{x}]" => y.to_i)
        end
      end
    end
  end

  def cards_sort
    @cards_hash = @cards_hash.sort { |_a, _b| rand <=> rand }.to_h
  end

  def give_rard
    @namber += 1
    @cards_hash.keys[@namber - 1]
  end

  def reset
    @namber = 0
  end
end

card = Cards.new
# h={}
# puts card.cards_hash
# puts card.cards_hash.keys[0]
#
# card.cards_sort
# puts card.cards_hash
# puts card.cards_hash.keys[0]
# puts card.cards_hash["[3♦]"]
#
# puts card.cards_hash[0]
# puts "11111"
# puts card.give_rard
# puts card.give_rard
# puts card.give_rard
# puts card.give_rard
#
# h.merge!(card.cards_hash.keys[0] => card.cards_hash.values[0])
# puts h
# puts card.cards_hash.length
#
#
# puts card.cards_hash
# card.cards_sort
# puts card.cards_hash
# puts card.give_rard
# a=card.give_rard
# puts a
# puts a
