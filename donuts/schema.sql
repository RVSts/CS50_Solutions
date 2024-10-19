CREATE TABLE "ingredients"(
    "typical" TEXT,
    "sugar" TEXT,
    "typical_price" NUMERIC,
    "sugar_price" NUMERIC
);

CREATE TABLE "donuts"(
    "name" TEXT PRIMARY KEY,
    "type" TEXT,
    "price" NUMERIC,
    "typical_used" TEXT,
    "sugar_used" TEXT,
    FOREING KEY ("typical_used") REFERENCES "ingredients"("typical"),
    FOREING KEY ("sugar_used" REFERENCES "ingredients"("sugar")
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
