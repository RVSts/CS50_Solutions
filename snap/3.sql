EXPLAIN QUERY PLAN
SELECT "to_user_id" FROM "messages"
WHERE "from_user_id" =(
    SELECT "id" FROM "users"
    WHERE "username" = 'creativewisdom377'
)
