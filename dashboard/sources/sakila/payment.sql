    SELECT
        st.store_id,
        a.address,
        p.payment_date,
        p.amount
    FROM staging.payment as p
    LEFT JOIN staging.staff as s
           ON s.staff_id = p.staff_id
    LEFT JOIN staging.store as st
           ON st.store_id = s.store_id
    LEFT JOIN staging.address as a
           ON a.address_id = st.address_id