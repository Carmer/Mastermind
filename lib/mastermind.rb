require 'pry'                          # => true
require_relative 'response' # ~> LoadError: cannad such file -- ./lib/printer
require_relative 'sequence_generator'
require_relative 'guess_evaluator'
require_relative 'menu'

class Mastermind

  attr_reader   :secret,
                :response

  attr_accessor :start_time,
                :end_time

  def initialize
    @secret = []
    @response = Response.new
    @start_time = nil
  end

  def play
    until @response.status == :game_over || @response.status == :won
      response.welcome
      input = gets.chomp
      game_menu = Menu.new(self, input)
      game_menu.menu_parse
    end
  end

  def begin_game
    start_time
    @secret = SequenceGenerator.new.generate_sequence
    response.begin_game
    game_loop
  end

  def game_loop
    until @response.status == :game_over || @response.status == :won
      input = gets.chomp
      if input[/[icq]/]
        in_game_menu = Menu.new(self, input)
        in_game_menu.menu_parse
      else
        check = GuessEvaluator.new(input, @secret)
        case
        when check.guess_correct?
          response.response_count += 1
          @response.winner(input, response.response_count, total_min, total_sec)
        when check.guess_too_short?
          @response.guess_too_short
        when check.guess_too_long?
          @response.guess_too_long
        when input[/[rbgy]{4}/]
          @response.correct_input(input, check.guess_num_colors_correct, check.guess_correct_positions)
        else
          @response.invalid_input
        end
        if @response.response_count > 9
          @response.out_of_guesses
        end
      end
    end
    end_time
    input = gets.chomp
    final_menu = Menu.new(self, input)
    final_menu.menu_parse
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
