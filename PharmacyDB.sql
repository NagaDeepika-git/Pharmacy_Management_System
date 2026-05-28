use PharmacyDB;
show tables;
INSERT INTO Manufacturer VALUES(1,'Cipla','Mumbai','9000000001','cipla@gmail.com'),(2,'Sun Pharma','Hyderabad','9000000002','sun@gmail.com'),
(3,'Dr Reddy','Hyderabad','9000000003','drreddy@gmail.com'),(4,'Lupin','Pune','9000000004','lupin@gmail.com'),
(5,'Aurobindo','Hyderabad','9000000005','auro@gmail.com'),(6,'Zydus','Ahmedabad','9000000006','zydus@gmail.com'),
(7,'Glenmark','Mumbai','9000000007','glen@gmail.com'),(8,'Torrent','Ahmedabad','9000000008','torrent@gmail.com'),
(9,'Biocon','Bangalore','9000000009','biocon@gmail.com'),(10,'Abbott','Delhi','9000000010','abbott@gmail.com'),
(11,'Pfizer','USA','9000000011','pfizer@gmail.com'),(12,'Novartis','Switzerland','9000000012','nova@gmail.com'),
(13,'Sanofi','France','9000000013','sanofi@gmail.com'),(14,'GSK','UK','9000000014','gsk@gmail.com'),
(15,'Bayer','Germany','9000000015','bayer@gmail.com'),(16,'Mankind','Delhi','9000000016','mankind@gmail.com'),
(17,'Alkem','Mumbai','9000000017','alkem@gmail.com'),(18,'Intas','Ahmedabad','9000000018','intas@gmail.com'),
(19,'Hetero','Hyderabad','9000000019','hetero@gmail.com'),(20,'Wockhardt','Mumbai','9000000020','wockhardt@gmail.com');
select * from Manufacturer;
CREATE TABLE Bill_Items (Bill_ID INT,Medicine_ID INT,Quantity INT CHECK (Quantity > 0),Price DECIMAL(10,2) CHECK (Price > 0),
    Subtotal DECIMAL(10,2) CHECK (Subtotal >= 0),PRIMARY KEY (Bill_ID, Medicine_ID),FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID));
desc Bill_Items;
CREATE TABLE Prescription (Prescription_ID INT PRIMARY KEY,Doctor_Name VARCHAR(100) NOT NULL,Date DATE DEFAULT (CURRENT_DATE),
    Customer_ID INT,Notes VARCHAR(200),FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));
desc Prescription;
CREATE TABLE Bill (Bill_ID INT PRIMARY KEY,Bill_Date DATE DEFAULT (CURRENT_DATE),Total_Amount DECIMAL(10,2) CHECK (Total_Amount >= 0),
    Customer_ID INT,Employee_ID INT,FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID));
desc Bill;
CREATE TABLE Orders (Order_ID INT PRIMARY KEY,Order_Date DATE DEFAULT (CURRENT_DATE),Supplier_ID INT,Employee_ID INT,
    Status VARCHAR(50) DEFAULT 'Pending',FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID));
desc Orders;
CREATE TABLE Stock (Stock_ID INT PRIMARY KEY,Medicine_ID INT UNIQUE,Quantity_Available INT CHECK (Quantity_Available >= 0),
    Reorder_Level INT DEFAULT 10,Last_Updated DATE DEFAULT (CURRENT_DATE),FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID));
desc Stock;
CREATE TABLE Medicine (Medicine_ID INT PRIMARY KEY,Medicine_Name VARCHAR(100) NOT NULL,Category VARCHAR(50),
Price DECIMAL(10,2) CHECK (Price > 0),Expiry_Date DATE NOT NULL,Manufacturer_ID INT,
FOREIGN KEY (Manufacturer_ID) REFERENCES Manufacturer(Manufacturer_ID));
desc Medicine;
CREATE TABLE Employee (Employee_ID INT PRIMARY KEY,Employee_Name VARCHAR(100) NOT NULL,Role VARCHAR(50) NOT NULL,
      Salary DECIMAL(10,2) CHECK (Salary > 0),Phone VARCHAR(15) UNIQUE,Hire_Date DATE DEFAULT (CURRENT_DATE));
