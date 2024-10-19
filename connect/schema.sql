CREATE TABLE "users"(
    "id" NUMERIC PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    "connection_people_id" NUMERIC,
    FOREIGN KEY ("connection_people_id") REFERENCES "connections_people"("id"),

);

CREATE TABLE "schools_universities"(
    "id" NUMERIC PRIMARY KEY,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year" TEXT
);

CREATE TABLE "companies"(
    "id" NUMERIC PRIMARY KEY,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT
);

CREATE TABLE "connections_people"(
    "id" NUMERIC PRIMARY KEY,
    "first_person_id" NUMERIC,
    "second_person_id" NUMERIC,
    FOREIGN KEY("first_person_id") REFERENCES "users"("id"),
    FOREIGN KEY("second_person_id") REFERENCES "users"("id")
);

CREATE TABLE "connections_schools"(
    "id" NUMERIC PRIMARY KEY,
    "first_person_id" NUMERIC,
    "second_person_id" NUMERIC,
    FOREIGN KEY("first_person_id") REFERENCES "users"("id"),
    FOREIGN KEY("second_person_id") REFERENCES "users"("id")
);
