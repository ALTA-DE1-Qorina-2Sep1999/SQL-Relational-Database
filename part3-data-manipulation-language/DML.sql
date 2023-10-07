--Select table
select * from merk;
select * from product_description;
select * from product_type;
select * from product;
select * from payment_method;
select * from customer;
select * from transaction;
select * from transaction_detail;

insert into product_type (product_name) values ('Serum'),('Toner'), ('Moisturizer');

insert into merk (name) values ('Avoskin'),('COSRX'),('Benton');

insert into product (product_name,stock,price) values ('Serum Avoskin',3,150000), ('Toner COSRX',2, 250000), ('Moisturizer Benton',3,100000);

insert into product_description (description, spesification) values ('Vitamin C 3% + Niacinamide 2%, plus Mandarin Orange Fruit Extract','Serum Vit C'),('Gentle Exfoliatin Toner','Toner AHA+BHA'),('Aloe Propolis Soothing Gel', 'Gel Moisturizer');

insert into payment_method (name) values ('Virtual Account'), ('QRIS'), ('COD');

insert into pelanggan (name, address, dob, status_user, gender, created_at, updated_at) values
('Benedict', 'Malang', '1994-07-09', 'Aktif', 'Laki-Laki', NOW(), NOW()),
('Steve', 'Surabaya', '1983-09-12', 'Tidak Aktif', 'Laki-laki', NOW(), NOW()),
('May', 'Blitar', '1999-09-02','Aktif', 'Perempuan', NOW(), NOW()),
('Karin', 'Jakarta', '1999-09-09', 'Aktif', 'Perempuan', NOW(), NOW()),
('Aaron', 'Balikpapan', '1997-04-12', 'Tidak Aktif', 'Laki-laki', NOW(), NOW());

insert into transaction (customer_id, payment_method_id, date_and_time, paid_amount, status) values 
('3', '2', NOW(),'400000','Dalam Pengiriman'),
('4', '1', NOW(),'100000','Menunggu Pengiriman'),
('3', '2', NOW(),'100000','Menunggu Pembayaran'),
('1', '3', NOW(),'350000','Menunggu Pengiriman'),
('1', '3', NOW(),'250000','Menunggu Pembayaran'),
('2', '1', NOW(),'300000','Menunggu Pengiriman'),
('2', '2', NOW(),'450000','Menunggu Pengiriman'),
('3', '2', NOW(),'100000','Menunggu Pengiriman'),
('3', '3', NOW(),'500000','Menunggu Pembayaran');

INSERT INTO transaction_detail (product_id, transaction_id, qty, price, sub_total) VALUES
('1', '1', '1',(SELECT price FROM product WHERE id = '1'),150000),
('2', '1', '1',(SELECT price FROM product WHERE id = '2'),250000),
('3', '1', '1',(SELECT price FROM product WHERE id = '3'),100000),
('1', '2', '2',(SELECT price FROM product WHERE id = '1'),300000),
('3', '2', '1',(SELECT price FROM product WHERE id = '3'),100000),
('1', '3', '3',(SELECT price FROM product WHERE id = '1'),150000),
('2', '3', '1',(SELECT price FROM product WHERE id = '2'),250000),
('3', '3', '1',(SELECT price FROM product WHERE id = '1'),100000),
('2', '4', '2',(SELECT price FROM product WHERE id = '1'),500000);

SELECT * FROM product;
-- 2. Select

SELECT name FROM customer WHERE gender = 'Laki-laki';

SELECT * FROM product WHERE id ='3';

SELECT * FROM customer WHERE created_at >= current_date AT time zone 'UTC' - interval '7 days' UNION SELECT * FROM customer WHERE name ILIKE 'a%';

SELECT FROM customer COUNT WHERE gender = 'Perempuan';

SELECT * FROM customer ORDER BY name ASC;

SELECT * FROM transaction_detail WHERE product_id ='3' ORDER BY id DESC LIMIT 5;

UPDATE product SET name='Product Dummy' WHERE id=1;

UPDATE transaction_detail SET qty='3' WHERE product_id=1;

DELETE FROM product WHERE id=1;

DELETE FROM product WHERE product_type_id=1;


-- RELEASE 2

SELECT * FROM transaction WHERE id=1 UNION SELECT * FROM transaction WHERE id=2;

SELECT SUM(paid_amount) FROM transaction WHERE customer_id=1;

SELECT COUNT(1) FROM transaction_detail WHERE product_id=2;

SELECT product.id, product_name, stock, price
FROM product
JOIN product_type ON product.id = product_type.id

SELECT transaction.id, transaction.customer_id, transaction.payment_method_id, transaction.date_and_time, transaction.paid_amount, transaction.status
FROM customer
INNER JOIN penjualan ON customer.id=transaction.id;

SELECT nama
FROM product
WHERE id NOT IN
    (SELECT product_id 
     FROM transaction_detail)