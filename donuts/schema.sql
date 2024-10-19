CREATE TABLE "ingredients"(
    "id" NUMERIC PRIMARY KEY,
    "typical" TEXT,
    "sugar" TEXT,
    "typical_price" NUMERIC,
    "sugar_price" NUMERIC,
    "unit" TEXT
);

CREATE TABLE "donuts"(
    "id" NUMERIC PRIMARY KEY,
    "name" TEXT,
    "is_gluten_free" BOOLEAN,
    "price" REAL
);

CREATE TABLE "donuts_ingredients"(
    "id" NUMERIC PRIMARY KEY,
    "donut_id",
    "ingredient_id",
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
)

CREATE TABLE "orders"(
    "id" NUMERIC PRIMARY KEY,
    "order_number" NUMERIC,
    "donut_id" NUMERIC,
    "customer_id" NUMERIC,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers"(
    "id" NUMERIC PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "history" TEXT
);
