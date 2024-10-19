CREATE TABLE "ingredients"(
    "id" NUMERIC PRIMARY KEY
    "typical" TEXT,
    "sugar" TEXT,
    "typical_price" NUMERIC,
    "sugar_price" NUMERIC
);

CREATE TABLE "donuts"(
    "name" TEXT PRIMARY KEY,
    "type" TEXT,
    "price" NUMERIC,
    "ingredient_id"
    FOREING KEY ("ingredient_id") REFERENCES "ingredients"("id"),
);

CREATE TABLE "orders"(
    "order_number" NUMERIC,
    "donut_name" TEXT,
    "customer_id" NUMERIC,
    FOREING KEY ("donut_name") REFERENCES "donuts"("name"),
    FOREING KEY ("customer_id") REFERENCES "customers"("id"),
);

CREATE TABLE "customers"(
    "id" NUMERIC PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "history" TEXT
);
