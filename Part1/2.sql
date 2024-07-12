/*
	2. Cold Medications. Select medicines starting with the word "аква" 
	(using the LIKE operator). 
	Convert data to lowercase, group, 
	and calculate the total sales volume for each medicine, 
	rank by descending sales volume, and calculate each medicine's share of the total sales.

	2. Лекарства от насморка. Выделяем препараты, начинающиеся со слова “аква” 
    (с использованием оператора LIKE). 
    Приводим данные к нижнему регистру, 
    группируем и подсчитываем общий объем продаж для каждого препарата, 
    ранжируем по убыванию объема продаж и подсчитываем долю продаж каждого лекарства в общем объеме.
*/
with drug_sales as (
  select 
      lower(drug) as drug
      , sum(price * count) as sales 
  from pharma_orders
  WHERE LOWER(drug) like 'аква%'
  group by lower(drug)
  ORDER BY sum(price * count) desc
)
select 
	drug 
    , CONCAT(ROUND(100*sales/ sum(sales) OVER (), 1),'%') as sales_share
    , ROW_NUMBER() OVER (ORDER BY sales DESC) as drug_rating
from
	drug_sales