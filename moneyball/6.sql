SELECT SUM("performances"."H") as "total hits", "teams"."name" FROM "teams"
JOIN "performances" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" = '2001'
GROUP BY "teams"."name"
ORDER BY "total hits" DESC
LIMIT 5;
