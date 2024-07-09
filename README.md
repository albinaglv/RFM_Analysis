 # RFM_Analysis_of_Retail_Sales_Data 

### :file_folder: Project Overview
This project focuses on performing RFM (Recency, Frequency, Monetary) analysis on anonymised retail store sales transactions sourced from [Kaggle](https://www.kaggle.com/datasets/marian447/retail-store-sales-transactions/data). By leveraging transactional data, this project aims to understand customer behaviour and optimise marketing strategies to enhance customer retention.

**What is RFM Analysis?** 

RFM analysis is a marketing technique used to quantitatively rank and group customers based on their transaction history. It considers three factors:

- **Recency**: How recently did the customer make a purchase?
- **Frequency**: How often do they make purchases?
- **Monetary**: How much do they spend?

By scoring customers based on these three metrics, businesses can identify their most valuable customers, tailor marketing efforts, and improve customer engagement and retention strategies.

**Why Perform RFM Analysis?**

Understanding customer behaviour is crucial for effective marketing. RFM analysis helps businesses:

- Segment customers into different groups based on their purchase behavior.
- Identify loyal customers who frequently purchase and spend more.
- Develop targeted marketing campaigns to increase customer satisfaction and retention.
- Predict future customer behavior and identify at-risk customers who may need re-engagement.

### 📊 Dataset 

The dataset consists of a single file named `scanner_data.csv`, which contains detailed retail store sales transactions. These transactions were recorded by 'scanning' barcodes for individual products at electronic points of sale within a retail store. Download the dataset [here](https://www.kaggle.com/datasets/marian447/retail-store-sales-transactions/data). 

The dataset includes the following attributes: Date of Sales Transaction, Customer ID, Transaction ID, SKU Category ID, SKU ID, Quantity Sold, and Sales Amount.

### 🎯 Objectives

- **Data Exploration**: Analyse and preprocess the dataset.
- **RFM Scoring**: Calculate the recency, frequency, and monetary values for each customer.
- **Customer Segmentation**: Segment customers into different groups based on their RFM scores.
- **Analysis and Insights**: Explore patterns in consumer spending, identify trends in product preferences, and derive actionable insights to optimise marketing strategies and enhance customer retention efforts.

### 🛠️ Tools Used

- **SQL Server**: This project utilises SQL Server as the primary database management system for querying and performing data analysis.

### :key: Key Metrics and Findings 

- **Time Period**: From January 2, 2016, to December 31, 2016.
- **Number of customers**: 22,625
- **Number of categories**: 187
- **Number of transactions**: 64,682
- **Quantity sold**: 195,624
- **Total Revenue**: $1,578,038.62

**Revenue and Transaction Insights**

1. **Highest Revenue Month**:

    - **December** achieved the highest revenue at $152,124.19 

2. **Lowest Revenue Month**:

    - **January** recorded the lowest revenue of $111,200.28
  
3. **Notable Revenue Increase**: 

   - **March to May**: steady revenue increase from $127,924.54 in March to $142,719.86 in May, indicating rising consumer activity during spring.

4. **Mid-Year Decline**:

   - **June to August**: Revenue dropped consistently, with August reaching $116,908.98, suggesting a summer slowdown.

5. **Autumn Recovery**:

  - **September**: Revenue rebounded to $141,239.89 from 5,732 transactions, signaling increased spending as the holiday season approaches.

**Top Selling Products in December**:

- UNJKW: 271 transactions
- E3PAN: 105 transactions
- Total Distinct Products Sold (SKU): 2,663

**RFM Analysis**

 RFM (Recency, Frequency, and Monetary) analysis was used to segment customers based on their purchasing behaviour. Each segment represents a different level of customer engagement and value to the business. 

- **Champions**: 
  - **Count**: 4,719
  - **Percentage**: 20.86%
  - **Description**: These are your most valuable customers. They make frequent purchases and have high transaction values.

- **Promising**:
  - **Count**: 4,201
  - **Percentage**: 18.57%
  - **Description**: Customers with potential to become loyal.They have a good frequency of purchase and decent transaction values.

- **New Customers**:
  - **Count**: 3,469
  - **Percentage**: 15.33%
  - **Description**: Recently acquired customers who have made their first purchase.

- **At Risk**:
  - **Count**: 2,742
  - **Percentage**: 12.12%
  - **Description**: Customers who used to be active but haven’t made a purchase recently. There is a risk they may be losing interest or have moved to a competitor.

- **Lost Customers**:
  - **Count**: 2,529
  - **Percentage**: 11.18%
  - **Description**: Customers who have not engaged with the store for an extended period and may no longer be interested.

- **Cannot Lose Them**:
  - **Count**: 2,271
  - **Percentage**: 10.04%
  - **Description**: Customers who still engage with the store but have low recency, frequency, and monetary values.

- **Potential Loyalist**:
  - **Count**: 1,370
  - **Percentage**: 6.06%
  - **Description**: Customers who have shown potential for increased engagement and loyalty.

- **Loyal Customers**:
  - **Count**: 1,324
  - **Percentage**: 5.85%
  - **Description**: Consistent buyers who regularly engage with the store and make frequent purchases.

### 📝 Conclusion and Recommendations

**Revenue and Transaction Insights**:

- Analysis highlights seasonal variations with December as the peak revenue month, suggesting effective strategies during holiday seasons but also pointing out challenges in post-holiday retention.
  
- Understanding top selling products provides insights into consumer preferences and opportunities for targeted promotions.

**Segment Distribution**:

- **Champions** (20.86%) and **Promising** (18.57%) together make up nearly 40% of the customer base. This is a positive indication as it shows a substantial proportion of high-value and potentially loyal customers.

- **New Customers** (15.33%) suggest a healthy acquisition rate, though strategies should focus on nurturing them to become repeat buyers.

- **At Risk** (12.12%) and Lost Customers (11.18%) collectively represent a notable portion of customers who need attention for retention efforts.

- **Cannot Lose Them** (10.04%), **Potential Loyalist** (6.06%), and **Loyal Customers** (5.85%) indicate opportunities to strengthen engagement and loyalty further.

### Recommendations:

**Seasonal Promotions**:

- **Holiday Campaigns**: Capitalise on the high sales in December by planning targeted marketing campaigns and discounts to drive more traffic and increase sales.
  
- **Post-Holiday Engagement**: Implement strategies to maintain customer engagement in January, such as loyalty rewards, special promotions, or clearance sales to counter the post-holiday slump.

**Product Stocking**:

- **Top Products Focus**: Ensure that top-selling products like UNJKW and E3PAN are well-stocked during peak months to avoid stockouts and lost sales opportunities.
  
- **Inventory Optimisation**: Use monthly sales data to forecast demand more accurately and adjust inventory levels accordingly, minimising overstock and stockout situations.

**Retention Strategies**:

  - Implement targeted campaigns for **At Risk** and **Lost Customers** to re-engage them. Utilise personalised offers or reminders based on past behaviour to regain their interest.
    
  - Develop loyalty programmes or incentives tailored to **Cannot Lose Them** customers to encourage more frequent and higher-value purchases.
    
  - New Customer Nurturing: Focus on enhancing the onboarding experience for **New Customers** to increase their likelihood of making subsequent purchases. Consider welcome discounts or personalised recommendations based on their initial purchase.

### References:

1. [RFM Analysis For Successful Customer Segmentation](https://www.putler.com/rfm-analysis/). *Putler*
2. [Retail Store Sales Transactions (Scanner Data)](https://www.kaggle.com/datasets/marian447/retail-store-sales-transactions/data). *Kaggle*


