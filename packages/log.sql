
-- *** The Lost Letter ***
SELECT "action" FROM "scans" WHERE(
    SELECT "ID" FROM "scans" WHERE(
        SELECT "package_id" FROM "scans" WHERE(
            SELECT "id" FROM "adresses" WHERE "from_address_id" = '900 Somerville Avenue' AND "to_address_id" = '2 Finnegan Street'
        )
    )
);



-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

