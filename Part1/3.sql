/*
  3. Who Are Our Customers. Calculate the age of customers based on birth date 
  using date functions; 
  then use the CASE WHEN operator to determine who our customers are. 
  Describe each group: men under 30, men aged 30 to 45, and so on. 
  Calculate the sales share for each group.

	3. Кто наши клиенты. Вычисляем возраст клиентов на основе даты рождения 
    с использованием функции для работы с датами; 
    затем используем оператор CASE WHEN для расчета, кто наши клиенты. 
    Описываем каждую группу: мужчины младше 30, мужчины от 30 до 45 и так далее.
    Подсчитываем долю продаж на каждую группу.
*/
WITH customer_gender_ages AS (
  SELECT customer_id, gender, EXTRACT(YEAR FROM AGE(date_of_birth :: DATE)) AS customer_age
  FROM customers
), customer_groups as (
	select customer_id, concat(
      case gender when 'муж' then 'Мужчины' else 'Женщины' end
      , ' ', case when customer_age<30 then 'младше 30' when customer_age<=45 then '30-45' else '45+' end
    ) as customer_group
  from customer_gender_ages
), group_totals as (
  select 
      customer_group
    , count(distinct o.customer_id) as cust_in_group_cnt
    , sum(price*count) as cust_group_amnt
  from pharma_orders o 
  join customer_groups ca on ca.customer_id=o.customer_id
  group by customer_group
) 
select 
	customer_group
    , CONCAT(ROUND(100*cust_in_group_cnt/ sum(cust_in_group_cnt) OVER (), 1),'%') as customers_share
    , CONCAT(ROUND(100*cust_group_amnt  / sum(cust_group_amnt)   OVER (), 1),'%') as sales_share
from group_totals
order by customer_group