require_relative "lib/movie"
require_relative "lib/api"


def search_again
  while true do
    puts "Search Again (Y/N)" 
    answer = gets.upcase[0]
    if answer == "Y"
      find_movie
    else
      break
    end
  end
end

def find_movie
  puts "OH HAI. Search?"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  if movie
  puts "Found: #{movie.title}. Score: #{movie.score}"
  else
    puts "#{movie_title} was not found."
  end
  search_again
end

find_movie

#So we want to do something after movie = Api.search_by_title(movie_title) like if movie == false {puts "#{movie.title} not found, Search Again (Y/N)?" -then basically the while loop below--} 
#if movie == false
 # puts "#{movie.title} was not found. Search again? (Y/N)"
  #answer = gets.upcase[0]
  #if answer =="Y"
   # find_movie
  #end
#end





