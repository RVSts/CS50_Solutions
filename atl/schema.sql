CREATE TABLE "passengers"(
    "id" NUMERIC,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins"(
    "date" TEXT,
    "time" TEXT,
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines"(
    "name" TEXT,
    "concourse" TEXT
)

CREATE TABLE "flights"(
    "number" INTEGER,
    "id" NUMERIC,
    FOREIGN KEY ("airline_name") REFERENCES "airlines"("name"),
    "code" TEXT,
    
)
