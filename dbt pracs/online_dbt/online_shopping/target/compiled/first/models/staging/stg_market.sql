

with required_fields as(
    SELECT *
  FROM "online"."dbo"."market"
),

datatype_conversion AS (

    SELECT 
        ord_id,prod_id,cust_id,ship_id,
        CAST(sales AS Float) AS Sales,
        CAST(discount as Float) as Discount,
        cast(order_quantity as int) as OrderQuantity,
        cast(profit as Float) as Profit,
        cast(shipping_cost as Float) as ShippingCost,
        cast(product_base_margin as Float) as ProductBaseMargin

    FROM required_fields

)

SELECT * FROM datatype_conversion