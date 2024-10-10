
-- *** The Lost Letter ***
SELECT "action" FROM "scans"
WHERE(
    SELECT "package_id" FROM "scans"
    WHERE(
        SELECT "id" FROM "packages"
        WHERE(
            SELECT "to_adress_id" FROM "packages"
            WHERE(
                SELECT "id" FROM "addresses"
                WHERE "address" = '2 Finnegan Street'
            )
        )
    )
);
-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

