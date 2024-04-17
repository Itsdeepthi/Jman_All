{{
    config(
        tags=['mart', 'customer'],
       
    )
}}
 
WITH notnunavut AS (
    SELECT *
    FROM {{ ref('stg_customer') }}
    WHERE region != 'NUNAVUT'
),
 
joincustmark AS (
    SELECT
        cu.CustomerId,
        cu.CustomerName,
        cu.Province,
        cu.CustomerSegment,
        ma.Ord,
        ma.Sales
    FROM notnunavut as cu
    JOIN {{ ref('stg_market') }} as ma ON cu.CustomerId = ma.CustomerId
),
 
joincustorder AS (
    SELECT
        cus.CustomerId,
        cus.CustomerName,
        cus.Province,
        cus.CustomerSegment,
        ord.OrdID,
        cus.Sales,
        ord.OrderDate
    FROM joincustmark as cus
    JOIN {{ ref('stg_order') }} as ord ON cus.Ord = ord.OrdID
),
 
finalcustorder AS (
    SELECT
        CustomerId,
        CustomerName,
        Province,
        CustomerSegment,
        MIN(OrderDate) AS FirstOrderDate,
        MAX(OrderDate) AS RecentOrderDate,
        COUNT(OrdId) AS TotalOrders,
        SUM(cast(Sales as DECIMAL(10,5))) AS TotalAmount
    FROM joincustorder
    GROUP BY CustomerId, CustomerName, Province, CustomerSegment
)
 
SELECT * FROM finalcustorder