# ABC Cake Order Management System

## Project Overview

The **ABC Cake Order Management System** is a web application built using ASP.NET, designed to streamline the order processing and inventory management of an online cake business. This platform enables administrators to manage orders, monitor inventory levels, generate sales reports, and oversee essential operational tasks. The system includes robust search capabilities for finding orders by various criteria, as well as an RDLC reporting feature to provide detailed insights on sales and inventory levels.

## Features

### 1. Order Management
- **Order Tracking**: View and manage all orders placed within the system, including details such as `Order ID`, `User ID`, `Total Price`, `Status`, `Order Date`, `Delivery Address`, and `Phone Number`.
- **Status Updates**: Update order statuses in real-time, transitioning orders through various stages (e.g., Pending, Confirmed, Processing, Shipped, Delivered).
- **Sales Calculation**: Automatically calculate and display total sales based on completed orders.

### 2. Inventory Management
- **Stock Monitoring**: Track the inventory levels of each ingredient. 
- **Low Stock Alerts**: Get notifications when ingredient quantities fall below a set threshold.
- **Inventory Adjustments**: Update inventory levels automatically as ingredients are used in orders.

### 3. Search Functionality
- **Flexible Search Options**: Filter orders based on `Order ID`, `Ingredients`, or `Order Date`.
- **User-Friendly Results Display**: Search results are displayed in a grid format, showing essential details like `User Name`, `Total Price`, and `Order Date`.

### 4. Reporting
- **Report Generation**: Generate detailed search reports on orders, status, and inventory, date range(start date-end date).
- **Customizable Criteria**: Reports can be customized based on specific search criteria, providing valuable insights for business decisions.



## Database Structure

### Key Tables and Relationships

1. **Users**
   - Stores user information and roles, enabling secure login and user identification.
   - Key Fields: `UserID`, `username`, `password`, `contact`, `sex`, `date`, `Roles`

2. **Orders**
   - Maintains records of each order, including user details and delivery information.
   - Key Fields: `OrderID`, `UserID`, `TotalPrice`, `StatusID`, `OrderDate`, `DeliveryAddress`, `PhoneNumber`

3. **OrderIngredients**
   - Associates specific ingredients with orders, tracking which ingredients were used in each order.
   - Key Fields: `OrderIngredientID`, `OrderID`, `IngredientID`

4. **Inventory**
   - Tracks the current stock levels of each ingredient in real time.
   - Key Fields: `InventoryID`, `IngredientID`, `Quantity`

5. **Ingredient**
   - Contains details of each ingredient available, including pricing and custom cake options.
   - Key Fields: `IngredientID`, `Ingredient_Name`, `Price_Unit`, `Custom_Cake_Name`

6. **Status**
   - Defines possible statuses for orders, allowing administrators to manage order progression.
   - Key Fields: `statusID`, `status_serial`, `status_name`

### Database Diagram

![ABC_CAKE_Database](https://github.com/user-attachments/assets/d960b2d8-5aad-4b7f-b91a-20d47f844dfc)


## Installation and Setup

### Prerequisites

- **Microsoft SQL Server**: Set up the SQL database with the tables and relationships defined above.
- **ASP.NET Development Environment**: Visual Studio 2019 or later recommended.

### Steps to Set Up

1. **Clone or Download** the project files from the repository.
2. **Database Configuration**:
   - Create the database schema using the provided tables.
   - Update the database connection string in `Web.config` under the key `"AbcCakeConnection"` with your SQL Server connection details.
3. **Run the Project**:
   - Open the project in Visual Studio, build the solution, and run it.
   - Access the application through `http://localhost:<port>/Admin_dashboard.aspx` in a web browser.
4. **Admin Login**:
   - **Username**: `Admin`
   - **Password**: `Admin@1234`

## Usage
### User Dashboard

- **User Profile **: Can edit user profile and also can view order history.
- **Create Custom Orders**: User can make customized cake and make order. With preview of cake with final price.

### Admin Dashboard

- **View Statistics**: Get a summary of users, total sales, and inventory.
- **Manage Orders**: View, filter, and update order statuses.

### Order Search

- **Use Filters**: Filter orders by Order ID, Ingredients, or Date.
- **View Results**: Matching orders are displayed in a grid with key details for easy viewing.

### Low Inventory Alerts

- **Monitor Inventory**: Receive automatic alerts when ingredients run low.
- **Update Inventory**: Adjust stock levels as needed to meet order requirements.



## Troubleshooting

- **Database Connection Issues**: Verify the connection string in `Web.config`.
- **JavaScript Search Functionality**: Ensure client-side scripts are correctly referenced and dropdown behavior is functioning.
- **Report Errors**: Check that required report files are included and that data sources are properly configured.

## Screenshots
Login:
![image](https://github.com/user-attachments/assets/6b0b6826-b4ca-4e6d-82ea-7888889a4939)
Registration:
![image](https://github.com/user-attachments/assets/de479b83-2709-43ab-b83c-10cbfa07ff6b)
User Profile:
![image](https://github.com/user-attachments/assets/a34c25a5-11dc-4a6f-9e61-cabc5a3720f0)
User History:
![image](https://github.com/user-attachments/assets/a6720e24-dbc0-4d23-ad59-64a76d5a292f)
Custom Cake Order:
![image](https://github.com/user-attachments/assets/e2d7e4fa-2487-48fe-a18b-2f816cfe1575)
Admin Dashboard:
![image](https://github.com/user-attachments/assets/22f6f3a2-46a7-4157-bbb1-35186df1ced7)
Inventory Management:
![image](https://github.com/user-attachments/assets/284f4931-43a8-4473-8496-5c7b3cc4089a)
Search Order:
![image](https://github.com/user-attachments/assets/1c3eb1a4-b34f-4259-86df-f419d1c89895)
Order Report:
![image](https://github.com/user-attachments/assets/5515c57d-9b23-4d4d-9c0e-c676f1b6fb05)






## License

This project is released under the Interstoff apparels ltd. License. Feel free to use, modify, and distribute as needed.

---

This ReadMe provides a comprehensive overview for developers, users, and contributors, offering a clear guide to the ABC Cake Order Management System’s functionality, setup, and maintenance.
