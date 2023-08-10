-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

-- Query for finding patron
SELECT PatronID
FROM Patrons
WHERE Email = 'jvaan@wisdompets.com';

-- Query for finding Dorian Gray
SELECT BookID
FROM Books
WHERE Barcode = '2855934983';

-- Query for finding Great Expectations
SELECT BookID
FROM Books
WHERE Barcode = '4043822646';

INSERT INTO Loans(BookID, PatronID, LoanDate, DueDate)
VALUES
  -- Loaning Dorian Gray
  (
    (SELECT BookID FROM Books WHERE Barcode = '2855934983'),
    (SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com'),
    '2022-08-25',
    '2022-09-08'
  ),
  -- Loaning Great Expectations
  (
    (SELECT BookID FROM Books WHERE Barcode = '4043822646'),
    (SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com'),
    '2022-08-25',
    '2022-09-08'
  );

SELECT *
FROM Loans
ORDER BY LoanID DESC
LIMIT 5;