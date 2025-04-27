-- Create Database
CREATE DATABASE OnlineBookstore

-- Use Database
USE OnlineBookstore

-- Create Table: Book
CREATE TABLE Book (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT 
);

-- Create Table: Customers
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- Create Table: Orders
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

SELECT * FROM Book;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Basic Questions : 


-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM Book WHERE Genre ='Fiction';


 -- 2) Find books published after the year 1950:
SELECT * FROM Book WHERE Published_Year>1950;

 -- 3) List all customers from the Canada:
SELECT * FROM Customers Where Country = 'Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30'; 

-- 5) Retrieve the total stock of books available:
SELECT SUM(Stock) as Total_stock from Book;

-- 6) Find the details of the most expensive book:
SELECT  TOP 1 * FROM Book ORDER BY Price DESC;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders WHERE Quantity >1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders WHERE Total_Amount>20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT Genre FROM Book;

-- 10) Find the book with the lowest stock:
SELECT TOP 1 * FROM Book ORDER BY Stock ASC;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders