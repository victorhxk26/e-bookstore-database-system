-- Create database
CREATE DATABASE APU_Online_Bookstore;

-- Create tables
USE APU_Online_Bookstore;

CREATE TABLE Publisher (
	Publisher_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Name nvarchar(50),
	Liaison nvarchar(50),
	Phone_Number nvarchar(50),
	Email nvarchar(50),
	Address nvarchar(50)
);

CREATE TABLE Bookstore_Manager (
	Manager_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Name nvarchar(50),
	Contact_Number nvarchar(50)
);

CREATE TABLE Publisher_Order (
	Publisher_Order_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Publisher_ID nvarchar(50) FOREIGN KEY REFERENCES Publisher(Publisher_ID),
	Manager_ID nvarchar(50) FOREIGN KEY REFERENCES Bookstore_Manager(Manager_ID),
	Order_Date date
);

CREATE TABLE Book (
	Book_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Name nvarchar(50),
	Genre nvarchar(50),
	Author nvarchar(50),
	Price_MYR decimal(10,2),
	Published_Date date,
	Publisher_ID nvarchar(50) FOREIGN KEY REFERENCES Publisher(Publisher_ID)
);

CREATE TABLE Publisher_Order_Details (
	Publisher_Order_Details_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Publisher_Order_ID nvarchar(50) FOREIGN KEY REFERENCES Publisher_Order(Publisher_Order_ID),
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES Book(Book_ID),
	Quantity int
);

CREATE TABLE Member (
	Member_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Name nvarchar(50),
	Contact_Number nvarchar(50),
	Address nvarchar(50)
);

CREATE TABLE Member_Order (
	Member_Order_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES Member(Member_ID),
	Payment_Date date,
	Delivery_EDA date,
	Delivery_Address nvarchar(50),
	Delivery_Status nvarchar(50)
);

CREATE TABLE Shopping_Cart (
	Shopping_Cart_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES Member(Member_ID),
	Quantity int
);

CREATE TABLE Review (
	Review_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES Book(Book_ID),
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES Member(Member_ID),
	Ratings int,
	Short_Comments nvarchar(50)
);

CREATE TABLE Members_Orders_Detail (
	Mem_Order_Detail_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES Book(Book_ID),
	Member_Order_ID nvarchar(50) FOREIGN KEY REFERENCES Member_Order(Member_Order_ID),
	Quantity int
);

CREATE TABLE Shopping_Cart_Detail (
	Shopping_Cart_Detail_ID nvarchar(50) NOT NULL PRIMARY KEY,
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES Book(Book_ID),
	Shopping_Cart_ID nvarchar(50) FOREIGN KEY REFERENCES Shopping_Cart(Shopping_Cart_ID),
	Quantity int
);

-- Insert data into the tables
INSERT INTO Publisher (Publisher_ID, Name, Liaison, Phone_Number, Email, Address)
VALUES
('P001', 'Crayson', 'Kavi', '012-958 7863', 'kavi@crayson.com', 'Kuala Lumpur'),
('P002', 'Oxford', 'Darshan', '016-582 1420', 'darshan@oxford.com', 'Petaling Jaya'),
('P003', 'Wiley', 'Bryan', '017-785 6479', 'bryan@wiley.com', 'Subang Jaya'),
('P004', 'Scholastic', 'Wendy', '019-123 5210', 'wendy@scholastic.com', 'Subang Jaya'),
('P005', 'McGraw-Hill', 'Sabri', '016-885 2231', 'sabri@mcgraw-hill.com', 'Johor Bahru'),
('P006', 'Marvel', 'Rajesh', '012-541 0232', 'rajesh@marvel.com', 'Petaling Jaya'),
('P007', 'Pelangi', 'Nicole', '012-958 7864', 'nicole@pelangi.com', 'Johor Bahru'),
('P008', 'Sasbadi', 'Nikita', '016-582 1421', 'nikita@sasbadi.com', 'Kuala Lumpur'),
('P009', 'Bloombury', 'Jean', '017-785 6480', 'jean@bloombury.com', 'Kuala Lumpur'),
('P010', 'Potato', 'Alex', '019-123 5211', 'alex@potato.com', 'Petaling Jaya');

