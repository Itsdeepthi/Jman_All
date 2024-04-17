USE [master];
    
    

    EXEC('create view "dbt"."stg_order" as 

with required_fields as(
    SELECT Order_ID
      ,Order_Date
      ,Order_Priority
      ,Ord_id
  FROM "online"."dbo"."order"
),

datatype_conversion AS (

    SELECT 

        CAST(order_id AS INT) AS OrderID,
        CONVERT(date, order_date) AS OrderDate,
        Order_Priority,
        Ord_id

    FROM required_fields

)

SELECT * FROM datatype_conversion;');


