require "open-uri"
require "json"
require "ostruct"
require_relative "./movie"
class Api

  APIKEY="4t6456xa33z8qhcqyuqgnkjh"

  def self.search_by_title(title)
    return false if title.empty?
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"

    movie_hash = get_url_as_json(url).fetch("movies").first
    if movie_hash
      struct = OpenStruct.new(movie_hash)
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
