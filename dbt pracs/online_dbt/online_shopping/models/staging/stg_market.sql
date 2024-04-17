{{
    config(
        tags=['basic', 'staging']
    )
}}

with required_fields as(
    SELECT *
  FROM {{ source('onlineshop', 'market') }}
),

datatype_conversion AS (
    SELECT 
        ord_id as Ord,
        prod_id as ProductID,
        cust_id as CustomerId,
        ship_id as ShipID,
        CAST(sales AS Decimal(10,4)) AS Sales,
        cast(order_quantity as int) as OrderQuantity,
        cast(profit as Decimal(10,4)) as Profit,
        cast(shipping_cost as Decimal(10,4)) as ShippingCost,
        cast(discount as Decimal(10,4)) as Discount,
        cast(try_cast(product_base_margin as float) as float) as product_base_margin
    FROM required_fields
)

SELECT * FROM datatype_conversion