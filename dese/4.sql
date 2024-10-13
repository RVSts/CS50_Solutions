SELECT COUNT("id"), "city" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY COUNT("id") DESC, "name" ASC
LIMIT 10;
