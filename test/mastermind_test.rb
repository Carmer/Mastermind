require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'


class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_can_play
    mm = Mastermind.new
    assert mm.respond_to?(:play)
  end

  def test_it_has_an_empty_secret_array_to_begin
    mm = Mastermind.new
    assert_equal [], mm.secret
  end

  def test_it_can_begin_a_game
    mm = Mastermind.new
    assert mm.respond_to?(:begin_game)
  end

  def test_it_has_play_loop
    mm = Mastermind.new
    assert mm.respond_to?(:game_loop)
  end

  def test_it_starts_the_time_at_the_begining
    skip                  ## --> testing time?
    mm = Mastermind.new
    mm.start_time
    assert_equal Time.now, mm.start_time
  end

  def test_it_can_detect_end_time
    skip                ## --> testing time?
    mm = Mastermind.new
    mm.end_time
    assert_equal Time.now, mm.end_time
  end

end
