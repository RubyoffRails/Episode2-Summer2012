require_relative "lib/movie"
require_relative "lib/api"

def find_movie(movies_hash)
  puts "Add a movie you really like..."
  movie_title = gets.chop

  begin
     movies = Api.search_by_title(movie_title)
     hash = {movies.title => movies.score}
     movies_hash = hash.merge(movies_hash)
   rescue StandardError=>e
     puts e
     puts "Error: Movie '#{movie_title}' not found!"
   else  
     puts "Found: #{movies.title}. Score: #{movies.score}"
     count = score = 0
     movies_hash.each {|key, value| 
      count = count + 1
      score = score + value 
    }
   end
   average = (score/count).to_f
   puts "Your Average Taste in Movies: #{average}"
   movies_hash 
end

movies_hash      = {}
movies_hash = find_movie(movies_hash)

while true do
  puts "Search Again (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    movies_hash = find_movie(movies_hash)
  else
    break
  end
end
