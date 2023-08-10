-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

SELECT *
FROM Patrons
LIMIT 5;

SELECT *
FROM Books
LIMIT 5;

SELECT p.FirstName, p.Email, b.Title, l.DueDate
-- get loan data
FROM Loans AS l
-- join patrons for guest data
INNER JOIN Patrons AS p USING(PatronID)
-- join books for book data
INNER JOIN Books AS b USING(BookID)
-- filter for due date of july 13th 2022
WHERE l.DueDate = '2022-07-13'
  AND l.ReturnedDate IS NULL
ORDER BY p.FirstName;