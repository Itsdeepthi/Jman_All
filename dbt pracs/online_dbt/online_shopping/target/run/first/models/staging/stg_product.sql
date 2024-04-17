USE [master];
    
    

    EXEC('create view "dbt"."stg_product" as 

with required_fields as (
    
    SELECT

        prod_id as ProductID, 
        product_category as ProductCategory,
        product_sub_category as ProductSubCategory

    FROM "online"."dbo"."product"
)

SELECT * FROM required_fields;');


