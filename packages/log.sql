
-- *** The Lost Letter ***
SELECT "action" FROM "scans"
WHERE(
    SELECT "package_id" FROM "scans"
    WHERE "package_id" IN(
        SELECT "id" FROM "packages"
        WHERE "to_address_id" IN(
            SELECT "id" FROM "addresses"
            WHERE "address" LIKE '%2 Fin%'
        )
        AND "from_address_id" IN(
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
    )
);
-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

