SELECT "name" FROM "teams"
WHERE "id" IN(
    SELECT "team_id" FROM "salaries"
    WHERE "player_id" =(
        SELECT "id" FROM "players"
        WHERE "first_name" = 'Satchel' AND "last_name" = 'Paige'
    )
);

SELECT "team_id" FROM "salaries"
WHERE "id" IN(
    SELECT "id" FROM "salaries"
    WHERE "player_id"=(
        SELECT "id" FROM "players"
        WHERE "first_name" = 'Satchel' AND "last_name" = 'Paige'
    )
);

SELECT "id" FROM "players"
WHERE "first_name" = 'Satchel' AND "last_name" = 'Paige';

SELECT "id" FROM "salaries"
WHERE "player_id"=(
    SELECT "id" FROM "players"
    WHERE "first_name" = 'Satchel' AND "last_name" = 'Paige'
);
