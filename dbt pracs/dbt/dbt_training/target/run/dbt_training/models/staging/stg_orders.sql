
  
    

   

    USE [practice];
    
    

    EXEC('create view "dbt_staging"."stg_orders_temp_view" as 

WITH

required_fields AS (

    SELECT

        id                  AS order_id
        , user_id           AS customer_id
        , order_date        AS order_date
        , status

    FROM "practice"."dbo"."jaffle_shop_orders"

),

datatype_conversion AS (

    SELECT 

        CAST(order_id AS INT)               AS order_id
        , CAST(customer_id AS INT)          AS customer_id        
        , CONVERT(date, order_date)         AS order_date
        , status

    FROM required_fields

)

SELECT * FROM datatype_conversion;');



    
      EXEC('SELECT * INTO [practice].[dbt_staging].[stg_orders] FROM [practice].[dbt_staging].[stg_orders_temp_view];');
    

    
      
      
    
    USE [practice];
    EXEC('DROP view IF EXISTS "dbt_staging"."stg_orders_temp_view";');



  