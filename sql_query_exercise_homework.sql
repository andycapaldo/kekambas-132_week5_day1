-- Question 1 - How many actors are there with the last name ‘Wahlberg’?

SELECT *
FROM actor a
WHERE last_name = 'Wahlberg';

-- Answer: 2


-- Question 2 - How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Answer: 5,607


-- Question 3 - What films have exactly 7 copies? (search in inventory)

SELECT film_id, COUNT(inventory_id)
FROM inventory
GROUP BY film_id
HAVING COUNT(inventory_id) = 7;

-- Answer: 116 films have exactly 7 copies (see table)



-- Question 4 - How many customers have the first name ‘Willie’?
SELECT first_name, COUNT(*)
FROM customer
WHERE first_name = 'Willie'
GROUP BY first_name; 

-- Answer: 2


-- Question 5 - What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, COUNT(rental_id) 
FROM rental
GROUP BY staff_id;

-- Answer: staff_id 1


-- Question 6 - How many unique district names are there?
SELECT COUNT(DISTINCT district)
FROM address;

-- Answer: 378


-- Question 7 - What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id) AS actors
FROM film_actor 
GROUP BY film_id
ORDER BY actors DESC;

-- Answer: film_id 508


-- Question 8 - From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name)  
FROM customer
WHERE last_name LIKE '%es';

-- Answer: 21


-- Question 9 - How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING COUNT(amount) > 250;

-- Answer: 3 (2.99, 4.99, 0.99)


-- Question 10 - Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(DISTINCT rating) AS rating_categories, COUNT(title)
FROM film
GROUP BY rating;

-- Answer: PG-13 with 223 movies
