require_relative 'response'
require_relative 'sequence_generator'
require_relative 'printer'
require_relative 'guess_evaluator'
require_relative 'guess'


class Mastermind

  attr_reader :response_count,
              :sequence_generator,
              :printer,
              :guess_evaluator,
              :response,
              :input


  def initialize
    @response_count = 0
    @sequence_generator = SequenceGenerator.new
    @printer = Printer.new
    @guess_evaluator = GuessEvaluator.new
    @response = Resonse.new
    @input = Guess.new
    
  end


  def execute(input)
    #secret = "BBGB" # this is mock sercret for testing
    secret
    if input == secret
      Response.new(:message => "You Win!", :status => :won)
    else
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end

end


# game = Mastermind.new
#
# print game.execute("rbyg")
