SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN(
    SELECT "players_id" FROM(
        SELECT "performances"."player_id" AS "players_id", ("salaries"."salary" / "performances"."H") AS "dollars per hit" FROM "performances"
        JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
        WHERE "performances"."year" = '2001' AND "performances"."H" > 0
        ORDER BY "dollars per hit" ASC
        LIMIT 10
    ) AS subquery
    INTERSECT
    SELECT "players_id" FROM(
        SELECT "performances"."player_id" AS "players_id", ("salaries"."salary" / "performances"."RBI") AS "dollars per rbi" FROM "performances"
        JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
        WHERE "performances"."year" = '2001' AND "performances"."RBI" > 0
        ORDER BY "dollars per rbi" ASC
        LIMIT 10
    ) AS subquery
)
ORDER BY "id" ASC;
