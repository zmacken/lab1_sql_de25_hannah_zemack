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


```sql actor_movies
SELECT
       actor_id,
       CONCAT(first_name, ' ', last_name) as name,
       COUNT(film_id) as count_films
FROM sakila.actor
GROUP BY actor_id, name
LIMIT 10;
```

<BarChart
 data={actor_movies}
 x=name
 y=count_films
/>

```sql store_revenue
    SELECT
           store_id,
           address,
           DATE_TRUNC('month', payment_date) as trunc_month,
           SUM(amount) as total_revenue
    FROM sakila.payment
    GROUP BY store_id, trunc_month, address
    ORDER BY total_revenue DESC
    LIMIT 10;
```

