EXPLAIN QUERY PLAN
SELECT "username", "joined_date" FROM "users"
WHERE "joined_date" LIKE '2024-01-%'
LIMIT 10;
