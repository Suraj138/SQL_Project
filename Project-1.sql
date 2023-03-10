CREATE DATABASE project1;
USE project1;
CUSTOMER TABLE:-

CREATE TABLE customer(
cust_id INT PRIMARY KEY,
NAME CHAR(20),
cust_city CHAR(20),
cont_no CHAR(15),
gender CHAR(1),
date_of_birth DATE,
email CHAR(10),
delevery_add CHAR(20),
cust_type CHAR(10),
cart_id INT,
FOREIGN KEY(cart_id) REFERENCES cart(cart_id)
);


CREATE TABLE seller(
seller_id INT PRIMARY KEY,
NAME CHAR(20),
mobile_no CHAR(15),
PASSWORD CHAR(20),
cate_prod CHAR(20)
);

CREATE TABLE product(
prod_id INT PRIMARY KEY,
seller_id INT,
NAME CHAR(20),
color CHAR(10),
size CHAR(5),
quantity_avil INT,
price INT,
STATUS CHAR(20),
tags CHAR(10),
discount_id INT,
delivery_id INT,
is_featured CHAR(5),
is_on_sale CHAR(5)
);


CREATE TABLE orders(
order_id INT PRIMARY KEY,
order_date DATE,
cust_id INT,
prod_id INT,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE cart(
cart_id INT PRIMARY KEY,
prod_id INT,
quantity INT,
size CHAR(1)
);

CREATE TABLE delivery(
delivery_id INT PRIMARY KEY,
tracking_id CHAR(10),
expected_date DATE,
delivery_date DATE,
order_id INT,
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);


CREATE TABLE discount(
discount_id CHAR(10) PRIMARY KEY,
discount_percent CHAR(10),
prod_id INT
);

SELECT * FROM discount;

CREATE TABLE payment(
payment_id INT PRIMARY KEY,
pay_date DATE,
amount INT,
prod_id INT,
invoice_no INT,
order_id INT,
FOREIGN KEY(prod_id) REFERENCES product(prod_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);


CREATE TABLE Users(
user_id INT PRIMARY KEY,
NAME CHAR(20),
PASSWORD CHAR(20),
addresh CHAR(20)
);

CREATE TABLE category(
cat_id INT PRIMARY KEY,
cat_name CHAR(20),
subcategory CHAR(10),
brand CHAR(10),
image CHAR(10),
quest CHAR(20),
tags CHAR(5),
DESCRIPTION CHAR(20),
prod_id INT,
FOREIGN KEY(prod_id) REFERENCES product(prod_id)
);

CREATE TABLE review(
review_id INT PRIMARY KEY,
reviewer_name CHAR(20),
prod_id INT,
popularity_index CHAR(10),
avg_rating INT(10),
total_rating INT(10),
review_country CHAR(10)
); 


SHOW CREATE TABLE customer;


--  INSERTING DATA into THE Table   --

DROP TABLE customer;
INSERT INTO customer VALUES(01,'Amrit','Delhi',787755876,'M','2012-2-19','suraj@com','chadanichok','normal',1001),
			(02,'Jim','Haryana',995445366,'F','1998-5-14','abs@com','murthal','primum',1002),
			(03,'kevin','Bhopal',70776464,'M','2002-8-12','dsd@com','indrpuri','normal',1003),
			(04,'Sandhya','Ranchi',806646875,'F','2001-1-6','hdhjs@.com','dhani','normal',1004),
			(05,'Suraj','Jharkhand',986207723,'M','1995-2-19','den@.com','deoghar','primum',1005);
INSERT INTO customer VALUES(06,'Ankita','Goa',7846207723,'M','2005-2-11','den@.com','sjuij','normal',1006);
INSERT INTO customer VALUES(07,'Akansha','Puna',705986207723,'M','208-2-09','den@.com','funji','primum',1007);
			
			
			
DROP TABLE customer;
SELECT * FROM customer;

INSERT INTO seller VALUES(001,'Rakesh',9430321469,'abcd@123','winter'),
			 (002,'Saurav',9999768678,'acac@123','summer'),
			 (003,'Hritik',9995485857,'jklmn@123','rainy'),
			 (004,'Shankar',989620773,'qwewr@123','monsoon'),
			 (005,'Suraj',8083638912,'uopop@123','autumn');

INSERT INTO product VALUES(201,001,'Jense','Blue','M',11,1250,'available','A11D00',250,0011,'warm','yes');
INSERT INTO product VALUES(202,002,'T-shirt','White','M',15,500,'available','A22D00',250,0012,'warm','yes');
INSERT INTO product VALUES(203,003,'Shirt','Red','Xl',20,800,'available','A33D5',250,0013,'warm','yes');
INSERT INTO product VALUES(204,004,'Jacket','Sky Blue','M',5,3550,'unavailable','A44D45',250,0014,'warm','no');
INSERT INTO product VALUES(205,005,'Shooe','Black','L',10,2500,'available','A56D08',250,0015,'warm','yes');
SELECT * FROM product;



INSERT INTO cart VALUES(1001,201,2,'L'),
		       (1002,202,4,'M'),
		       (1003,203,7,'M'),
		       (1004,204,1,'L'),
		       (1005,205,8,'M');
INSERT INTO cart VALUES(1006,206,6,'L');
INSERT INTO cart VALUES(1007,207,5,'M');

INSERT INTO orders VALUES(101,'2022-10-12',01,201),
			(102,'2022-10-15',02,202),
			(103,'2022-10-18',03,203),
			(104,'2022-10-25',04,204),
			(105,'2022-11-05',05,205);
INSERT INTO orders VALUES(106,'2022-11-28',06,206);
INSERT INTO orders VALUES(107,'2022-11-12',07,207);

SELECT * FROM orders;
			
INSERT INTO payment VALUES(1102,'2022-12-1',345,1,00012,1),
			(2322,'2022-11-9',800,2,00013,2),
			(2334,'2022-12-5',750,3,00015,3),
			(2006,'2022-12-1',3000,4,00017,4),
			(2840,'2022-12-2',2500,5,00018,5);
SELECT * FROM category ;
DROP TABLE payment;

INSERT INTO review VALUES(1015,'Suraj',201,'Excelent',9,10,'India'),
			 (1016,'Keshav',202,'Very good',8,10,'India'),
			 (1017,'Depansh',203,'Nice',10,10,'India'),
			 (1018,'Deepak',204,'Excelent',8,10,'India'),
			 (1019,'Shashi',205,'Nice prod',7,10,'India');
			 
INSERT INTO category VALUES(1001,'Ramesh','Formal','Puma','PUMA','hdahdadjo','T2','huadhadhua',201),
			(1002,'Rakesh','Causual','Adidas','AD','hdahdadjo','T5','huadhadhua',202),
			(1003,'Shankar','Formal','Nike','NI','hdahdadjo','T7','huadhadhua',203),
			(1004,'Vishal','Sporty','Woodland','WD','hdahdadjo','T4','huadhadhua',204),
			(1005,'Guddu','Formal','Reebok','RBK','hdahdadjo','T0','huadhadhua',205);

INSERT INTO payment VALUES(11001,'2022-10-05',5500,201,100011,101),
			(11002,'2022-10-17',1500,202,100012,102),
			(11003,'2022-10-25',2500,203,100055,103),
			(11004,'2022-11-05',5000,204,100054,104),
			(11005,'2022-11-11',8000,205,100045,105);
			
INSERT INTO delivery VALUES(555,'ASD12D45','2022-11-25','2022-11-27',101),
			(556,'ASD13D85','2022-10-21','2022-10-27',102),
			(557,'ASD14D78','2022-10-14','2022-10-17',103),
			(558,'ASD15D77','2022-11-05','2022-11-09',104),
			(559,'ASD16D12','2022-11-11','2022-11-17',105);

INSERT INTO discount VALUES('XYA12EG22','10%',201),
			('XYA10EG72','10%',202),
			('XYA52EG44','10%',203),
			('XYA42EG41','10%',204),
			('XYA22EG20','10%',205);

INSERT INTO Users VALUES(555,'Harish','asajd@gdw','Delhi');

ALTER TABLE orders ADD COLUMN(order_status CHAR(20));

SELECT * FROM orders;

UPDATE orders SET order_status = 'delivered'
WHERE order_id = 103;

UPDATE delivery SET order_status = 'delivered'
WHERE delivery_id = 557;

UPDATE product SET prod_price = 15000
WHERE prod_id = 202;

INSERT INTO orders VALUES(108, '2022-08-15', 3, 202, 'delivered');
SELECT * FROM orders WHERE order_status ='delivered';
--   Querry for Question Answer   --
1)
SELECT * FROM customer ORDER BY cust_city;

2)
ALTER TABLE product 
RENAME COLUMN NAME  TO prod_name,
RENAME COLUMN color TO prod_color,
RENAME COLUMN size TO prod_size,
RENAME COLUMN quantity_avil TO prod_quantity_avil,
RENAME COLUMN price TO prod_price,
RENAME COLUMN STATUS TO prod_status,
RENAME COLUMN tags TO prod_tags;
SELECT * FROM product;

