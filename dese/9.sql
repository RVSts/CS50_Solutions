SELECT "name" FROM "districts"
WHERE "id" IN(
    SELECT "district_id" FROM "expenditures"
    GROUP BY "pupils"
    INTERSECT "district_id" WHERE "pupils" = "pupils"
    ORDER BY "pupils" DESC
    LIMIT 1
);
