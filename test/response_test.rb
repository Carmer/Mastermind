require 'minitest/autorun'
require 'minitest/pride'
require './lib/response'

class ResponseTest < Minitest::Test


  def test_it_has_the_expected_messages
  expected = [:welcome, :begin_game, :guess_too_short, :guess_too_long, :correct_input, :out_of_guesses, :instructions, :winner, :quit]

  printer = Response.new
  expected.each do |message|
    assert printer.respond_to?(message), "Response should have a #{message} method."
    end
  end

  def test_response_winner_has_a_won_status_and_message
    stat = Response.new
    stat.winner("", 3, 0, 34)
    assert_equal :won, stat.status
  end

  def test_response_guess_too_short_has_a_continue_status
    stat = Response.new
    stat.guess_too_short
    assert_equal :continue, stat.status
  end

  def test_response_guess_too_long_has_a_continue_status
    stat = Response.new
    stat.guess_too_long
    assert_equal :continue, stat.status
  end

  def test_response_invalid_input_has_a_continue_status
    stat = Response.new
    stat.invalid_input
    assert_equal :continue, stat.status
  end

  def test_response_instructions_has_a_continue_status
    stat = Response.new
    stat.instructions
    assert_equal :continue, stat.status
  end

  def test_response_begin_game_has_a_continue_status
    stat = Response.new
    stat.begin_game
    assert_equal :continue, stat.status
  end

  def test_response_welcome_has_a_continue_status
    stat = Response.new
    stat.welcome
    assert_equal :continue, stat.status
  end

  def test_response_cheat_has_a_continue_status
    stat = Response.new
    stat.cheat("yygb")
    assert_equal :continue, stat.status
  end

  def test_response_out_of_guesses_has_a_game_over_status
    stat = Response.new
    stat.out_of_guesses
    assert_equal :game_over, stat.status
  end

end
