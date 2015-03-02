require_relative "mastermind"

class Menu

  attr_reader :input

  def initialize(mastermind_instance, input)
    @mastermind = mastermind_instance
    @input = input.downcase
  end

  def menu_parse
    welcome
    quit
    begin_the_game
    cheat
  end

  def welcome
    if input == ""
      @mastermind.response.welcome
    end
  end

  def quit
    if input == "q"
      @mastermind.response.quit
    end
  end

  def begin_the_game
    if input == "p"
      @mastermind.begin_game
    end
  end

  def cheat
    if input == "c"
      @mastermind.response.cheat(@mastermind.secret)
    end
  end

end
