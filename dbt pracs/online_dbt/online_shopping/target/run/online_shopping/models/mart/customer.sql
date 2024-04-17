
  
    

   

    USE [online];
    
    

    EXEC('create view "dbt_mart"."customer_temp_view" as 
 
WITH notnunavut AS (
    SELECT *
    FROM "online"."dbt_staging"."stg_customer"
    WHERE region != ''NUNAVUT''
),
 
joincustmark AS (
    SELECT
        cu.CustomerId,
        cu.CustomerName,
        cu.Province,
        cu.CustomerSegment,
        ma.Ord,
        ma.Sales
    FROM notnunavut as cu
    JOIN "online"."dbt_staging"."stg_market" as ma ON cu.CustomerId = ma.CustomerId
),
 
joincustorder AS (
    SELECT
        cus.CustomerId,
        cus.CustomerName,
        cus.Province,
        cus.CustomerSegment,
        ord.OrdID,
        cus.Sales,
        ord.OrderDate
    FROM joincustmark as cus
    JOIN "online"."dbt_staging"."stg_order" as ord ON cus.Ord = ord.OrdID
),
 
finalcustorder AS (
    SELECT
        CustomerId,
        CustomerName,
        Province,
        CustomerSegment,
        MIN(OrderDate) AS FirstOrderDate,
        MAX(OrderDate) AS RecentOrderDate,
        COUNT(OrdId) AS TotalOrders,
        SUM(cast(Sales as DECIMAL(10,5))) AS TotalAmount
    FROM joincustorder
    GROUP BY CustomerId, CustomerName, Province, CustomerSegment
)
 
SELECT * FROM finalcustorder;');



    
      EXEC('SELECT * INTO [online].[dbt_mart].[customer] FROM [online].[dbt_mart].[customer_temp_view];');
    

    
      
      
    
    USE [online];
    EXEC('DROP view IF EXISTS "dbt_mart"."customer_temp_view";');



  