require './lib/mastermind'

class Runner

  attr_reader :mastermind

  def initialize
    @mastermind = Mastermind.new
  end

  def run
    response = nil
    printer.welcome


    until response && response.status == :won
      guess = input.user_guess
      
      response = mastermind.execute(input)
      puts response.message
      if response.status == :won
        response = true
      else
      end
    end
    printer.goodbye
  end
end

new_game = Runner.new

new_game.run
