require "open-uri"
require "json"
require "ostruct"

require_relative "./movie"

class Api
  APIKEY="4t6456xa33z8qhcqyuqgnkjh"

  def self.search_by_title(title)
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"

    result = get_url_as_json(url)

		if found?(result)
    	struct = OpenStruct.new(result.fetch('movies').first)

    	Movie.new(id: struct.id.to_i,
              	title: struct.title,
              	year: struct.year,
              	score: struct.ratings["critics_score"]
    	)
		else
			nil
		end
  end

	def self.found?(result)
		result.has_key?('movies') && !(result.fetch('movies').empty?)
	end

  def self.get_url_as_json(url)
    JSON.parse(open(url).read)
  end
end
