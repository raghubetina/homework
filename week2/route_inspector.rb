require 'open-uri'

# This Ruby class is used by some of the other tests this week.
# Don't touch this code, or your tests might give you false results.
class RouteInspector
  attr_accessor :routes

  def initialize(rake_route_string)
    @routes = []
    rows = rake_route_string.split("\n")
    rows.map do |row|
      route = row.split.map { |piece| piece.strip }
      if route.size == 3
        route = [route[0], 'GET', route[1], route[2]]
      end
      @routes << route
    end
  end

  def [](url_or_name)
    if url_or_name.is_a?(Symbol)
      named_route = url_or_name.to_s
      self.routes.detect { |route| route.first == named_route }
    else
      url = url_or_name
      route = self.routes.detect do |route|
        searchable_route = route[2].gsub(/:[^\/]+/,'[^/]+')
        searchable_route = searchable_route.sub('(.+)', '[^/]*')
        url =~ /^#{searchable_route}$/
      end
      return route
    end
  end

  def self.get_from_app(port = 3000)
    html = open("http://localhost:#{port}/rails/info/properties").read
    html =~ /Application root<\/td><td class="value">([^>]+)</
    root_dir = $1.strip if $1
    if root_dir
      route_table = `cd #{root_dir}; bundle exec rake routes`
      return RouteInspector.new(route_table)
    end
  end
end

# puts RouteInspector.get_from_app.routes.inspect
