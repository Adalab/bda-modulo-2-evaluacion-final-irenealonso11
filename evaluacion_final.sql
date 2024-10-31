-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT title
	FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT title 
	FROM film
	WHERE rating = "PG-13";

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT title, description
	FROM film
	WHERE description LIKE "%amazing%";

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT title, length
	FROM film
	WHERE length > 120;

-- 5. Recupera los nombres de todos los actores.

SELECT first_name, last_name
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name, last_name
	FROM actor
	WHERE last_name = "Gibson";
-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT actor_id, first_name, last_name
	FROM actor
	WHERE actor_id BETWEEN 10 AND 20;

-- 8.Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT title
	FROM film
	WHERE description NOT IN ("R", "PG-13");

/* 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con
		el recuento.*/

SELECT rating, count(title) AS cantidad_peliculas
	FROM film
	GROUP BY rating;

/* 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y
		apellido junto con la cantidad de películas alquiladas.*/

SELECT c.customer_id, c.first_name, c.last_name, count(r.rental_id) AS peliculas_alquiladas
	FROM customer AS c 
	INNER JOIN rental AS r
	ON c.customer_id = r.customer_id
	GROUP BY c.customer_id, c.first_name, c.last_name;


/*11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el
		recuento de alquileres.*/
        
SELECT name, COUNT(rental_id) AS cantidad_alquileres
	FROM rental AS r
	INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
    INNER JOIN film AS f ON i.film_id = f.film_id
    INNER JOIN film_category AS fc ON i.film_id= fc.film_id
    INNER JOIN category AS c ON fc.category_id = c.category_id
    GROUP BY c.name;

/*12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la
	clasificación junto con el promedio de duración.*/
    
SELECT rating, AVG(length) AS promedio_duracion
	FROM film
	GROUP BY rating;
    
-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
    
SELECT first_name, last_name
	FROM actor AS a 
	INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
	INNER JOIN film AS f ON fa.film_id = f.film_id
	WHERE title = "Indian Love";

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
    
SELECT title, description
	FROM film
	WHERE description LIKE '%dog%' OR description LIKE '%cat%';

-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.

SELECT a.actor_id, a.first_name, a.last_name
	FROM actor  AS a
	LEFT JOIN film_actor AS fa ON a.actor_id = fa.actor_id
	WHERE fa.actor_id IS NULL;


