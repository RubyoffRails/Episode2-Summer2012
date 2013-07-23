require "open-uri"
require "json"
require "ostruct"
require_relative "./movie"

class Api

  APIKEY="4t6456xa33z8qhcqyuqgnkjh"

  def self.search_by_title(title)
    @history ||= []
    @history << title

    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"
    full_json = get_url_as_json(url)

    if found?(full_json)
      struct = OpenStruct.new(full_json.fetch("movies").first)
      movie = Movie.new( id:    struct.id.to_i,
                         title: struct.title,
                         year:  struct.year,
                         score: struct.ratings["critics_score"] )
      puts "Found: #{movie.title}. Score: #{movie.score}"
      Movie.add_movies(movie)
      movie
    else
      empty_search(title)
    end
  end

  def self.found?( json )
    json.fetch("total").zero? ? false : true
  end

  def self.get_url_as_json(url)
    JSON.parse(open(url).read)
  end

  def self.empty_search( title )
    puts "Not found: #{title}"
  end

  def self.search_history
    @history
  end
end
