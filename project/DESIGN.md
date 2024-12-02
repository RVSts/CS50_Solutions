# Design Document

### By Rian Vasconcelos dos Santos

## Video overview: <URL HERE>

## Scope

#### The propose of this database is to easily store all informations about all supermarkets at a specific location. This helps in price comparison, market analysis in identifying trends, inventory optimization, etc. As such, included in the database's scope is:

* **Supermarkets**: Contains supermarket information and deletion information.
* **Customers**: Contains customer information.
* **Suppliers**: Contains information about suppliers.
* **Supermarkets_Suppliers**: Contains information about the supermarkets and the suppliers, with a supermarket being able to have many suppliers and suppliers many suppermarkets.
* **Trademarks**:Brand identity to differentiate products.
* **Categories**: Includes product categores.
* **Products**: Contains product information.
* **Price_History**: Contains information about price variations of a specific product over time.
* **Departments**: Includes department information.
* **Job_Titles**: Includes all job titles at the market
* **Employees**: Contains employee informations.
* **Promotions**: Includes information about any product promotion in a supermarket.
* **Sales**: Includes information about any sales and their relationship with customers.
* **Sales_Products**: Includes information about quantity of sales of a specific product.
* **Reviews**: Includes reviews of customers who have bought in that supermarket.

* Which people, places, things, etc. are *outside* the scope of your database?

## Functional Requirements

### User Capabilities

* **Products and Stock**: View the current stock of products from a specific brand in a specific supermarket; Identify products with low avaliability.
* **Sales and Trend Analysis**: Check the best selling product during a specific period; Obtain information about the average sales by department or category.
* **Customers and Purchase Behavior**: Track customer purchase history, including dates, purchased products, and total spending; Obtain average spending per customer.
* **Supermarkets and Locations**: View detailed information about supermarkets, including their location and active promotions
* **Promotions and Effectiveness**: View active promotions and their impact on sales volume; Identify the most purchased products during specific promotions.
* **Suppliers and Supplies**: Able to view information about product and stores;
* **Reviews and Feedback**: View customer reviews about products and supermarkets, and generate statistics based on rating.

### Beyond Scope

* Perform complex financial operations, such as calculating net profit.
* Automate restocking or purchasing processes.
* Detailed management of logistics and transportation.


## Representation

### Entities

#### Supermarkets:

* `id` (Primary Key)
* `name`
* `address`

#### Customers
* `id` (Primary Key)
* `first_name`
* `last_name`
* `username`
* `email`
* `phone`
* `supermarket_id` (Foreign Key referencing Supermarkets)

#### Suppliers
* `id` (Primary Key)
* `name`

#### Supermarket_Supplier
* `id` (Primary Key)
* `supermarket_id` (Foreign Key referencing Supermarkets)
* `supplier_id` (Foreign Key referencing Suppliers)

#### Trademarks
* `id` (Primary Key)
* `name`
* `supplier_id` (Foreign Key refencing Suppliers)

#### Categories
* `id` (Primary Key)
* `name`

#### Products
* `id` (Primary Key)
* `name`
* `price`
* `quantity`
* `weight`
* `unit_of_measure`
* `expiration_date`
* `created_at`
* `updated_at`
* `trademark_id` (Foreign Key referencing Trademarks)
* `category_id` (Foreign Key referencing Categories)
* `supermarket_id` (Foreign Key referencing Supermarkets)

#### Price_History
* `id`
* `price`
* `date_time`
* `product_id`

#### Departments
* `id` (Primary Key)
* `name`
* `supermarket_id`(Foreign Key referencing Supermarkets)

#### Job_Titles
* `id`
* `name`
* `department_id`

#### Employees
* `id` (Primary Key)
* `first_name`
* `last_name`
* `job_title_id`(Foreign Key referencing Job_Titles)
* `start_date`
* `end_date`
* `supermarket_id`(Foreign Key referencing Supermarkets)
* `department_id` (Foreign Key referencing Departments)

#### Promotions
* `id` (Primary Key)
* `type`
* `price`
* `start_date`
* `end_date`
* `supermarket_id` (Foreign Key referencing Supermarkets)
* `trademark_id` (Foreign Key referencing Trademarks)
* `product_id` (Foreign Key referencing Products)

#### Sales
* `id` (Primary Key)
* `date_time`
* `customer_id`(Foreign Key referencing Customers)

#### Sales_Products
* `id` (Primary Key)
* `date_time`
* `sales_id` (Foreign Key referencing Sales)
* `product_id` (Foreign Key referencing Products)
* `quantity`
* `unit_price`

#### Reviews
* `id` (Primary Key)
* `date`
* `rate`
* `comment`
* `customer_id` (Foreign Key referencing Customers)
* `supermarket_id` (Foreign Key referencing Supermarkets)



In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
* What attributes will those entities have?
* Why did you choose the types you did?
* Why did you choose the constraints you did?

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
* What might your database not be able to represent very well?
