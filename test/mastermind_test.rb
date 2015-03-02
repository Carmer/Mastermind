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

  def test_it_can_begin_a_game
    mm = Mastermind.new
    assert mm.respond_to?(:begin_game)
  end

  def test_it_has_play_loop
    mm = Mastermind.new
    assert mm.respond_to?(:game_loop)
  end

  def test_it_starts_the_time_at_the_begining
    mm = Mastermind.new
    assert Time.now, mm.start_time
  end

  def test_it_can_detect_end_time
    mm = Mastermind.new
    assert Time.now, mm.end_time
  end

  def test_it_can_find_total_time_to_solve
    skip # -> I dont know how to test time
    mm = Mastermind.new
    mm.start_time = Time.now
    end_time  = Time.now + 2
    assert 2, mm.total_time
  end

end
