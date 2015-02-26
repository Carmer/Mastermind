require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_evaluator'

class GuessEvaluatorTest < Minitest::Test

  def test_it_exists
    assert GuessEvaluatorTest
  end

  def test_game_recognizes_correct_guess
    guess = GuessEvaluator.new("yyyy", ["y","y","y","y"])
    assert guess.guess_correct?
  end

  def test_game_tells_user_if_entry_is_too_short_1
    guess = GuessEvaluator.new("y", ["y","y","y","y"])
    assert guess.guess_too_short?
  end

  def test_game_tells_user_if_entry_is_too_short_2
    guess = GuessEvaluator.new("yy", ["y","y","y","y"])
    assert guess.guess_too_short?
  end

  def test_game_tells_user_if_entry_is_too_short_3
    guess = GuessEvaluator.new("yyy", ["y","y","y","y"])
    assert guess.guess_too_short?
  end

  def test_game_tells_user_if_entry_is_too_long
    guess = GuessEvaluator.new("yyyyy", ["y","y","y","y"])
    assert guess.guess_too_short?
  end

  def test_it_can_evaluate_the_guess_and_give_feedback
    guess = GuessEvaluator.new("yrrr", ["y","y","y","y"])
    assert "Your guess had #{guess.guess_num_correct} characters correct, #{guess_correct_positions} in the correct position."
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
