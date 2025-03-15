**E-Commerce Data Pipeline with MySQL**

---

### README.md  
# 📊 E-Commerce ETL Pipeline & Data Analysis  

## 🚀 Project Overview  
This project builds an ETL pipeline that extracts data from an Excel file, transforms it for consistency, and loads it into a MySQL database. Additionally, SQL queries are provided for insightful data analysis.  

---

## 🎯 Key Objectives  
✅ Extract data from a raw Excel file.  
✅ Clean and transform data for accuracy and consistency.  
✅ Load data into a MySQL database with proper constraints.  
✅ Perform insightful SQL queries for business insights.  

---

## 🗂️ Folder Structure  
```
📂 E-Commerce-Data-Pipeline
 ┣ 📂 data
 ┃ ┗ 📄 Data for ETL Assignment.xlsx
 ┣ 📄 ETL_Pipeline.sql
 ┣ 📄 ETL_Pipeline.ipynb
 ┣ 📄 README.md

```

---

## ⚙️ Setup Instructions  
1. **Database Setup:**  
   - Install MySQL Server and MySQL Workbench (if not already installed).  
   - Create a database called **`ecommerce_db`**.  
   - Use `etl_pipeline.sql` to create tables and insert data.  

2. **Data Cleaning & Transformation:**  
   - Handle missing values appropriately.  
   - Ensure data types match the schema (e.g., `TIMESTAMP`, `DECIMAL`).  
   - Confirm `order_id` in the Payments table references valid orders.  

3. **Data Analysis:**  
   - Use `analysis_notebook.ipynb` for deeper insights, trends, and business analysis.  

---

## 🔍 Sample SQL Queries  
💬 **Basic Queries**  
- Retrieve customer details.  
- List orders with total amounts and statuses.  

📊 **Intermediate Queries**  
- Find top-paying customers.  
- Identify total revenue and average order value (AOV).  

🖥️ ER Diagram

![ETL_ER_Diagram](https://github.com/user-attachments/assets/b7015fb1-7a6e-4766-afc4-e89e5ad6acb9)



🚀 **Advanced Queries**  
- Identify unpaid or failed orders.  
- Discover the most popular product categories and busiest sales months.  

---

## 💡 Why This Project?  
This ETL pipeline streamlines data handling while SQL queries unlock valuable insights, making it ideal for business growth and informed decision-making.  

