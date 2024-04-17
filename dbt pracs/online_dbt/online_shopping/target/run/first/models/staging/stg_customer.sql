USE [master];
    
    

    EXEC('create view "dbt"."stg_customer" as 


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

        CAST(Cust_id AS INT) as CustomerID,
        province,
        region,
        customer_segment  as CustomerSegment,
        Customer_Name as CustomerName

    FROM required_fields

)


SELECT * FROM datatype_conversion;');


