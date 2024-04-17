
  
    

   

    USE [online];
    
    

    EXEC('create view "dbt_staging"."stg_product_temp_view" as 

with required_fields as (
    
    SELECT

        prod_id as ProductID, 
        product_category as ProductCategory,
        product_sub_category as ProductSubCategory

    FROM "online"."dbo"."product"
)

SELECT * FROM required_fields;');



    
      EXEC('SELECT * INTO [online].[dbt_staging].[stg_product] FROM [online].[dbt_staging].[stg_product_temp_view];');
    

    
      
      
    
    USE [online];
    EXEC('DROP view IF EXISTS "dbt_staging"."stg_product_temp_view";');



  