INSERT INTO Bookstore_Manager (Manager_ID, Name, Contact_Number)
VALUES
('M01', 'Larry', '010-462 8740'),
('M02', 'Bonnie', '018-471 2190'),
('M03', 'Ashley', '018-822 1197'),
('M04', 'Phoebe', '016-521 1435'),
('M05', 'Richard', '010-933 0738'),
('M06', 'Richmond', '017-901 2977'),
('M07', 'Terrence', '017-592 4961');

INSERT INTO Publisher_Order (Publisher_Order_ID, Publisher_ID, Manager_ID, Order_Date)
VALUES
('PO001', 'P001', 'M01', '31 July 2023'),
('PO002', 'P003', 'M02', '28 August 2023'),
('PO003', 'P004', 'M03', '18 May 2023'),
('PO004', 'P008', 'M02', '12 September 2023'),
('PO005', 'P003', 'M06', '21 September 2023'),
('PO006', 'P001', 'M03', '21 August 2023'),
('PO007', 'P009', 'M07', '19 August 2023'),
('PO008', 'P010', 'M06', '22 May 2023'),
('PO009', 'P001', 'M02', '23 August 2023'),
('PO010', 'P010', 'M07', '5 July 2023');

INSERT INTO Book (Book_ID, Name, Genre, Author, Price_MYR, Published_Date, Publisher_ID)
VALUES
('B001', 'The Widow in the Prison', 'Mystery', 'Barbosa', 189.15, '15 October 2021', 'P004'),
('B002', 'The Prophecy of the Nun', 'Mystery', 'Winston', 138.03, '24 July 2017', 'P002'),
('B003', 'Mockingjay', 'Action', 'Winston', 141.03, '17 May 2020', 'P003'),
('B004', 'Man on Fire', 'Action', 'Jerry', 171.91, '19 April 2018', 'P004'),
('B005', 'Interstellar', 'Sci-Fi', 'Ollie', 133.83, '11 May 2020', 'P005'),
('B006', 'Mars', 'Sci-Fi', 'Jerry', 152.90, '3 September 2019', 'P006'),
('B007', 'The Fault in our Stars', 'Romance', 'Barbosa', 76.33, '21 September 2018', 'P005'),
('B008', 'Beauty and the Beast', 'Romance', 'Walter', 86.59, '6 June 2020', 'P004'),
('B009', 'Divergent', 'Action', 'Jansen', 185.96, '9 May 2019', 'P009'),
('B010', 'Into the Unknown', 'Mystery', 'Winston', 98.14, '3 April 2018', 'P002');

INSERT INTO Publisher_Order_Details (Publisher_Order_Details_ID, Publisher_Order_ID, Book_ID, Quantity)
VALUES
('POD-001', 'PO008', 'B010', 100),
('POD-002', 'PO008', 'B007', 50),
('POD-003', 'PO005', 'B008', 50),
('POD-004', 'PO010', 'B005', 200),
('POD-005', 'PO004', 'B007', 150),
('POD-006', 'PO006', 'B004', 150),
('POD-007', 'PO005', 'B008', 50),
('POD-008', 'PO010', 'B007', 100),
('POD-009', 'PO005', 'B010', 100),
('POD-010', 'PO003', 'B002', 150);

INSERT INTO Member (Member_ID, Name, Contact_Number, Address)
VALUES
('M001', 'Renee', '010-789 7163', 'Kuala Lumpur'),
('M002', 'Louis', '014-400 0550', 'Subang Jaya'),
('M003', 'Mary', '011-8888 8463', 'Petaling Jaya'),
('M004', 'Louie', '014-400 0865', 'Georgetown'),
('M005', 'Wayne', '018-472 2931', 'Seremban'),
('M006', 'Benjamin', '018-870 7475', 'Kuala Lumpur'),
('M007', 'Potts', '010-428 4082', 'Ipoh'),
('M008', 'Syaril', '019-886 3761', 'Johor Bahru'),
('M009', 'Tana', '014-400 2056', 'Seremban'),
('M010', 'Eddryll', '016-332 0105', 'Petaling Jaya');

