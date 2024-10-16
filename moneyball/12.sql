SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN(
    SELECT "players_id" FROM(
        SELECT ("salaries"."salary" / "performances"."RBI") AS "dollars per RBI" FROM "performances"
        JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
        WHERE "performances"."year" = '2001' AND "performances"."RBI" > 0
        ORDER BY "dollars per RBI" ASC
        LIMIT 10
    )
)
GROUP BY "id"
ORDER BY "id" ASC;
