-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(OrderID) AS OrderCount
FROM Customers AS c
INNER JOIN Orders USING(CustomerID)
GROUP BY CustomerID
ORDER BY OrderCount DESC
LIMIT 10;