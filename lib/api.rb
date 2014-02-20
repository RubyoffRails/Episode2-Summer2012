require "open-uri"
require "json"
require "ostruct"
require_relative "./movie"
require_relative "./movie_list"
class Api

  APIKEY="4t6456xa33z8qhcqyuqgnkjh"

  def self.search_by_title(title)
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"
    struct = OpenStruct.new(get_url_as_json(url).fetch("movies").first)
    search_by_year(struct.year)
    Movie.new(id: struct.id.to_i,
              title: struct.title,
              year: struct.year,
              score: struct.ratings["critics_score"]
             )
  end

  def self.search_by_year(year)
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(year.to_s)}&page_limit=49"
    movies_in_year = get_url_as_json(url)
    movies_in_year.fetch('movies').each do |movie|
    #   Movie.build(id: movie.fetch('id').to_i,
    #           title: movie.fetch('title'),
    #           year: movie.fetch('year'),
    #           score: movie.fetch('ratings').fetch('critics_score')
    #          ) 
    # end
    if movie.fetch('year') == year
         puts "ID: #{movie.fetch('id').to_i}"
         puts "Title: #{movie.fetch('title')}"
         puts "Year: #{movie.fetch('year')}"
         puts "Rating: #{movie.fetch('ratings').fetch('critics_score')}"
       end
    end
  end

  def self.get_url_as_json(url)
    JSON.parse(open(url).read)
  end

end
