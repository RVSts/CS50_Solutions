# Design Document

### By Rian Vasconcelos dos Santos

## Video overview: <URL HERE>

## Scope

The purpose of this database is to store information about all supermarkets in a specific location, facilitating price comparison, market analysis, trend identification, inventory optimization, and more. The scope of the database includes:

- **Supermarkets**: Contains information about supermarkets.
- **Customers**: Stores customer details.
- **Suppliers**: Includes supplier data.
- **Supermarkets_Customers**: Tracks the relationship between supermarkets and their customers.
- **Supermarket_Supplier**: Represents the many-to-many relationship between supermarkets and suppliers.
- **Trademarks**: Stores brand identity details for products.
- **Categories**: Defines categories for product classification.
- **Products**: Contains product-specific information.
- **Price_History**: Tracks historical price data for products.
- **Departments**: Contains department information.
- **Job_Titles**: Represents job titles within departments.
- **Employees**: Stores employee details.
- **Promotions**: Tracks promotional events and their details.
- **Sales**: Stores sales transaction details.
- **Sales_Products**: Represents the relationship between sales and products.
- **Reviews**: Captures customer feedback and ratings.

### Out of Scope

- Complex financial operations (e.g., net profit calculation).
- Automated restocking or purchasing processes.
- Detailed management of logistics and transportation.

---

## Functional Requirements

### User Capabilities

- **Products and Stock**: View current stock and identify products with low availability.
- **Sales and Trend Analysis**: Analyze best-selling products and obtain average sales by department or category.
- **Customer Insights**: Track purchase history, including total spending and average spending per customer.
- **Supermarket Details**: Access information about supermarkets, including active promotions.
- **Promotion Effectiveness**: Evaluate the impact of promotions on sales volume.
- **Supplier Information**: View data about suppliers and the stores they supply.
- **Reviews and Feedback**: Analyze customer reviews and ratings.
- **Employee Management**: Manage employee information, such as active contracts and role history.
- **Inventory Management**:  Identify products nearing expiration dates and track historical changes in inventory per supermarket.

- **Supplier Performance**: Assess supplier reliability by tracking delays or delivery frequency.

- **Promotion Insights**: Generate reports on promotion effectiveness by category or product.

- **Department-Level Analytics**: Obtain detailed statistics on sales, stock, and promotions for each department.

- **Supermarket Comparison**: Compare prices and promotions across different supermarkets.

- **Custom Reports**: Create reports based on custom filters, such as product categories, brands, or date ranges.

- **Complete Purchase History**: Generate detailed purchase history, including the impact of promotions on past purchases.

---

## Main Tables

### Supermarkets
Stores supermarkets.
- **Columns**: `id`, `name`, `address`
- **Primary Key**: `id`

### Suppliers
Stores suppliers.
- **Columns**: `id`, `name`
- **Primary Key**: `id`

### Categories
Stores product categories.
- **Columns**: `id`, `name`
- **Primary Key**: `id`

### Trademarks
Stores product trademarks and their associated suppliers.
- **Columns**: `id`, `name`, `supplier_id`
- **Primary Key**: `id`
- **Foreign Key**: `supplier_id` → `Suppliers.id`

### Customers
Stores customer information.
- **Columns**: `id`, `first_name`, `last_name`, `username`, `email`, `phone`
- **Primary Key**: `id`
- **Constraints**:
  - `username` and `email` must be unique.

## Relational Tables

### Supermarkets_Customers
Relates customers with supermarkets.
- **Columns**: `id`, `supermarket_id`, `customer_id`
- **Primary Key**: `id`
- **Foreign Keys**:
  - `supermarket_id` → `Supermarkets.id`
  - `customer_id` → `Customers.id`

### Supermarket_Supplier
Relates supermarkets with suppliers.
- **Columns**: `id`, `supermarket_id`, `supplier_id`
- **Primary Key**: `id`
- **Foreign Keys**:
  - `supermarket_id` → `Supermarkets.id`
  - `supplier_id` → `Suppliers.id`

## Product and Pricing Tables

### Products
Stores information about products.
- **Columns**: `id`, `name`, `price`, `quantity`, `product_weight`, `unit_of_measure`, `expiration_date`, `created_at`, `updated_at`, `trademark_id`, `category_id`, `supermarket_id`
- **Primary Key**: `id`
- **Foreign Keys**:
  - `trademark_id` → `Trademarks.id`
  - `category_id` → `Categories.id`
  - `supermarket_id` → `Supermarkets.id`
- **Constraints**:
  - `price` and `quantity` must be greater than or equal to 0.

### Price_History
Stores product price history.
- **Columns**: `id`, `price`, `date_time`, `product_id`, `is_active`
- **Primary Key**: `id`
- **Foreign Key**: `product_id` → `Products.id`

## Organizational Tables

