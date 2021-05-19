USE DBProject

exec Input_Customer 'CU001', 'Felix Prima', 'felix.prima@binus.ac.id', 'Binus Square', '2001/07/12','Male', '081188119111', 'Udin123' 
exec Input_Customer 'CU002', 'Budi Lopez', 'budi.lopez@binus.ac.id', 'Kemanggisan', '2004/04/28','Male', '082160143321', 'Oper928'
exec Input_Customer 'CU003', 'Markocop Lestari', 'markocop.lestari@binus.ac.id', 'Pluit', '1999/01/01','Male', '082163307160', 'Ipoq192'
exec Input_Customer 'CU004', 'Ricky Baswedan', 'ricky.baswedan@binus.ac.id', 'Binus Square', '2002/08/02','Male', '082272011641', 'uqiw201'
exec Input_Customer 'CU005', 'Suryono Ivana', 'suryono.ivana@binus.ac.id', 'Kelapa Gading', '2012/02/03','Male', '082183019736', 'Udne022'
exec Input_Customer 'CU006', 'Gatot Kamal', 'gatot.kamal@binus.ac.id', 'Bandengan', '2010/10/10','Male', '082252303112', 'Pass122'
exec Input_Customer 'CU007', 'Iskan Noviandri', 'iskan.noviandri@binus.ac.id', 'Lestari', '2009/09/09','Female', '082216036969', 'Ciee102'
exec Input_Customer 'CU008', 'Okta Firma', 'okta.firma@binus.ac.id', 'Cawang Barat', '2004/07/04','Female', '082173891311', 'aduh192'
exec Input_Customer 'CU009', 'Alkane Ikrum', 'alkane.ikrum@binus.ac.id', 'Cawang Pusat', '1998/12/12','Male', '082161304108', 'sars029'
exec Input_Customer 'CU010', 'Petrus Imba', 'petrus.imba@binus.ac.id', 'Cawang Timur', '2006/06/12','Male', '083184115883', 'ampe862'
exec Input_Customer 'CU011', 'Metal Alingga', 'metal.alingga@binus.ac.id', 'Bekasi Timur', '2001/10/28','Male', '082151842449', 'Bidc920'
exec Input_Customer 'CU012', 'Alustri Oktrum', 'alustri.oktrum@binus.ac.id', 'Tangerang Barat', '1997/02/10','Female', '081711372576', 'jUdi934'
exec Input_Customer 'CU013', 'Callista Triadmaja', 'callista.triadmaja@binus.ac.id', 'Surabaya', '1997/05/22','Female', '082117874768', 'maIn732'
exec Input_Customer 'CU014', 'Satria Nometri', 'satria.nometri@binus.ac.id', 'Monas', '1999/09/11','Male', '082142105162', 'maiN009'
exec Input_Customer 'CU015', 'Indra Gazali', 'indra.gazali@binus.ac.id', 'Ancol', '2003/03/29','Male', '082157470851', 'ball100'
GO

insert into DBMSSoftware VALUES
('DS001', 'MichaelSoft SQL Server Managing Studios', 'www.michaelsoftssms.com'),
('DS002', 'Oraclee ourSQL', 'www.oursql.com'),
('DS003', 'Veetas SQL Worksheet', 'www.veetasql.com'),
('DS004', 'Visual Coding Studios', 'www.vcstudios.com'),
('DS005', 'R Query Server', 'www.rqs.com'),
('DS006', 'Alvorna Worksheet', 'www.alvorsheets.com'),
('DS007', 'Mahindi Coding Management', 'www.mahindigement.com'),
('DS008', 'Numbers Server Studios', 'www.nss.com'),
('DS009', 'Aria Query Language Studios', 'www.ariaqls.com'),
('DS010', 'The Server Management Studio', 'www.thesmstudio.com'),
('DS011', 'Subreme Text', 'www.subremetxt.com'),
('DS012', 'SUS SQL', 'www.amogusql.com'),
('DS013', 'Sentul International Coding Worksheet', 'www.sentulintercs.com'),
('DS014', 'Manda Lika Text', 'www.mltxt.com'),
('DS015', 'Accountant Works', 'www.accworks.com');
GO

INSERT INTO [Database] VALUES
('DB001','DS011',16,120000),
('DB002','DS001',8,150000),
('DB003','DS003',2,200000),
('DB004','DS012',4,100000),
('DB005','DS004',32,110000),
('DB006','DS006',8,220000),
('DB007','DS007',4,130000),
('DB008','DS001',16,170000),
('DB009','DS015',2,200000),
('DB010','DS010',32,150000),
('DB011','DS011',4,160000),
('DB012','DS005',8,290000),
('DB013','DS013',2,270000),
('DB014','DS004',16,240000),
('DB015','DS015',4,180000)
GO

