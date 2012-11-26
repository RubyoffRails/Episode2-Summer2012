require "open-uri"
require "json"
require "ostruct"
require_relative "./movie"
class Api

  APIKEY="4t6456xa33z8qhcqyuqgnkjh"

  def self.search_by_title(title)
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"
    struct = OpenStruct.new(get_url_as_json(url).fetch("movies").first)
    if struct.title == nil
      Movie.new(id: 1,
                title: "No movie by that title",
                year: 1111,
                score: 0
               )
    else
      Movie.new(id: struct.id.to_i,
                title: struct.title,
                year: struct.year,
                score: struct.ratings["critics_score"]
               )
    end
  end

  def self.get_url_as_json(url)
    JSON.parse(open(url).read)
  end

end
