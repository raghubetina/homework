require "test/unit"
require 'open-uri'
require_relative 'route_inspector'

# Instructions:
# ---------------------
# 1. Run this program, and notice that all of the tests will fail.
# 2. Your assignment:
#    - Create a rails app in a separate folder than this one.
#    - Start the rails server on port 3000 (the default port).
#    - Write code in your rails app so that these tests pass.
#    - Remember: Your rails server must be active while you
#    - run these tests!
#
# Do NOT change any of the code in the TestRailsRoutes class. :-)
# ----------------------------------------------------------

class TestRailsRoutes < Test::Unit::TestCase


  def test_home_page_shows_list_of_favorite_things
    assert_nothing_raised do
      html = open("http://localhost:3000/favorites").read
      assert_not_nil html =~ /<ul>.*<li>/
    end
  end

  def test_placeholder_page_was_removed
    assert_nothing_raised do
      html = open("http://localhost:3000/").read
      assert_not_nil html =~ /<ul>.*<li>/
    end
  end

  def test_named_routes
    assert_nothing_raised("You must run your app on port 3000") do
      inspector = RouteInspector.get_from_app
      s = inspector[:root]
      puts s.inspect
      assert s
    end
  end
end
