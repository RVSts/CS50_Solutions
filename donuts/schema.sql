CREATE TABLE "donuts"(
    "name" TEXT,
    "type" TEXT,
    "price" NUMERIC
);

CREATE TABLE "orders"(
    "numer" NUMERIC,
    "donuts_name" TEXT,
    "customer_id" NUMERIC
)

CREATE TABLE "customers"(
    "id" NUMERIC PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    
)
