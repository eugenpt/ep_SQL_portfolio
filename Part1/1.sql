/*
	1. Comparison of Sales Dynamics Between Moscow and Saint Petersburg. 
	Calculate the sales of medicines by pharmacies and months for Moscow, 
	do the same for Saint Petersburg, 
	join the tables, and calculate the monthly percentage difference. 
	Write brief conclusions in comments.

	1. Сравнение динамики продаж между Москвой и Санкт-Петербургом. 
	Подсчитываем продажи лекарств по аптекам и месяцам для Москвы 
	и проделываем то же самое для Санкт-Петербурга, 
	соединяем таблицы и вычисляем разницу по месяцам в процентах. 
	Пишем короткие выводы в комментариях.
*/
SELECT 
	month
    , MSK_sales
    , SP_sales
    , CONCAT(ROUND( (100*MSK_sales / SP_sales) - 100,1),'%') as MSK_SP_sales_diff
FROM (
  select
      date_trunc('month', report_date::date)::date as month --to_char(report_date :: date, 'YYYY-MM') as month
      , SUM(price*count) as SP_sales
  from pharma_orders
  where city='Санкт-Петербург'
  group by date_trunc('month', report_date::date) --to_char(report_date :: date, 'YYYY-MM')
)
FULL JOIN (
  select
      date_trunc('month', report_date::date)::date as month --to_char(report_date :: date, 'YYYY-MM') as month
      , SUM(price*count) as MSK_sales
  from pharma_orders
  where city='Москва'
  group by date_trunc('month', report_date::date) --to_char(report_date :: date, 'YYYY-MM')
) USING (month)
ORDER BY MONTH