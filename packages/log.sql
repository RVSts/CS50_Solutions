
-- *** The Lost Letter ***
SELECT "action" FROM "scans"
WHERE "package_(
    SELECT "package_id" FROM "scans" WHERE "package_id" = "id" IN(
        SELECT "id" FROM "addresses" WHERE "from_address_id" = '900 Somerville Avenue' AND "to_address_id" = '2 Finnegan Street'
    )
);
-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

