require './lib/mastermind'

class Runner

  attr_reader :mastermind

  def initialize
    @mastermind = Mastermind.new
  end

  def run
    print File.read(File.join(__dir__, "intro_graphic.txt"))
    mastermind.message.welcome

    until mastermind.response.status == :game_over #|| mastermind.response.status == :won
      answer = gets.chomp

      case
      when    answer == ""
        mastermind.message.welcome
        # mastermind.message(mastermind.response.status)
      when answer == "q"
        mastermind.quit
      when answer == "i"
        mastermind.instructions
      when answer == "p"
        mastermind.begin_game
      when answer == "c" # ----> cheat needs to move into the game
        mastermind.cheat
      end
      answer = ""
    end
  end
end


new_game = Runner.new

new_game.run
