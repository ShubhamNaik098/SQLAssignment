-- Q1. Create a table called employees with the following structure?
-- : emp_id (integer, should not be NULL and should be a primary key)Q
-- : emp_name (text, should not be NULL)Q
-- : age (integer, should have a check constraint to ensure the age is at least 18)Q
-- : email (text, should be unique for each employee)Q
-- : salary (decimal, with a default value of 30,000).

-- Write the SQL query to create the above table with all constraints.

create database assignment;
use assignment;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(200) UNIQUE,
    salary INT DEFAULT 30000
) SELECT * FROM
    employees;

-- 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
-- examples of common types of constraints.

-- Ans Constraints are rules forced on table columns to maintain data integrity.
-- how they maintain the integrity: 1.Enforce rules at the database level(not just application level)
--                                  2.Prevent entry of incorrect, duplicate, or null data where it shouldn't exist.
--                                  3.Help maintain relationships between tables (like foreign keys).
-- Common Types of Constraints: 1. Primary key
--                              2. Foreign key
--                              3. Not Null.
--                              4. Check.
--                              5. Unique.

-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
-- your answer.

-- Ans. To ensures a column cannot have a NULL value we apply the not null constraints to a column.
--      No, a primary key cannot contain NULL values.
--      Justification: 1.Primary key contains values which is unique in each row and null represents an unknown
--                       or missing values and you can't identify something uniquely with an unknown.
--                     2.Also, uniqueness or non-nullability are both enforced by default when a column is 
--                       declared as a primary key

-- 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
-- example for both adding and removing a constraint.

-- Ans. You can modify constraints on an existing table using the ALTER TABLE statement. 
-- Here's how to do both:
-- ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint_type (column_name);
-- ALTER TABLE table_name DROP CONSTRAINT constraint_name;

-- 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
-- Provide an example of an error message that might occur when violating a constraint.

-- Ans. 1. NOT NULL Constraint Violation: Code: INSERT INTO Students (student_id, name) VALUES (1, NULL);
--                                        Error:1048 (23000): Column 'name' cannot be null
--      2. UNIQUE Constraint Violation: Code:INSERT INTO Users (user_id, email) VALUES (2, 'test@example.com');
-- 											 If 'test@example.com' already exists
--                                      Error:ERROR: duplicate key value violates unique constraint "users_email_key"
--                                                   DETAIL: Key (email)=(test@example.com) already exists.
--      3. PRIMARY KEY Constraint Violation: Code:INSERT INTO Orders (order_id, amount) VALUES (101, 500);
--                                                 If 101 already exists
--                                           Error: Violation of PRIMARY KEY constraint 'PK_Orders'. 
--                                                  Cannot insert duplicate key in object 'dbo.Orders'.

-- 
-- Ans6. 1. Add PRIMARY KEY constraint to product_id
--         ALTER TABLE products
--         ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

--      2. Set default value for price column
--         ALTER TABLE products
--         ALTER COLUMN price SET DEFAULT 50.00;

-- Ans7.
-- Ans8.
-- Ans9.
-- Ans10.


--                             SQL Commands

-- Ans2. select * from actor;
-- Ans3. SELECT * FROM customer;
-- Ans4. SELECT country FROM country;
-- Ans5. Display all active customers.
-- Ans6. SELECT * 
--		 FROM customer
--       WHERE active = 1;
-- Ans7. SELECT rental_id
--       FROM rental
--       WHERE customer_id = 1;
-- Ans8. SELECT * 
--       FROM film
--       WHERE rental_duration > 5;
-- Ans9. SELECT COUNT(*) AS total_films
--       FROM film
--       WHERE replacement_cost > 15 AND replacement_cost < 20;
-- Ans10.SELECT COUNT(DISTINCT first_name) AS unique_first_names 
-- 		 FROM actor;
-- Ans11.SELECT * FROM customer LIMIT 10;
-- Ans12.SELECT *
--       FROM customer
--       WHERE first_name LIKE 'B%'
--       LIMIT 3;
-- Ans13.SELECT title
--       FROM film
--       WHERE rating = 'G'
--       LIMIT 5;
-- Ans14.SELECT *
--       FROM customer
--       WHERE first_name LIKE '%a'
-- Ans15.SELECT city
--       FROM city
--       WHERE city LIKE 'A%a'
--       LIMIT 4;
-- Ans16.Select * from customer
--       where LOWER(first_name) regexp 'NI\';
-- Ans17.SELECT *
--       FROM customer
--       WHERE first_name LIKE '_r%';
-- Ans18.select * from customer
--       where LOWER(first_name) regexp '^[a]' and length(first_name)>=5;
-- Ans19.select * from customer
--       where first_name regexp '^a.*o$'
-- Ans20.SELECT * FROM film
--       WHERE rating IN ('PG', 'PG-13');
-- Ans21.SELECT * FROM film
--       WHERE length BETWEEN 50 AND 100;
-- Ans22.SELECT * FROM actor LIMIT 50;
-- Ans23.SELECT DISTINCT film_id FROM inventory;



--                                 Functions
--                          Basic Aggregated functions

