require 'pry'                          # => true
require_relative 'response' # ~> LoadError: cannad such file -- ./lib/printer
require_relative 'sequence_generator'
require_relative 'guess_evaluator'

class Mastermind

  attr_reader   :secret,
                :response

  attr_accessor :start_time,
                :end_time

  def initialize
    @secret = SequenceGenerator.new.generate_sequence
    @response = Response.new(Hash.new)
    @start_time = Time.now
  end

  def begin_game
    @secret
    response.begin_game
    game_loop
  end

  def game_loop
    until @response.status == :game_over || @response.status == :won
      guess = gets.chomp
      if guess[/[icq]/]
        in_game_menu(guess)
      else
        check = GuessEvaluator.new(guess, @secret)
        case
        when check.guess_correct?
          response.response_count += 1
          @response.winner(guess, response.response_count, total_min, total_sec)
        when check.guess_too_short?
          @response.guess_too_short
        when check.guess_too_long?
          @response.guess_too_long
        when guess[/[rbgy]{4}/]
          @response.correct_input(guess, check)
        else
          @response.invalid_input
        end
        if @response.response_count > 9
          @response.out_of_guesses
        end
      end
    end
    end_time
    menu
  end

  def menu
    guess = gets.chomp
    case
    when    guess == ""
      welcome
    when guess == "q"
      @response.quit
    when guess == "i"
      instructions
    when guess == "p"
      begin_game
    when guess == "c"
      response.cheat(@secret)
    end
  end

  def in_game_menu(guess)
    case
    when    guess == ""
      what_is_your_guess
    when guess == "q"
      @response.quit
    when guess == "i"
      response.instructions
    when guess == "p"
      begin_game
    when guess == "c"
      response.cheat(@secret)
    end
  end

  def start_time
    @start_time = Time.now
  end

  def end_time
    Time.now
  end

  def total_time
    total = end_time - @start_time
    total.divmod(60)
  end

  def total_min
  total_time[0]
  end

  def total_sec
    total_time[1].to_i
  end
end
