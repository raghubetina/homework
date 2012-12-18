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

  def routes
    @inspector ||= RouteInspector.get_from_app
  rescue
    assert false, "You must run your app on port 3000 while running these tests."
  end

  def test_home_page_shows_list_of_favorite_things
    favorites_path = routes[:favorites][2].sub('(.:format)', '')
    assert_page_has_html_list(favorites_path)
  end

  def test_placeholder_page_was_removed
    assert_page_has_html_list '/'
  end

  def test_root_route_same_as_favorites_page
    assert_nothing_raised("You must run your app on port 3000") do
      assert_not_nil routes[:root]
      assert_equal routes[:root][3], routes[:favorites][3]
    end
  end

  def test_named_route_for_page_of_favorites
    assert_nothing_raised("You must run your app on port 3000") do
      assert_not_nil routes[:favorites]
    end
  end

  def assert_page_has_html_list(path)
    assert_nothing_raised do
      html = open(File.join("http://localhost:3000", path)).read
      assert_not_nil html =~ /<li>.+<.li>/
    end

  end
end
