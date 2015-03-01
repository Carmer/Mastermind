require './lib/mastermind'

class Runner

  attr_reader :mastermind

  def initialize
    @mastermind = Mastermind.new
  end

  def run
    print File.read(File.join(__dir__, "intro_graphic.txt"))
    mastermind.response.welcome
    mastermind.menu
  end
end
new_game = Runner.new
new_game.run
