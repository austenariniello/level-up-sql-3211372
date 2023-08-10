-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

-- generate list of bookids that are currently checked out
SELECT BookID
FROM Loans
WHERE ReturnedDate IS NULL;

-- generate list of books that are not currently checked out
SELECT *
FROM Books AS b
WHERE BookID NOT IN (
  SELECT BookID
  FROM Loans
  WHERE ReturnedDate IS NULL
);

-- generate desired list of books
-- not checked out
-- between 1890 and 1899
SELECT b.Author, b.Title, b.Barcode
FROM Books AS b
WHERE (b.BookID NOT IN (
  SELECT BookID
  FROM Loans
  WHERE ReturnedDate IS NULL
)) 
  AND (b.Published BETWEEN 1890 AND 1899)
ORDER BY b.Author, b.Title;
