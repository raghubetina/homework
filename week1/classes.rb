require "test/unit"

# Instructions:
# ---------------------
# 1. Run this program, and notice that all of the tests will fail.
# 2. Your assignment: add code to the Player class until all tests pass.
#
# Do NOT change any of the code in the TestPlayer class. :-)
# ----------------------

# CHANGE THIS CODE TO MAKE THE TESTS PASS

class Player

  SCORING_RULES = { 1 => 1, 2 => 2, 3 => 4, 4 => 7, 5 => 10, 6 => 15 }

  attr_accessor :name, :points

  def initialize(player_name)
    self.name = player_name
    self.points = 0
  end

  def move(train_size)
    self.points += SCORING_RULES[train_size]
  end

end

class TestPlayer < Test::Unit::TestCase

  def test_total_points
    player = Player.new("Bob")
    moves = [3, 5, 1, 2, 4, 6, 1]

    moves.each do |train_size|
      player.move(train_size)
    end

    assert_equal(40, player.points)
  end

end
