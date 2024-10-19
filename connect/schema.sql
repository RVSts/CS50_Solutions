CREATE TABLE "users"(
    "id" NUMERIC PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT
    "connection_people_id"
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
    "id" NUMERIC PRIMARY KEY
)
