USE DBProject

BEGIN TRAN
INSERT INTO HeaderTransaction VALUES
('TR016', 'CU006', 'CP008', 'DB001', 'SV001'),
('TR017', 'CU001', 'CP005', 'DB015', 'SV012')
COMMIT

BEGIN TRANSACTION
UPDATE HeaderTransaction 
SET CustomerID = 'CU008'
WHERE TransactionID = 'TR016'
COMMIT

BEGIN TRANSACTION
DELETE FROM HeaderTransaction WHERE TransactionID = 'TR017'
COMMIT

-- ---------------------------------------------------------------

BEGIN TRAN
INSERT INTO DetailTransaction VALUES
('TR005', 'CU013', '2020-09-12'),
('TR007', 'CU014', '2019-07-12')
COMMIT

BEGIN TRANSACTION
UPDATE DetailTransaction 
SET CustomerID = 'CU008'
WHERE TransactionID = 'TR005' AND CustomerID = 'CU013'
COMMIT

BEGIN TRANSACTION
DELETE FROM DetailTransaction WHERE TransactionID = 'TR007' AND CustomerID = 'CU014'
COMMIT

SELECT * FROM DetailTransaction