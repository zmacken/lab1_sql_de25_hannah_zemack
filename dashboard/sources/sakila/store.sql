SELECT
        st.store_id,
        f.film_id
FROM staging.store as st
LEFT JOIN staging.inventory as i
        ON i.store_id = st.store_id
LEFT JOIN staging.film as f
        ON f.film_id = i.film_id;