CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    release_year INT,
    rating FLOAT,
    category_name VARCHAR(50),
    publisher_name VARCHAR(50),
    min_players VARCHAR(50),
    max_players VARCHAR(50)
);




CREATE OR REPLACE PROCEDURE usp_search_by_category(
	IN category VARCHAR(50)
)
AS 
$$
BEGIN
    
	TRUNCATE search_results;

    INSERT INTO search_results(
		"name",
		release_year,
		rating,
		category_name,
		publisher_name,
		min_players,
        max_players
	)

    SELECT 
    bg.name AS "name",
    bg.release_year AS release_year,
    bg.rating AS rating,
    c.name AS category_name,
    p.name AS publisher_name,
    CONCAT(pr.min_players, ' ', 'people') AS min_players,
    CONCAT(pr.max_players, ' ', 'people') AS max_players
    FROM publishers AS p 
    JOIN board_games AS bg
    ON p.id = bg.publisher_id
    JOIN categories AS c 
    ON c.id = bg.category_id
    JOIN players_ranges AS pr 
    ON pr.id = bg.players_range_id
    WHERE c.name = category
    ORDER BY publisher_name ASC, 
    release_year DESC;



END;
$$
LANGUAGE plpgsql;