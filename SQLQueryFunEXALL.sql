--Create SQL statements to complete the following:

--1.  Return all category names with their descriptions from the Categories table.
SELECT CategoryName, Description FROM Categories;

--2.  Return the contact name, customer id, and company name of all Customers in London
SELECT ContactName, CustomerID, CompanyName FROM Customers WHERE City ='London';
--3.  Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number 
SELECT * FROM Suppliers WHERE Fax is not null;
--4.  Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.
SELECT CustomerID FROM Orders WHERE RequiredDate BETWEEN '1997-01-01 00:00:00.000' AND '1998-01-01 00:00:00.000' AND Freight <100.00;
--5.  Return a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.
SELECT CompanyName, ContactName FROM Customers WHERE Country IN ('Mexico','Sweden','Germany');
--6.  Return a count of the number of discontinued products in the Products table.
SELECT COUNT(*) as Discontinued FROM Products WHERE Discontinued > 0;
--7.  Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
SELECT CategoryName, Description FROM Categories WHERE CategoryName LIKE '%Co%’;

--8.	Return all the company names, city, country and postal code from the Suppliers table with the word rue in their address. The list should ordered alphabetically by company name.

SELECT CompanyName, City, Country, PostalCode FROM Suppliers WHERE [Address] LIKE [%rue%'ORDER BY CompanyName;

--9.	Return the product id and the total quantities ordered for each product id in the Order Details table.
SELECT ProductID, Quantity  FROM [Order Details];

--10.	Return the customer name and customer address of all customers with orders that shipped using Speedy Express.

SELECT c.CompanyName, c.Address FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID WHERE ShipVia = 1

--11.	Return a list of Suppliers that have regions. The list should contain company name, contact name, contact title and region.

SELECT CompanyName, ContactName, ContactTitle, Region FROM Suppliers;

--12.	Return all product names from the Products table that are condiments.
SELECT ProductName From [Products by Category] Where CategoryName = 'Condiments';

--13.	Return a list of customer names who have no orders in the Orders table.
SELECT c.CompanyName, c.CustomerID FROM Customers c WHERE c.CustomerID NOT IN (SELECT o.CustomerID FROM Orders o)

--14.	Add a shipper named 'Amazon' to the Shippers table using SQL.
INSERT INTO Shippers (CompanyName) VALUES ('Amazon')

--15.	Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
UPDATE Shippers SET CompanyName = 'Amazon Prime Shipping' WHERE CompanyName = 'Amazon'

--16.	Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
SELECT CompanyName, AVG(Freight) as 'Average Freight Weight' FROM Shippers LEFT JOIN Orders ON Orders.ShipVia=Shippers.ShipperID group by CompanyName

--17.	Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
SELECT LastName + ', ' + FirstName AS 'DisplayName' FROM Employees

--18.	 Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
INSERT INTO Customers (CustomerID, CompanyName, ContactName) 
VALUES ('91932', 'Rita CO', 'Rita McKerring');
INSERT INTO [Orders] ([CustomerID])
VALUES ('91932');

--19.	Remove yourself and your order from the database.
DELETE FROM Customers WHERE CustomerID = '91932' 
DELETE FROM [Order Details] WHERE OrderID = '11078'
DELETE FROM Orders WHERE OrderID = '11078'

--20.	Return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
SELECT ProductName, UnitsInStock FROM Products WHERE UnitsInStock > 100
