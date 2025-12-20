---
title: Film data
---

## The data presented here has to do with the films stocked in our two stores. 


```sql filter_actor
select 
        CONCAT(first_name, ' ', last_name) as name
from sakila.actor
GROUP BY 1
```

Here you can see how many movies each of the ten most frequent actors have been in.

<Dropdown
    name=selected_name
    data={filter_actor}
    value=name
>
    <DropdownOption value="%" valueLabel="All Names" />
</Dropdown>

```sql actor_movies
SELECT
       actor_id,
       CONCAT(first_name, ' ', last_name) as name,
       COUNT(film_id) as count_films
FROM sakila.actor
WHERE CONCAT(first_name, ' ', last_name) LIKE '${inputs.selected_name.value}'
GROUP BY actor_id, name
LIMIT 10;
```

<BarChart
 data={actor_movies}
 x=name
 y=count_films
/>


```sql total_inventory
    SELECT
           store_id,
           COUNT(film_id) as total_movies
    FROM sakila.store
    GROUP BY store_id;
```

This table shows how many movies are available at each store.

<DataTable data={total_inventory}>
	<Column id=store_id />
	<Column id=total_movies/>
</DataTable>

```sql film_data
    SELECT
            MIN(length) as min_length,
            MAX(length) as max_length,
            ROUND(AVG(length)) as average_length,
            ROUND(MEDIAN(length)) as median_length
    FROM sakila.film;
```

This table shows what the minimum, maximum, median and average length are for all movies.

<DataTable data={film_data}>
	<Column id=min_length />
	<Column id=max_length />
	<Column id=average_length/>
       <Column id=median_length/>
</DataTable>


```sql rating
SELECT
        rating,
        COUNT(film_id) as count_rating
FROM sakila.film
GROUP BY rating;
```

Here you can see the average rating for the movies we have in stock.

<BarChart 
    data={rating}
    x=rating
    y=count_rating
    labels=true
/>

