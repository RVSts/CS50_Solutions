
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
SELECT "id", "address", "type" FROM "addresses"
WHERE "id" IN(
    SELECT "to_address_id" FROM "packages"
    WHERE "from_address_id" IS NULL
);

SELECT "contents" FROM "packages"
WHERE "from_address_id" IS NULL;

SELECT "

-- *** The Forgotten Gift ***

