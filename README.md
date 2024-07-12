# ep_SQL_portfolio

Repo for SQL project

Source data tables in `src/`

solutions tested in [SQL Online](https://sqliteonline.com/)

## Part1

1. Comparison of Sales Dynamics Between Moscow and Saint Petersburg. Calculate the sales of medicines by pharmacies and months for Moscow, do the same for Saint Petersburg, join the tables, and calculate the monthly percentage difference. Write brief conclusions in comments.
2. Cold Medications. Select medicines starting with the word "аква" (using the LIKE operator). Convert data to lowercase, group, and calculate the total sales volume for each medicine, rank by descending sales volume, and calculate each medicine's share of the total sales.
3. Who Are Our Customers. Calculate the age of customers based on birth date using date functions; then use the CASE WHEN operator to determine who our customers are. Describe each group: men under 30, men aged 30 to 45, and so on. Calculate the sales share for each group.

## Part2

1. Query "Top 3 Pharmacies"
    - Display the top 3 pharmacies by sales volume (GROUP BY, LIMIT)
2. Query "Top 3 Medicines"
    - Display the top 3 medicines by sales volume
3. Query "Pharmacies with Revenue Over 1.8 Million"
    - Display pharmacies with revenue over 1.8 million (HAVING)
4. Query "Cumulative Sales by Each Pharmacy" (OVER)
5. Query "Number of Customers in Pharmacies"
    - Join orders and customers tables (JOIN)
    - Count the number of unique customers for each pharmacy (DISTINCT)
    - Sort pharmacies by descending number of customers (ORDER BY)
6. Query "Top Customers"
    - Join orders and customers tables (JOIN)
    - Calculate the total order amount for each customer
    - Rank customers by descending order amount (ROW_NUMBER)
    - Keep the top 10 customers
7. Query "Cumulative Amount by Customers"
    - Join orders and customers tables
    - Concatenate full name into one field
    - Calculate the cumulative amount for each customer
8. Query "Most Frequent Customers of Gorzdrav and Zdravsiti Pharmacies"
    - Create two temporary tables: one for Gorzdrav pharmacy and one for Zdravsiti pharmacy (WITH)
    - Within each, join orders and customers tables (JOIN)
    - Within each, format data as "customer - number of orders in the pharmacy"
    - Within each, keep the top 10 customers of each pharmacy
    - Combine customers using UNION

# ep_SQL_portfolio

Репозиторий для проекта по SQL

Файлы таблиц с исходными данными в папке `src/`

Решения проверены в [SQL Online](https://sqliteonline.com/)

## Часть 1 (в папке `Part1`)

1. Сравнение динамики продаж между Москвой и Санкт-Петербургом. Подсчитываем продажи лекарств по аптекам и месяцам для Москвы и проделываем то же самое для Санкт-Петербурга, соединяем таблицы и вычисляем разницу по месяцам в процентах. Пишем короткие выводы в комментариях.
2. Лекарства от насморка. Выделяем препараты, начинающиеся со слова “аква” (с использованием оператора LIKE). Приводим данные к нижнему регистру, группируем и подсчитываем общий объем продаж для каждого препарата, ранжируем по убыванию объема продаж и подсчитываем долю продаж каждого лекарства в общем объеме.
3. Кто наши клиенты. Вычисляем возраст клиентов на основе даты рождения с использованием функции для работы с датами; затем используем оператор CASE WHEN для расчета, кто наши клиенты. Описываем каждую группу: мужчины младше 30, мужчины от 30 до 45 и так далее. Подсчитываем долю продаж на каждую группу.

## Часть 2

1. Запрос "Топ-3 аптеки"
    - Вывести топ 3 аптеки по объему продаж (GROUP BY, LIMIT)
2. Запрос "Топ-3 лекарства"
    - Вывести топ 3 лекарства по объему продаж
3. Запрос "Аптеки от 1.8 млн оборота"
    - Вывести аптеки, имеющие более 1.8 млн оборота (HAVING)
4. Запрос "Накопленная сумма продаж по каждой аптеке" (OVER)
5. Запрос "Количество клиентов в аптеках"
    - Соединить таблицы заказов и клиентов (JOIN)
    - Посчитать кол-во уникальных клиентов на каждую аптеку (DISTINCT)
    - Отсортировать аптеки по убыванию кол-ва клиентов (ORDER BY)
6. Запрос "Лучшие клиенты"
    - Соединить таблицы заказов и клиентов (JOIN)
    - Посчитать тотал сумму заказов для каждого клиента
    - Проранжировать клиентов по убыванию суммы заказа (row_number)
    - Оставить топ-10 клиентов
7. Запрос "Накопленная сумма по клиентам"
    - Соединить таблицы заказов и клиентов
    - Соединить ФИО в одно поле
    - Рассчитать накопленную сумму по каждому клиенту
8. Запрос "Самые частые клиенты аптек Горздрав и Здравсити"
    - Сделать две временные таблицы: для аптеки горздрав и здравсити (WITH)
    - Внутри каждой соединить таблицы заказов и клиентов (JOIN)
    - Внутри каждой привести данные в формат "клиент - кол-во заказов в аптеке"
    - Внутри каждой оставить топ 10 клиентов каждой аптеки
    - Объединить клиентов с помощью UNION