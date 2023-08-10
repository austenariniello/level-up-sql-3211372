-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

SELECT *
FROM Reservations
WHERE CustomerID = (
  SELECT CustomerID
  FROM Customers
  WHERE FirstName = 'Norby'
)
  AND Date LIKE '2022-07-29%';

DELETE FROM Reservations
WHERE ReservationID = 2000;

SELECT *
FROM Reservations
ORDER BY ReservationID DESC;