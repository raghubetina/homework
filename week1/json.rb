require "test/unit"
require 'json'
# Instructions:
# ---------------------
# 1. Run this program, and notice that all of the tests will fail.
# 2. Your assignment: add code to the methods so that the tests pass.
#
# Do NOT change any of the code in the TestJSON class. :-)
# ----------------------

def get_favorite(key, json)
end

def generate_json_from_hash(h)
end

# ----------------------------------------------------------

class TestJSON < Test::Unit::TestCase

  def test_parse_from_string
    json = '{"favorites":{"color":"maroon","fruit":"apple","language":"ruby"}}'
    assert_equal('apple', get_favorite("fruit", json))
  end

  def test_generate_from_data
    teams = { football: [:bears, :packers, :vikings],
              baseball: [:cubs, :sox] }

    team_json = '{"football":["bears","packers","vikings"],"baseball":["cubs","sox"]}'
    assert_equal team_json, generate_json_from_hash(teams)
  end

end
