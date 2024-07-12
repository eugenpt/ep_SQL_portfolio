/*
	2. Query "Top 3 Medicines"
    - Display the top 3 medicines by sales volume
	
	2. Запрос "Топ-3 лекарства"
    - Вывести топ 3 лекарства по объему продаж
*/
select
	drug
    , SUM(price * count) as sales
    , ROW_NUMBER() OVER (ORDER BY SUM(price * count) DESC) sales_rating
FROM
	pharma_orders
GROUP BY
	drug
ORDER BY sales desc
LIMIT 3