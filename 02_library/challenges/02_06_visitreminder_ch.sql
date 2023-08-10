-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT p.PatronID, p.FirstName, p.LastName, p.Email, COUNT(LoanID) AS loan_count
FROM Patrons AS p
-- left join to find patrons that have not checked out any books
LEFT JOIN Loans AS l USING(PatronID)
GROUP BY p.PatronID
ORDER BY loan_count
LIMIT 10;