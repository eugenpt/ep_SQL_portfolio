/*
	3. Query "Pharmacies with Revenue Over 1.8 Million"
    - Display pharmacies with revenue over 1.8 million (HAVING)
	
	3. Запрос "Аптеки от 1.8 млн оборота"
    - Вывести аптеки, имеющие более 1.8 млн оборота (HAVING)
*/
select
	pharmacy_name
    , SUM(price * count) as sales
    , ROW_NUMBER() OVER (ORDER BY SUM(price * count) DESC) sales_rating
FROM
	pharma_orders
GROUP BY
	pharmacy_name
HAVING SUM(price * count)>=1800000
ORDER BY sales desc
