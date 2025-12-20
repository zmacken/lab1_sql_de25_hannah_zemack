 SELECT
        s.first_name,
        s.last_name,
        p.payment_date,
        p.amount
    FROM staging.staff s
    LEFT JOIN staging.payment as p
        ON p.staff_id = s.staff_id