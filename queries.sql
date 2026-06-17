-- Query 1: Total revenue by product category
SELECT Category, ROUND(SUM(Sales), 2) AS Total_Revenue
FROM superstore
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- Query 2: Top 5 most profitable products
SELECT "Product Name", ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 5;

-- Query 3: Revenue by region
SELECT Region, ROUND(SUM(Sales), 2) AS Revenue
FROM superstore
GROUP BY Region
ORDER BY Revenue DESC;

-- Query 4: Monthly revenue trend (to find Q4 spike)
SELECT strftime('%Y-%m', "Order Date") AS Month,
       ROUND(SUM(Sales), 2) AS Monthly_Revenue
FROM superstore
GROUP BY Month
ORDER BY Month;

-- Query 5: Customer segment analysis
SELECT Segment, COUNT(DISTINCT "Customer ID") AS Customers,
       ROUND(SUM(Sales), 2) AS Revenue
FROM superstore
GROUP BY Segment;

-- Query 6: Average order value by category
SELECT Category,
       ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM superstore
GROUP BY Category;

-- Query 7: Return rate by region (orders with negative profit)
SELECT Region,
       COUNT(CASE WHEN Profit < 0 THEN 1 END) AS Loss_Orders,
       COUNT(*) AS Total_Orders,
       ROUND(100.0 * COUNT(CASE WHEN Profit < 0 THEN 1 END) / COUNT(*), 2) AS Loss_Rate_Pct
FROM superstore
GROUP BY Region;

-- Query 8: Top 3 categories by revenue share
SELECT Category,
       ROUND(SUM(Sales), 2) AS Revenue,
       ROUND(100.0 * SUM(Sales) / (SELECT SUM(Sales) FROM superstore), 2) AS Revenue_Share_Pct
FROM superstore
GROUP BY Category
ORDER BY Revenue DESC;
