require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_evaluator'

class GuessEvaluatorTest < Minitest::Test

  def test_it_exists
    assert GuessEvaluatorTest
  end

  def test_game_recognizes_correct_guess
    guess = GuessEvaluator.new("yyyy", ["Y","Y","Y","Y"])
    assert guess.guess_correct?
  end

  def test_game_tells_user_if_entry_is_too_short_1
    guess = GuessEvaluator.new("Y", ["Y","Y","Y","Y"])
    assert guess.guess_too_short?
  end

  def test_game_tells_user_if_entry_is_too_short_2
    guess = GuessEvaluator.new("yy", ["Y","Y","Y","Y"])
    assert guess.guess_too_short?
  end

  def test_game_tells_user_if_entry_is_too_short_3
    guess = GuessEvaluator.new("yyy", ["Y","Y","Y","Y"])
    assert guess.guess_too_short?
  end

  def test_game_tells_user_if_entry_is_too_long
    guess = GuessEvaluator.new("yyyyy", ["Y","Y","Y","Y"])
    assert guess.guess_too_long?
  end

  def test_it_can_evaluate_the_guess_and_give_feedback
    guess = GuessEvaluator.new("yrrr", ["Y","Y","Y","Y"])
    assert_equal 1,  guess.guess_num_colors_correct
  end

  def test_it_can_count_one_color_of_guess_is_right
    guess = GuessEvaluator.new("gyyy", ["Y","Y","Y","r"])
    assert_equal 1,  guess.guess_num_colors_correct
  end

  def test_it_can_count_two_colors_of_guess_are_correct
    guess = GuessEvaluator.new("gyyy", ["Y","G","Y","R"])
    assert_equal 2,  guess.guess_num_colors_correct
  end

  def test_it_can_count_three_colors_of_guess_are_correct
    guess = GuessEvaluator.new("gyyr", ["G","Y","R","B"])
    assert_equal 3, guess.guess_num_colors_correct
  end

  def test_it_can_count_four_colors_of_guess_are_correct
    guess = GuessEvaluator.new("gryb",["Y","G","B","R"])
    assert_equal 4, guess.guess_num_colors_correct
  end

  def test_it_can_count_one_color_in_correct_position
    guess = GuessEvaluator.new("gryb", ["G","B","R","Y"])
    assert_equal 1, guess.guess_correct_positions
  end

  def test_it_can_count_two_colors_in_correct_position
    guess = GuessEvaluator.new("gbyb", ["G","B","R","Y"])
    assert_equal 2, guess.guess_correct_positions
  end

  def test_it_can_count_three_colors_in_correct_position
    guess = GuessEvaluator.new("gbrb", ["G","B","R","Y"])
    assert_equal 3, guess.guess_correct_positions
  end

  def test_it_can_count_four_colors_in_correct_position
    guess = GuessEvaluator.new("gbry", ["G","B","R","Y"])
    assert_equal 4, guess.guess_correct_positions
  end

  def test_it_can_evaluate_a_correct_guess
    guess = GuessEvaluator.new("gbry", ["G","B","R","Y"])
    assert guess.guess_correct?
  end
end
