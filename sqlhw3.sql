--1.List all customers who live in Texas (use
--JOINs); 
            
--Answer= [Richard Mccrary, Kim Cruz, Jennifer Davis, Ian Still, Bryan Hardison];

SELECT *
FROM address
FULL OUTER JOIN customer
ON address.address_id = customer.address_id
ORDER BY district;

--2.Get all payments above $6.99 with the Customer's Full NAME;
           
        -- Answer= Janice Ward, Ron Deluca, Ron Deluca ;

SELECT *
FROM payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id
ORDER BY amount <= '6.99' DESC;


--3. Show all customers names who have made payments over $175(use
--subqueries) 

SELECT first_name, last_name
FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY first_name, last_name, amount
HAVING SUM(amount) > 175;



--4. List all customers that live in Nepal (use the city
--table)
                --answer=Kevin Schuler

SELECT *
FROM city
FULL OUTER JOIN address
ON city.city_id = address.city_id
FULL OUTER JOIN customer
ON address.address_id = customer.address_id
ORDER BY country_id DESC;

SELECT *
FROM country;


--5. Which staff member had the most
--transactions?   
--ANSWER= Jon Stephens

SELECT staff_id, Count(*)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(staff_id);


SELECT first_name, last_name, staff_id
FROM staff;



--6. How many movies of each rating are
--there? 
--Answer ={G:179}, {PG:194}, {R:195}, {NC-17:209}, {PG-13:223}

SELECT rating, Count(*)
FROM film
GROUP BY rating
ORDER BY COUNT(rating);

--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 6.99
ORDER BY SUM(amount);

--8.How many free rentals did our store give away?
            --Answer=12


SELECT store_id, amount
FROM staff
FULL OUTER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY store_id, amount
ORDER BY SUM(amount) < 0.00 DESC;

