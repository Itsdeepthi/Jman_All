


WITH

required_fields AS (

    SELECT

        Cust_id, 
        Customer_Name , 
        province, region, 
        customer_segment

    FROM "online"."dbo"."customer"

),

datatype_conversion AS (

    SELECT 

        Cust_id as CustomerID,
        province as Province,
        region as Region,
        customer_segment  as CustomerSegment,
        Customer_Name as CustomerName

    FROM required_fields

)


SELECT * FROM datatype_conversion