-- returning 回傳修改結果

UPDATE products
SET price = 75
WHERE name = '美式咖啡'
returning product_id , name , price;

--茶飲（分類 2）全部漲 5 元

update products p 
set price = price + 5
where p.category_id = 2
returning category_id , name ,price;

--

insert into products (category_id, name, price, cost, launched_on)
values (1,'過季草莓拿鐵', 130, 50, '2024-01-01')
returning name, price, cost;


delete from products 
where name= '過季草莓拿鐵'
returning product_id , name;

--delete,update保密3步驟
-- 交易可回復 rollback
-- 中間失敗則不改
-- 真正完成commit

BEGIN;
update products p 
set price = 1;

select name, price 
from products p 
order by p.product_id 
limit 3;

rollback ;

begin;

UPDATE products
SET price = 90
WHERE name = '美式咖啡'
returning product_id , name , price;

commit;