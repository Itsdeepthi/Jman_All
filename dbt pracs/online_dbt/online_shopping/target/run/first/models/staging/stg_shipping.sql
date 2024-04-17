USE [master];
    
    

    EXEC('create view "dbt"."stg_shipping" as 

with required_fields as(
    SELECT Order_ID,
       Ship_mode
      ,Ship_Date
      ,ship_id
  FROM "online"."dbo"."shipping"
),

datatype_conversion AS (

    SELECT 

        CAST(order_id AS INT) AS OrderId,
        CONVERT(date, ship_date) AS ShipDate,
        Ship_mode,
        ship_id

    FROM required_fields

)

SELECT * FROM datatype_conversion;');


