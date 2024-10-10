
-- *** The Lost Letter ***
SELECT "action" FROM "scans"
WHERE "package_id" IN(
    SELECT "package_id" FROM "scans" WHERE "package_id" = "id" IN(
        SELECT "id" FROM "addresses" WHERE "to_address_id" = '2 Finnegan Street'
    )
);
-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

