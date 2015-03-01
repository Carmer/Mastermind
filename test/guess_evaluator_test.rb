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
    assert guess.guess_too_long?
  end

  def test_it_can_evaluate_the_guess_and_give_feedback
    guess = GuessEvaluator.new("yrrr", ["y","y","y","y"])
    assert_equal 1,  guess.guess_num_colors_correct
  end

  def test_it_can_count_one_color_of_guess_is_right
    guess = GuessEvaluator.new("gyyy", ["g","g","g","r"])
    assert_equal 1,  guess.guess_num_colors_correct
  end

  def test_it_can_count_two_colors_of_guess_are_correct
    guess = GuessEvaluator.new("gyyy", ["g","g","y","r"])
    assert_equal 2,  guess.guess_num_colors_correct
  end

  def test_it_can_count_three_colors_of_guess_are_correct
    guess = GuessEvaluator.new("gyyr", ["g","y","r","b"])
    assert_equal 3, guess.guess_num_colors_correct
  end

  def test_it_can_count_four_colors_of_guess_are_correct
    guess = GuessEvaluator.new("gryb",["y","g","b","r"])
    assert_equal 4, guess.guess_num_colors_correct
  end

  def test_it_can_count_one_color_in_correct_position
    guess = GuessEvaluator.new("gryb", ["g","b","r","y"])
    assert_equal 1, guess.guess_correct_positions
  end

  def test_it_can_count_two_colors_in_correct_position
    guess = GuessEvaluator.new("gbyb", ["g","b","r","y"])
    assert_equal 2, guess.guess_correct_positions
  end

  def test_it_can_count_three_colors_in_correct_position
    guess = GuessEvaluator.new("gbrb", ["g","b","r","y"])
    assert_equal 3, guess.guess_correct_positions
  end

  def test_it_can_count_four_colors_in_correct_position
    guess = GuessEvaluator.new("gbry", ["g","b","r","y"])
    assert_equal 4, guess.guess_correct_positions
  end

  def test_it_can_evaluate_a_correct_guess
    guess = GuessEvaluator.new("gbry", ["g","b","r","y"])
    assert guess.guess_correct?
  end
end
