---
title: The sakila database
---


```sql films_over180
    SELECT
           title,
           length
    FROM sakila.film
    WHERE
           length >= 180;
```

Films in sakila that are over 180 minutes long
<DataTable data={films_over180} search=true/>

```sql love
    SELECT
           title,
           rating,
           length,
           description
    FROM sakila.film
    WHERE (' ' || title || ' ') LIKE '% LOVE %';
```