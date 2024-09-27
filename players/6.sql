SELECT "first_name", "last_name", "debut"
FROM "players"
WHERE "birth_city" = 'Pittsburgh' AND "birth_state" = 'Pennsylvania (PA)'
ORDER BY "debut" DESC, 'first_name' ASC, 'last_name' ASC;
