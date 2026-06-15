-- Databricks notebook source
'Imbewu Retail transactional database. It contains six tables covering 18 months of operations (January 2024 through June 2025) across
all 45 stores nationwide.'

'Runing profiling queries. Checking the data types, data quality, duplicates'

SELECT 'Customers' AS TableName, COUNT(*) AS Records FROM Customers UNION ALL
SELECT 'Products', COUNT(*) FROM Products UNION ALL SELECT 'Promotions',
COUNT(*) FROM promotions UNION ALL SELECT 'Stores', COUNT(*) FROM
stores UNION ALL SELECT 'Transaction_items', COUNT(*) FROM transaction_items 
UNION ALL SELECT 'Transactions', COUNT(*) FROM transactions;


--Basic SQL queries, data profiling, rows and columns

SELECT 
  *
FROM customers;

select distinct
  count(*)
from
  information_schema.columns
where
  table_schema = "imbewu_retail_schema"
  and table_name = "customers";


---------------------------------------------------------

SELECT 
  *
FROM products;

select distinct
  count(*)
from
  information_schema.columns
where
  table_schema = "imbewu_retail_schema"
  and table_name = "products";

-------------------------------------
SELECT 
  *
FROM promotions;

select distinct
  count(*)
from
  information_schema.columns
where
  table_schema = "imbewu_retail_schema"
  and table_name = 'promotions';

------------------------------------------------------------
SELECT
  *
FROM stores;

select distinct
  count(*)
from
  information_schema.columns
where
  table_schema = 'imbewu_retail_schema'
  and table_name = 'stores';

----------------------------------------
SELECT 
  *
FROM transaction_items;


select distinct
  count(*)
from
  information_schema.columns
where
  table_schema = 'imbewu_retail_schema'
  and table_name = "transaction_items";

------------------------------
SELECT 
  *
FROM transactions;


select distinct
  count(*)
from
  information_schema.columns
where
  table_schema = 'imbewu_retail_schema'
  and table_name = 'transactions';

----------------------------------------------------------------------------------------------
--Advanced SQL queries

--Hypothesis 1: Revenue decline in the Western Cape & provincially 6 month period - SPLY
WITH semi_annual_sales AS (
    SELECT 
        Stores.province as province,
        YEAR(transactions.transaction_date) AS sale_year,
        round(SUM(transaction_items.unit_price_at_sale * transaction_items.quantity ),2) AS total_sales
    FROM transaction_items
    FULL JOIN transactions
    ON transactions.transaction_id = transaction_items.transaction_id
    full join stores  --pk tbl
      on stores.store_id = transactions.store_id

    WHERE MONTH(transactions.transaction_date) BETWEEN 1 AND 6 
    GROUP BY YEAR(transactions.transaction_date), province
)
SELECT 
    province,
    sale_year,
    total_sales,
    LAG(total_sales) OVER (ORDER BY sale_year) AS previous_sales,
    round((total_sales - LAG(total_sales) OVER (ORDER BY sale_year)),2) AS Growth
FROM semi_annual_sales
WHERE sale_year IN (YEAR('2025-06-30'), YEAR('2025-06-30') - 1 and Stores.province = 'Western Cape')-- for provincial analysis, remove and Stores.province = 'Western Cape' in the WHERE clause );


'Hypothesis 1: 
Sales are declining in the Western Cape and provincially using SPLY analysis (6 months)
1st January 2024 - 30 June 2024 compared to 1 January 2025 - 30 June 2025
SQL script - CTE, Window function - LAG,  full outer joins 

Findings: 
The data reveals that the sales performance has declined when a SPLY analysis is conducted, across all provinces in particular in the Western Cape. The Power BI dashboard reveals key insights for management to view the exact number difference'


----------------------------------------------------------------------------------------------------

--Hypothesis 2: Loyalty programme performance in the Western Cape 
-- Month On Month (MoM) trend analysis for 18 month period for each tier

WITH tier_MoM AS (
  SELECT
  
  cus.loyalty_tier as Tier,
  round(sum(trItem.unit_price_at_sale * tritem.quantity ),2) as Total_tier_Sales,
  date_trunc('month',trn.transaction_date)::date AS Tier_monthly,
  year(trn.transaction_date) as Yearly_tier
from
  stores St 
   full join transactions trn 
      on st.store_id = trn.store_id
    full join transaction_items tritem
      on trn.transaction_id = tritem.transaction_id
    full join customers cus
      on cus.customer_id = trn.customer_id
      where st.province = 'Western Cape' and cus.loyalty_tier = 'Silver' 
group by
  cus.loyalty_tier, tier_monthly, Yearly_tier
)
SELECT
Tier,
  Tier_monthly,
Total_tier_Sales,
Yearly_tier,
  
  ROUND(
    100.0 * (Total_tier_Sales - LAG(Total_tier_Sales) OVER (PARTITION BY tier ORDER BY  Tier_monthly))
    / NULLIF(LAG(Total_tier_Sales) OVER (PARTITION BY tier ORDER BY Tier_monthly), 0),
    2
  ) AS mom_pct
FROM tier_MoM
ORDER BY Tier_monthly asc;


--Tier performance - breakdown 
--H2.1 Sales performance per tier per year for the Western Cape for 18 months
 select
  st.province,
  st.format,
  st.suburb,
  cus.loyalty_tier,
  round(sum(trItem.unit_price_at_sale * tritem.quantity),2) as Total_Store_Sales,
 
  
  year(trn.transaction_date) as Yearly_sales_per_tier
