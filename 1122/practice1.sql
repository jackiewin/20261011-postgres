SELECT name,region,phone
FROM stores;

select name as 門市,region as 區域
from stores s ;


--請使用supbase的mcp
列出所有「店長」的姓名和月薪，月薪高的排前面。（表：`staff`，職稱欄：`title`）
請給我sql語法

SELECT name, salary
FROM public.staff
WHERE title = '店長'
ORDER BY salary DESC;

--請使用supbase的mcp
--毛利（`price - cost`）大於 80 元的商品，依毛利由高到低列出。
--請給我sql語法

SELECT name, price, cost, price - cost AS gross_profit
FROM public.products
WHERE price - cost > 80
ORDER BY gross_profit DESC;

--請使用supbase的mcp
有哪幾種付款方式？（不重複）
請給我sql語法

SELECT DISTINCT payment_method
FROM public.orders
ORDER BY payment_method;

--請使用supbase的mcp
2024 年 2 月 14 日情人節當天，有哪些訂單？列出訂單編號、時間和付款方式，依時間排序。
請給我sql語法

SELECT order_id, order_time, payment_method
FROM public.orders
WHERE order_date = DATE '2024-02-14'
ORDER BY order_time, order_id;


