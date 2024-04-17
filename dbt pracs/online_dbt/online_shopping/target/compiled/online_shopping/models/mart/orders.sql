
 
WITH
Customers AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_customer"
    WHERE Region != 'NUNAVUT'
),
 
Products AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_product"
),
 
Markets AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_market"
),
Orders AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_order"
),
Shippings AS (
    SELECT
        *
    FROM "online"."dbt_staging"."stg_shipping"
),
 
custmarket as (
    select cu.*,mark.Sales,mark.OrderQuantity,mark.Profit,mark.ShippingCost, mark.Ord, mark.ProductID, mark.ShipID
    from Customers as cu
    JOIN Markets as mark
    on cu.CustomerID=mark.CustomerId
),
custmarkord as (
    select cm.*,o.OrderID,o.OrderDate,o.Order_Priority
    from custmarket as cm
    JOIN Orders as o
    on cm.Ord = o.OrdID
),

custmarkordprod as (
    select cmo.*,pr.ProductSubCategory
    from custmarkord as cmo
    JOIN products as pr
    on cmo.ProductID=pr.ProductID
),
custmarkordprodship as (
    select cmop.*,sh.ShipDate,sh.ShipMode
    from custmarkordprod as cmop
    JOIN shippings as sh
    on cmop.ShipID=sh.ShipID
)

SELECT * FROM custmarkordprodship