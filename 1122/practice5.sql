CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    name    VARCHAR(50) NOT NULL
);

CREATE TABLE promo_items (
    promo_id       INT PRIMARY KEY,
    name           VARCHAR(50) NOT NULL,
    discount_price INT NOT NULL
);

INSERT INTO menu_items VALUES
    (1, '美式咖啡'), (2, '拿鐵咖啡'), (3, '卡布奇諾'), (4, '焦糖瑪奇朵');

INSERT INTO promo_items VALUES
    (101, '拿鐵咖啡', 99), (102, '美式咖啡', 69),
    (103, '西西里檸檬咖啡', 89), (104, '燕麥奶拿鐵', 109);