INSERT INTO Member_Order (Member_Order_ID, Member_ID, Payment_Date, Delivery_EDA, Delivery_Address, Delivery_Status)
VALUES
('MO-001', 'M008', '1 November 2023', '4 November 2023', 'Johor Bahru', 'Pending'),
('MO-002', 'M001', '10 October 2023', '13 October 2023', 'Kuala Lumpur', 'Pending'),
('MO-003', 'M004', '31 October 2023', '3 November 2023', 'Georgetown', 'Pending'),
('MO-004', 'M002', '12 October 2023', '16 October 2023', 'Subang Jaya', 'Arrived'),
('MO-005', 'M008', '1 November 2023', '4 November 2023', 'Johor Bahru', 'Arrived'),
('MO-006', 'M001', '10 October 2023', '13 October 2023', 'Kuala Lumpur', 'Pending'),
('MO-007', 'M008', '1 November 2023', '4 November 2023', 'Johor Bahru', 'Pending'),
('MO-008', 'M001', '10 October 2023', '13 October 2023', 'Kuala Lumpur', 'Arrived'),
('MO-009', 'M002', '13 October 2023', '16 October 2023', 'Subang Jaya', 'Arrived'),
('MO-010', 'M004', '31 October 2023', '3 November 2023', 'Georgetown', 'Arrived');

INSERT INTO Shopping_Cart (Shopping_Cart_ID, Member_ID, Quantity)
VALUES
('SC001', 'M003', 1),
('SC002', 'M002', 3),
('SC003', 'M005', 3),
('SC004', 'M010', 1),
('SC005', 'M007', 1),
('SC006', 'M005', 2),
('SC007', 'M008', 1),
('SC008', 'M007', 1),
('SC009', 'M002', 1),
('SC010', 'M008', 2);

INSERT INTO Review (Review_ID, Book_ID, Member_ID, Ratings, Short_Comments)
VALUES
('R001', 'B006', 'M010', 7, 'Wonderful'),
('R002', 'B008', 'M010', 4, 'Nothing special'),
('R003', 'B003', 'M001', 4, 'Nothing special'),
('R004', 'B008', 'M006', 3, 'Special, but in a bad way'),
('R005', 'B004', 'M002', 1, 'Boring storyline'),
('R006', 'B008', 'M005', 2, 'Boring storyline'),
('R007', 'B001', 'M007', 8, 'Amazing'),
('R008', 'B001', 'M006', 7, 'Wonderful'),
('R009', 'B003', 'M006', 6, 'Overall is good'),
('R010', 'B006', 'M006', 6, 'Overall is good');

INSERT INTO Members_Orders_Detail (Mem_Order_Detail_ID, Book_ID, Member_Order_ID, Quantity)
VALUES
('MOD-001', 'B009', 'MO-008', 5),
('M0D-002', 'B007', 'MO-005', 4),
('MOD-003', 'B007', 'MO-002', 5),
('MOD-004', 'B004', 'MO-005', 3),
('MOD-005', 'B010', 'MO-010', 2),
('MOD-006', 'B006', 'MO-005', 4),
('MOD-007', 'B001', 'MO-002', 5),
('MOD-008', 'B003', 'MO-008', 1),
('MOD-009', 'B004', 'MO-004', 1),
('MOD-010', 'B007', 'MO-010', 2);

INSERT INTO Shopping_Cart_Detail (Shopping_Cart_Detail_ID, Book_ID, Shopping_Cart_ID, Quantity)
VALUES
('SCD-001', 'B008', 'SC006', 2),
('SCD-002', 'B009', 'SC006', 3),
('SCD-003', 'B002', 'SC002', 3),
('SCD-004', 'B002', 'SC003', 1),
('SCD-005', 'B007', 'SC001', 2),
('SCD-006', 'B001', 'SC003', 3),
('SCD-007', 'B008', 'SC004', 3),
('SCD-008', 'B005', 'SC010', 1),
('SCD-009', 'B006', 'SC008', 4),
('SCD-010', 'B001', 'SC002', 4);