### Departments
Stores departments within supermarkets.
- **Columns**: `id`, `name`, `supermarket_id`
- **Primary Key**: `id`
- **Foreign Key**: `supermarket_id` → `Supermarkets.id`
- **Constraints**:
  - Combination of `name` and `supermarket_id` must be unique.

### Job_Titles
Stores job titles within departments.
- **Columns**: `id`, `name`, `department_id`
- **Primary Key**: `id`
- **Foreign Key**: `department_id` → `Departments.id`

### Employees
Stores employee information.
- **Columns**: `id`, `first_name`, `last_name`, `job_title_id`, `starting_date`, `ending_date`, `supermarket_id`, `department_id`
- **Primary Key**: `id`
- **Foreign Keys**:
  - `supermarket_id` → `Supermarkets.id`
  - `department_id` → `Departments.id`

## Promotion and Sales Tables

### Promotions
Stores product promotion information.
- **Columns**: `id`, `type`, `price`, `starting_date`, `ending_date`, `supermarket_id`, `trademark_id`, `product_id`, `is_active`
- **Primary Key**: `id`
- **Foreign Keys**:
  - `supermarket_id` → `Supermarkets.id`
  - `trademark_id` → `Trademarks.id`
  - `product_id` → `Products.id`
- **Constraints**:
  - `starting_date` must be earlier than `ending_date`.
  - `price` must be greater than or equal to 0.

### Sales
Stores information about sales.
- **Columns**: `id`, `date_time`, `customer_id`
- **Primary Key**: `id`
- **Foreign Key**: `customer_id` → `Customers.id`

### Sales_Products
Relates products with specific sales.
- **Columns**: `id`, `date_time`, `sales_id`, `product_id`, `quantity`, `unit_price`
- **Primary Key**: `id`
- **Foreign Keys**:
  - `sales_id` → `Sales.id`
  - `product_id` → `Products.id`
- **Constraints**:
  - `quantity` and `unit_price` must be greater than or equal to 0.

## Review Table

### Reviews
Stores customer reviews about supermarkets.
- **Columns**: `id`, `date`, `rate`, `comment`, `customer_id`, `supermarket_id`
- **Primary Key**: `id`
- **Foreign Keys**:
  - `customer_id` → `Customers.id`
  - `supermarket_id` → `Supermarkets.id`
- **Constraints**:
  - `rate` must be between 1 and 5.
  - Combination of `customer_id` and `supermarket_id` must be unique.

---

## Optimizations

### Indexes
1. Indexes on `Supermarkets_Customers` for `supermarket_id` and `customer_id`.
2. Indexes on `Price_History` for `product_id`.
3. Indexes on `Sales_Products` for `sales_id` and `product_id`.
4. Additional indexes on `Products`, `Promotions`, `Employees`, and `Reviews` for query optimization.

---
## Views

### vw_top_selling_products
Lists top-selling products.
- **Columns**: `product_name`, `total_quantity_sold`
- **Ordering**: Descending by total sold.

### vw_customer_purchase_history
Purchase history by customer.
- **Columns**: `customer_id`, `first_name`, `last_name`, `purchase_date`, `product_name`, `quantity`, `unit_price`
- **Ordering**: By customer and date.

### vw_active_promotions
Lists active promotions.
- **Columns**: `product_name`, `promotion_type`, `promotion_price`, `starting_date`, `ending_date`, `is_active`
- **Permissions**: Accessible by the `User` role.

### vw_products_sales
Sales summary by product.
- **Columns**: `product_name`, `total_quantity_sold`, `total_revenue`
- **Permissions**: Accessible by the `User` role.

---

## Roles and Permissions

### Admin
- **Access**: Full access to all data and functionalities.
- **Responsibilities**:
  - Manage database structure.
  - Assign roles to users.
  - Oversee system health and data integrity.

### Supermarket_Manager
- **Access**: Restricted to supermarket-related data.
- **Responsibilities**:
  - Manage product and promotion details.
  - Monitor sales performance and employee data.

### Customer
- **Access**: Limited to their own purchase history and review submissions.
- **Responsibilities**:
  - Provide feedback and reviews for supermarkets.
  - View their transaction details.

### Analyst
- **Access**: Read-only access to analytics and aggregated data.
- **Responsibilities**:
  - Generate reports on trends, sales, and customer behavior.
  - Provide actionable insights based on database queries.

---

## Limitations

1. **Predefined ENUM Values**:
   - Fields like `unit_of_measure` and `promotion_type` use ENUMs, limiting flexibility for dynamic additions.

2. **Logistics and Transportation**:
   - No data captured for supply chain or delivery operations.

3. **Financial Analytics**:
   - Excludes in-depth profit and loss calculations.

4. **Historical Constraints**:
   - Price history is recorded only from the moment a product is added to the database.
   