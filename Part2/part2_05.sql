/*
	5. Query "Number of Customers in Pharmacies"
    - Join orders and customers tables (JOIN)
    - Count the number of unique customers for each pharmacy (DISTINCT)
    - Sort pharmacies by descending number of customers (ORDER BY)

	5. Запрос "Количество клиентов в аптеках"
    - Соединить таблицы заказов и клиентов (JOIN)
    - Посчитать кол-во уникальных клиентов на каждую аптеку (DISTINCT)
    - Отсортировать аптеки по убыванию кол-ва клиентов (ORDER BY)
*/
select
	pharmacy_name, COUNT(DISTINCT CONCAT(first_name,' ',second_name,' ',last_name))
FROM
	pharma_orders
    join customers USING (customer_id)
GROUP BY pharmacy_name
ORDER BY COUNT(DISTINCT CONCAT(first_name,' ',second_name,' ',last_name)) DESC