from
  stores St 
   full join transactions trn 
      on st.store_id = trn.store_id
    full join transaction_items tritem
      on trn.transaction_id = tritem.transaction_id
    full join customers cus
      on cus.customer_id = trn.customer_id
      where st.province = 'Western Cape' and cus.loyalty_tier = 'Silver'
group by
  st.province,
  cus.loyalty_tier,
  st.suburb,
  Yearly_sales_per_tier,
 st.format
order by
  Yearly_sales_per_tier,
  total_store_sales desc;


  -- H2.2 Sign up performance per tier for the Western cape from 2023 - 2025/06/30
 select
  st.province,
  st.format,
  st.suburb,
  cus.loyalty_tier,
 cus.customer_id,
 cus.signup_date

from
  stores St 
   full join transactions trn 
      on st.store_id = trn.store_id
    full join customers cus
      on cus.customer_id = trn.customer_id
      where st.province = 'Western Cape' and cus.loyalty_tier = 'Gold'
group by
  st.province,
   st.format,
     st.suburb,
  cus.loyalty_tier,
 cus.customer_id, cus.signup_date;

--

'Hypothesis 2: 
This hypothesis aims to determine and display the tier sign-up trends since January 2023 - June 2025, to determine if a pattern exists between the sign-ups and revenue, meaning do sign-ups translate into revenue, also is there an incentive for signing-up that would mean greater revenue for business
SQL script - CTE, Window function - LAG, full outer joins 

Findings:
For each tier being Bronze, Gold and Silver according to the data the sales patterns for each tier are more or less the same for the 18 month period. The tier sign-ups however are not performing the same as the tier sales not that there should be parallel performance however  the data reveals that there is an increase in sign-ups for the Bronze tier specifically ,as it out performs the silver and gold tiers, in all three years, 2023, 2024 and 2025 although 2025 is only six months in and not a full year account of sign-ups,  but the increase in sign-ups for the bronze tier does not translate into the sales of the bronze tier'

-------------------------------------------------------------------------------
  
  --Hypothesis 3: Revenue per store format Western Cape for 6 month period - SPLY
  WITH semi_annual_sales_per_format AS (
    SELECT 
        Stores.province as province,
         stores.format as format, 
          monthname(transactions.transaction_date) as Month_sales,
        YEAR(transactions.transaction_date) AS sale_year,
        round(SUM(transaction_items.unit_price_at_sale * transaction_items.quantity ),2) AS total_sales
    FROM transaction_items
    FULL JOIN transactions
    ON transactions.transaction_id = transaction_items.transaction_id
    full join stores  
      on stores.store_id = transactions.store_id

    WHERE MONTH(transactions.transaction_date) BETWEEN 1 AND 6 --AND stores.province = 'Western Cape'
    GROUP BY YEAR(transactions.transaction_date), province, format, Month_sales
)
SELECT 
    province,
    format,
    month_sales,
    sale_year,
    total_sales, --AS current_sales,
    LAG(total_sales) OVER (ORDER BY sale_year) AS previous_sales,
    round((total_sales - LAG(total_sales) OVER (ORDER BY sale_year)),2) AS Growth
FROM semi_annual_sales_per_format
WHERE sale_year IN (YEAR('2025-06-30'), YEAR('2025-06-30') - 1) and province = 'Western Cape';


'H3:
The numbers reveal a decline in all formats across the suburbs in the Western Cape 
SQL script - CTE, Window function - LAG'


-----------------------------------------------------------------------------------------------------------------------------------

--Hypothesis 4: Discount applied: promotion or no promotion applied
SELECT 

 st.province,
  pro.sub_category,
  trItem.discount_applied,
  trItem.item_id,
  trItem.product_id,
  trItem.unit_price_at_sale as sale_price,
  pro.unit_price as list_price,
    CASE 
        WHEN sale_price < list_price THEN 'Discounted'
        ELSE 'No Discount'
    END AS discount_status,
    list_price - sale_price AS discount_amount
FROM 
  stores St 
     full join transactions trn
      on st.store_id = trn.store_id
    full join transaction_items tritem
      on trn.transaction_id = tritem.transaction_id
    full join products pro
      on trItem.product_id = pro.product_id
       where st.province = 'Western Cape'
group by
  st.province,
  pro.sub_category,
  trItem.discount_applied,
  trItem.item_id,
  trItem.product_id,
  trItem.unit_price_at_sale,
  pro.unit_price;


'Hypothesis 4:
Not all discounts are being applied, the only one being the pap promo seems to be manually captured, because there is no link between the promorions table with the other tables partcularly the transactions_items table

Findings:
Miscategorization in the Products table e.g. in the Products table Apparel is categorized as ‘category’ but beverages, snacks and maize meal are categorized as ‘sub-categories’  this inconsistency is filters into the Promotions table, should the target be ‘category’ or ‘sub-category’, meaning if the ‘category-targeted’ is meant to apply to the ‘category’ of the Products table then in the Promotions table snacks, maize meal and beverages should be replaced with Groceries, whereas if ‘category-targeted’ is meant to apply to ‘subcategory’ then Apparel must be replaced with ‘tops, kids, underwear etc both the Products and Promotions tables need to be logically reworked'



--------------THE END :) -------------------


