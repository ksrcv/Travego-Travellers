USE Travego;
### How many female passengers traveled a minimum distance of 600 KMs? ###
-- Query:
SELECT COUNT(*) AS No_of_Female_Passengers
FROM passenger
WHERE Gender = 'F' AND Distance >= 600;

-- So the number of female passengers who travled a minimum of 600km is: 2

### Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus. ###
-- Query:
SELECT * FROM passenger
WHERE Distance > 500 AND Bus_Type = 'Sleeper';

### Select passenger names whose names start with the character 'S'. ###
-- Query:
SELECT Passenger_name FROM passenger
WHERE Passenger_name LIKE 'S%';

### Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, 
-- Destination City, Bus type, and Price in the output. ###
-- Query:
SELECT ps.Passenger_name, ps.Boarding_City, ps.Destination_City, pr.Bus_Type, pr.Price  FROM passenger AS ps
LEFT JOIN price AS pr ON ps.Distance = pr.Distance AND ps.Bus_Type = pr.Bus_Type;

### What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? ###
-- Query:
SELECT ps.Passenger_name,pr.Price FROM passenger AS ps
LEFT JOIN price AS pr ON ps.Distance = pr.Distance AND ps.Bus_Type = pr.Bus_Type
WHERE ps.Distance = 1000 AND ps.Bus_Type = 'Sitting';

## NOTE ##
-- Wasn't able to find passenger name(s) for those who traveled '1000'kms 'Sitting' in a bus,
-- as there was no one in the data given who travelled 1000kms with bus type 'Sitting'

## {IF the question meant name and price for passenger who travelled 1000 kms while just being 
-- in the bus(sitting/sleeper)the query would've been for 1 e.) 
/*SELECT ps.Passenger_name,pr.Price FROM Passenger AS ps
LEFT JOIN Price AS pr ON ps.Distance = pr.Distance AND ps.Bus_Type = pr.Bus_Type
WHERE ps.Distance = 1000;}*/ ##

### What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? ###
-- Query:
SELECT ps.Passenger_name, ps.Destination_City, ps.Boarding_City,pr.Bus_Type, pr.Price  FROM passenger AS ps
LEFT JOIN price AS pr ON ps.Distance = pr.Distance
WHERE ps.passenger_name = 'Pallavi';

-- So we can see that to travel from Banaglore to panaji it would take Pallavi 744 for sitting and 1320 for Sleeper

### Alter the column category with the value "Non-AC" where the Bus_Type is sleeper ###
-- Query:
SET SQL_SAFE_UPDATES = 0;
UPDATE Passenger
SET Category = 'Non-AC'
WHERE Bus_Type = 'Sleeper';

### Delete an entry from the table where the passenger name is Piyush and commit this change in the database. ###
-- Query:
-- We know that by default the after deletion statement is run, the changes are commited automatically, but if we want 
-- to manually Commit we can turn off AutoCommit and use the Commit keyword

-- Assuming that autocommit is disabled i.e; -> SET AUTOCOMMIT = 0;
-- Deletion Operation
DELETE FROM passenger 
WHERE Passenger_name = 'Piyush';
SELECT * FROM passenger; -- We can see that the record with Passenger_name Piyush has been deleted
-- Commit the Change
Commit;

### Truncate the table passenger and comment on the number of rows in the table (explain if required). ###
-- QUERY:
-- Truncating the Table
TRUNCATE TABLE passenger;
# Number of Rows in the Tabel: 0
SELECT COUNT(*) AS No_of_Rows FROM passenger;
-- We know that the number of rows in the table passenger will be 'zero' becuase the TRUNCATE command 
-- basically deletes every record present in a particular table.

### Delete the table passenger from the database. ###
DROP TABLE passenger;







