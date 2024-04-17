
  
    

   

    USE [practice];
    
    

    EXEC('create view "dbt_mart"."customer_temp_view" as 

WITH

stg_customer AS (

    SELECT

        *

    FROM "practice"."dbt_staging"."stg_customers"

),

stg_orders AS (

    SELECT

        *

    FROM "practice"."dbt_staging"."stg_orders"

),

order_info AS (

    SELECT

        customer_id
        , COUNT(*)      AS total_orders

    FROM stg_orders

    GROUP BY 
        customer_id

),

final AS (

    SELECT 

        sc.*
        , oi.total_orders

    FROM stg_customer sc

    LEFT JOIN order_info oi
        ON sc.customer_id = oi.customer_id
)

SELECT * FROM final;');



    
      EXEC('SELECT * INTO [practice].[dbt_mart].[customer] FROM [practice].[dbt_mart].[customer_temp_view];');
    

    
      
      
    
    USE [practice];
    EXEC('DROP view IF EXISTS "dbt_mart"."customer_temp_view";');



  