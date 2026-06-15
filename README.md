# Imbewu Retail - Data Analytics
End-to-end retail analytics project following a step-by-step data lifecycle - ERD design: database structure > SQL: data exploration > Power BI: dashboard design > Data dictionary and Executive summary. The project objective is to investigate the declining revenue in the Western Cape stores of a South African retailer operating in the FMCG industry.

![Overview](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Imbewu%20Dashboard%20screenshots/Overview.png)

## 🔑Table of contents
![The business problem](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#%EF%B8%8Fthe-business-probelm)\
![The dataset](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#%EF%B8%8Fthe-dataset)\
![Data quality issues](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-data-quality-issues)\
![What I built](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#%EF%B8%8F-what-i-built)\
![ERD: Database structure and Data dictionary](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-erddatabase-structure-and-data-dictionary)\
![SQL: Data exploration](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-sql-data-exploration)\
![Power BI: Dashboard](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-power-bi-dashboard)\
![Executive summary](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-executive-summary)\
![Tools and skills utilised, how to run the project](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#%EF%B8%8F-tools-and-skills-utilised-how-to-run-the-project)\
![Learning path]([https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#%EF%B8%8F-tools-and-skills-utilised-how-to-run-the-project](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-learning-path))\
![References](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-references)\
![About me](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#-about-me)

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

The main data quality issues are documented as findings feature in the ![Executuve summary](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Executive%20summary.docx), the summary also includes recommendations to handle these issues that prevent optimal performance of the stores.

### 🛠️ What I built 

### 🧱 ERD:Database structure and Data dictionary
The database structure follows the star schema modelling approach, the fact table is the transactions_items table, perhaps the transactions table may also be considered as a fact table. The other tables being the store, customers, promotions, products are the dimension tables. This approach organizes the data in a database in such a way that it is easy to understand and analyze. The data model can be viewed here, ![ERD](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Imbewu%20Retail%20ERD.drawio.pdf) in addition the explanation of the relationships and cardinalities that exist are documented in the ![Data Dictionary](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Data_dictionary.md) 

### 🧬 SQL: Data exploration
The data was explored using Databricks: SQL ![Investigation/sql](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Investigation.sql) , the purpose of this phase was to get to know the data, run profiling queries to understand what each table holds, what the data quality is like, and where the gaps are. Hypotheses were formulated to understand what could be happening in Western Cape. Each hypothesis was tested using CTEs, joins, and window functions to see if they hold true, only 4 of 6 held true.





### 📈 Power BI: Dashboard

The dataset was imported into Power BI to build a meaningful dashboard that through visuals tells a story of Imbewu's operations. The dashboard consists of an overview page and 4 pages each of which are of the respective hypothesis, listed as follows:

**Hypothesis 1:** Revenue decline in the Western Cape & provincially 6 month period - SPLY: SAMEPERIODLASTYEAR analysis\
**Hypothesis 2:** Loyalty programme performance in the Western Cape\
**Hypothesis 3:** Revenue per store format Western Cape for 6 month period - SPLY\
**Hypothesis 4:** Discount applied: promotion or no promotion applied

One of the objectives of the dashboard was to highlight cricital data structure flaws for the COO and other key stakeholders such as Database engineers to see. These flaws were intentionally not transformed in the data cleaning phase, the overview page for example speaks to this. The aim of the page is to show the disconnect between the Promotions table and other relevant tables. Ideally, when a connection exists, by navigating through the button slicers of the Promotions visual one could see which provinces applied the promotions and which did not and also which store formats applied the promotions the most and which did not. With that kind of information one is able to improve the effectiveness of the promotions in those respective regions and stores.

![Overview](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Imbewu%20Dashboard%20screenshots/Overview.png)


_Hypothesis 2:_ Loyalty programme performance in the Western Cape.\
This hypothesis questions the purpose of the loyalty programme if there is any value added to the bottom line. Through the visual one can see that a higher number of tier signups to the loyalty programme does not translate into sales, why is that? in addition do customers receieve an incentive for signing up?, the Sales and Marketing department must be able to provide justifiable reasons for these programmes because organizations spend resources on developing campaigns therefore a quantifiable return on investment must be realized.

![](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Imbewu%20Dashboard%20screenshots/Hypothesis%202.png)

The dashboard can be further explored here: ![Dashboard](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/imbewu_dashboard.pbix)




### 💼 Executive summary





### ✂️ Tools and skills utilised, how to run the project







### 🎓 Learning path 









### 🤝 References









### 🏆 About me











