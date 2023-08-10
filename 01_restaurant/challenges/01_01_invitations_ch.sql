-- Generate a list of customer information.

-- Show their first name, last name, and email address.
SELECT LastName, FirstName, Email
FROM Customers
-- Sort the list of results by last name.
ORDER BY LastName, FirstName;