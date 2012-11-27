require "test/unit"

# Instructions:
# ---------------------
# 1. Run this program, and notice that all of the tests will fail.
# 2. Your assignment: add code to the methods so that the tests pass.
#
# Do NOT change any of the code in the TestCalculations class. :-)
# ----------------------

SCORING_RULES = { 1 => 1, 2 => 2, 3 => 4, 4 => 7, 5 => 10, 6 => 15 }

# MODIFY THESE METHODS TO MAKE THE TESTS PASS
def calculate_points_from_moves
end

def calculate_points_for_player(player, data)
end

# ----------------------------------------------------------

class TestCalculations < Test::Unit::TestCase

  def test_calculate_points_from_moves
    moves = [3, 5, 1, 2, 4, 6, 1]
    points = calculate_points_from_moves(moves)

    assert_equal(40, points)
  end

  def test_calculate_points_for_player
    player_data = {
      "alice" => [4,5,6],
      :bob => [1,2,3],
      :charlie => [1,3,5]
    }
    points_for_bob = calculate_points_for_player(:bob, player_data)
    assert_equal 7, points_for_bob
  end

end
