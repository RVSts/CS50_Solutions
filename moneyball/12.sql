SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN(
    SELECT "performances"."players_id" FROM(
        SELECT "performances"."player_id", ("salaries"."salary" / "performances"."RBI") AS "dollars per RBI" FROM(
            SELECT ("salaries"."salary" / "performances"."RBI") AS "dollars per RBI" FROM "performances"
            JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
            WHERE "performances"."year" = '2001' AND "performances"."RBI" > 0
            ORDER BY "dollars per RBI" DESC
            LIMIT 10
        ) AS subquery
        JOIN "salaries" ON "salaries"."player_id" = "performances"."player_id" AND "salaries"."year" = "performances"."year"
        WHERE "performances"."year" = '2001' AND "performances"."RBI" > 0
        ORDER BY "dollars per RBI" ASC
    ) AS subquery
)
ORDER BY "id" ASC;
