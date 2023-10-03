-- SQLite
-- Select movie titles and their release years
SELECT movie_title, movie_release_year 
-- from the "movies" table 
FROM movies
-- where the movie release year is greater than 2020
WHERE movie_release_year > 2020;
