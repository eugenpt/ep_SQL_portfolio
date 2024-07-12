/*
	8. Query "Most Frequent Customers of Gorzdrav and Zdravsiti Pharmacies"
    - Create two temporary tables: one for Gorzdrav pharmacy and one for Zdravsiti pharmacy (WITH)
    - Within each, join orders and customers tables (JOIN)
    - Within each, format data as "customer - number of orders in the pharmacy"
    - Within each, keep the top 10 customers of each pharmacy

	8. Запрос "Самые частые клиенты аптек Горздрав и Здравсити"
    - Сделать две временные таблицы: для аптеки горздрав и здравсити (WITH)
    - Внутри каждой соединить таблицы заказов и клиентов (JOIN)
    - Внутри каждой привести данные в формат "клиент - кол-во заказов в аптеке"
    - Внутри каждой оставить топ 10 клиентов каждой аптеки
*/
select * from (
select 
	pharmacy_name
    , customer_id
	, CONCAT(first_name,' ',second_name,' ',last_name) as full_name
    , count(order_id)
    , ROW_NUMBER() OVER (PARTITION BY pharmacy_name ORDER BY count(order_id) DESC) as pharmacy_customer_rating
from 
  pharma_orders
  join customers USING (customer_id)
where
  pharmacy_name in ('Горздрав','Здравсити')
GROUP BY pharmacy_name, customer_id, CONCAT(first_name,' ',second_name,' ',last_name)
) where pharmacy_customer_rating<=10