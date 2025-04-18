-- Question 1: Achieving 1NF 🛠️
-- Transform ProductDetail to 1NF by separating multiple products into individual rows

-- First, create a normalized ProductDetail_1NF table:
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Then, insert data in 1NF format (one product per row):
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Now each row represents a single product per order (1NF achieved).



-- Question 2: Achieving 2NF 🧩
-- Step 1: Separate Customer info from the OrderDetails table

-- Create the Customers table
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert unique OrderID-CustomerName pairs
INSERT INTO Customers (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create a new OrderDetails_2NF table without CustomerName
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Insert product and quantity data
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Now the table is in 2NF: all non-key attributes fully depend on the full primary key, and no partial dependency exists.
