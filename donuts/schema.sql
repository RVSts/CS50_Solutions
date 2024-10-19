CREATE TABLE "ingredients"(
    "id" INTEGER PRIMARY KEY,
    "typical" TEXT,
    "sugar" TEXT,
    "typical_price" REAL,
    "sugar_price" REAL,
    "unit" TEXT
);

CREATE TABLE "donuts"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "is_gluten_free" BOOLEAN,
    "price" REAL
);

CREATE TABLE "donuts_ingredients"(
    "id" INTEGER PRIMARY KEY,
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders"(
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers"(
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "history" TEXT
);

CREATE TABLE "orders_customers"(
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    "quantity" INTEGER,
    PRIMARY KEY ("donut_id", "customer_id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);
