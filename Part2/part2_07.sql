/*
	7. Query "Cumulative Amount by Customers"
    - Join orders and customers tables
    - Concatenate full name into one field
    - Calculate the cumulative amount for each customer

	7. Запрос "Накопленная сумма по клиентам"
    - Соединить таблицы заказов и клиентов
    - Соединить ФИО в одно поле
    - Рассчитать накопленную сумму по каждому клиенту
*/
select
	report_date
    , order_id
	, customer_id
    , CONCAT(first_name,' ',second_name,' ',last_name) as full_name
    , price * count as sale
    , SUM(price * count) OVER (PARTITION BY customer_id ORDER BY report_date, order_id) cumulative_sales
FROM
	pharma_orders
    join customers USING (customer_id)
ORDER BY customer_id, report_date
