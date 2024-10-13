SELECT "name" FROM "districts"
WHERE "id" IN(
    SELECT "district_id" FROM "expenditures"
    GROUP BY "pupils"
    ORDER BY "pupils" DESC
    LIMIT 10
);
