CREATE OR REPLACE FUNCTION fn_creator_with_board_games (
	"name" VARCHAR(30)
)RETURNS INT
AS
$$
-- DECLARE 
-- 	full_name VARCHAR(101);
BEGIN
	RETURN 
    (SELECT 
    count(cbg.board_game_id) 
    FROM creators AS c
    JOIN  creators_board_games AS cbg
    ON c.id = cbg.creator_id
    WHERE c.first_name = "name");
END;
$$
LANGUAGE plpgsql;