-- 若表格存在先清理（CASCADE 會一併解除外鍵關聯）
DROP TABLE IF EXISTS fk_staff CASCADE;
DROP TABLE IF EXISTS fk_stores CASCADE;

CREATE TABLE fk_stores (
    store_id SERIAL PRIMARY KEY,
    name     VARCHAR(30) NOT NULL
);

CREATE TABLE fk_staff (
    staff_id SERIAL PRIMARY KEY,
    name     VARCHAR(20) NOT NULL,
    store_id INT REFERENCES fk_stores(store_id)
);

INSERT INTO fk_stores (name) VALUES ('台北信義店'), ('台中逢甲店');
INSERT INTO fk_staff (name, store_id) VALUES ('張志明', 1), ('陳美玲', 1), ('許淑芬', 2);

--保護資料完整性

insert into fk_staff(name, store_id)
values ('幽靈員工', 99);

delete from fk_stores 
where store_id = 1;
