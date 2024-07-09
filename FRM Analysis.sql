USE PortfolioDB;

--Explore data
SELECT * 
FROM [dbo].[scanner_data];


--Date range
SELECT 
	MIN (Date) AS Max_Date,
	MAX (Date) AS Min_Date
FROM [dbo].[scanner_data];

--Number of customers
SELECT 
	COUNT (DISTINCT Customer_ID) AS Customer_Count
FROM [dbo].scanner_data;


--Number of Categories
SELECT 
	COUNT (DISTINCT SKU_Category) AS Categories_Count
FROM dbo.scanner_data; --187 categories

--Number of transactions
SELECT 
	COUNT (DISTINCT Transaction_ID) AS Total_Transactions
FROM dbo.scanner_data;

--Quantity sold
SELECT ROUND (SUM (Quantity),0) AS Total_Amount_Sold
FROM dbo.scanner_data;

-- Total Revenue
SELECT ROUND (SUM (Sales_Amount),2) AS Revenue
FROM dbo.scanner_data;

-- Transactions by Month: Analyzing total transactions and revenue by month
SELECT 
	MONTH (Date) AS Month_ID,
	DATENAME(MONTH, Date) AS Month_Name,
	COUNT (DISTINCT Transaction_ID) AS Total_Transactions,
	ROUND (SUM (Sales_Amount),2) AS Revenue
FROM dbo.scanner_data
GROUP BY MONTH (Date), DATENAME(MONTH, Date)
ORDER BY Revenue DESC; -- December shows the highest revenue at $152,124.19 and May 1

--What products (SKU) were most frequently bought in Dec?
SELECT 
	SKU,
	COUNT(Transaction_ID) AS Frequency,
	ROUND (SUM (Sales_Amount),2) AS Revenue
FROM dbo.scanner_data
WHERE MONTH (Date) = 12
GROUP BY SKU
ORDER BY Frequency DESC; 
   
--Number of distinct products (SKU) sold in Dec
SELECT 
    COUNT (distinct SKU) AS Total_SKU
FROM dbo.scanner_data
WHERE MONTH(Date) = 12
ORDER BY COUNT(DISTINCT SKU) DESC; --2663 distinct products (SKU)

-- RFM ANALYSIS: Identifying Our Best Customers

-- Who is our best customer? This analysis aims to identify the most valuable customers based on their RFM scores.

-- Step 1: Create a temporary table to store RFM data
DROP TABLE IF EXISTS #rfm;  -- we are going to create a temp table instead of selecting and running this long query every time

-- Step 2: Calculate RFM metrics for each customer
WITH rfm AS 
(
SELECT 
	customer_id,
	COUNT (transaction_id) AS Frequency,
	ROUND (SUM (sales_amount),2) AS Monetary_Value,
	ROUND (AVG (sales_amount),2) AS Avg_Monetary_Value,
	MAX (Date) Last_Order_Date,
	(SELECT MAX (Date) FROM dbo.scanner_data) AS Max_Order_Date,
	DATEDIFF (dd, MAX (Date), (SELECT MAX (Date) FROM dbo.scanner_data )) AS Recency
FROM dbo.scanner_data
GROUP BY customer_id
),
-- Step 3: Calculate RFM scores using NTILE function for each RFM metric
rfm_calc AS 
(
	SELECT r.*,
		NTILE (3) OVER (ORDER BY Recency DESC) AS R,
		NTILE (3) OVER (ORDER BY Frequency) AS F,
		NTILE (3) OVER (ORDER BY Monetary_Value) AS M
	FROM rfm r
)
-- Step 4: Store results in the temporary table #rfm with additional RFM cell and RFM score
SELECT 
	c.*, 
	R + F + M AS rfm_cell,
	CAST (R AS VARCHAR) + CAST (F AS VARCHAR) + CAST (M AS VARCHAR) AS rfm_score
	INTO #rfm   -- temp table #rfm
FROM rfm_calc c;

-- Step 5: Determine RFM segments based on RFM scores
-- RFM Segments definition based on RFM score ranges
SELECT 
    customer_id, 
    R, 
    F, 
    M,
    CASE 
		WHEN rfm_score IN (333, 233) THEN 'Champions' -- Highest score segment
		WHEN rfm_score IN (332, 331, 323, 223) THEN 'Loyal Customers' 
		WHEN rfm_score IN (322, 233, 232, 231) THEN 'Potential Loyalist' 
		WHEN rfm_score IN (321, 313, 312, 222, 221, 213, 212 ) THEN 'Promising'
		WHEN rfm_score IN (311, 211) THEN 'New Customers'
		WHEN rfm_score IN (131, 122, 121) THEN 'At Risk'
		WHEN rfm_score IN (133, 132, 123, 113) THEN 'Cannot Lose Them'
		WHEN rfm_score IN (112, 111) THEN 'Lost Customers'   -- Lowest score segment
	END rfm_segment
FROM 
	#rfm;  -- Query the temporary table #rfm to retrieve RFM segments



-- Percentage Calculation by RFM Segment

SELECT
    rfm_segment,
    COUNT(DISTINCT customer_id) AS Customer_Count,
    (COUNT(DISTINCT customer_id) * 100.0) / 
        (SELECT COUNT(DISTINCT customer_id) FROM #rfm) AS Percentage_
FROM (
    -- Subquery to assign RFM segments based on scores
    SELECT 
        customer_id, 
        R, 
        F, 
        M,
        CASE 
            WHEN rfm_score IN (333, 233) THEN 'Champions' 
            WHEN rfm_score IN (332, 331, 323, 223) THEN 'Loyal Customers' 
            WHEN rfm_score IN (322, 233, 232, 231) THEN 'Potential Loyalist' 
            WHEN rfm_score IN (321, 313, 312, 222, 221, 213, 212 ) THEN 'Promising'
            WHEN rfm_score IN (311, 211) THEN 'New Customers'
            WHEN rfm_score IN (131, 122, 121) THEN 'At Risk'
            WHEN rfm_score IN (133, 132, 123, 113) THEN 'Cannot Lose Them'
            WHEN rfm_score IN (112, 111) THEN 'Lost Customers'
        END AS rfm_segment
    FROM 
        #rfm
) AS rfm_tb
GROUP BY rfm_segment
ORDER BY Percentage_ DESC;


