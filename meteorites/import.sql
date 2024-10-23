CREATE TABLE "meteorites_temp"(
    "name" TEXT,
    "id" INTEGER PRIMARY KEY,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);


.import --csv --skip 1 meteorites.csv meteorites_temp


UPDATE "meteorites_temp" SET "mass" = NULL
WHERE "mass" = 0;

UPDATE "meteorites_temp" SET "lat" = NULL
WHERE "lat" = 0;

UPDATE "meteorites_temp" SET "long" = NULL
WHERE "long" = 0;

UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2), "long" = ROUND("long", 2), "long" = ROUND("long", 2);

CREATE TABLE "meteorites"(
    "name" TEXT,
    "id" INTEGER PRIMARY KEY,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

INSERTO INTO "meteorites"("name", "class", "mass", "discovery, "year", "lat", "long")

