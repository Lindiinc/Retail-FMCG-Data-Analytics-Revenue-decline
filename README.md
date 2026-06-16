# Imbewu Retail - Data Analytics
End-to-end retail analytics project following a step-by-step data lifecycle - ERD design: database modelling > SQL: data exploration > Power BI: dashboard design > Data dictionary and Executive summary. The project objective is to investigate the declining revenue in the Western Cape stores of a South African retailer operating in the FMCG industry.

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

### What I built
The project was based on a request to investigate declining revenue in the Western Cape stores of Imbewu Retail. Following the data lifecycle phases, with the use of various ![tools and skills](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/edit/main/README.md#%EF%B8%8F-tools-and-skills-utilised) I built a project that began with reading the project brief in order to understand the business requirements that were somewhat vague but workable. This phase was followed by ingesting the![CSV files](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/tree/main/Imbewu%20Retail%20dataset) into Databricks to make use of SQL for exploring the data by run profiling queries to get an idea of its shortcomings, once this phase was completed a connection was established between Databricks and Power BI to import the dataset. The dashboard design phase revealed insights that would spur the COO and other key stakeholders into action to address the pressing matter of declining revenue. To conclude the lifecycle technical documentation was drafted, this documentation include the data dictionary as well as the Executive summary, containing findings and recommendations for the organization 

### 🧱 ERD: Database structure and data dictionary
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
The ![executive summary](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/Executive%20summary.docx), is presented as a 2 page summmary of findings and recommendations for the COO an other key stakeholders to read through. This document has key takeaways that can assist in taking action that will improve operational performance not just in the Western Cape but across all provinces. The document provides recommendations that also speak to formulating strategically sound business rules which is one of the key steps to enhance database design and ensure organizational optimization. 


### ✂️ Tools and skills utilised
Tools for project development:
* Databricks: SQL
* Power BI Desktop
* DAX expressions
* Github

Skills
* Data modelling - Star schema approach
* SQL - CTE's, joins, window functions
* DAX - time intelligence
* Data quality auditing 
* Dashboard design
* Technical writing and documentation
* Data lifecycle management  

Running the project one can view the ![CSV files](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/tree/main/Imbewu%20Retail%20dataset) via Excel, SQL tools and Power BI. The ![Dashboard](https://github.com/Lindiinc/Retail-FMCG-Data-Analytics-Revenue-decline/blob/main/imbewu_dashboard.pbix) is viewed via Power BI, the dataset can imported through a connection where the database is stored, the visuals will load accordingly.


### 🎓 Learning path 
As a _Junior Data Analyst_ this project taught me new skills and made me realise that **data is everywhere but how it is collected, managed, stored, governed and utilised can make or break an orgnization**. I learnt the **importance of formulating and following logical business rules** in the process of database modelling. 
**Do your research** - resources are plentiful one must take the initiative to learn by **thoroughly researching topics** in order to understand a new subject matter and **asking questions** to oneself and others with greater expertise. Regarding a project having **defensible reasons for taking certain decisions is key**, our perspectives differ thats not the issue what matters is being able to logically defend your stance to the next party.
**Explore, explore, explore your data**, the minute details can reveal the greatest insights, which the human eye can pick up with enough attention in so saying **Artificial Intelligence is great but not greater than Actual Intelligence** human intervention is necessary in the data lifecycle.
Power BI is more than just building dashboards, logic must lie behind the visuals to convey a logical and plausible story. Lastly stick through it, new skills  take time to learn but with enough practise eventually one can master anything they put their mind too! 😎 ,	🎊 


### 🤝 References
Resources used:
* Witle Academy: Data Analytics course - lecture presentations
* ![DAX expressions](https://dax.guide/)
* ![SQL](https://www.sqlbi.com/articles/filter-arguments-in-calculate/)
* ![Find Open Datasets and Machine Learning Projects | Kaggle](https://www.kaggle.com/datasets?search=messy)
* ![SQL](https://learnsql.com/blog/year-over-year-difference-sql/)
* [Power BI](https://www.youtube.com/watch?v=gP-AxNi6uxo&list=PLUaB-1hjhk8HqnmK0gQhfmIdCbxwoAoys&index=3)


### 🏆 About me
Junior Data Analyst with a background in Taxation and Supply Chain Management.\
**![LinkedIn](https://www.linkedin.com/in/lindelwamashaba)**
**![Email](mashaba.inc@gmail.com)**












