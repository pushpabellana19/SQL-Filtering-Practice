-- Query 1: WHERE Operator
-- Display company names and cities of customers from Germany

SELECT company_name, city
FROM customers
WHERE country IN ('Germany')
ORDER BY company_name ASC;


-- Query 2: WHERE Operator
-- Premium products

SELECT product_name, unit_price
FROM products
WHERE unit_price > 50
ORDER BY unit_price DESC, product_name ASC;



-- Query 3: Count orders placed in 1997

SELECT COUNT(*) AS orders
FROM orders
WHERE order_date >= '1997-01-01'
  AND order_date < '1998-01-01'; 


-- Query 4: Customers with no region recorded
SELECT company_name, country
FROM customers
WHERE region IS NULL
ORDER BY company_name ASC;


-- Query 5: Sales employees
SELECT first_name, last_name, title
FROM employees
WHERE title ILIKE '%Sales%'
ORDER BY last_name, first_name;

-- Query 6: Mid-range products
SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 20 AND 30
ORDER BY unit_price ASC, product_name ASC;


-- Query 7: Contacts named Maria
SELECT contact_name, company_name
FROM customers
WHERE contact_name ILIKE 'Maria%'
ORDER BY company_name;

-- Query 8: Discontinued but in stock
SELECT product_name, units_in_stock
FROM products
WHERE discontinued = 1
  AND units_in_stock > 0
ORDER BY units_in_stock DESC, product_name ASC;

-- Query 9: Employees hired in 1994
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1994-01-01' AND '1994-12-31'
ORDER BY hire_date ASC, last_name ASC;

-- Query 10: Order 10250 line totals
SELECT
    product_id,
    unit_price,
    quantity,
    ROUND(unit_price::numeric * quantity, 2) AS line_total
FROM order_details
WHERE order_id = 10250
ORDER BY product_id;

-- Query 11: French shipping cities
SELECT DISTINCT ship_city
FROM orders
WHERE ship_country = 'France'
ORDER BY ship_city ASC;

-- Query 12: Order 10250 with product names
SELECT
    p.product_name,
    od.quantity,
    ROUND(od.unit_price::numeric * od.quantity, 2) AS line_total
FROM order_details od
JOIN products p
    ON od.product_id = p.product_id
WHERE od.order_id = 10250
ORDER BY p.product_name ASC;


