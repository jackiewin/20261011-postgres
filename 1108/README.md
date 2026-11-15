# PostgreSQL 課程專案

## 專案說明
本專案演示如何使用 PostgreSQL 建立企業費用申報系統的資料庫結構和資料。

## 資料庫結構
- expense_departments: 部門資訊表
- expense_employees: 員工資訊表  
- expense_categories: 費用類別表
- expense_claims: 費用申報表

## 安全性注意事項
1. 此腳本僅供學習用途
2. 在實際生產環境中需要添加適當的安全措施
3. 請勿在未經授權的系統中執行此腳本

## 執行方式
```sql
-- 執行資料庫建立腳本
psql -U username -d database_name -f expense_database.sql

-- 或者直接在 PostgreSQL 中執行
\i expense_database.sql
```

## 組件清單
- PostgreSQL 12+
- 資料庫連接工具

## 安全性分析
請參閱 security_analysis.md 檔案以獲取詳細的安全性分析報告。