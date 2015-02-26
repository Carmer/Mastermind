require './lib/mastermind'

class Runner

  attr_reader :mastermind

  def initialize
    @mastermind = Mastermind.new
  end

  def run
    #response = nil
    mastermind.printer.welcome

    until mastermind.response.status == :game_over || mastermind.response.status == :won

    answer = mastermind.input.accept_input

    if    answer == ""
      mastermind.printer.welcome
    elsif answer == "q"
      mastermind.quit
    elsif answer == "i"
      mastermind.instructions
    elsif answer == "p"
      mastermind.begin_game
    else
      mastermind.evaluate
    end


  end
end
end

  #     puts response.message
  #     if response.status == :won
  #       response = true
  #     else
  #     end
  #   end
  #   printer.goodbye




new_game = Runner.new

new_game.run