INSERT INTO Operating_System VALUES
('OS001', 'Debian', 'Linux', 1000000),
('OS002', 'CentOS', 'Linux', 900000),
('OS003', 'Mint', 'Linux', 800000),
('OS004', 'Slackel', 'Linux', 1100000),
('OS005', 'Zorin', 'Linux', 1400000),
('OS006', 'Netrunner', 'Linux', 1300000),
('OS007', 'Neptune', 'Linux', 1200000),
('OS008', 'BunsenLabs', 'Linux', 600000),
('OS009', 'Windows 10', 'Windows', 800000),
('OS010', 'Windows XP', 'Windows', 700000),
('OS011', 'Windows 8 ', 'Windows', 1000000),
('OS012', 'OS X El Capitan', 'IOS', 900000),
('OS013', 'Mac OS X Snow Leopad', 'IOS', 1300000),
('OS014', 'Mac OS X Puma', 'IOS', 1099000),
('OS015', 'Windows 7', 'Windows', 999999)
GO

--(ServerID,ProcessorID,OperatingSystemID,[Name],Memory,Price,Storage)
INSERT INTO [Server] VALUES
('SV001','PR001','OS001',),
('SV002','PR002','OS012',),
('SV003','PR013','OS011',),
('SV004','PR004','OS004',),
('SV005','PR015','OS006',),
('SV006','PR008','OS001',),
('SV007','PR007','OS008',),
('SV008','PR001','OS008',),
('SV009','PR006','OS003',),
('SV010','PR003','OS001',),
('SV011','PR004','OS011',),
('SV012','PR005','OS012',),
('SV013','PR013','OS013',),
('SV014','PR004','OS001',),
('SV015','PR015','OS005',)
GO

INSERT INTO Processor VALUES
('PR001', 'AMD Ryzen 9 5950X', 16, 3.7, 4.9),
('PR002', 'Intel Core i9-10900K', 12, 3.8, 4.5),
('PR003', 'Intel Core i9-10900KF', 12, 3.5, 4.7),
('PR004', 'Intel Core i9-10850K', 8, 3.6, 4.5),
('PR005', 'AMD Ryzen 9 5900X', 12, 3.3, 4.6),
('PR006', 'AMD Ryzen 9 3950X', 8, 3.7, 4.5),
('PR007', 'Intel Core i9-9960X', 16, 3.5, 4.3),
('PR008', 'Intel Core i9-10900', 16, 3.8, 4.7),
('PR009', 'AMD Ryzen Threadripper', 16, 3.2, 4.5),
('PR010', 'Intel Core i9-10980XE Extreme Edition', 16, 3.5, 4.8),
('PR011', 'AMD Ryzen 9 3900XT', 8, 3.9, 5.1),
('PR012', 'Intel Core i9-10900F', 4, 3.8, 5.1),
('PR013', 'Intel Core i9-10940X X-series', 3.6, 3.4, 4.9),
('PR014', 'Intel Core i9-7980XE', 8, 3.7, 4.8),
('PR015', 'Intel Core i9-9900KS', 16, 3.5, 4.7)
GO

INSERT INTO Cloud_Provider VALUES
('CP001', 'Kamatera', 'kamatera@cloud.com', 'Texas', 'www.kamatera.com'),
('CP002', 'Serverspace', 'Serverspace@cloud.com', 'New York', 'www.Serverspace.com'),
('CP003', 'phoenixNAP', 'phoenixNAP@cloud.com', 'Amsterdam', 'www.phoenixNAP.com'),
('CP004', 'Cloudways', 'Cloudways@cloud.com', 'California', 'www.Cloudways.com'),
('CP005', 'pCloud', 'pCloud@cloud.com', 'Washingthon', 'www.pCloud.com'),
('CP006', 'Amazon Web Services', 'kamatera@cloud.com', 'Texas', 'www.amazon.com'),
('CP007', 'Microsoft Azure', 'kamatera@cloud.com', 'Los Angeles', 'www.Azure.com'),
('CP008', 'Google Cloud Platform', 'google@cloud.com', 'New York', 'www.googlecloud.com'),
('CP009', 'Adobe', 'Adobe@cloud.com', 'Texas', 'www.Adobe.com'),
('CP010', 'VMware', 'VMwarea@cloud.com', 'Texas', 'www.VMwarea.com'),
('CP011', 'IBM Cloud', 'IBM@cloud.com', 'New York', 'www.IBM.com'),
('CP012', 'Rackspace', 'Rackspace@cloud.com', 'California', 'www.Rackspace.com'),
('CP013', 'Red Hat', 'Red Hat@cloud.com', 'Texas', 'www.RedHat.com'),
('CP014', 'Salesforce', 'Salesforce@cloud.com', 'Amsterdam', 'www.Salesforce.com'),
('CP015', 'Oracle Cloud', 'Oraclea@cloud.com', 'Texas', 'www.Oraclea.com')
GO

INSERT INTO [Transaction] VALUES
()
GO

--delete from Customer