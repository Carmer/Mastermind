require 'minitest/autorun'
require 'minitest/pride'
require './lib/menu'

class MenuTest < Minitest::Test

  def test_it_responds_to_cheat
    test = Menu.new(mm = Mastermind.new, "input")
    assert test.respond_to?(:cheat)
  end

  def test_it_responds_to_begin_game
    test = Menu.new(mm = Mastermind.new, "input")
    assert test.respond_to?(:begin_the_game)
  end

  def test_it_can_respond_to_nothing_and_reprint_welcome
    test = Menu.new(mm = Mastermind.new, "")
    assert test.respond_to?(:welcome)
  end

  def test_it_can_respond_to_menu_parse_method
    test = Menu.new(mm = Mastermind.new, "")
    assert test.respond_to?(:menu_parse)
  end

  def test_it_can_respond_quit_request
    test = Menu.new(mm = Mastermind.new, "q")
    assert test.respond_to?(:quit)
  end

end
