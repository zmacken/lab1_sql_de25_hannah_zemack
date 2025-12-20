---
title: Revenue
---

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