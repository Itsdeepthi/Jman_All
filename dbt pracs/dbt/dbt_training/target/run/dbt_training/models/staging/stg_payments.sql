
  
    

   

    USE [practice];
    
    

    EXEC('create view "dbt_staging"."stg_payments_temp_view" as 

WITH

required_fields AS(

    SELECT

        *

    FROM "practice"."dbo"."stripe_payments"

),

datatype_and_renamed AS (

    SELECT

        CAST(id AS INT)             AS id
        , CAST(orderid AS INT)     AS order_id
        , paymentmethod
        , CAST(amount AS INT)       AS amount

    FROM required_fields

)

SELECT * FROM datatype_and_renamed;');



    
      EXEC('SELECT * INTO [practice].[dbt_staging].[stg_payments] FROM [practice].[dbt_staging].[stg_payments_temp_view];');
    

    
      
      
    
    USE [practice];
    EXEC('DROP view IF EXISTS "dbt_staging"."stg_payments_temp_view";');



  