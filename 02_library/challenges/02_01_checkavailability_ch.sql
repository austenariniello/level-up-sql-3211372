-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT COUNT(Books.Title)
FROM Books
WHERE Title = 'Dracula';

SELECT COUNT(Loans.LoanID)
FROM Loans
INNER JOIN Books USING(BookID)
WHERE (ReturnedDate IS NULL)
  AND (Title = 'Dracula');

SELECT 
  (
    SELECT COUNT(Books.Title)
    FROM Books
    WHERE Books.Title = 'Dracula'
  ) -
  (
    SELECT COUNT(Loans.LoanID)
    FROM Loans
    INNER JOIN Books ON Books.BookID = Loans.BookID
    WHERE (Loans.ReturnedDate IS NULL)
      AND (Books.Title = 'Dracula')
  ) AS AvailableCopies;