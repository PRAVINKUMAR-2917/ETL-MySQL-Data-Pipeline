-- create database ecommerce_db ;
use ecommerce_db ;

select * from customers;
select * from orders ;
select * from payments;
select * from products;

#  customer Table cleaning 

SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET phone_number = RIGHT(REGEXP_REPLACE(phone_number, '[^0-9]', ''), 10);

ALTER TABLE Customers 
ADD COLUMN created_date DATE,
ADD COLUMN created_time TIME;

UPDATE Customers
SET 
    created_date = DATE(created_at),
    created_time = TIME(created_at);

ALTER TABLE Customers 
DROP COLUMN created_at;

select * from customers;

 # Orders Table cleaning
 
 select * from orders;
 
 ALTER TABLE orders 
ADD COLUMN orderr_date DATE,
ADD COLUMN order_time TIME;

UPDATE orders
SET 
    orderr_date = DATE(order_date),
    order_time = TIME(order_date);

ALTER TABLE orders 
DROP COLUMN order_date;

select * from orders;


# Payments Table Cleaning

select * from payments;

alter table payments
add column payment_datee date,
add column payment_time time; 

update payments
set payment_datee = date(payment_date),
    payment_time = time(payment_date);
    
alter table payments
drop column payment_date;

select * from payments;
  
  # Products table cleaning
  
  select * from products;
  
  alter table products 
  add column created_date date ,
  add column created_time time ;
  
  update products 
  set created_date = date(created_at),
      created_time = time(created_at);
      
alter table products
drop column created_at ;

select * from products;
  
SET SQL_SAFE_UPDATES = 1 ;


# _______________________________________ Basic Queries ______________________________________________

-- 1 .Retrieve all customer details.

select * from customers;

# List all orders with their total amount and status.
select order_id , Status  , sum(total_amount) as  Total from orders
group by 1,2; 

# Find all products that belong to the ‘Electronics’ category.

select * from products 
where category = "Electronics";


# ____________________________________Intermediate Queries (Joins & Aggregations)_____________________________________________

-- Find the total number of orders placed by each customer (customer_id and count).

select c.customer_id , count(*) as Number_of_orders
from orders as c 
group by 1;

# Retrieve a list of all orders, including customer names and order status.
select concat(c.first_name,"-", c.last_name) as Full_name , o.order_id , o.status 
from customers as c
right join orders as o
on c.customer_id = o.customer_id ;

# Find the total revenue (sum of all orders) generated.
select sum(total_amount) as total_amount from orders;


# Identify customers who have placed more than 3 orders.

select concat( c.first_name ,"-", last_name ) as Full_name , count(o.order_id) as no_of_orders
from customers as c
join orders as o
on c.customer_id = o.customer_id
group by c.customer_id , full_name
having no_of_orders > 3;

# Retrieve all completed payments and include the associated order details.

select concat(c.first_name , "-" , c.last_name) as full_name , o.order_id , o.orderr_date ,o.total_amount
from customers as c 
join orders as o
on c.customer_id = o.Customer_id
join payments as p
on o.order_id = p.order_id 
where p.payment_status = "completed";

# ______________________________________Advanced Queries _______________________________________________

# Find the top 5 customers who have spent the most on orders.

-- select concat(c.first_name ," ",c.last_name) AS full_name , sum(o.Total_amount) ,
-- rank() over(order by o.total_amount desc) as rankkk
-- from customers as c 
-- join orders as o
-- on c.customer_id = o.Customer_id
-- group by customers;

select customer_id , total_amount from(
 select *,
 rank() over(order by total_amount desc ) as rnkkk
 from orders) as x 
 where rnkkk <= 5 ;
 
  # List all orders where the payment was either ‘Pending’ or ‘Failed’ 

 select * from orders
 where order_id in (select order_id from payments where payment_method in ('Pending' , 'Failed'));


# Find the most popular product category based on the number of orders.

alter table orders
drop column product_id ;

alter table orders
add column product_id int ;
   

select * from orders;

UPDATE orders
SET product_id = FLOOR(1 + RAND() * 200)
WHERE order_ID BETWEEN 1 AND 200;

# Find the most popular product category based on the number of orders.

select p.category , count(o.order_id)  as number_of_orders
from products as p
join orders as o
on p.product_id = o.product_id
group by 1
order by number_of_orders desc
limit 1;

# Identify orders that were placed but have no successful payment recorded.

select * from orders
where order_id not in (select order_id from payments where payment_Status = "completed");


# Calculate the average order value (AOV) per customer.


select * from orders;

select customer_id , avg(total_amount) as Avg_amount
from orders
group by 1;


# ____________________________ Business-Oriented Analytical Questions ___________________________________________

# Identify which payment method is most commonly used.

select * from payments;

select payment_method , count(*) as no_of_times
from payments
group by 1
order by no_of_times desc
limit 1;

# Determine the percentage of orders that were canceled.

select * from orders;

select count(order_id) / (Select count(order_id) from orders) *  100 as Cancelled_Percentage
from orders
where status = "Cancelled";

 # Find out the month in which the most orders were placed.

select * from orders;

select monthname(orderr_date)  as monthss, count(*) as No_of_orders from orders
group by monthss
order by No_of_orders desc
limit 1;


# ______________________ Section 4: Data Validation _____________________________________

# Write an SQL query to check if all Orders have a valid customer_id present in the Customers table

select * from customers;







