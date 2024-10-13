SELECT "city" FROM "schools"
WHERE "type" = 'Public School'
ORDER BY COUNT("id") DESC, "name" ASC
LIMIT 10;
