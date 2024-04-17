{{
    config(
        tags=['basic', 'staging']
    )
}}

with required_fields as(
    SELECT Order_ID,
       Ship_mode
      ,Ship_Date
      ,ship_id
  FROM {{ source('onlineshop', 'shipping') }}
),

datatype_conversion AS (

    SELECT 

        CAST(order_id AS INT) AS OrderId,
        CONVERT(date, ship_date,105) AS ShipDate,
        Ship_mode as ShipMode,
        ship_id as ShipID

    FROM required_fields

)

SELECT * FROM datatype_conversion