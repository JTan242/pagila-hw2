/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT film.title
FROM film,
LATERAL unnest(film.special_features) AS feature
WHERE film.rating = 'G'
AND feature = 'Trailers'
ORDER BY film.title ASC;
