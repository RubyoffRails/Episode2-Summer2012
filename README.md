Episode 2 Summer 2012- BlackJack
=====================

A simple API wrapper around the RottenTomato's service

Panda Level
-----------

1. Fix the code where it does not "blow up" when searching for a non-existent movie
2. Fill in the Api "empty search" code to help with the not found movie

Example:

```
expect {
  Api.search_by_title("NOTHINGFOUNDHERE")
}.to_not raise_error
```

Tiger Level
-----------

1. Keep track of the searches a user enters
2. Reword the question to "Add a movie you really like"
3. Display the average movie Rating.. [Hint](http://stackoverflow.com/questions/1341271/average-from-a-ruby-array)

A sample way to do this:

```
movies = []
movies << Api.search_by_title(movie_title)
```

Eagle Level
-----------

1. Tiger Level, plus display the average year for the ratings for the movie selected
2. Calculate the slope of the average ratings from the first year to the last year
3. Determine if the user is getting happier or madder (slope of line increasing or decreasing)

Slope of line is `(y1 - y2) / (x1 - x2)` ... In this case, if my average rating for 1990 was 50 and 2012 was 45:

```
(45 - 50).to_f / (2012 - 1990).to_f
=> -0.22727272727272727  
# getting madder
```

Copyright: Jesse Wolgamott, MIT License (See LICENSE)
