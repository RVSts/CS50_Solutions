SELECT COUNT("id"), "city" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY COUNT("id") DESC WHERE(
    ORDER BY COUNT("id") ASC
), "city" ASC
LIMIT 3;
