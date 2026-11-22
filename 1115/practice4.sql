SELECT 
	name as "姓名", 
	region as "區域", 
	phone as "電話"
FROM stores;


--每項商品賺多少
select  name as "商品", price as "售價" ,cost as "成本" , price - cost as "毛利"
from products ;

select region from stores;

select distinct  region from stores;


select name ,price
from products
where price > 120;

select count(*) as "筆數"
from orders where order_date between '2024-03-01' and '2024-03-31'
and payment_method = '信用卡'
and status = '已完成';


--
select name , price
from products 
order by price desc
limit 3;

-- OR：符合其中一個就算。電子支付的訂單前 3 筆
SELECT order_id, payment_method
FROM orders
WHERE payment_method = 'LINE Pay' OR payment_method = '街口支付'
ORDER BY order_id
LIMIT 3;

SELECT COUNT(*) AS 散客訂單數
FROM orders
WHERE customer_id IS NULL;

-- 先依區域，同區域再依門市名稱
SELECT region, name
FROM stores
ORDER BY region, name;


--最貴的前三名
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 3;

--每頁 5 筆，第 2 頁就是跳過前 5 筆
SELECT product_id, name
FROM products
ORDER BY product_id
LIMIT 5 OFFSET 5;




