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
)

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
    FOREIGN KEY (category_id) REFERENCES TO 
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id),

)


CREATE TABLE Price_History (

)

CREATE TABLE Departments (

)

CREATE TABLE Job_Titles (

)

CREATE TABLE Employees (

)

CREATE TABLE Promotions (

)


CREATE TABLE Sales (

)

CREATE TABLE Sales_Products (

)

CREATE TABLE Reviews (

)
