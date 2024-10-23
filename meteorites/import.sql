CREATE TABLE meteorites(
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

.mode csv
.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp" SET "mass" = NULL
WHERE "mass" = 0;

UPDATE "meteorites_temp" SET "lat" = NULL
WHERE "lat" = 0;

UPDATE "meteorites_temp" SET "long" = NULL
WHERE "long" = 0;

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT
    "name",
    "class",
    ROUND("mass", 2) AS "mass",
    "discovery",
    "year",
    ROUND("lat", 2) AS "lat",
    ROUND("long", 2) AS "long"
FROM
    "meteorites_temp"
WHERE
    "nametype" != 'Relict' AND
    ("mass" IS NOT NULL OR "lat" IS NOT NULL OR "long" IS NOT NULL) -- Elimina registros sem dados importantes
ORDER BY
    year ASC,
    name ASC;

-- Atualizar a nova tabela com IDs únicos
WITH OrderedMeteorites AS (
    SELECT ROW_NUMBER() OVER (ORDER BY "year", "name") AS "id",
           "name", "nametype", "class", "mass", "discovery", "year", "lat", "long"
    FROM "meteorites_temp"
)
INSERT INTO meteorites ("name", "id", "nametype", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "id", "nametype", "class", "mass", "discovery", "year", "lat", "long"
FROM OrderedMeteorites;

-- Renomear a tabela
DROP TABLE meteorites_temp;
