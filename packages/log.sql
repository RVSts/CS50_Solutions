
-- *** The Lost Letter ***

-- The first step is to identify what is being requested: check the request action

-- How can we know the request action: knowing the address "2 Finnegan Street"

-- How can we get to the request action through the address: getting the address ID

-- What can we get with the address ID: the ID of where the package is being sent, where, using the departure ID, we can get the package ID

-- With this we get the ID of the scanned package, which gives us the scan ID and its respective action.
SELECT "action" FROM "scans"
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
);
-- *** The Devious Delivery ***

SELECT * FROM "packages"
WHERE "from_address_id" IS NULL;

SELECT * FROM "scans"
WHERE "package_id" IN(
    SELECT "id" FROM "packages"
    WHERE "from_address_id" IS NULL
);

SELECT * FROM "addresses"
WHERE "id" IN(
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop' AND "package_id" IN(
        SELECT "id" FROM 'packages'
        WHERE "from_address_id" IS NULL
    )
);


-- *** The Forgotten Gift ***

SELECT "id" FROM "addresses"
WHERE "address" = '728 Maple Place';

SELECT * FROM "packages"
WHERE "to_address_id" IN(
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);


SELECT * FROM "scans"
WHERE "package_id" IN(
    SELECT "id" FROM "packages"
    WHERE "to_address_id" IN(
        SELECT "id" FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
);

SELECT * FROM "drivers"
WHERE "id" IN(
    SELECT "driver_id" FROM "scans"
    WHERE "action" = 'Pick' AND "package_id" IN(
        SELECT "id" FROM "packages"
        WHERE "to_address_id" IN(
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
    )
);

SELECT * FROM "packages"
WHERE "from_address_id" IN(
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
);
