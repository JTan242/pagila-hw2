/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */
WITH TopProfitableFilms AS (
    SELECT film.film_id, sum(payment.amount) as profit
    FROM film
    JOIN inventory ON film.film_id = inventory.film_id
    JOIN rental ON inventory.inventory_id = rental.inventory_id
    JOIN payment ON rental.rental_id = payment.rental_id
    GROUP BY film.film_id
    ORDER BY profit DESC
    LIMIT 5
)
SELECT DISTINCT customer.customer_id
FROM customer
JOIN rental Using (customer_id)
JOIN inventory Using (inventory_id)
JOIN TopProfitableFilms USING(film_id)
ORDER BY customer.customer_id;
