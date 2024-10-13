SELECT COUNT("id"), "city" FROM(
    SELECT COUNT("id"), "city"
    FROM "schools"
    WHERE "type" = 'Public School'
    GROUP BY "city"
    ORDER BY COUNT("id") ASC
    LIMIT 3
)
GROUP BY "city"
ORDER BY COUNT("id") DESC, "city" ASC;
