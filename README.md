# O2C Operations & Delivery Performance Analytics

End-to-end Order-to-Cash analytics project using Power BI, DAX and SQL to analyze revenue, delivery performance, freight efficiency and customer experience.
## Project Overview

I built this project to analyze the end-to-end order-to-cash process using transactional e-commerce data, with a particular focus on sales performance, order fulfillment, delivery reliability and customer experience.

In Power BI, I created key performance indicators for Total Revenue, Total Orders, Total Customers, On-Time Delivery % and Average Review Score. I also analyzed these metrics by customer state and year, using interactive filters to understand how performance changes across regions and time periods.

In addition, I developed a Delivery & Freight Analysis view to compare logistics performance, including Total Freight and Average Freight per Order by customer state. I also validated selected Power BI KPIs against SQL calculations and investigated discrepancies caused by data grain and blank-value handling.
## Business Questions

This project focuses on the following business questions:

- How is revenue changing over time?
- How many orders and unique customers are generated across the dataset?
- How does on-time delivery performance vary by customer state?
- Which customer states have the highest freight cost per order?
- How does delivery performance relate to customer review scores?
- Which regions should be prioritized when considering delivery performance, order volume and freight efficiency together?

- ## Tools & Skills Used

- Power BI
- Power Query
- DAX
- SQL
- Data Modeling
- Data Validation
- KPI Reconciliation
- Business Analysis

- ## Key KPIs

- Total Revenue: ~13.59M
- Total Orders: ~99.9K
- Total Customers: ~96K
- On-Time Delivery: ~91.89%
- Average Review Score: ~4.09
- Average Review Score - On Time: 4.29
- Average Review Score - Late: 2.57

- ## Key Insights

- On-time deliveries have an average review score of 4.29, while late deliveries average 2.57, showing a strong association between delivery reliability and customer satisfaction.

- Freight efficiency varies significantly by customer state. Roraima (RR) has the highest average freight cost per order overall at approximately 48.59.

- When a minimum threshold of 100 orders is applied to reduce the effect of small sample sizes, Paraíba (PB) becomes the highest-cost state at approximately 48.35 per order.

- Overall on-time delivery performance is approximately 91.89%, but performance varies across customer states, showing that national averages can hide regional operational differences.

- Total freight spend and average freight cost per order represent different business perspectives: high total spend can be driven by volume, while high average freight per order can indicate structural logistics cost issues.
- ## Recommendations

- Prioritize root-cause analysis in high-volume customer states with below-average on-time delivery performance.

- Evaluate freight efficiency using average freight cost per order, not only total freight spend, to identify structurally expensive regions.

- Combine delivery performance, order volume, freight efficiency and customer review scores when prioritizing regional operational improvements.

- Monitor high-revenue product categories more closely from a service-level and availability perspective, while using additional cost and margin data before making profitability-based decisions.
- ## Data Quality & Validation

Selected Power BI KPIs were validated against SQL calculations to confirm that the reporting logic was consistent across both tools.

During this validation, I identified 2,965 delivery-date records that were stored as empty strings rather than SQL NULL values. These records were initially included incorrectly in the SQL on-time delivery analysis.

After updating the SQL logic to exclude both NULL and empty-string delivery dates, the SQL result aligned with Power BI:

- Average Review Score - On Time: 4.29
- Average Review Score - Late: 2.57

This validation highlighted the importance of handling blank values consistently and reconciling analytical results across different tools.
## Dashboard

### O2C Overview
![O2C Overview](screenshots/O2C_overview.png)

### Delivery & Freight Analysis
![Delivery & Freight Analysis](screenshots/Delivery_Freight_Analysis.png)

Power BI source file available upon request

## Data Source

This project uses the Brazilian E-Commerce Public Dataset by Olist, available on Kaggle.

Dataset:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The main tables used in the analysis are:

- olist_orders_dataset - order status, purchase and delivery dates
- olist_order_items_dataset - product, seller, price and freight information
- olist_customers_dataset - customer and customer-state information
- olist_order_reviews_dataset - customer review scores
- olist_products_dataset - product information
- olist_sellers_dataset - seller information

A separate Date Dimension (DimDate) was created in Power BI to support time-based analysis.

Raw dataset files are not included in this repository and can be downloaded from the original Kaggle source.

## Data Model

The Power BI model connects transactional and dimension-like tables through shared business keys.

Key relationships include:

- Customers → Orders
- Orders → Order Items
- Products → Order Items
- Sellers → Order Items
- Orders → Reviews
- DimDate → Orders

The model primarily uses single-direction filtering to maintain predictable filter propagation and avoid unnecessary ambiguity.

Different levels of data granularity were also considered during the analysis:

- Orders: one row per order
- Order Items: one row per item within an order
- Customers: customer information
- Reviews: review records linked to orders

Understanding the difference between order-level and item-level grain was particularly important when calculating metrics such as Total Revenue and Average Freight per Order.
