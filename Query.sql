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

