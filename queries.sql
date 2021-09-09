-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT 
    pr.productName,
    ca.categoryName 
FROM product AS pr
LEFT JOIN category AS ca
ON pr.categoryID = ca.id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT 
    ord.id,
    sh.companyName 
FROM 'order' AS ord
LEFT JOIN shipper AS sh
    on ord.ShipVia =  sh.id
WHERE ord.orderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT 
    od.Quantity,
    pr.ProductName
FROM 'order' AS ord
LEFT JOIN orderdetail AS od
ON ord.id = od.OrderID
LEFT JOIN product AS pr
ON od.productId = pr.id
WHERE od.orderID = 10251
GROUP BY pr.productName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT 
    ord.id,
    c.companyName,
    e.LastName
FROM 'order' AS ord
INNER JOIN customer AS c
ON ord.CusotmerId = c.id
INNER JOIN employee AS e
ON ord.employeeId = e.id
