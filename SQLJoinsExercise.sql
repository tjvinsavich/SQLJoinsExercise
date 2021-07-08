-- joins: select all the computers from the products table: 
-- using the products table and the categories table, return the product name and the category name
 SELECT p.Name AS PRODUCT_NAME, c.Name AS CATEGORY_NAME FROM products AS p
 LEFT JOIN categories AS c ON p.CategoryID = c.CategoryID
 WHERE c.Name = "Computers";
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 SELECT p.Name, p.Price, r.Rating FROM products AS p
 LEFT JOIN reviews AS r ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT CASE 
WHEN e.MiddleInitial IS NOT NULL THEN CONCAT(e.FirstName, " ", e.MiddleInitial, ". ", e.LastName) 
ELSE CONCAT(e.FirstName, " ", e.LastName)
END
AS FullName, e.EmployeeID, SUM(s.Quantity) AS TotalQuantity FROM employees AS e 
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
GROUP BY FullName
ORDER BY TotalQuantity DESC
LIMIT 1;

-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT d.Name AS DEPARTMENT_NAME, c.Name AS CATEGORY_NAME FROM departments AS d
LEFT JOIN categories AS c ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
SELECT p.Name, SUM(s.Quantity) AS TotalNumberSold, (s.PricePerUnit * SUM(s.Quantity)) AS TotalPriceSold FROM products AS p
LEFT JOIN sales AS s ON p.ProductID = s.ProductID
WHERE p.Name = "Eagles: Hotel California";
-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)

SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM products AS p
LEFT JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE p.Name = "Visio TV"
LIMIT 1;



-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS PRODUCT_NAME, s.Quantity AS TOTAL_SOLD FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p on s.ProductID = p.ProductID
ORDER BY e.EmployeeID;