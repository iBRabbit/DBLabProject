USE DBProject

-- 1.	Display customer name and Cloud Providers Count (obtained from the total of purchased cloud providers by the customer) for every customer whose name contains the letter “e” and the birthdate day is even number.

SELECT 
c.Name,
COUNT(*) as [Cloud Providers Count]
FROM HeaderTransaction h
JOIN DetailTransaction dt
ON dt.TransactionID = h.TransactionID
JOIN Customer c
ON c.CustomerID = dt.CustomerID
JOIN Cloud_Provider cp
ON cp.CloudProviderID = h.CloudProviderID
WHERE c.Name LIKE '%e%' AND DAY(c.Date_of_Birth) % 2 = 0
GROUP BY c.Name


-- 2.	Display server name and Total Price (obtained from the sum of server price, operating system price, and database price with “Rp” added at  the front, then replacing “.00” with “,-”, for every server with memory more than 2 and database storage more than 1.

SELECT
s.Name,
REPLACE('Rp ' + CAST(SUM(s.Price) + SUM(db.Price) + SUM(os.Price) as varchar) + '.00', '.00', ',-') as [Total Price]
FROM HeaderTransaction h 
JOIN [Server] s
ON s.ServerID = h.ServerID
JOIN Operating_System os
ON os.OperatingSystemID = s.OperatingSystemID
JOIN [Database] db
ON db.DatabaseID = h.DatabaseID
WHERE s.Memory > 2 AND db.Storage > 1
GROUP BY s.Name

--3 
-- 3.	Display Initial (obtained from the first letter from the first word of customer name and first letter from the second word of customer name), Database Price (obtained from the total of all databases price which was purchased by the customer), and Transaction Count (obtained from the total of transactions made by the customer) for every database with storage more than 2 and the customer gender is female.

SELECT
SUBSTRING(c.Name, 1, 1) + SUBSTRING(c.Name, CHARINDEX(' ', c.Name) + 1, 1) as [Initial],
SUM(db.Price) as [Database Price],
COUNT(h.TransactionID) as [Transaction Count]
FROM HeaderTransaction h
JOIN DetailTransaction dt_h
ON h.TransactionID = dt_h.TransactionID
JOIN Customer c
ON c.CustomerID = dt_h.CustomerID
JOIN [Database] db
ON db.DatabaseID = h.DatabaseID
WHERE db.Storage > 2 AND c.Gender = 'Female'
GROUP BY c.Name

--4 

-- 4.	Display Cloud Company (obtained from the first word of cloud provider name and “ Company” added at the end), Total Transaction (obtained from the total of transactions which include the cloud provider), and Customer Average Account Balance (obtained from the average of customer account balance) for every cloud provider name which contains the word “Cloud” and Total Transaction more than 1.

SELECT
SUBSTRING(cp.Name, 1, CHARINDEX(' ', cp.Name)) + 'Company' as [Cloud Company],
COUNT(h.CloudProviderID) as [Cloud Provider],
AVG(c.MoneyBalance) as [Money Balance]
FROM HeaderTransaction h
JOIN Cloud_Provider cp
ON cp.CloudProviderID = h.CloudProviderID
JOIN DetailTransaction dt
ON dt.TransactionID = h.TransactionID
JOIN Customer c
ON c.CustomerID = dt.CustomerID
WHERE cp.Name LIKE '%Cloud%' 
GROUP BY cp.Name
HAVING COUNT(h.CloudProviderID) > 1

--5 
-- 5.	Display Server Initial (obtained from the first five letters of server name, combined with “-“, and combined with the last three letters of server ID in uppercased form), processor name, and server storage for every server storage that is more than maximum storage of all databases and processor cores at least 4.

SELECT
UPPER(LEFT(s.Name, 5)) + '-' + REVERSE(LEFT(REVERSE(s.ServerID), 3)) as [Server Initial],
p.Name,
s.Storage
FROM HeaderTransaction h
JOIN [Server] s
ON s.ServerID = h.ServerID
JOIN Processor p
ON p.ProcessorID = s.ProcessorID
JOIN [Database] db
ON db.DatabaseID = h.DatabaseID
WHERE db.Storage > (
    SELECT MAX(db.Storage) 
    FROM [Database] db 
) AND p.Cores >= 4

--6 
-- 6.	Display DBMS software name, database price, database storage with “GB” added at the back, and DBMS software website URL with “https://” removed for every database with price above the average price of all servers and DBMS software name contains “DB”.

SELECT 
dbms.Name,
db.Price,
CAST(db.Storage as varchar) + ' GB' as [Database Storage],
CASE 
    WHEN NOT(dbms.Name LIKE '%DB%') THEN dbms.URL
    WHEN db.price > (SELECT AVG(Price) FROM [Server]) THEN REPLACE(dbms.URL, 'https://', '')
    WHEN db.Price <= (SELECT AVG(Price) FROM [Server]) THEN dbms.URL
END as [Website URL]
FROM [Database] db
JOIN DBMSSoftware dbms
ON dbms.DBMSSoftwareID = db.DBMSSoftwareID

-- 7.	Display Server Code (obtained from the first five letters of server name, combined with “-“, combined with the last two letters of server ID, combined with “-“, and combined with database storage, all in uppercase), Storage (obtained from database storage with “GB” added at the end), and Price (obtained from database price with “Rp” added at the front) for every server with price above the maximum price from all operating systems, and server storage above the average storage of all databases.

SELECT 
UPPER(LEFT(s.Name, 5) + '-' + RIGHT(s.ServerID, 2) + '-' + CAST(db.Storage as varchar)) as [Server Code],
CAST(DB.Storage as nvarchar) + ' GB' as [Storage],
'Rp ' + CAST(db.Price as nvarchar) as [Price]
FROM HeaderTransaction h
JOIN [Server] s
ON s.ServerID = h.ServerID
JOIN [Database] db
ON db.DatabaseID = h.DatabaseID
GROUP BY s.Name, s.Price, db.Storage, db.Price, s.ServerID, s.Storage
HAVING s.Storage > (
    SELECT 
    AVG([Storage])
    FROM [Database]
) AND s.Price > (
    SELECT 
    MAX(Price)
    FROM Operating_System
)

-- 8.	Display Database Code (obtained from the last three letters from database ID, combined with “-“, combined with the last three letters from DBMS software ID, combined with “-“, and combined with database storage with “GB” added at the end) for every database with price between the minimum price of all servers and the average price of all operating systems, and DBMS software ID either “DS006” or “DS007”.

SELECT
RIGHT(db.DatabaseID,3) + '-' + RIGHT(dbms.DBMSSoftwareID, 3) + '-' + CAST(db.Storage as nvarchar) + 'GB' as [Database Code]
FROM HeaderTransaction h
JOIN [Database] db
ON db.DatabaseID = h.DatabaseID
JOIN DBMSSoftware dbms
ON dbms.DBMSSoftwareID = db.DBMSSoftwareID
WHERE dbms.DBMSSoftwareID = 'DS006' OR dbms.DBMSSoftwareID = 'DS007'
GROUP BY db.DatabaseID, dbms.DBMSSoftwareID, db.Storage, db.Price
HAVING db.Price BETWEEN (SELECT MIN(Price) FROM [Server]) AND (SELECT AVG(price) FROM Operating_System) 
GO

-- 9.	Create a view named as “Affordable Server View” to display server name, processor name, operating system name, and server memory with “GB” added at the end for every server with price is between the cheapest price of all servers and average price of all servers, and memory is at least 4.

CREATE VIEW [Affordable Server View] AS
SELECT
s.Name as [Server Name],
p.Name as [Processor Name],
os.Name as [Operating System Name],
CAST(s.Memory as nvarchar) + 'GB' as [Server Memory]
FROM [Server] s
JOIN Processor p
ON p.ProcessorID = s.ProcessorID
JOIN Operating_System os
ON os.OperatingSystemID = s.OperatingSystemID
WHERE s.Memory >= 4
GROUP BY s.Name, p.Name, os.Name, s.Memory, s.Price
HAVING s.Price BETWEEN (SELECT MIN(Price) FROM [Server]) AND (SELECT AVG(Price) FROM [Server])
GO
-- 10.	Create a view named as “Popular Cheap Databases View” to display database name, website URL, and storage with “GB” added at the end, and Transaction Count (obtained from the total of transactions which include the database) for every database with price equals or below the average price of all databases and Transaction Count more than 2.

CREATE VIEW [Popular Cheap Databases View] AS
SELECT
dbms.Name as [Database Name],
dbms.URL as [Website URL], 
CAST(db.Storage as nvarchar) + ' GB' as [Storage],
COUNT(h.TransactionID) as [Transaction COUNT]
FROM HeaderTransaction h
JOIN [Database] db
ON db.DatabaseID = h.DatabaseID
JOIN DBMSSoftware dbms
ON dbms.DBMSSoftwareID = db.DBMSSoftwareID
JOIN DetailTransaction dt
ON dt.TransactionID = h.TransactionID
GROUP BY dbms.Name, dbms.URL, db.Storage, db.Price
HAVING db.Price <= (SELECT AVG(price) FROM [Database]) AND COUNT(h.TransactionID) > 2

-- SELECT * FROM [Popular Cheap Databases View]