desc Employee;
CREATE TABLE Customer (Customer_ID INT PRIMARY KEY,Customer_Name VARCHAR(100) NOT NULL,
Gender VARCHAR(10) CHECK (Gender IN ('Male','Female','Other')),Phone VARCHAR(15) UNIQUE,Address VARCHAR(200));
desc Customer;
CREATE TABLE Supplier (Supplier_ID INT PRIMARY KEY,Supplier_Name VARCHAR(100) NOT NULL,Address VARCHAR(200),Phone VARCHAR(15) UNIQUE,
      Email VARCHAR(100) UNIQUE);
desc supplier;
CREATE TABLE Manufacturer (Manufacturer_ID INT PRIMARY KEY,Manufacturer_Name VARCHAR(100) NOT NULL,Address VARCHAR(200) NOT NULL,
       Contact_Number VARCHAR(15) UNIQUE,Email VARCHAR(100) UNIQUE);
desc Manufacturer;


INSERT INTO Supplier VALUES(1,'MedSupply','Hyderabad','9100000001','med1@gmail.com'),(2,'HealthCorp','Chennai','9100000002','med2@gmail.com'),
(3,'PharmaLink','Delhi','9100000003','med3@gmail.com'),(4,'CarePlus','Mumbai','9100000004','med4@gmail.com'),
(5,'WellnessDist','Pune','9100000005','med5@gmail.com'),(6,'LifeCare','Bangalore','9100000006','med6@gmail.com'),
(7,'ApolloDist','Hyderabad','9100000007','med7@gmail.com'),(8,'MedZone','Chennai','9100000008','med8@gmail.com'),
(9,'QuickMeds','Delhi','9100000009','med9@gmail.com'),(10,'CityPharma','Mumbai','9100000010','med10@gmail.com'),(11,'GreenHealth','Pune','9100000011','med11@gmail.com'),
(12,'MediTrust','Bangalore','9100000012','med12@gmail.com'),(13,'SafeMeds','Hyderabad','9100000013','med13@gmail.com'),
(14,'PrimePharma','Chennai','9100000014','med14@gmail.com'),(15,'HealthPlus','Delhi','9100000015','med15@gmail.com'),
(16,'Medico','Mumbai','9100000016','med16@gmail.com'),(17,'PharmaHub','Pune','9100000017','med17@gmail.com'),
(18,'CareMeds','Bangalore','9100000018','med18@gmail.com'),(19,'MedExpress','Hyderabad','9100000019','med19@gmail.com'),
(20,'WellCare','Chennai','9100000020','med20@gmail.com');
select * from Supplier;

INSERT INTO Customer VALUES(1,'Ravi Kumar','Male','9200000001','Hyderabad'),(2,'Anita Sharma','Female','9200000002','Chennai'),
(3,'Rahul Verma','Male','9200000003','Delhi'),(4,'Sneha Reddy','Female','9200000004','Hyderabad'),
(5,'Amit Singh','Male','9200000005','Mumbai'),(6,'Pooja Mehta','Female','9200000006','Pune'),
(7,'Kiran Rao','Male','9200000007','Bangalore'),(8,'Neha Gupta','Female','9200000008','Delhi'),
(9,'Arjun Nair','Male','9200000009','Kerala'),(10,'Priya Das','Female','9200000010','Kolkata'),
(11,'Vikas Yadav','Male','9200000011','Lucknow'),(12,'Meera Iyer','Female','9200000012','Chennai'),
(13,'Rohit Jain','Male','9200000013','Jaipur'),(14,'Divya Patel','Female','9200000014','Ahmedabad'),
(15,'Suresh Babu','Male','9200000015','Hyderabad'),(16,'Lakshmi Devi','Female','9200000016','Chennai'),
(17,'Manoj Kumar','Male','9200000017','Delhi'),(18,'Kavya Nair','Female','9200000018','Kerala'),
(19,'Ajay Singh','Male','9200000019','Mumbai'),(20,'Anjali Verma','Female','9200000020','Pune');
select * from Customer;

