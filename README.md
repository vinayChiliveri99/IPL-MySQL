# IPL Project using MySQL

This project involves importing raw CSV data related to IPL matches and deliveries into MySQL tables. The provided `index.js` file contains the code responsible for converting the raw CSV data and pushing it into the SQL tables.

## Setup

1. **Database Setup:**

   Before running the script, make sure to create a MySQL database and two tables. You can use the provided SQL scripts in the "tableGenerator" folder.

   ```bash
   mysql -u <your_username> -p <database_name> < matchesTable.sql
   mysql -u <your_username> -p <database_name> < deliveriesTable.sql

   
Replace `<your_username>` with your MySQL username and `<database_name>` with the database you want to use from your older databases or the one you just created.
This will ask to enter your password to login to your SQL server on your machine, Once that is done, you ll have the tables created.

2. **Running the script**

    Execute the index.js file to populate the tables with data from raw CSV files.

    ```bash
    node index.js


## Project Structure

* **index.js:**

  Contains the JavaScript code responsible for reading raw CSV data and populating the MySQL tables.

* **table generator/matchesTable.sql:**

  SQL script to create the matchesTable in your MySQL database.

* **table generator/deliveriesTable.sql:**

  SQL script to create the deliveriesTable in your MySQL database.


## Requirements
  * Node.js
  * MySQL
  
