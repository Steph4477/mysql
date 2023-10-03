-- SQLite
-- Select the movie title with the highest rating score
SELECT movie_title
-- from the "movies" table 
FROM movies
-- Join with the "ratings" table to obtain the ratings
JOIN ratings on movies.movie_id = ratings.movie_id
-- Order the results by rating score in descending order
ORDER by ratings.rating_score DESC
-- fetch only the first row, which will be top rated movie
LIMIT 1;