-- View all tables
SELECT * FROM Publisher;
SELECT * FROM Publisher_Order;
SELECT * FROM Bookstore_Manager;
SELECT * FROM Publisher_Order_Details;
SELECT * FROM Book;
SELECT * FROM Members_Orders_Detail;
SELECT * FROM Member_Order;
SELECT * FROM Review;
SELECT * FROM Member;
SELECT * FROM Shopping_Cart;
SELECT * FROM Shopping_Cart_Detail;

-- Q2(b)(i) - Total number of feedback per book
SELECT Book.Book_ID, Book.Name, COUNT (Review.Ratings) AS Total_Feedback
FROM Book
INNER JOIN Review ON Book.Book_ID = Review.Book_ID
GROUP BY Book.Book_ID, Book.Name;

-- Q2(b)(ii) - Total number of feedback per member
SELECT Member.Member_ID, Member.Name, COUNT (Review.Ratings) AS Total_Feedback
FROM Member
INNER JOIN Review ON Member.Member_ID = Review.Member_ID
GROUP BY Member.Member_ID, Member.Name;

-- Q2(b)(iii) - Total number of book published by each publisher
SELECT Publisher.Publisher_ID, Publisher.Name, COUNT (Book.Book_ID) AS Total_Book
FROM Publisher
INNER JOIN Book ON Publisher.Publisher_ID = Book.Publisher_ID
GROUP BY Publisher.Publisher_ID, Publisher.Name;

-- Q2(b)(iv) - Total number of book for each genre
SELECT Genre, COUNT (Book_ID) AS Total_Book
FROM Book
GROUP BY Genre;

-- Q2(b)(v) - List the books where quantity is more than the average quantity of all books
SELECT Book.Book_ID, Book.Name, Book.Genre, Book.Author, Book.Price_MYR, Book.Published_Date, Publisher_Order_Details.Quantity 
FROM Book
JOIN Publisher_Order_Details
ON Book.Book_ID = Publisher_Order_Details.Book_ID
WHERE Publisher_Order_Details.Quantity > (SELECT AVG (Quantity) FROM Publisher_Order_Details);

-- Q2(b)(vi) - Total number of books ordered by store manager from various publishers
SELECT Publisher_Order.Publisher_ID, SUM (Publisher_Order_Details.Quantity) AS Total_Book
FROM Publisher_Order
INNER JOIN Publisher_Order_Details ON Publisher_Order.Publisher_Order_ID = Publisher_Order_Details.Publisher_Order_ID
GROUP BY Publisher_Order.Publisher_ID;

-- Q2(b)(vii) - Members who did not make any order
SELECT * FROM Member
WHERE NOT EXISTS
(SELECT Member_ID FROM Member_Order
WHERE Member_Order.Member_ID = Member.Member_ID);

-- Q2(b)(viii) - Genres of the book which has the most number of quantity in stock
SELECT Book.Genre, Book_Quantities.Total_Quantity
FROM Book
JOIN 
(SELECT Book_ID, SUM(Quantity) AS Total_Quantity
 FROM Publisher_Order_Details
 GROUP BY Book_ID) AS Book_Quantities 
ON Book.Book_ID = Book_Quantities.Book_ID
WHERE Book_Quantities.Total_Quantity = (SELECT MAX(Total_Quantity)
FROM (SELECT Book_ID, SUM(Quantity) AS Total_Quantity
      FROM Publisher_Order_Details
      GROUP BY Book_ID) AS MaxQuantities);

--Q2(b)(ix) - List of purchased books that have not been delivered to members
SELECT * FROM ((Members_Orders_Detail
INNER JOIN Member_Order ON Members_Orders_Detail.Member_Order_ID = Member_Order.Member_Order_ID)
INNER JOIN Book ON Book.Book_ID = Members_Orders_Detail.Book_ID)
WHERE Member_Order.Delivery_Status = 'Pending';

-- Q2(b)(x) - Members who made more than 2 orders
SELECT Member.Member_ID, Member.Name, COUNT(Member_Order.Member_Order_ID) AS [Num_Of_Order]
FROM Member JOIN Member_Order on Member.Member_ID = Member_Order.Member_ID 
GROUP BY Member.Member_ID, Member.Name 
HAVING COUNT(Member_Order.Member_Order_ID) > 2;
