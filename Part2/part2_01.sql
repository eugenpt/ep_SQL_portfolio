/*
	1. Query "Top 3 Pharmacies"
    - Display the top 3 pharmacies by sales volume (GROUP BY, LIMIT)
	
	1. Запрос "Топ-3 аптеки"
    - Вывести топ 3 аптеки по объему продаж (GROUP BY, LIMIT)
*/
select
	pharmacy_name
    , SUM(price * count) as sales
    , ROW_NUMBER() OVER (ORDER BY SUM(price * count) DESC) sales_rating
FROM
	pharma_orders
GROUP BY
	pharmacy_name
ORDER BY sales desc
LIMIT 3