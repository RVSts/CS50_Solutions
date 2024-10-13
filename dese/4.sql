SELECT "city", COUNT("id") AS school_count FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY school_count DESC, "name" ASC
LIMIT 10;
