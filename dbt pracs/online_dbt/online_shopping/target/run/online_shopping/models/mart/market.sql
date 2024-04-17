
  
    

   

    USE [online];
    
    

    EXEC('create view "dbt_mart"."market_temp_view" as 
 
WITH
Customers AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_customer"
),
 
Products AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_product"
),
 
Markets AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_market"
),
 
NotNunavut AS (
    SELECT
        cu.*
    FROM customers as cu
    WHERE UPPER(cu.Region) != ''NUNAVUT''
),
 
final AS (
    SELECT nn.*, pro.ProductCategory, pro.ProductSubCategory from
    NotNunavut as nn
    JOIN markets as mark
    on nn.CustomerID=mark.CustomerId
    join products as pro
    on mark.ProductID=pro.ProductId
)
 
select * from final;');



    
      EXEC('SELECT * INTO [online].[dbt_mart].[market] FROM [online].[dbt_mart].[market_temp_view];');
    

    
      
      
    
    USE [online];
    EXEC('DROP view IF EXISTS "dbt_mart"."market_temp_view";');



  