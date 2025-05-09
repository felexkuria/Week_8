# E-commerce Order Management System

## Description

This project provides a MySQL database schema to manage orders, customers, products, and shipments for an e-commerce platform. It supports tracking order statuses, shipping details, and customer information.

## Setup

1. Clone the repository.
2. Import the SQL file into MySQL:

   ```bash
   mysql -u [username] -p ECommerceOrderManagement < ecommerce_order_management.sql
   ```

3. The repo must include:

   🧠 For Question 1:

   - Only one `.sql` file containing:
     - CREATE TABLE statements with proper constraints (PK, FK, NOT NULL, UNIQUE)
     - Table relationships (1-1, 1-M, M-M where needed)
     - Well-structured relational database design for a real-world use case
     - Must be well-commented
