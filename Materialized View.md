---
tags:
  - SQL
  - Databases
---
Database object to store the SQL query along with the data returned from the query.

```sql
CREATE MATERIALIZED VIEW materialized_view_name    
BUILD [IMMEDIATE | DEFERRED]    
REFRESH [FAST | COMPLETE | FORCE]    
ON [COMMIT | DEMAND]    
AS    
SELECT column1, column2, ...    
FROM table_name    
WHERE condition;
```

Need to be refreshed to update with the latest SQL response.