-- Ans1. select count(*) as total_rentals
--       from rental;
-- Ans2. SELECT AVG(DATEDIFF(return_date, rental_date)) AS avg_rental_duration
--       FROM rental
--       WHERE return_date IS NOT NULL;
-- Ans3. SELECT 
--       UPPER(first_name) AS first_name_upper,
--       UPPER(last_name) AS last_name_upper
--       FROM customer;
-- Ans4. SELECT rental_id, MONTH(rental_date) AS rental_month
--       FROM rental;
-- Ans5. SELECT 
--       customer_id,COUNT(*) AS rental_count
--       FROM rental
--       GROUP BY customer_id;
-- Ans6. SELECT 
--       s.store_id,
--       SUM(p.amount) AS total_revenue
--       FROM payment p
--       JOIN staff s ON p.staff_id = s.staff_id
--       GROUP BY s.store_id;
-- Ans7. SELECT 
--       c.name AS category,
-- 		 COUNT(r.rental_id) AS total_rentals
-- 		 FROM rental r
-- 		 JOIN inventory i ON r.inventory_id = i.inventory_id
-- 		 JOIN film f ON i.film_id = f.film_id
-- 		 JOIN film_category fc ON f.film_id = fc.film_id
-- 		 JOIN category c ON fc.category_id = c.category_id
-- 		 GROUP BY c.name
-- 		 ORDER BY total_rentals DESC;

-- Ans8.SELECT 
--      l.name AS language,
--		ROUND(AVG(f.rental_rate), 2) AS avg_rental_rate
--      FROM film f
-- 		JOIN language l ON f.language_id = l.language_id
-- 		GROUP BY l.name
-- 		ORDER BY avg_rental_rate DESC;

-- Ans9.SELECT 
--		f.title AS movie_title,
-- 		c.first_name,
-- 		c.last_name
-- 		FROM rental r
--		JOIN inventory i ON r.inventory_id = i.inventory_id
--		JOIN film f ON i.film_id = f.film_id
--		JOIN customer c ON r.customer_id = c.customer_id
-- 		ORDER BY f.title, c.last_name;

-- Ans10.SELECT 
--		 a.first_name,
-- 		 a.last_name
--       FROM film f
--		 JOIN film_actor fa ON f.film_id = fa.film_id
--  	 JOIN actor a ON fa.actor_id = a.actor_id
-- 		 WHERE f.title = 'Gone with the Wind';

-- Ans11.SELECT 
-- 		 c.first_name,
-- 		 c.last_name,
-- 		 ROUND(SUM(p.amount), 2) AS total_amount_spent
--  	 FROM customer c
-- 		 JOIN payment p ON c.customer_id = p.customer_id
-- 		 GROUP BY c.customer_id, c.first_name, c.last_name
--  	 ORDER BY total_amount_spent DESC;

-- Ans12.SELECT 
-- 		 c.first_name,
--		 c.last_name,
--       f.title AS movie_title
--  	 FROM customer c
--		 JOIN address a ON c.address_id = a.address_id
--		 JOIN city ci ON a.city_id = ci.city_id
--		 JOIN rental r ON c.customer_id = r.customer_id
--		 JOIN inventory i ON r.inventory_id = i.inventory_id
--		 JOIN film f ON i.film_id = f.film_id
--		 WHERE ci.city = 'London'
--	  	 ORDER BY c.last_name, f.title;

-- Ans13.
-- Ans14.



--											Windows Function

											-- Ans1 

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.amount) AS total_spent
FROM 
    payment p
JOIN 
    customer c ON p.customer_id = c.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    total_spent DESC;
    
											-- Ans2

SELECT
    f.film_id,
    f.title,
    p.payment_date::date AS payment_date,
    SUM(p.amount) AS daily_revenue,
    SUM(SUM(p.amount)) OVER (PARTITION BY f.film_id ORDER BY p.payment_date::date) AS cumulative_revenue
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
GROUP BY 
    f.film_id, f.title, p.payment_date::date
ORDER BY 
    f.film_id, payment_date;

												-- Ans3
                                                    
SELECT
    f.film_id,
    f.title,
    f.length,
    FLOOR(f.length / 10) * 10 AS length_group,
    AVG(TIMESTAMPDIFF(HOUR, r.rental_date, r.return_date)) AS avg_rental_duration_hours
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY f.film_id, f.title, f.length, length_group
ORDER BY length_group, avg_rental_duration_hours DESC;


												-- Ans4
                                                
WITH film_rental_counts AS (
    SELECT
        c.name AS category,
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        RANK() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS rank_in_category
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.name, f.film_id, f.title
)
SELECT
    category,
    film_id,
    title,
    rental_count
FROM film_rental_counts
WHERE rank_in_category <= 3
ORDER BY category, rental_count DESC;

												-- Ans5
										
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals,
    ROUND(AVG(COUNT(r.rental_id)) OVER (), 2) AS avg_rentals_across_customers,
    COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS rental_diff
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_diff DESC;

												-- Ans6
                                                
												-- Ans7

WITH category_rentals AS (
    SELECT
        c.name AS category,
        COUNT(r.rental_id) AS rental_count
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.name
)
SELECT
    category,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM category_rentals
ORDER BY rental_count DESC;


												-- Ans9

WITH film_rentals AS (
    SELECT
        f.film_id,
        f.title,
        c.name AS category,
        COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, c.name
),
category_avg AS (
    SELECT
        category,
        AVG(rental_count) AS avg_rentals
    FROM film_rentals
    GROUP BY category
)
SELECT
    fr.film_id,
    fr.title,
    fr.category,
    fr.rental_count,
    ca.avg_rentals
FROM film_rentals fr
JOIN category_avg ca ON fr.category = ca.category
WHERE fr.rental_count < ca.avg_rentals
ORDER BY fr.category, fr.rental_count ASC;


													-- Ans10
                                                    






