/*
	6. Query "Top Customers"
    - Join orders and customers tables (JOIN)
    - Calculate the total order amount for each customer
    - Rank customers by descending order amount (ROW_NUMBER)
    - Keep the top 10 customers

	6. Запрос "Лучшие клиенты"
    - Соединить таблицы заказов и клиентов (JOIN)
    - Посчитать тотал сумму заказов для каждого клиента
    - Проранжировать клиентов по убыванию суммы заказа (row_number)
    - Оставить топ-10 клиентов
*/
select
	customer_id
    , CONCAT(first_name,' ',second_name,' ',last_name) as full_name
    , SUM(price * count) sales
    , ROW_NUMBER() OVER (ORDER BY SUM(price * count) DESC) rating
FROM
	pharma_orders
    join customers USING (customer_id)
GROUP BY customer_id, CONCAT(first_name,' ',second_name,' ',last_name)
ORDER BY sales DESC
LIMIT 10