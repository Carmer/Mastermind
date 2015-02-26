require_relative 'response'
require_relative 'sequence_generator'
require_relative 'printer'
require_relative 'guess_evaluator'
require_relative 'user_input'


class Mastermind

  attr_reader :response_count,
              :key,
              :printer,
              :evaluate,
              :response,
              :input,
              :quit


  def initialize
    @response_count = 0
    @key = SequenceGenerator.new
    @printer = Printer.new
    @evaluate = GuessEvaluator.new
    @response = Response.new(Hash.new)
    @input = UserInput.new
  end


  def execute(input)
    #secret = "BBGB" # this is mock sercret for testing
    secret
    if input == key.secret
      Response.new(message: printer.winner, status: :won)
    else
      Response.new(message: printer.try_again, status: :continue)
    end
  end

  def begin_game
    key.generate_sequence
    printer.begin
  end

  def instructions
    printer.instructions
  end

  def quit
    Response.new(message: printer.quit , status: :game_over)
  end

end


# game = Mastermind.new
#
# print game.execute("rbyg")
