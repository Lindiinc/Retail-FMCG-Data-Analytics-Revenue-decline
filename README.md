# Imbewu Retail - Data Analytics
End-to-end retail analytics project following a step-by-step data lifecycle - ERD design: database structure > SQL: data exploration > Power BI: dashboard design > Data dictionary and Executive summary. The project objective is to investigate the declining revenue in the Western Cape stores of a South African retailer operating in the FMCG industry.

![Overview](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Imbewu%20Dashboard%20screenshots/Overview.png)

## 🔑Table of contents
![The business problem]\
![The dataset]\
![Data quality issues]\
![What I built]\
![ERD: Database structure]\
![SQL: Data exploration]\
![Power BI: Dashboard]\
![Data dictionary]\
![Executive summary]\
![Tools and skills utilised]\
![Learning path]\
![References]\
![About me]\

### ⏱️The business probelm
Imbewu Retail is a South African retailer with a national footprint comprising of 45 stores of varying formats located in Gauteng, the Western Cape, Kwa-Zulu Natal, and the Eastern Cape. With no hard proof Head of Sales speculated that revenue is declining in the Western Cape. The task was to use the given dataset to analyse the numbers, loyalty programme trends, promotion effectiveness and extract insights that must answer the three main questions "what's happening, why, and what we should do about it". The end result expected - a meaningful Power BI dashboard that will be sent to the COO.

### ⚙️The dataset 
Imbewu Retail's transactional database contains six tables covering 18 months of operations (January 2024 through to June 2025) across
all 45 stores nationwide. A brief description of the tables follows:

![Dataset table](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Imbewu%20Retail%20dataset/Dataset%20table.png)

Further exploration of the dataset is available here:![CSV files](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/tree/main/Imbewu%20Retail%20dataset), using tools such as Excel. The SQL scripts can be viewed here![Investigation/sql](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Investigation.sql)

### 🔍 Data quality issues
Imbewu's dataset has some NULLs, minor inconsistencies, the occasional duplicates that were discovered whilst running the query profiles on SQL and during the data cleaning phase on Power BI. 
One of the key issues that arose when cleaning the data was, what would be the impact of removing the null records such as the customer_ids found in the Transaction table?.
Due to the relationship that exists between the transactions, customer and transactions_items table deletion of null customer_ids would have a major impact on the transactions_items table that holds the revenue data which is indirectly linked to the customers via the transactions table, see the ![ERD](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Imbewu%20Retail%20ERD.drawio.pdf) to view the database structure.

The main data quality issues are documented in the 











