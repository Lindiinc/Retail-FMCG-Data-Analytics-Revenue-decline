### Data Dictionary

The data dictionary of Imbewu Retail describes the relationship between the tables, secondly it further describes the different tables and their respective details, including any data quality issues.

The transactional database (DB) of Imbewu retail, contains six tables covering 18 months of operations (January 2024 through June 2025) across all 45 stores nationwide.



##### Part 1:



##### Table Descriptions



##### 1\. Customers

Contains customer demographic information and loyalty program details. Used for customer segmentation, analyzing loyalty program effectiveness, and tracking signup trends. Links to Transactions table via customer\_id. The cardinality is a (1:Many)

###### 

###### Table: CUSTOMERS

|Field Name|Data Type|Field Size for Display|Description|Example|
|-|-|-|-|-|
|customer\_id|STRING|10|Unique identifier for each customer (Primary Key)|C00001|
|first\_name|STRING|30|Customer's first name|Palesa|
|last\_name|STRING|30|Customer's last name|Nyathi|
|gender|STRING|1|Customer's gender (M/F, nullable)|F|
|birth\_year|BIGINT|4|Year of birth for age-based segmentation|1982|
|loyalty\_tier|STRING|10|Customer loyalty program tier (Bronze/Silver/Gold)|Bronze|
|home\_suburb|STRING|50|Residential suburb for geographic analysis|Constantia|
|signup\_date|DATE|10|Date customer joined the loyalty program|2024-03-29|

### 

### 

##### 2\. Products

The product table contains items sold across all stores. Includes categorization, brand information, and pricing details for inventory management. Links to transaction\_items via product\_id. The cardinality is (1:Many)

###### 

###### Table: PRODUCTS

|Field Name|Data Type|Field Size for Display|Description|Example|
|-|-|-|-|-|
|product\_id|STRING|10|Unique identifier for each product (Primary Key)|P001|
|product\_name|STRING|100|Full descriptive name of the product|Iwisa Super Maize Meal 2.5kg|
|category|STRING|30|Primary product category|Groceries|
|sub\_category|STRING|30|More specific product classification|Maize Meal|
|brand|STRING|30|Product brand name|Iwisa|
|unit\_cost|DOUBLE|10|Cost to retailer per unit (ZAR)|28.00|
|unit\_price|DOUBLE|10|Retail selling price per unit (ZAR)|39.99|





##### 3\. Stores

Store location and management information. Captures store format, geographical distribution, and operational details for market analysis and store performance tracking.

Links to transactions via store\_id. The cardinality is a (1:Many)

### 

###### Table: STORES

|Field Name|Data Type|Field Size for Display|Description|Example|
|-|-|-|-|-|
|store\_id|STRING|10|Unique identifier for each store (Primary Key)|S001|
|store\_name|STRING|50|Full name of the store location|Imbewu Express Sea Point|
|format|STRING|20|Store format type (Express/Market/Mega)|Express|
|province|STRING|30|South African province where store is located|Western Cape|
|city|STRING|30|City where store is located|Cape Town|
|suburb|STRING|50|Suburb or neighborhood of store|Sea Point|
|store\_manager|STRING|50|Name of the person managing the store|Karabo Cele|
|opened\_date|DATE|10|Date when store commenced operations|2008-01-03|

### 

### 

##### 4\. Transactions

Transactions table records transactions as when and where purchases occurred. Central table linking customers, stores, and transaction items. **Transactions** → **Transaction\_Items** (1:Many) via transaction\_id

Links to stores via store\_id, customers via customer\_id, and transaction\_items via transaction\_id

###### 

###### Table: TRANSACTIONS

|Field Name|Data Type|Field Size for Display|Description|Example|
|-|-|-|-|-|
|transaction\_id|STRING|10|Unique identifier for each transaction (Primary Key)|T000001|
|store\_id|STRING|10|Foreign key linking to stores table|S007|
|customer\_id|STRING|10|Foreign key linking to customers table (nullable for non-loyalty purchases)|C02951|
|transaction\_date|TIMESTAMP|19|Date and time when transaction occurred|2024-01-01 19:54:00|
|payment\_method|STRING|20|Method used for payment (Cash/Card/SnapScan)|SnapScan|

### 

### 

##### 5\. Transaction Items

Line-level details of products sold in each transaction. Records quantities, prices, and discounts applied for sales analysis and inventory tracking. Links to transactions via transaction\_id and products via product\_id.



###### Table: TRANSACTION\_ITEMS

