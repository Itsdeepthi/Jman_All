{{
    config(
        tags=['basic', 'staging']
    )
}}

with required_fields as (
    
    SELECT

        prod_id as ProductID, 
        product_category as ProductCategory,
        product_sub_category as ProductSubCategory

    FROM {{ source('onlineshop', 'product') }}
)

SELECT * FROM required_fields




