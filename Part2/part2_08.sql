/*
	8. Query "Most Frequent Customers of Gorzdrav and Zdravsiti Pharmacies"
    - Create two temporary tables: one for Gorzdrav pharmacy and one for Zdravsiti pharmacy (WITH)
    - Within each, join orders and customers tables (JOIN)
    - Within each, format data as "customer - number of orders in the pharmacy"
    - Within each, keep the top 10 customers of each pharmacy
    - Combine customers using UNION

	8. Запрос "Самые частые клиенты аптек Горздрав и Здравсити"
    - Сделать две временные таблицы: для аптеки горздрав и здравсити (WITH)
    - Внутри каждой соединить таблицы заказов и клиентов (JOIN)
    - Внутри каждой привести данные в формат "клиент - кол-во заказов в аптеке"
    - Внутри каждой оставить топ 10 клиентов каждой аптеки
    - Объединить клиентов с помощью UNION
*/
select 
	customer_id
	, CONCAT(first_name,' ',second_name,' ',last_name) as full_name
    , order_cnt
from (
  (
    select customer_id, count(order_id) as order_cnt
    FROM pharma_orders
    WHERE pharmacy_name = 'Горздрав'
    group by pharmacy_name, customer_id
    ORDER BY count(order_id) desc
    limit 10
  )
  UNION 
  (
    select customer_id, count(order_id) as order_cnt
    FROM pharma_orders
    WHERE pharmacy_name = 'Здравсити'
    group by pharmacy_name, customer_id
    ORDER BY count(order_id) desc
    limit 10
  )
)
join customers USING (customer_id)
ORDER BY order_cnt DESC