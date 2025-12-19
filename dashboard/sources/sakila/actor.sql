select 
            a.actor_id,
            a.first_name,
            a.last_name,
            fa.film_id
FROM staging.actor as a
LEFT JOIN staging.film_actor as fa
        ON a.actor_id = fa.actor_id