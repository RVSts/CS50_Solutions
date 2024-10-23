CREATE TABLE meteorites_temp(
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

UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2)
WHERE "mass" IS NOT NULL;

UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2)
WHERE "lat" IS NOT NULL;

UPDATE "meteorites_temp" SET "long" = ROUND("long", 2)
WHERE "long" IS NOT NULL;