|Field Name|Data Type|Field Size for Display|Description|Example|
|-|-|-|-|-|
|item\_id|STRING|10|Unique identifier for each line item (Primary Key)|I0000001|
|transaction\_id|STRING|10|Foreign key linking to transactions table|T000001|
|product\_id|STRING|10|Foreign key linking to products table|P009|
|quantity|BIGINT|5|Number of units purchased|1|
|unit\_price\_at\_sale|DOUBLE|10|Actual price charged per unit at time of sale (ZAR)|32.99|
|discount\_applied|DOUBLE|10|Discount amount applied per unit (ZAR)|0.00|

### 

### 

##### 6\. Promotions

Marketing campaign and promotional offer details. Tracks promotion schedules, targeted categories, and discounts for campaign effectiveness analysis.



###### Table: PROMOTIONS

|Field Name|Data Type|Field Size for Display|Description|Example|
|-|-|-|-|-|
|promo\_id|STRING|10|Unique identifier for each promotion (Primary Key)|PR001|
|promo\_name|STRING|50|Marketing name of the promotional campaign|Pap Power Promo|
|category\_targeted|STRING|30|Product category targeted by the promotion|Maize Meal|
|start\_date|DATE|10|Date when promotion becomes active|2025-04-01|
|end\_date|DATE|10|Date when promotion expires|2025-04-30|
|discount\_pct|DOUBLE|6|Percentage discount offered during promotion|33.33|







###### **Key Relationships**

* Customers → Transactions (1:Many) via customer\_id
* Stores → Transactions (1:Many) via store\_id
* Transactions → Transaction\_Items (1:Many) via transaction\_id
* Products → Transaction\_Items (1:Many) via product\_id
* Promotions → Products (indirect via category\_targeted matching category)

### 

##### Part 2:

###### Data Quality issues:



The Imbewu database exhibits good referential integrity at the foreign key level, with no orphaned records. However, several business logic and data consistency issues were identified that impact data quality and analytical reliability.

1\. Discount Calculation Error

* What is the mathematical logic being used when discounts are applied at the till by the Point of sale system being used?  
What value is applied, is it a discount amount or percentage  
Likely confusion between discount percentage vs. discount amount, or incorrect data entry.

2\. Promotion Category Mismatch

* Details:

  * "Beverages" - 0 matching products (exists as sub\_category under "Groceries")
  * "Maize Meal" - 0 matching products (exists as sub\_category under "Groceries")
  * "Snacks" - 0 matching products (exists as sub\_category under "Groceries")
  * "Apparel" - 3 matching products (correctly references category but the promotion says Back to school yet only one of the items under apparel is school related being the boys school socks, therefore promotions must be applied specifically to products )
* Impact: Promotions cannot be properly applied to products; reporting on promotion effectiveness will fail
* The entire Promotions table must be logically reworked
* Data model inconsistency - *category\_targeted* references sub-categories instead of categories

### 

##### 3\. Missing Gender Data

* Approximately 139 customers have NULL gender values
* Gender-based marketing analysis can be impacted
* Recommendation: decide if it is necessary to capture gender during sign-up, what operational / strategic significance does gender data make?, if it is necessary address the user interface, sign-up forms must be fully completed before rows are stored in the DB

##### 

##### 4\. Non-Loyalty Transactions

* Approximately 3,911 transactions have NULL customer\_id, not assigned to a tier
* For unsigned customers this is not necessarily a problem.
* Recommendation: decide if it is necessary to categorize customers according to tier if at the present moment, there does not seem to be any business value in having a tier program. Management must re-strategize the tier program in order to create business value and customer value



##### Additional investigative insights

* Foreign Key Integrity: All foreign key relationships are valid

  * Transactions → Stores: 0 orphaned records
  * Transactions → Customers: 0 invalid references (excluding valid NULLs)
  * Transaction\_Items → Transactions: 0 orphaned records
  * Transaction\_Items → Products: 0 orphaned records
* Primary Key Integrity: No duplicate IDs found in any table

  * customer\_id, product\_id, store\_id, transaction\_id, item\_id, promo\_id all unique
* Data Range Validation: No anomalies detected

  * No negative prices or quantities
  * No zero or negative pricing
  * No products where cost exceeds price
  * No future dates in historical fields
  * No transactions before stores opened
  * No invalid birth years





The overall data quality of Imbewu’s Database is above-average it requires business logic corrections, also addressing the user interface input forms, determining sound business rules and re-strategizing business objectives.

### 

