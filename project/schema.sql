-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

CREATE TABLE Supermarkets (
    id smallserial PRIMARY KEY,
    name varchar(30),
    address varchar(120)
);

CREATE TABLE Customers (
    id serial PRIMARY KEY,
    first_name varchar(30),
    last_name varchar(60),
    username varchar(30) UNIQUE,
    email varchar(100) UNIQUE,
    phone varchar(12)
);

CREATE TABLE Supermarkets_Customers(
    id serial PRIMARY KEY,
    supermarket_id smallint NOT NULL,
    customer_id int NOT NULL CHECK,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Suppliers (
    id smallserial PRIMARY KEY,
    name varchar(30)
);

CREATE TABLE Supermarket_Supplier (
    id PRIMARY KEY smallserial,
    supermarket_id smallint NOT NULL,
    supplier_id smallint NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
);


CREATE TABLE Trademarks (
    id smallserial PRIMARY KEY ,
    name varchar(30),
    supplier_id smallint NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
);

CREATE TABLE Categories (
    id smallserial PRIMARY KEY,
    name varchar(20)
);

CREATE TABLE Products (
    id serial PRIMARY KEY,
    name varchar(60),
    price numeric(4,2) NOT NULL CHECK (quantity >= 0),
    quantity smallint NOT NULL CHECK (quantity >= 0),
    product_weight numeric(6,3),
    unit_of_measure varchar(10),
    expiration_date date,
    created_at timestamp,
    updated_at timestamp,
    trademark_id smallint NOT NULL,
    category_id smallint NOT NULL,
    supermarket_id smallint NOT NULL,
    FOREIGN KEY (trademark_id) REFERENCES Trademarks(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id)
);


CREATE TABLE Price_History (
    id serial PRIMARY KEY,
    price numeric(4,2),
    date_time timestamp,
    product_id int NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

CREATE TABLE Departments (
    id smallserial PRIMARY KEY,
    name VARCHAR(20),
    supermarket_id smallint NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id)
);

CREATE TABLE Job_Titles (
    id smallserial PRIMARY KEY,
    name varchar(20),
    department_id smallint NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Employees (
    id smallserial PRIMARY KEY ,
    first_name varchar(30),
    last_name varchar(60),
    job_title_id smallint NOT NULL,
    starting_date date,
    ending_date date,
    supermarket_id smallint NOT NULL,
    department_id smallint NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id),
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Promotions (
    id smallserial PRIMARY KEY,
    name ENUM(),
    price numeric(4,2) NOT NULL CHECK (price >= 0),
    starting_date timestamp,
    ending_date timestamp,
    supermarket_id smallint NOT NULL,
    trademark_id smallint NOT NULL,
    products_id int NOT NULL,
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id),
    FOREIGN KEY (trademark_id) REFERENCES Trademarks(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);


CREATE TABLE Sales (
    id bigserial PRIMARY KEY,
    date_time timestamp,
    customer_id int NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Sales_Products (
    id bigserial PRIMARY KEY,
    date_time timestamp,
    sales_id bigint NOT NULL,
    product_id int NOT NULL,
    quantity smallint NOT NULL CHECK (quantity >= 0),
    unit_price numeric(4,2) NOT NULL CHECK (unit_price >= 0),
    FOREIGN KEY (sales_id) REFERENCES Sales(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

CREATE TABLE Reviews (
    id serial PRIMARY KEY,
    date timestamp,
    rate int CHECK (rate between 1 and 5),
    comment varchar(500),
    customer_id int NOT NULL,
    supermarket_id smallint NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (supermarket_id) REFERENCES Supermarkets(id)
);



CREATE ROLE

CREATE ROLE
