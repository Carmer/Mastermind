require 'pry'
require_relative 'response'
require_relative 'sequence_generator'
require_relative 'printer'
require_relative 'guess_evaluator'


class Mastermind

  attr_reader :response_count,
              :secret,
              :message,
              :response,
              :guess


  def initialize
    @response_count = 0
    @secret = SequenceGenerator.new.generate_sequence
    @message = Printer.new
    @response = Response.new(Hash.new)
  end

  def begin_game
    @secret
    message.begin
    game_loop
  end

  def game_loop
    until @response.status == :game_over || @response.status == :won
      guess = gets.chomp
      check = GuessEvaluator.new(guess, @secret)
      case
      when check.guess_correct?
        @response_count += 1
        @response.status   = :won
        @response.message  = message.winner
      when check.guess_too_short?
        @response.status = :continue
        @response.message = message.guess_too_few_char
      when check.guess_too_long?
        @response.status = :continue
        @response.message = message.guess_too_many_char
      else
        @response_count += 1
        @response.status  = :continue
        @response.message = message.guess_correctness(check.guess_num_correct, check.guess_correct_positions)
      end
      if @response_count > 9
        @response.status  = :game_over
        @response.message = message.out_of_guesses
      end
    end
  end

  def instructions
    message.instructions
  end

  def quit
    @response.status  = :game_over
    @response.message = message.quit
  end

  def cheat
    print @secret
  end
end
