-- SQLite
-- Count the number of distinct user IDs and rename the result as "number_users"
SELECT COUNT(DISTINCT user_id) as number_users
-- from "ratings" table
FROM ratings;