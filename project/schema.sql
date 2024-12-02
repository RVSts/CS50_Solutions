-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

CREATE TABLE Supermarkets (
    id PRIMARY KEY smallserial
    supermarket_name varchar(30)
    address varchar(120)
);

CREATE TABLE Customers (
    id PRIMARY KEY serial
    first_name varchar(30)
    last_name varchar(60)
    username varchar(30)
    email varchar(100)
    phone varchar (12)
    supermarket_id smallserial NOT NULL
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id)
);

CREATE TABLE Suppliers (
    id PRIMARY KEY smallserial
    supplier_name varchar(30)
)

CREATE TABLE Supermarket_Supplier (
    id PRIMARY KEY smallserial
    supermarket_id smallserial NOT NULL
    supplier_id smallserial NOT NULL
    FOREIGN KEY (supermarket_id) REFERENCES TO Supermarkets(id)
    FOREIGN KEY (supplier_id) REFERENCES TO Suppliers(id)
);


CREATE TABLE Trademarks (

)

CREATE TABLE Categories (

)

CREATE TABLE Products (

)


