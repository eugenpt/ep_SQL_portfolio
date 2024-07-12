/*
	4. Query "Cumulative Sales by Each Pharmacy" (OVER)
	
    4. Запрос "Накопленная сумма продаж по каждой аптеке" (OVER)
*/
SELECT
	pharmacy_name
    , price*count sale
    , report_date
    , order_id
	, SUM(price*count) OVER (
      	PARTITION BY pharmacy_name ORDER BY report_date, order_id
    ) as cum_pharmacy_sales
FROM
	pharma_orders
ORDER BY pharmacy_name, report_date