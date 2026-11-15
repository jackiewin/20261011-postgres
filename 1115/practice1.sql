CREATE TABLE IF NOT EXISTS stores (
    store_id SERIAL PRIMARY KEY,      -- 門市編號，自動產生
    name     VARCHAR(30)  NOT NULL,   -- 門市名稱，必填
    address  VARCHAR(100) NOT NULL,   -- 地址，必填
    region   VARCHAR(10)  NOT NULL,   -- 區域：北部、中部、南部
    phone    VARCHAR(20)              -- 電話，可以空白
);


CREATE TABLE IF NOT EXISTS public."商店" (
    "商店id" SERIAL PRIMARY KEY, -- 這是註解
    "名稱"   VARCHAR(100) NOT NULL,
    "地址"   VARCHAR(255) NOT NULL,
    "區域"   VARCHAR(50) NOT NULL,
    "電話"   VARCHAR(30)
);

alter table stores add column seat_count int default 0;

alter table stores drop column seat_count;

alter table stores rename column phone to tel;

alter table stores rename column tel to phone;

create table temp_notes(note text);

drop table if exists temp_notes ;

-- 建立員工表 employees (中文欄位版)
CREATE TABLE IF NOT EXISTS public.employees (
    "員工編號" SERIAL PRIMARY KEY,        -- 自動產生、主鍵
    "姓名"     VARCHAR(50) NOT NULL,      -- 必填
    "職稱"     VARCHAR(50) NOT NULL,      -- 必填
    "到職日"   DATE NOT NULL,             -- 日期格式、必填
    "月薪"     INT NOT NULL CHECK ("月薪" > 0) -- 整數、必填
);

drop table employees ;


-- 建立員工表 employees
CREATE TABLE IF NOT EXISTS public.employees (
    employee_id  SERIAL PRIMARY KEY,      -- 員工編號：自動產生流水號、主鍵
    name         VARCHAR(50) NOT NULL,    -- 姓名：字串、必填
    job_title    VARCHAR(50) NOT NULL,    -- 職稱：字串、必填
    hire_date    DATE NOT NULL,           -- 到職日：日期型態 (YYYY-MM-DD)、必填
    salary       INT NOT NULL CHECK (salary > 0) -- 月薪：整數、必填 (並確保大於 0)
);

-- (選用) 加入註解說明
COMMENT ON TABLE public.employees IS '員工基本資料表';
COMMENT ON COLUMN public.employees.employee_id IS '員工編號 (流水號主鍵)';
COMMENT ON COLUMN public.employees.name IS '員工姓名';
COMMENT ON COLUMN public.employees.job_title IS '職稱 / 職位';
COMMENT ON COLUMN public.employees.hire_date IS '到職日期';
COMMENT ON COLUMN public.employees.salary IS '每月薪資 (新台幣整數)';


-- 1. 新增欄位 line_id (文字型態，可為 NULL)
ALTER TABLE public.employees 
ADD COLUMN line_id VARCHAR(50);

-- 2. 刪除欄位 line_id
ALTER TABLE public.employees 
DROP COLUMN line_id;

-- 💡 (進階安全寫法：若欄位存在才刪除，避免欄位不存在時報錯)
 ALTER TABLE public.employees DROP COLUMN IF EXISTS line_id;


CREATE TABLE sample_products (
    product_id SERIAL PRIMARY KEY,                     -- 身分證
    name       VARCHAR(50) NOT NULL UNIQUE,            -- 必填且不可重複
    price      NUMERIC(10, 2) NOT NULL CHECK (price >= 0), -- 售價不可為負
    cost       NUMERIC(10, 2) CHECK (cost >= 0),       -- 成本不可為負
    is_active  BOOLEAN NOT NULL DEFAULT true,          -- 沒填就是供應中
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP   -- 沒填就是現在時間
);

-- DML
INSERT INTO sample_products (name, price, cost) VALUES ('經典拿鐵', 95, 35);

INSERT INTO sample_products (name, price) 
VALUES ('經典拿鐵', 80)
ON CONFLICT (name) DO NOTHING;

INSERT INTO sample_products (name, price) 
VALUES ('經典拿鐵', 85)
ON CONFLICT (name) DO UPDATE 
SET price = EXCLUDED.price;
