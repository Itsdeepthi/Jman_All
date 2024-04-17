
  
    

   

    USE [online];
    
    

    EXEC('create view "dbt_staging"."stg_shipping_temp_view" as 

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
        CONVERT(date, ship_date,105) AS ShipDate,
        Ship_mode as ShipMode,
        ship_id as ShipID

    FROM required_fields

)

SELECT * FROM datatype_conversion;');



    
      EXEC('SELECT * INTO [online].[dbt_staging].[stg_shipping] FROM [online].[dbt_staging].[stg_shipping_temp_view];');
    

    
      
      
    
    USE [online];
    EXEC('DROP view IF EXISTS "dbt_staging"."stg_shipping_temp_view";');



  