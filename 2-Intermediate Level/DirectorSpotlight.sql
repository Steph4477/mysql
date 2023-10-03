-- SQLite
-- Select movie title and release year for films by George Lucas
SELECT movie_title, movie_release_year
-- from the "movies" table
FROM movies
-- where the director is "George Lucas"
WHERE director_name = 'George Lucas'
-- Order the results by release year in descending order
ORDER BY movie_release_year DESC;

