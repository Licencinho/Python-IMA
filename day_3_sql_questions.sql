-- Day 3 SQL Questions

-- 1) How many orders were received for products with a category_id = 2

SELECT count(id) FROM `orders` WHERE category_id =2;

-- 2) How many orders were received with a category_id of either 2, 4, or 5

SELECT count(id) FROM `orders` 
WHERE (category_id =2 or category_id=4 or category_id =5)

-- 3) How many order are there with a price over £35.00 

SELECT count(id) FROM `orders` 
WHERE price > 35

-- 4) How many orders are there where the customer has a date of birth before 1st January 1980 and want to receive the newsletter

SELECT count(id) FROM `orders` 
WHERE date_of_birth < '1980-01-01'
AND newsletter = 1

-- 5)  How many customers named Davenport placed orders?

SELECT customer_firstname, customer_surname, count(id) as number_of_orders FROM `orders` 
WHERE customer_surname = "Davenport"
group by customer_firstname

-- The query returns two rows, which means only 2 customers named Davenport placed orders. Since there isn't a customer_id, I'm assuming customers with the same name are the same customer.

-- 6) Which customer with a firstname starting with 'Br', had the most orders

SELECT customer_firstname, customer_surname, count(id) as number_of_orders FROM `orders` 
WHERE customer_firstname LIKE "Br%"
group by customer_firstname, customer_surname
order by number_of_orders desc

-- There's a tie between 4 customers, who all placed 1 order

-- 7) List all orders with products from category 3 by order of price, highest first.

SELECT * FROM `orders` 
WHERE category_id = 3
order by price desc

-- 8) Select the following fields from all orders (trans_date, price, promo_code) renaming the colum (field) headings ('Transaction Date', 'Price' & 'Promotion Code')

SELECT id, trans_date as "Transaction Date", price as "Price", promo_code as "Promotional Code"  
FROM `orders` 

-- 9) Select the following fields (customer_surname, customer_firstname, county) from all orders, with customer names in a single field named 'Customer Name' and in the format <Surname>, <Firstname>, with surname capitalised.  The county field is to be renamed 'County'.

SELECT id, CONCAT(UPPER(customer_surname), ', ', customer_firstname) as "Customer Name", county as "County" 
FROM `orders`

-- 10)	Select the average price, minimum price & maximum price for each category.

SELECT category_id, avg(price), min(price), max(price)
FROM `orders` 
group by category_id

-- 11) 	Select the category_name (labelled 'Category', number of sales (labelled 'Total Orders') & total sales (labelled 'Total Sales') for each category.

SELECT category_name as "Category", count(orders.id) as "Total Orders", sum(price) as "Total Sales" 
FROM `orders`, categories
WHERE category_id = categories.id
group by category_id

-- 12) 	List all orders with the following fields (with the labls given) orders.trans_date('Transaction Date'), categories.category_name('Category'), orders.customer_surname('Surname'), orders.customer_firstname('Firstname'), orders.price('Order Price'), categories.category_name('Category'), promotions.discount('Discounted by') 

SELECT orders.id, orders.trans_date as 'Transaction Date', categories.category_name as 'Category', orders.customer_surname as'Surname', orders.customer_firstname as 'Firstname', orders.price as 'Order Price', promotions.discount as 'Discounted by'
FROM `orders`, categories, promotions
WHERE category_id = categories.id
AND promotions.code = promo_code