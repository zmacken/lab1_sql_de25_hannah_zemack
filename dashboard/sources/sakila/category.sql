SELECT
       c.category_id,
       c.name,
       p.amount
FROM staging.category as c
       LEFT JOIN staging.film_category as fc
       ON c.category_id = fc.category_id
LEFT JOIN staging.film as f
       ON fc.film_id = f.film_id
LEFT JOIN staging.inventory as i
       ON f.film_id = i.film_id
LEFT JOIN staging.rental as r
       ON i.inventory_id = r.inventory_id
LEFT JOIN staging.payment as p
       ON r.rental_id = p.rental_id;