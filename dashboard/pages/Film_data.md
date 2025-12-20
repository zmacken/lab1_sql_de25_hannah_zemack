---
title: Film data
---


```sql filter_actor
select 
        CONCAT(first_name, ' ', last_name) as name
from sakila.actor
GROUP BY 1
```

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

<DataTable data={total_inventory}>
	<Column id=store_id />
	<Column id=total_movies />
</DataTable>

```sql film_data
    SELECT
            MIN(length) as min_length,
            MAX(length) as max_length,
            ROUND(AVG(length)) as average_length,
            ROUND(MEDIAN(length)) as median_length
    FROM sakila.film;
````

<DataTable data={film_data}>
	<Column id=min_length />
	<Column id=max_length />
	<Column id=average_length/>
       <Column id=median_length/>
</DataTable>

