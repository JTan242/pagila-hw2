/*
 * Compute the total revenue for each film.
 */
SELECT film.title, COALESCE(SUM(p.amount), 0.00) as revenue
FROM film
LEFT JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
LEft JOIN payment p USING (rental_id)
GROUP BY film.title
ORDER BY revenue DESC;
