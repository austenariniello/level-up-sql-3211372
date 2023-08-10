-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

-- Find the loan data for the selected books
SELECT *
FROM Loans
WHERE BookID IN (
  SELECT BookID
  FROM Books
  WHERE Barcode IN ('6435968624', '5677520613', '8730298424')
) AND ReturnedDate IS NULL;

-- update the loan table to reflect new returned dates
UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE LoanID IN (
  SELECT LoanID
  FROM Loans
  WHERE (BookID IN (
    SELECT BookID
    FROM Books
    WHERE Barcode IN ('6435968624', '5677520613', '8730298424')
  )) AND (ReturnedDate IS NULL)
);

-- check the updated loan data for the selected books
SELECT *
FROM Loans
WHERE BookID IN (
  SELECT BookID
  FROM Books
  WHERE Barcode IN ('6435968624', '5677520613', '8730298424')
) AND ReturnedDate = '2022-07-05';