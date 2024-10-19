CREATE TABLE "ingredients"(
    "typical" TEXT,
    "sugar" TEXT,
    "typical_price" NUMERIC,
    "sugar_price" NUMERIC
);

CREATE TABLE "donuts"(
    "name" TEXT,
    "type" TEXT,
    "price" NUMERIC,
    "typical_used" TEXT,
    "sugar_used" TEXT,
    FOREING KEY ("typical_used") REFERENCES "ingredients"("typical"),
    FOREING KEY ("sugar_used" REFERENCES "ingredients"("sugar")
)
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
