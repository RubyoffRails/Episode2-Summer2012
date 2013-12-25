require "open-uri"
require "json"
require "naught"
require_relative "./movie"
require_relative "./api_key"

NullObject = Naught.build do |config|
  config.define_explicit_conversions
end

class Api

  def self.search_by_title(title)
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"
    struct = OpenStruct.new(get_url_as_json(url).fetch("movies").first)
    struct.id.nil? ? NullObject.new : store_movie(struct)
  end


  def self.get_url_as_json(url)
    JSON.parse(open(url).read)
  end

  def self.store_movie(movie_struct)
    Movie.new(id: movie_struct.id.to_i,
              title: movie_struct.title,
              year: movie_struct.year,
              score: movie_struct.ratings["critics_score"]
             )
  end
end
