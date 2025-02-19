-- Define custom ENUM types
CREATE TYPE unit_of_measure_type AS ENUM ('kg', 'g', 'l', 'ml', 'unit');
CREATE TYPE promotion_type AS ENUM ('discount', 'bundle');

-- Tables without dependencies
CREATE TABLE Supermarkets (
    id smallserial,
    name varchar(30),
    address varchar(120),
    CONSTRAINT supermarket_key PRIMARY KEY (id)
);
CREATE TABLE Suppliers (
    id smallserial,
    name varchar(30),
    CONSTRAINT supplier_key PRIMARY KEY (id)
);
CREATE TABLE Categories (
    id smallserial,
    name varchar(20),
    CONSTRAINT category_key PRIMARY KEY (id)
);
CREATE TABLE Trademarks (
    id smallserial,
    name varchar(30),
    supplier_id smallint NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers (id),
    CONSTRAINT trademark_key PRIMARY KEY (id)
);

-- Customers table
CREATE TABLE Customers (
    id serial,
    first_name varchar(30),
    last_name varchar(60),
    username varchar(30) UNIQUE,
    email varchar(100) UNIQUE,
    phone varchar(12),
    CONSTRAINT customer_key PRIMARY KEY (id)
);

-- Relationship tables
CREATE TABLE Supermarkets_Customers (
    id serial,
    supermarket_id smallint NOT NULL,
    customer_id int NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets (id),
    FOREIGN KEY (customer_id) REFERENCES Customers (id),
    CONSTRAINT sup_cust_key PRIMARY KEY (id)
);
CREATE TABLE Supermarket_Supplier (
    id smallserial,
    supermarket_id smallint NOT NULL,
    supplier_id smallint NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets (id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers (id),
    CONSTRAINT supermarket_supplier_key PRIMARY KEY (id)
);

-- Products table
CREATE TABLE Products (
    id serial,
    name varchar(60),
    price numeric(6, 2) NOT NULL CHECK (price >= 0),
    quantity smallint NOT NULL CHECK (quantity >= 0),
    product_weight numeric(6, 3),
    unit_of_measure unit_of_measure_type NOT NULL,
    expiration_date date,
    created_at timestamp,
    updated_at timestamp,
    trademark_id smallint NOT NULL,
    category_id smallint NOT NULL,
    supermarket_id smallint NOT NULL,
    FOREIGN KEY (trademark_id) REFERENCES Trademarks (id),
    FOREIGN KEY (category_id) REFERENCES Categories (id),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets (id),
    CONSTRAINT product_key PRIMARY KEY (id)
);

-- Price History table
CREATE TABLE Price_History (
    id serial,
    price numeric(4, 2),
    date_time timestamp,
    product_id int NOT NULL,
    is_active boolean DEFAULT TRUE,
    FOREIGN KEY (product_id) REFERENCES Products (id),
    CONSTRAINT price_history_key PRIMARY KEY (id)
);

-- Departments table
CREATE TABLE Departments (
    id smallserial,
    name varchar(20),
    supermarket_id smallint NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets (id),
    UNIQUE (name, supermarket_id),
    CONSTRAINT department_key PRIMARY KEY (id)
);

-- Job Titles table
CREATE TABLE Job_Titles (
    id smallserial,
    name varchar(20),
    department_id smallint NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments (id),
    CONSTRAINT job_title_key PRIMARY KEY (id)
);

-- Employees table
CREATE TABLE Employees (
    id smallserial,
    first_name varchar(30),
    last_name varchar(60),
    job_title_id smallint NOT NULL,
    starting_date date,
    ending_date date,
    supermarket_id smallint NOT NULL,
    department_id smallint NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets (id),
    FOREIGN KEY (department_id) REFERENCES Departments (id),
    CONSTRAINT employee_key PRIMARY KEY (id)
);

-- Promotions table
CREATE TABLE Promotions (
    id smallserial,
    type promotion_type NOT NULL,
    price numeric(4, 2) NOT NULL CHECK (price >= 0),
    starting_date timestamp NOT NULL,
    ending_date timestamp NOT NULL,
    supermarket_id smallint NOT NULL,
    trademark_id smallint NOT NULL,
    product_id int NOT NULL,
    is_active boolean DEFAULT TRUE,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets (id),
    FOREIGN KEY (trademark_id) REFERENCES Trademarks (id),
    FOREIGN KEY (product_id) REFERENCES Products (id),
    CHECK (starting_date < ending_date),
    CONSTRAINT promotion_key PRIMARY KEY (id)
);

-- Sales table
CREATE TABLE Sales (
    id bigserial,
    date_time timestamp,
    customer_id int NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers (id),
    CONSTRAINT sales_key PRIMARY KEY (id)
);

-- Sales Products table
CREATE TABLE Sales_Products (
    id bigserial,
    date_time timestamp,
    sales_id bigint NOT NULL,
    product_id int NOT NULL,
    quantity smallint NOT NULL CHECK (quantity >= 0),
    unit_price numeric(4, 2) NOT NULL CHECK (unit_price >= 0),
    FOREIGN KEY (sales_id) REFERENCES Sales (id),
    FOREIGN KEY (product_id) REFERENCES Products (id),
    CONSTRAINT sales_products_key PRIMARY KEY (id)
);

-- Reviews table
CREATE TABLE Reviews (
    id serial,
    date timestamp,
    rate int CHECK (
        rate BETWEEN 1 AND 5
    ),
    comment varchar(500),
    customer_id int NOT NULL,
    supermarket_id smallint NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers (id),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets (id),
    UNIQUE (customer_id, supermarket_id),
    CONSTRAINT review_key PRIMARY KEY (id)
);

-- Indexes for Supermarkets_Customers table
CREATE INDEX idx_supermarkets_customers_supermarket_id ON Supermarkets_Customers (supermarket_id);
CREATE INDEX idx_supermarkets_customers_customer_id ON Supermarkets_Customers (customer_id);

-- Indexes for Price_History table
CREATE INDEX idx_price_history_product_id ON Price_History (product_id);

-- Indexes for Sales_Products table
CREATE INDEX idx_sales_products_sales_id ON Sales_Products (sales_id);
CREATE INDEX idx_sales_products_product_id ON Sales_Products (product_id);
CREATE INDEX idx_products_expiration_date ON Products (expiration_date);

-- Additional Indexes
CREATE INDEX idx_products_supermarket_id ON Products (supermarket_id);
CREATE INDEX idx_promotions_supermarket_id ON Promotions (supermarket_id);
CREATE INDEX idx_employees_department_id ON Employees (department_id);
CREATE INDEX idx_reviews_date ON Reviews (date);

-- Roles for user permissions
CREATE ROLE analyst LOGIN PASSWORD 'password_analyst';
CREATE ROLE manager LOGIN PASSWORD 'password_manager';
CREATE ROLE operator LOGIN PASSWORD 'password_operator';
CREATE ROLE user_ LOGIN PASSWORD 'password_user';

GRANT SELECT ON ALL TABLES IN SCHEMA public TO analyst;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO manager;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA public TO operator;
GRANT SELECT ON Products TO user_;
GRANT SELECT ON Categories TO user_;
GRANT SELECT ON Trademarks TO user_;
GRANT SELECT ON Promotions TO user_;
GRANT SELECT ON Price_History TO user_;

-- Views for common queries
CREATE VIEW vw_top_selling_products AS
SELECT
    p.name AS product_name,
    SUM(sp.quantity) AS total_quantity_sold
FROM
    Sales_Products sp
JOIN
    Products p ON sp.product_id = p.id
GROUP BY
    p.name
ORDER BY
    total_quantity_sold DESC;

CREATE VIEW vw_customer_purchase_history AS
SELECT
    c.id AS customer_id,
    c.first_name,
    c.last_name,
    s.date_time AS purchase_date,
    p.name AS product_name,
    sp.quantity,
    sp.unit_price
FROM
    Customers c
JOIN
    Sales s ON c.id = s.customer_id
JOIN
    Sales_Products sp ON s.id = sp.sales_id
JOIN
    Products p ON sp.product_id = p.id
ORDER BY
    c.id, s.date_time;

CREATE VIEW vw_active_promotions AS
SELECT
    p.name AS product_name,
    pr.type AS promotion_type,
    pr.price AS promotion_price,
    pr.starting_date,
    pr.ending_date,
    pr.is_active
FROM
    Promotions pr
JOIN
    Products p ON pr.product_id = p.id
WHERE
    pr.is_active = TRUE;

GRANT SELECT ON vw_active_promotions TO user_;


CREATE VIEW vw_products_sales AS
SELECT
    p.name AS product_name,
    SUM(sp.quantity) AS total_quantity_sold,
    SUM(sp.quantity * sp.unit_price) AS total_revenue
FROM
    Sales_Products sp
JOIN
    Products p ON sp.product_id = p.id
GROUP BY
    p.name;

GRANT SELECT ON vw_products_sales TO user_;


-- Updates the `updated_at` field before any update in `Products`
CREATE OR REPLACE FUNCTION trg_update_product_timestamp_fn()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_product_timestamp
BEFORE UPDATE ON Products
FOR EACH ROW
EXECUTE FUNCTION trg_update_product_timestamp_fn();

-- Prevents negative stock quantity in `Products`
CREATE OR REPLACE FUNCTION trg_check_product_stock_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantity < 0 THEN
        RAISE EXCEPTION 'Quantity cannot be negative';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_product_stock
BEFORE UPDATE OR INSERT ON Products
FOR EACH ROW
EXECUTE FUNCTION trg_check_product_stock_fn();

-- Logs price changes in `Products`
CREATE OR REPLACE FUNCTION trg_log_price_change_fn()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Price_History (price, date_time, product_id, is_active)
    VALUES (NEW.price, NOW(), NEW.id, TRUE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_price_change
AFTER UPDATE OF price ON Products
FOR EACH ROW
WHEN (OLD.price IS DISTINCT FROM NEW.price)
EXECUTE FUNCTION trg_log_price_change_fn();

-- Automatically deactivates expired promotions
CREATE OR REPLACE FUNCTION trg_deactivate_expired_promotions_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ending_date < NOW() THEN
        NEW.is_active = FALSE;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_deactivate_expired_promotions
BEFORE INSERT OR UPDATE ON Promotions
FOR EACH ROW
EXECUTE FUNCTION trg_deactivate_expired_promotions_fn();

-- Ensures consistency of dates in `Employees`
CREATE OR REPLACE FUNCTION trg_check_employee_dates_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ending_date IS NOT NULL AND NEW.ending_date < NEW.starting_date THEN
        RAISE EXCEPTION 'Ending date cannot be before the starting date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_employee_dates
BEFORE INSERT OR UPDATE ON Employees
FOR EACH ROW
EXECUTE FUNCTION trg_check_employee_dates_fn();

-- Logs customer reviews in `Reviews`
CREATE OR REPLACE FUNCTION trg_log_review_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Reviews
        WHERE customer_id = NEW.customer_id AND supermarket_id = NEW.supermarket_id
    ) THEN
        INSERT INTO Reviews (date, rate, comment, customer_id, supermarket_id)
        VALUES (NOW(), NEW.rate, NEW.comment, NEW.customer_id, NEW.supermarket_id);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_review
AFTER INSERT ON Reviews
FOR EACH ROW
EXECUTE FUNCTION trg_log_review_fn();
