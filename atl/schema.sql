CREATE TABLE "passengers"(
    "id" NUMERIC PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER
);

CREATE TABLE "check_ins"(
    "date" TEXT,
    "time" TEXT,
    "passenger_id" NUMERIC,
    "flight_id" NUMERIC,
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines"(
    "name" TEXT PRIMARY KEY,
    "concourse" TEXT
);

CREATE TABLE "flights"(
    "number" INTEGER,
    "id" NUMERIC,
    "airline_name" TEXT,
    "from_code_airport" TEXT,
    "to_code_airport" TEXT,
    "departure_date" TEXT,
    "departure_time" TEXT,
    "arrival_date" TEXT,
    "arrival_time" TEXT,
    PRIMARY KEY("number", "id"),
    FOREIGN KEY ("airline_name") REFERENCES "airlines"("name")
);
