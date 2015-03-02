require 'pry'                         
require_relative 'response'
require_relative 'sequence_generator'
require_relative 'guess_evaluator'
require_relative 'menu'

class Mastermind

  attr_reader   :secret,
                :response

  attr_accessor :start_time,
                :end_time,
                :input

  def initialize
    @secret = []
    @response = Response.new
    @start_time = nil
    @input = nil
  end

  def play
    until @response.status == :game_over || @response.status == :won
      response.welcome
      input = gets.chomp
      input[/[icqpICQP]/]
      game_menu = Menu.new(self, input)
      game_menu.go_to_menu_option
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
      if input[/[icqpICQP]/]
        in_game_menu = Menu.new(self, input)
        in_game_menu.go_to_menu_option
      else
        check = GuessEvaluator.new(input, @secret)
        case
        when check.guess_correct?
          response.guess_count += 1
          @response.winner(input, response.guess_count, total_min, total_sec)
        when check.guess_too_short?
          @response.guess_too_short
        when check.guess_too_long?
          @response.guess_too_long
        when input[/[rbgyRBGY]{4}/]
          @response.correct_input(input, check.guess_num_colors_correct, check.guess_correct_positions)
        else
          @response.invalid_input
        end
        if @response.guess_count > 9
          @response.out_of_guesses
        end
      end
    end
    end_time
    input[/[icqpICQP]/]
    input = gets.chomp
    final_menu = Menu.new(self, input)
    final_menu.go_to_menu_option
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