INSERT INTO Employee VALUES(1,'Ramesh','Pharmacist',25000,'9300000001','2022-01-01'),(2,'Sita','Manager',40000,'9300000002','2021-05-10'),
(3,'Arun','Cashier',20000,'9300000003','2023-02-15'),(4,'Geeta','Pharmacist',26000,'9300000004','2022-03-20'),
(5,'Vijay','Manager',42000,'9300000005','2020-08-25'),(6,'Nisha','Cashier',21000,'9300000006','2023-01-11'),
(7,'Karthik','Pharmacist',25500,'9300000007','2022-11-12'),(8,'Latha','Manager',41000,'9300000008','2021-07-30'),
(9,'Suresh','Cashier',22000,'9300000009','2023-04-18'),(10,'Deepa','Pharmacist',27000,'9300000010','2022-06-05'),
(11,'Ravi','Manager',43000,'9300000011','2020-09-09'),(12,'Anu','Cashier',20500,'9300000012','2023-02-25'),
(13,'Raj','Pharmacist',26000,'9300000013','2022-12-01'),(14,'Meena','Manager',41500,'9300000014','2021-03-14'),
(15,'Ajay','Cashier',21500,'9300000015','2023-05-10'),(16,'Sunil','Pharmacist',26500,'9300000016','2022-10-10'),
(17,'Rekha','Manager',42000,'9300000017','2021-01-20'),(18,'Pavan','Cashier',21000,'9300000018','2023-06-12'),
(19,'Kiran','Pharmacist',25500,'9300000019','2022-09-09'),(20,'Swathi','Manager',44000,'9300000020','2020-11-11');
select * from Employee;

INSERT INTO Medicine VALUES(101,'Paracetamol','Tablet',20,'2026-12-31',1),(102,'Amoxicillin','Capsule',50,'2027-06-30',2),
(103,'Ibuprofen','Tablet',30,'2026-10-15',3),(104,'Cough Syrup','Syrup',80,'2026-09-20',4),
(105,'Vitamin C','Tablet',25,'2027-01-10',5),(106,'Aspirin','Tablet',15,'2026-08-18',6),
(107,'Insulin','Injection',200,'2026-07-22',7),(108,'Metformin','Tablet',40,'2027-03-11',8),
(109,'Azithromycin','Tablet',60,'2026-11-05',9),(110,'Dolo 650','Tablet',35,'2026-12-25',10),
(111,'Pantoprazole','Tablet',45,'2027-02-14',11),(112,'Cetirizine','Tablet',10,'2026-06-30',12),
(113,'ORS','Powder',20,'2027-04-01',13),(114,'Calcium','Tablet',55,'2026-10-10',14),
(115,'Iron Tablets','Tablet',30,'2027-05-15',15),(116,'Antacid','Liquid',70,'2026-09-09',16),
(117,'Eye Drops','Liquid',90,'2026-12-01',17),(118,'Pain Relief Spray','Spray',120,'2027-01-20',18),
(119,'Hand Sanitizer','Liquid',50,'2027-03-30',19),(120,'Thermometer','Device',150,'2028-01-01',20);
select * from Medicine;

INSERT INTO Stock VALUES(1,101,100,20,'2026-01-01'),(2,102,80,20,'2026-01-02'),(3,103,90,15,'2026-01-03'),(4,104,70,10,'2026-01-04'),
(5,105,60,10,'2026-01-05'),(6,106,120,25,'2026-01-06'),(7,107,50,10,'2026-01-07'),(8,108,85,20,'2026-01-08'),(9,109,75,15,'2026-01-09'),
(10,110,110,20,'2026-01-10'),(11,111,65,10,'2026-01-11'),(12,112,140,30,'2026-01-12'),(13,113,95,20,'2026-01-13'),(14,114,88,15,'2026-01-14'),
(15,115,77,15,'2026-01-15'),(16,116,66,10,'2026-01-16'),(17,117,55,10,'2026-01-17'),(18,118,44,10,'2026-01-18'),(19,119,130,25,'2026-01-19'),
(20,120,30,5,'2026-01-20');
select * from Stock;

