require_relative "lib/movie"
require_relative "lib/api"

def movie_search_by_title
  puts "OH HAI. Please enter movie title"
  print ">>" 
  movie_title = gets.chomp
  if movie_title.empty?
    puts "Sorry, but you have to actually enter something to search"
  else
    puts "Cool, searching for #{movie_title}"
    search = Api.search_by_title(movie_title)
    puts "#{movie_title} was released in #{search.year}. It recieved a critics score of #{search.score}"
  end
end

def search_again(response)
  if response == "yes"
    movie_search_by_title
  elsif response == "no"
    false
  else
    puts "I don't understand that"
  end
end

movie_search_by_title

while true
  puts "Search Again?"
  re_search = gets.downcase.chomp
  if search_again(re_search) == false
    break
  end
end

# def find_movie
#   puts "OH HAI. Search?"
#   movie_title = gets
#   movie = Api.search_by_title(movie_title)
#   puts "Found: #{movie.title}. Score: #{movie.score}"
# end

# find_movie

# while true do
#   puts "Search Again (Y/N)" 
#   answer = gets.upcase[0]
#   if answer == "Y"
#     find_movie
#   else
#     break
#   end
# end
