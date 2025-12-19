---
title: The sakila database
---





```sql film_data
    SELECT
            MIN(length) as min_length,
            MAX(length) as max_length,
            ROUND(AVG(length)) as average_length,
            ROUND(MEDIAN(length)) as median_length
    FROM sakila.film;
````


-- ```sql actor_movies
--     SELECT 
--             a.actor_id,
--             a.first_name,
--             a.last_name,
--             COUNT(fa.film_id) as number_films
--     FROM  sakila.actor as a
--     LEFT JOIN film_actor as fa
--            ON a.actor_id = fa.actor_id
--     GROUP BY a.actor_id, a.first_name, a.last_name
--     ORDER BY number_films DESC
--     LIMIT 10;
-- ```

```sql actor_movies
SELECT
       actor_id,
       CONCAT(first_name, ' ', last_name) as name,
       COUNT(film_id) as count_films
FROM sakila.actor
GROUP BY actor_id, name;
```