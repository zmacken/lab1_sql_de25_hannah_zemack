---
title: The sakila database
---

_This is a overview of some of the data available in the sakila database. And how we can use it to further understand the buisness._

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
           CAST(DATE_TRUNC('month', payment_date) as VARCHAR) as trunc_month,
           SUM(amount) as total_revenue
    FROM sakila.payment
    GROUP BY store_id, trunc_month, address
    ORDER BY total_revenue DESC
    LIMIT 10;
```

<Heatmap 
    data={store_revenue} 
    x=trunc_month 
    y=address 
    value=total_revenue 
    valueFmt=sek
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

```sql staff_revenue
    SELECT
            CONCAT(first_name,' ', last_name) as name,
            DATE_TRUNC('month', payment_date) as month,
            SUM(amount) as sum_amount
    FROM sakila.staff
    GROUP BY name, month
    ORDER BY sum_amount DESC;
```

<BarChart 
    data={staff_revenue}
    x=month
    y=sum_amount
    series=name
    type=grouped
/>