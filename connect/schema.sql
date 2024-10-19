CREATE TABLE "users"(
    "id" NUMERIC PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    "connection_people_id" NUMERIC
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
    "school_id" NUMERIC,
    "person_id" NUMERIC,
    "start_date" TEXT,
    "end_date" TEXT,
    "type" TEXT,
    FOREIGN KEY("school_id") REFERENCES "schools_universities"("id"),
    FOREIGN KEY("person_id") REFERENCES "users"("id")
);

CREATE TABLE "connections_companies"(
    "id" NUMERIC PRIMARY KEY,
    "companie_id" NUMERIC,
    "person_id" NUMERIC,
    "start_date" TEXT,
    "end_date" TEXT,
    "title" TEXT,
    FOREIGN KEY("companie_id") REFERENCES "companies"("id"),
    FOREIGN KEY("person_id") REFERENCES "users"("id")
);

