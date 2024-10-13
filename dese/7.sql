SELECT "name" FROM "schools"
WHERE "district_id" IN (
    SELECT "id" FROM "discricts"
    WHERE "name" = 'Cambridge'
);
