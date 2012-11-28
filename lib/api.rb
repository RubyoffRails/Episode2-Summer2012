require "open-uri"
require "json"
require "ostruct"
require_relative "./movie"
class Api
  @@search_history = []

  APIKEY="4t6456xa33z8qhcqyuqgnkjh"

  def self.search_by_title(title)
    if title != "" then
      url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"
      struct = OpenStruct.new(get_url_as_json(url).fetch("movies").first)
      if struct.ratings.nil? == false then
        movie = Movie.new(id: struct.id.to_i,
                  title: struct.title,
                  year: struct.year,
                  score: struct.ratings["critics_score"]
                 )
        @@search_history << movie
        return movie
      else
        Movie.new(id: 0,
                  title: "NOTHINGFOUNDHERE",
                  year: 0,
                  score: 0
                 )
      end
    else
         Movie.new(id: 0,
                  title: "NOTHINGFOUNDHERE",
                  year: 0,
                  score: 0
                  )
    end
  end

  def self.get_url_as_json(url)
    JSON.parse(open(url).read)
  end

  def self.get_search_history()
    @@search_history
  end

  def self.reset_search_history()
    @@search_history = []
  end
end
