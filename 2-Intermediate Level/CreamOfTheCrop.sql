-- SQLite
SELECT m.movie_title, AVG(r.rating_score) AS average_grade
FROM ratings r
JOIN movies m ON m.movie_id = r.movie_id
GROUP BY r.movie_id
ORDER BY r.rating_score DESC
LIMIT 5;