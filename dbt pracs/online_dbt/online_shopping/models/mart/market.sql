{{
    config(
        tags=['mart','market']
    )
}}
 
WITH
Customers AS (
    SELECT
        *
    FROM {{ ref('stg_customer') }}
),
 
Products AS (
    SELECT
        *
    FROM {{ ref('stg_product') }}
),
 
Markets AS (
    SELECT
        *
    FROM {{ ref('stg_market') }}
),
 
NotNunavut AS (
    SELECT
        cu.*
    FROM customers as cu
    WHERE UPPER(cu.Region) != 'NUNAVUT'
),
 
final AS (
    SELECT nn.*, pro.ProductCategory, pro.ProductSubCategory from
    NotNunavut as nn
    JOIN markets as mark
    on nn.CustomerID=mark.CustomerId
    join products as pro
    on mark.ProductID=pro.ProductId
)
 
select * from final