INSERT INTO Orders VALUES(1,'2026-01-01',1,1,'Delivered'),(2,'2026-01-02',2,2,'Pending'),(3,'2026-01-03',3,3,'Delivered'),
(4,'2026-01-04',4,4,'Shipped'),(5,'2026-01-05',5,5,'Delivered'),(6,'2026-01-06',6,6,'Pending'),(7,'2026-01-07',7,7,'Delivered'),
(8,'2026-01-08',8,8,'Shipped'),(9,'2026-01-09',9,9,'Delivered'),(10,'2026-01-10',10,10,'Pending'),(11,'2026-01-11',11,11,'Delivered'),
(12,'2026-01-12',12,12,'Shipped'),(13,'2026-01-13',13,13,'Delivered'),(14,'2026-01-14',14,14,'Pending'),(15,'2026-01-15',15,15,'Delivered'),
(16,'2026-01-16',16,16,'Shipped'),(17,'2026-01-17',17,17,'Delivered'),(18,'2026-01-18',18,18,'Pending'),(19,'2026-01-19',19,19,'Delivered'),
(20,'2026-01-20',20,20,'Shipped');
select * from Orders;

INSERT INTO Bill VALUES(1,'2026-02-01',200,1,1),(2,'2026-02-02',350,2,2),(3,'2026-02-03',150,3,3),(4,'2026-02-04',500,4,4),(5,'2026-02-05',220,5,5),
(6,'2026-02-06',300,6,6),(7,'2026-02-07',450,7,7),(8,'2026-02-08',275,8,8),(9,'2026-02-09',320,9,9),(10,'2026-02-10',410,10,10),
(11,'2026-02-11',180,11,11),(12,'2026-02-12',260,12,12),(13,'2026-02-13',340,13,13),(14,'2026-02-14',390,14,14),(15,'2026-02-15',210,15,15),
(16,'2026-02-16',370,16,16),(17,'2026-02-17',290,17,17),(18,'2026-02-18',310,18,18),(19,'2026-02-19',420,19,19),(20,'2026-02-20',230,20,20);
select * from Bill;

INSERT INTO Prescription VALUES(1,'Dr. Sharma','2026-01-01',1,'Fever'),(2,'Dr. Rao','2026-01-02',2,'Cold'),(3,'Dr. Khan','2026-01-03',3,'Pain'),
(4,'Dr. Reddy','2026-01-04',4,'Cough'),(5,'Dr. Patel','2026-01-05',5,'Weakness'),(6,'Dr. Singh','2026-01-06',6,'Headache'),
(7,'Dr. Mehta','2026-01-07',7,'Diabetes'),(8,'Dr. Das','2026-01-08',8,'Allergy'),(9,'Dr. Iyer','2026-01-09',9,'Infection'),
(10,'Dr. Verma','2026-01-10',10,'Fever'),(11,'Dr. Gupta','2026-01-11',11,'Cold'),(12,'Dr. Nair','2026-01-12',12,'Pain'),
(13,'Dr. Joshi','2026-01-13',13,'Cough'),(14,'Dr. Shah','2026-01-14',14,'Weakness'),(15,'Dr. Kulkarni','2026-01-15',15,'Headache'),
(16,'Dr. Pillai','2026-01-16',16,'Diabetes'),(17,'Dr. Chatterjee','2026-01-17',17,'Allergy'),(18,'Dr. Mishra','2026-01-18',18,'Infection'),
(19,'Dr. Saxena','2026-01-19',19,'Fever'),(20,'Dr. Tiwari','2026-01-20',20,'Cold');
select * from Prescription;

INSERT INTO Bill_Items VALUES(1,101,2,20,40),(2,102,3,50,150),(3,103,1,30,30),(4,104,2,80,160),(5,105,4,25,100),(6,106,3,15,45),
(7,107,1,200,200),(8,108,2,40,80),(9,109,2,60,120),(10,110,3,35,105),(11,111,2,45,90),(12,112,5,10,50),(13,113,3,20,60),(14,114,2,55,110),
(15,115,4,30,120),(16,116,1,70,70),(17,117,2,90,180),(18,118,1,120,120),(19,119,3,50,150),(20,120,1,150,150);
select * from Bill_Items;

SELECT Customer_Name, Phone FROM Customer;

