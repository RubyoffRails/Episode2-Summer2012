require "open-uri"
require "json"
require "ostruct"
require_relative "./movie"

class Api

  class MovieNotFoundError < StandardError; end

  APIKEY="4t6456xa33z8qhcqyuqgnkjh"

  def self.search_by_title(title)
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"

    raw_result_json = get_url_as_json(url)
    build_movie_from_result(raw_result_json)

  end

  def self.build_movie_from_result(json)
    if json["movies"].count > 0
      struct = OpenStruct.new(json.fetch("movies").first)
      Movie.new(id: struct.id.to_i,
                title: struct.title,
                year: struct.year,
                score: struct.ratings["critics_score"]
      )
    else
      raise MovieNotFoundError
    end
  end

  def self.get_url_as_json(url)
    JSON.parse(open(url).read)
  end

end
