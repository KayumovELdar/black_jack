# frozen_string_literal: true

require_relative 'cards'
require_relative 'player'
require_relative 'dealer_player'
class Main
  def initialize
    print "добрай день, введите ваше имя\n"\

    @name_player = gets.chomp
    print "добро пожаловать #{@name_player} \n"\
    "Cыграем!\n"\

    @player = Player.new
    @dealer = Dealer_player.new
    $card = Cards.new
  end

  def game_cycle
    puts ''
    puts 'делаем ставку по 10$'
    @player.money_player -= 10
    @dealer.money_player -= 10
    # puts $card.cards_hash
    $card.cards_sort
    # puts $card.cards_hash
    puts 'выдача карт игроку...'
    @player.give(2)
    card_info(@player, 'игрока')
    puts 'выдача карт диллеру...'
    @dealer.give(2)
    card_info_dealer(@dealer, 'диллера')
    menu
    card_info(@player, 'игрока')
    card_info_dealer(@dealer, 'диллера')
    result_1
    reset
    result_2
  end

  def result_2
    if @player.money_player.zero?
      puts 'вы банкрот, накопите нужную сумму, приходите снова)'
    elsif @dealer.money_player.zero?
      puts 'вы оставили диллера без штанов((('
    else
      game_cycle
    end
  end

  def reset
    @player.reset
    @dealer.reset
    $card.reset
  end

  def result_1
    puts 'подведем итоги:'
    card_info(@player, 'игрока')
    card_info(@dealer, 'диллера')
    if @player.score == @dealer.score || (@dealer.score > 21 && @player.score > 21)
      @player.money_player += 10
      @dealer.money_player += 10
      puts 'ничья!!!'
    elsif (@player.score > @dealer.score && @player.score <= 21) || @dealer.score > 21
      @player.money_player += 20
      puts 'Вы выиграли!!!'
    else
      @dealer.money_player += 20
      puts 'Вы проиграли!!!'
    end
    puts "ваш счет #{@player.money_player}, счет диллера #{@dealer.money_player}"
  end

  def card_info(player, name)
    print "Карты на руках y #{name}: "
    player.cards_player.each do |key, _value|
      print "#{key} "
    end
    print "текущий счет: #{player.score}"
    puts " В кошельке: #{player.money_player} $"
  end

  def card_info_dealer(player, name)
    print "Карты на руках y #{name}: "
    player.cards_player.each do |_key, _value|
      print '[*]  '
    end
    print 'текущий счет: [???]'
    puts " В кошельке: #{player.money_player} $"
  end

  def menu
    print "что будем делать  ?\n"\
    "1. Пропустить \n"\
    "2. Добавить карту\n"\
    "3. Открыть карты\n"\

    puts 'введите ключ'
    namber_key = gets.chomp
    case namber_key
    when 1
      @dealer.dealer_logic
    when 2
      @dealer.dealer_logic
      @player.give(1)
    when 3
    else
      puts 'данного ключа не сушествует'
      menu
    end
  end
end

m = Main.new
m.game_cycle
