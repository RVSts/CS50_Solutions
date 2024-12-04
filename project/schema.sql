-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

CREATE TABLE Supermarkets (
    id smallserial PRIMARY KEY,
    supermarket_name varchar(30),
    address varchar(120)
);

CREATE TABLE Customers (
    id serial PRIMARY KEY,
    first_name varchar(30),
    last_name varchar(60),
    username varchar(30),
    email varchar(100),
    phone varchar(12)
);

CREATE TABLE Supermarkets_Customers(
    id serial PRIMARY KEY,
    supermarket_id smallint NOT NULL CHECK (supermarket_id >= 0),
    customer_id int NOT NULL CHECK (customer_id >= 0),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Suppliers (
    id smallserial PRIMARY KEY,
    supplier_name varchar(30)
)

CREATE TABLE Supermarket_Supplier (
    id PRIMARY KEY smallserial,
    supermarket_id smallint NOT NULL CHECK (supermarket_id >= 0),
    supplier_id smallint NOT NULL CHECK (supplier_id >= 0),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
);


CREATE TABLE Trademarks (
    id smallserial PRIMARY KEY ,
    trademark_name varchar(30),
    suppier_id smallint NOT NULL CHECK (supplier_id >= 0),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
);

CREATE TABLE Categories (
    id smallserial PRIMARY KEY ,
    category_name varchar(20)
);

CREATE TABLE Products (
    id serial PRIMARY KEY,
    product_name varchar(60),
    price numeric(4,2),
    quantity smallint,
    product_weight numeric(3,3),
    unit_of_measure varchar(2),
    expiration_date date,
    created_at timestamp,
    updated_at timestamp,
    trademark_id smallint NOT NULL CHECK (trademark_id >= 0),
    category_id smallint NOT NULL CHECK (category_id >= 0),
    supermarket_id smallint NOT NULL CHECK (supermarket_id >= 0),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id)
);


CREATE TABLE Price_History (
    id serial PRIMARY KEY,
    price numeric(4,2),
    date_time datetime,
    product_id int NOT NULL CHECK (product_id >= 0),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

CREATE TABLE Departments (
    id smallserial PRIMARY KEY,
    department_name VARCHAR(20),
    supermarket_id smallint NOT NULL CHECK (supermarket_id >= 0),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id)
);

CREATE TABLE Job_Titles (
    id smallserial PRIMARY KEY,
    job_title_name varchar(20),
    department_id smallint NOT NULL CHECK (department_id >= 0),
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Employees (
    id smallserial PRIMARY KEY ,
    first_name varchar(30),
    last_name varchar(60),
    job_title_id smallint NOT NULL CHECK (job_title_id >= 0),
    starting_date date,
    ending_date date,
    supermarket_id smallint NOT NULL CHECK (suppermrket_id >= 0),
    department_id smallint NOT NULL CHECK (department_id >= 0),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id),
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Promotions (
    id smallserial PRIMARY KEY,
    type_name ENUM(),
    price numeric(4,2),
    starting_date timestamp,
    ending_date timestamp,
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



CREATE ROLE

CREATE ROLE
