require_relative "mastermind"

class Menu

  attr_reader :input

  def initialize(mastermind_instance, input)
    @mastermind = mastermind_instance
    @input = input.downcase
  end

  def go_to_menu_option
    welcome
    instructions
    quit
    begin_the_game
    cheat
  end

  def welcome
    if input == ""
      @mastermind.response.welcome
    end
  end

  def instructions
    if input =="i"
      @mastermind.response.instructions
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
