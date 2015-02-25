require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    skip #until figure out how to stub
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end

  def test_it_generages_random_number
    skip
    mm = Mastermind.new
    #dont know how to stub in minitest yet
    assert
  end

  def test_it_welcomes_you_to_the_game
    mm = Mastermind.new
    assert "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", mm.welcome
  end

  def test_begin_screen_with_general_game_outline
    mm = Mastermind.new
    assert "I have gernerated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow. Use (q)uit at any time to end game.\nWhat's your guess?", mm.begin
  end

  def test_menu_item_information_works
    skip
  end

  def test_menu_item_cheat_works
    skip
  end

  def test_menu_item_play_runs
  skip
  end

  def test_menu_item_quit_runs
    skip
  end

  def test_game_can_accept_guess
    skip
  end

  def test_it_ends_the_game_after_10_guesses
    skip
  end

  def test_it_records_guess_count
    skip
  end

  def test_it_tells_user_how_many_guesses_they_have_remaining
    skip
  end

end