3)
SELECT customer.name FROM customer
INNER JOIN orders
ON customer.cust_id=orders.cust_id;

4)
SELECT customer.name,customer.cust_city,customer.cont_no FROM customer
INNER JOIN orders
ON customer.cust_id=orders.cust_id
WHERE customer.name LIKE 'A%A';

5)
SELECT order_id,order_date, cust_id, order_status, prod_id FROM orders
WHERE order_status = 'delivered'
AND prod_id IN (SELECT prod_id FROM product WHERE prod_price>10000)
GROUP BY order_id;

6)
DELIMITER &&  
CREATE PROCEDURE customer_db ()  
BEGIN  
    CREATE DATABASE project1;
	CREATE TABLE customer(
cust_id INT PRIMARY KEY,
NAME CHAR(20),
cust_city CHAR(20),
cont_no CHAR(15),
gender CHAR(1),
date_of_birth DATE,
email CHAR(10),
delevery_add CHAR(20),
cust_type CHAR(10),
cart_id INT,
FOREIGN KEY(cart_id) REFERENCES cart(cart_id)
);
CREATE TABLE seller(
seller_id INT PRIMARY KEY,
NAME CHAR(20),
mobile_no CHAR(15),
PASSWORD CHAR(20),
cate_prod CHAR(20)
);
CREATE TABLE product(
prod_id INT PRIMARY KEY,
seller_id INT,
NAME CHAR(20),
color CHAR(10),
size CHAR(5),
quantity_avil INT,
price INT,
STATUS CHAR(20),
tags CHAR(10),
discount_id INT,
delivery_id INT,
is_featured CHAR(5),
is_on_sale CHAR(5)
);
CREATE TABLE orders(
order_id INT PRIMARY KEY,
order_date DATE,
cust_id INT,
prod_id INT,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id)
);
CREATE TABLE cart(
cart_id INT PRIMARY KEY,
prod_id INT,
quantity INT,
size CHAR(1)
);
CREATE TABLE delivery(
delivery_id INT PRIMARY KEY,
tracking_id CHAR(10),
expected_date DATE,
delivery_date DATE,
order_id INT,
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
CREATE TABLE discount(
discount_id CHAR(10) PRIMARY KEY,
discount_percent CHAR(10),
prod_id INT
);
CREATE TABLE payment(
payment_id INT PRIMARY KEY,
pay_date DATE,
amount INT,
prod_id INT,
invoice_no INT,
order_id INT,
FOREIGN KEY(prod_id) REFERENCES product(prod_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
CREATE TABLE Users(
user_id INT PRIMARY KEY,
NAME CHAR(20),
PASSWORD CHAR(20),
addresh CHAR(20)
);
CREATE TABLE category(
cat_id INT PRIMARY KEY,
cat_name CHAR(20),
subcategory CHAR(10),
brand CHAR(10),
image CHAR(10),
quest CHAR(20),
tags CHAR(5),
DESCRIPTION CHAR(20),
prod_id INT,
FOREIGN KEY(prod_id) REFERENCES product(prod_id)
);
CREATE TABLE review(
review_id INT PRIMARY KEY,
reviewer_name CHAR(20),
prod_id INT,
popularity_index CHAR(10),
avg_rating INT(10),
total_rating INT(10),
review_country CHAR(10)
); 
SHOW CREATE TABLE customer;
INSERT INTO customer VALUES(01,'Amrit','Delhi',787755876,'M','2012-2-19','suraj@com','chadanichok','normal',1001),
			(02,'Jim','Haryana',995445366,'F','1998-5-14','abs@com','murthal','primum',1002),
			(03,'kevin','Bhopal',70776464,'M','2002-8-12','dsd@com','indrpuri','normal',1003),
			(04,'Sandhya','Ranchi',806646875,'F','2001-1-6','hdhjs@.com','dhani','normal',1004),
			(05,'Suraj','Jharkhand',986207723,'M','1995-2-19','den@.com','deoghar','primum',1005);
INSERT INTO customer VALUES(06,'Ankita','Goa',7846207723,'M','2005-2-11','den@.com','sjuij','normal',1006);
INSERT INTO customer VALUES(07,'Akansha','Puna',705986207723,'M','208-2-09','den@.com','funji','primum',1007);
INSERT INTO seller VALUES(001,'Rakesh',9430321469,'abcd@123','winter'),
			 (002,'Saurav',9999768678,'acac@123','summer'),
			 (003,'Hritik',9995485857,'jklmn@123','rainy'),
			 (004,'Shankar',989620773,'qwewr@123','monsoon'),
			 (005,'Suraj',8083638912,'uopop@123','autumn');
INSERT INTO product VALUES(201,001,'Jense','Blue','M',11,1250,'available','A11D00',250,0011,'warm','yes');
INSERT INTO product VALUES(202,002,'T-shirt','White','M',15,500,'available','A22D00',250,0012,'warm','yes');
INSERT INTO product VALUES(203,003,'Shirt','Red','Xl',20,800,'available','A33D5',250,0013,'warm','yes');
INSERT INTO product VALUES(204,004,'Jacket','Sky Blue','M',5,3550,'unavailable','A44D45',250,0014,'warm','no');
INSERT INTO product VALUES(205,005,'Shooe','Black','L',10,2500,'available','A56D08',250,0015,'warm','yes');
INSERT INTO cart VALUES(1001,201,2,'L'),
		       (1002,202,4,'M'),
		       (1003,203,7,'M'),
		       (1004,204,1,'L'),
		       (1005,205,8,'M');
INSERT INTO cart VALUES(1006,206,6,'L');
INSERT INTO cart VALUES(1007,207,5,'M');

INSERT INTO orders VALUES(101,'2022-10-12',01,201),
			(102,'2022-10-15',02,202),
			(103,'2022-10-18',03,203),
			(104,'2022-10-25',04,204),
			(105,'2022-11-05',05,205);
INSERT INTO orders VALUES(106,'2022-11-28',06,206);
INSERT INTO orders VALUES(107,'2022-11-12',07,207);
INSERT INTO payment VALUES(1102,'2022-12-1',345,1,00012,1),
			(2322,'2022-11-9',800,2,00013,2),
			(2334,'2022-12-5',750,3,00015,3),
			(2006,'2022-12-1',3000,4,00017,4),
			(2840,'2022-12-2',2500,5,00018,5);
INSERT INTO review VALUES(1015,'Suraj',201,'Excelent',9,10,'India'),
			 (1016,'Keshav',202,'Very good',8,10,'India'),
			 (1017,'Depansh',203,'Nice',10,10,'India'),
			 (1018,'Deepak',204,'Excelent',8,10,'India'),
			 (1019,'Shashi',205,'Nice prod',7,10,'India');
			 
INSERT INTO category VALUES(1001,'Ramesh','Formal','Puma','PUMA','hdahdadjo','T2','huadhadhua',201),
			(1002,'Rakesh','Causual','Adidas','AD','hdahdadjo','T5','huadhadhua',202),
			(1003,'Shankar','Formal','Nike','NI','hdahdadjo','T7','huadhadhua',203),
			(1004,'Vishal','Sporty','Woodland','WD','hdahdadjo','T4','huadhadhua',204),
			(1005,'Guddu','Formal','Reebok','RBK','hdahdadjo','T0','huadhadhua',205);

INSERT INTO payment VALUES(11001,'2022-10-05',5500,201,100011,101),
			(11002,'2022-10-17',1500,202,100012,102),
			(11003,'2022-10-25',2500,203,100055,103),
			(11004,'2022-11-05',5000,204,100054,104),
			(11005,'2022-11-11',8000,205,100045,105);
			
INSERT INTO delivery VALUES(555,'ASD12D45','2022-11-25','2022-11-27',101),
			(556,'ASD13D85','2022-10-21','2022-10-27',102),
			(557,'ASD14D78','2022-10-14','2022-10-17',103),
			(558,'ASD15D77','2022-11-05','2022-11-09',104),
			(559,'ASD16D12','2022-11-11','2022-11-17',105);

INSERT INTO discount VALUES('XYA12EG22','10%',201),
			('XYA10EG72','10%',202),
			('XYA52EG44','10%',203),
			('XYA42EG41','10%',204),
			('XYA22EG20','10%',205);

INSERT INTO Users VALUES(555,'Harish','asajd@gdw','Delhi');

ALTER TABLE orders ADD COLUMN(order_status CHAR(20));

SELECT * FROM orders;

UPDATE orders SET order_status = 'delivered'
WHERE order_id = 103;

UPDATE delivery SET order_status = 'delivered'
WHERE delivery_id = 557;

UPDATE product SET prod_price = 15000
WHERE prod_id = 202;

INSERT INTO orders VALUES(108, '2022-08-15', 3, 202, 'delivered');
SELECT * FROM orders WHERE order_status ='delivered';
END &&  
DELIMITER ;  

