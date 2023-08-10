-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

SELECT 
  Published, 
  COUNT(DISTINCT(Title)) AS published_count,
  GROUP_CONCAT(DISTINCT(Title)) AS published_books
FROM Books
GROUP BY Published
ORDER BY published_count DESC
LIMIT 10;

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT b.Title, COUNT(l.LoanID) AS loan_count
FROM Loans AS l 
INNER JOIN Books AS b USING(BookID)
GROUP BY b.Title
ORDER BY loan_count DESC
LIMIT 5;