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
with drug_pharmacy_sales as (
  select 
      drug
  	  , pharmacy_name
      , sum(price * count) as sales 
  from pharma_orders
  WHERE LOWER(drug) like 'аква%'
  group by drug, pharmacy_name
), pharmacy_sales as (
  select pharmacy_name, SUM(price * count) as total_pharmacy_sales 
  from pharma_orders 
  group by pharmacy_name
)
select 
	pharmacy_name
    , drug 
    , CONCAT(ROUND(100*sales/ sum(sales) OVER (), 1),'%') as sales_share
    , ROW_NUMBER() OVER (PARTITION BY pharmacy_name ORDER BY sales DESC) as pharmacy_drug_rating
from
	drug_pharmacy_sales join pharmacy_sales USING(pharmacy_name)
ORDER BY sales_share DESC