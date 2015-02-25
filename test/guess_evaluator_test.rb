require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_evaluator'

class GuessEvaluatorTest < Minitest::Test

  def test_it_exists
    assert GuessEvaluatorTest
  end

  def test_game_can_accept_a_guess
    user_guess = GuessEvaluator.new
    assert_equal "", user_guess.accept_guess

  end


  def test_game_tells_user_if_entry_is_too_short_1
    skip
  end

  def test_game_tells_user_if_entry_is_too_short_2
    skip
  end

  def test_game_tells_user_if_entry_is_too_short_3
    skip
      secret = "BGGY"
      guess = "BRY"
      assert_equal
  end

  def test_game_tells_user_if_entry_is_too_long
    skip
  end

  def test_it_can_evaluate_the_guess_and_give_feedback
    skip
  end

  def test_it_can_generate_message_if_one_color_of_guess_is_right
  skip
  end

  def test_it_can_gererate_message_if_two_colors_of_guess_are_correct
    skip
  end

  def test_it_can_generate_message_if_three_colors_of_guess_are_correct
    skip
  end

  def test_it_can_generate_message_if_four_colors_of_guess_are_correct
    skip
  end


end
