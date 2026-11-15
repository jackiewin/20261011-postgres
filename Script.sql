-- 原始查詢
SELECT * FROM 目前天氣;

-- 1. 欄位運算與別名：查詢各城市氣溫並計算溫差 (最高溫度 - 最低溫度)
SELECT 城市, 最高溫度, 最低溫度, (最高溫度 - 最低溫度) AS 溫差
FROM 目前天氣;

-- 2. 條件篩選 (WHERE)：篩選高溫達 35 度以上或體感包含「易中暑」的城市
SELECT 城市, 最高溫度, 最低溫度, 感覺
FROM 目前天氣
WHERE 最高溫度 >= 35 OR 感覺 LIKE '%易中暑%';

-- 3. 排序與限制筆數 (ORDER BY & LIMIT)：查詢全台最高溫前 5 名的城市
SELECT 城市, 最高溫度, 最低溫度, 感覺
FROM 目前天氣
ORDER BY 最高溫度 DESC
LIMIT 5;

-- 4. 聚合函數統計 (AVG, MAX, MIN)：統計全台平均氣溫與極端最高/最低溫
SELECT 
    ROUND(AVG(最高溫度)::numeric, 1) AS 平均最高溫,
    ROUND(AVG(最低溫度)::numeric, 1) AS 平均最低溫,
    MAX(最高溫度) AS 全台最高溫,
    MIN(最低溫度) AS 全台最低溫
FROM 目前天氣;

-- 5. 分組與彙總 (GROUP BY & COUNT)：依體感描述分組，統計各類別的城市數量
SELECT 感覺, COUNT(*) AS 城市數量
FROM 目前天氣
GROUP BY 感覺
ORDER BY 城市數量 DESC;
