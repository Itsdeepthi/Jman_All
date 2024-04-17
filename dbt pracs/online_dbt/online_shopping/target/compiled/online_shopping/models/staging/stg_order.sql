

with required_fields as(
    SELECT Order_ID
      ,Order_Date
      ,Order_Priority
      ,Ord_id
  FROM "online"."dbo"."order"
),

datatype_conversion AS (

    SELECT 

        CAST(order_id AS INT) AS OrderID,
        CONVERT(date, order_date,105) AS OrderDate,
        Order_Priority as Order_Priority,
        Ord_id as OrdID

    FROM required_fields

)

SELECT * FROM datatype_conversion