SELECT Medicine_Name, Price FROM Medicine WHERE Price > 50;	
SELECT Customer_Name FROM Customer WHERE Gender = 'Female';

SELECT Medicine_Name, Price FROM Medicine ORDER BY Price DESC;

SELECT Customer_ID, Customer_Name FROM Customer ORDER BY Customer_Name ASC;

SELECT SUM(Total_Amount) AS Total_Sales FROM Bill;
SELECT AVG(Price) AS Avg_Price FROM Medicine;
SELECT MAX(Total_Amount) AS Highest_Bill FROM Bill;

SELECT Customer_ID, SUM(Total_Amount) AS Total_Spent FROM Bill GROUP BY Customer_ID;
SELECT Category, COUNT(*) AS Total_Medicines FROM Medicine GROUP BY Category;

SELECT Customer_ID, SUM(Total_Amount) AS Total_Spent FROM Bill GROUP BY Customer_ID
HAVING SUM(Total_Amount) > 300;

SELECT c.Customer_Name, b.Bill_ID, b.Total_Amount FROM Customer c 
INNER JOIN Bill b ON c.Customer_ID = b.Customer_ID;

SELECT e.Employee_Name, b.Bill_ID FROM Employee e
INNER JOIN Bill b ON e.Employee_ID = b.Employee_ID;

SELECT c.Customer_Name, b.Bill_ID FROM Customer c
LEFT JOIN Bill b ON c.Customer_ID = b.Customer_ID;

SELECT b.Bill_ID, m.Medicine_Name, bi.Quantity FROM Bill b
JOIN Bill_Items bi ON b.Bill_ID = bi.Bill_ID
JOIN Medicine m ON bi.Medicine_ID = m.Medicine_ID;

SELECT Medicine_Name FROM Medicine
WHERE Price = (SELECT MAX(Price) FROM Medicine);

SELECT Customer_ID FROM Bill
WHERE Total_Amount > (SELECT AVG(Total_Amount) FROM Bill);
SELECT Medicine_ID FROM Stock
WHERE Quantity_Available < (SELECT AVG(Quantity_Available) FROM Stock);
SELECT Medicine_Name, Expiry_Date FROM Medicine
WHERE Expiry_Date < '2027-01-01';
--views
CREATE VIEW Customer_Bills AS SELECT c.Customer_Name, b.Bill_ID, b.Total_Amount
FROM Customer c JOIN Bill b ON c.Customer_ID = b.Customer_ID;
SELECT * FROM Customer_Bills;

CREATE VIEW Medicine_Stock AS SELECT m.Medicine_Name, s.Quantity_Available
FROM Medicine m JOIN Stock s ON m.Medicine_ID = s.Medicine_ID;
select * from Medicine_Stock;

DELIMITER //
CREATE TRIGGER calculate_subtotal
BEFORE INSERT ON Bill_Items FOR EACH ROW
BEGIN
    SET NEW.Subtotal = NEW.Quantity * NEW.Price;
END //
DELIMITER ;
INSERT INTO Bill_Items (Bill_ID, Medicine_ID, Quantity, Price) VALUES (1, 102, 2, 50);
SELECT * FROM Bill_Items;

SELECT Medicine_ID FROM Bill_Items WHERE Medicine_ID IN (
    SELECT Medicine_ID FROM Stock);
    
SELECT Customer_ID FROM Bill WHERE Customer_ID NOT IN (
    SELECT Customer_ID FROM Prescription);
    
    START TRANSACTION;

UPDATE Stock SET Quantity_Available = Quantity_Available - 5
WHERE Medicine_ID = 101;
COMMIT;
SELECT * FROM Stock WHERE Medicine_ID = 101;

DELIMITER //
CREATE PROCEDURE GetExpensiveMedicines()
BEGIN
    SELECT * FROM Medicine
    WHERE Price > 50;
END //
DELIMITER ;
CALL GetExpensiveMedicines();

DELIMITER //
CREATE PROCEDURE GetCustomerBills(IN cust_id INT)
BEGIN
    SELECT * FROM Bill
    WHERE Customer_ID = cust_id;
END //
DELIMITER ;
CALL GetCustomerBills(1);