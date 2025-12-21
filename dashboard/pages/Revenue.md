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

In this heatmap you can see based on the colours opacity how big the revenue was that month.


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

Presented here is the staff from both stores revenue per month.

<BarChart 
    data={staff_revenue}
    x=month
    y=sum_amount
    series=name
    type=grouped
/>


```sql filter_category
select 
        name
from sakila.category
GROUP BY 1
```

Here you can choose which category you want to see the revenue from 

<Dropdown
    name=selected_name
    data={filter_category}
    value=name
>
    <DropdownOption value="%" valueLabel="All Categories" />
</Dropdown>

```sql category_revenue
    SELECT
           category_id,
           name,
           SUM(amount) as total_revenue
    FROM sakila.category
    WHERE name LIKE '${inputs.selected_name.value}'
    GROUP BY category_id, name
    ORDER BY total_revenue DESC;
```

<BarChart
 data={category_revenue}
 x=name
 y=total_revenue
/>