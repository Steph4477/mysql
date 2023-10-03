-- SQLite
-- Select the identifier of user and count the number of ratings by user
SELECT user_id, COUNT(*) AS rating_count
-- from the "ratings" table
FROM ratings
-- Group the results by user_id so we can count the ratings for each user.
GROUP BY user_id
-- Filters grouped results to only include users who give more than 10 ratings.
HAVING COUNT(*) > 10;

/*## Inactive Lists:
Context: The UI/UX team is researching ways to prompt users to update their old lists. They're looking into lists with more than 3 movies that haven't been updated in the past year.
Objective: Identify lists with more than 3 movies that have not been updated in the last year.

Emma
```sql=
SELECT list_id, list_title, list_update_timestamp_utc
FROM lists
WHERE list_movie_number > 3 AND list_update_timestamp_utc < '2022-09-29'
ORDER BY list_update_timestamp_utc;
```

Eric
```sql=
SELECT 
    list_title, 
    list_update_timestamp_utc 
FROM lists
WHERE 
    -- Display lists of more than 3 films
    list_movie_number > 3 
    AND
    -- Compare current date -1 year with list of updates
    DATETIME(list_update_timestamp_utc) < DATE('now', '-1 year')

    -- Sort list of updates by date
ORDER BY 
    list_update_timestamp_utc DESC;
```   
    

julien
```sql= 
SELECT l.list_id, l.list_title, l.list_movie_number, l.list_update_timestamp_utc
FROM lists l
WHERE l.list_movie_number > 3
  AND l.list_update_timestamp_utc <= DATE('now', '-1 year');
```


## Advanced Level:

### Director Popularity Analysis:
Context: Before negotiating contracts for exclusive content, the business development team wants to understand which directors have a track record of high-rated movies on the platform. Objective: Retrieve the names of directors who have more than 3 movies with an average rating score above 4.

julien
```sql=
SELECT DISTINCT m.director_name
FROM movies m
WHERE m.movie_id IN (
    SELECT movie_id
    FROM ratings
    GROUP BY movie_id
    HAVING AVG(rating_score) > 4
    AND COUNT(*) > 3
)
GROUP BY m.director_name
HAVING COUNT(*) > 3;
```


Frank
```sql=
SELECT m.director_name, COUNT(*) AS movie_count
FROM movies m
JOIN ratings r ON m.movie id = r.movie_id
GROUP BY m.director_name
HAVING COUNT (*) > 3 AND AVG(r. rating_score) > 4;
```





### Engagement Leaders:
Context: To enhance the community feel, the platform is considering highlighting lists created by users who are not just active in list-making but are also prolific raters.
Objective: Find the top 3 lists where the creators have given the highest number of ratings. Display the list title and the number of ratings given by its creator.


Frank
```sql=
SELECT l.list_title, COUNT(r.rating_id) AS num_ratings
FROM lists l
JOIN ratings r on l.user_id = r.user_id
GROUP BY l.list_id
ORDER BY num_ratings DESC
LIMIT 3;
```*/