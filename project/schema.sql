-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

CREATE TABLE Supermarkets (
    id PRIMARY KEY smallserial,
    supermarket_name varchar(30),
    address varchar(120)
);

CREATE TABLE Customers (
    id PRIMARY KEY serial,
    first_name varchar(30),
    last_name varchar(60),
    username varchar(30),
    email varchar(100),
    phone varchar(12),
    supermarket_id smallserial NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id)
);

CREATE TABLE Suppliers (
    id PRIMARY KEY smallserial,
    supplier_name varchar(30)
)

CREATE TABLE Supermarket_Supplier (
    id PRIMARY KEY smallserial,
    supermarket_id smallserial NOT NULL,
    supplier_id smallserial NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id),
    FOREIGN KEY (supplier_id) REFERENCES TO Suppliers(id)
);


CREATE TABLE Trademarks (
    id PRIMARY KEY smallserial,
    trademark_name varchar(30),
    suppier_id smallserial NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES TO Suppliers(id)
);

CREATE TABLE Categories (
    id PRIMARY KEY smallserial,
    category_name varchar(20)
);

CREATE TABLE Products (
    id PRIMARY KEY serial,
    product_name varchar(60),
    price numeric(4,2),
    quantity smallint,
    product_weight numeric(3,3),
    unit_of_measure varchar(2),
    expiration_date date,
    created_at datetime,
    updated_at datetime,
    trademark_id smallserial NOT NULL,
    category_id smallserial NOT NULL,
    supermarket_id smallserial NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES TO Suppliers(id),
    FOREIGN KEY (category_id) REFERENCES TO,
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id)
);


CREATE TABLE Price_History (
    id PRIMARY KEY serial,
    price numeric(4,2),
    date_time datetime,
    product_id serial NOT NULL,
    FOREIGN KEY (product_id) REFERENCES TO Products(id)
);

CREATE TABLE Departments (
    id PRIMARY KEY smallserial,
    department_name VARCHAR(20),
    supermarket_id smallserial NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id)
);

CREATE TABLE Job_Titles (
    id PRIMARY KEY smallserial,
    job_title_name varchar(20),
    department_id smallserial NOT NULL,
    FOREIGN KEY (department_id) REFERENCES TO Departments(id)
);

CREATE TABLE Employees (
    id PRIMARY KEY smallserial,
    first_name varchar(30),
    last_name varchar(60),
    job_title_id smallserial NOT NULL,
    starting_date date,
    ending_date date,
    supermarket_id smallserial NOT NULL,
    department_id smallserial NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id),
    FOREIGN KEY (department_id) REFERENCES TO Departments(id)
);

CREATE TABLE Promotions (
    id PRIMARY KEY smallserial,
    type_name,
    price numeric(4,2),
    starting_date datetime,
    ending_date datetime,
    supermarket_id smallserial NOT NULL,
    trademark_id smallserial NOT NULL,
    products_id serial NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id),
    FOREIGN KEY (trademark_id) REFERENCES TO Trademarks(id),
    FOREIGN KEY (product_id) REFERENCES TO Products(id)
);


CREATE TABLE Sales (
    id PRIMARY KEY bigserial,
    date_time datetime,
    customer_id serial NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES TO Customers(id)
);

CREATE TABLE Sales_Products (
    id PRIMARY KEY bigserial,
    date_time datetime,
    sales_id bigserial NOT NULL,
    product_id serial NOT NULL,
    quantity smallint,
    unit_price numeric(4,2),
    FOREIGN KEY (sales_id) REFERENCES TO Sales(id),
    FOREIGN KEY (product_id) REFERENCES TO Products(id)
);

CREATE TABLE Reviews (
    id PRIMARY KEY serial,
    review_date datetime,
    rate int check (rate between 1 and 5),
    comment varchar(500),
    customer_id serial NOT NULL,
    supermarket_id smallserial NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES TO Customers(id),
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id)
);
