


WITH

required_fields AS (

    SELECT

        id                  AS customer_id
        , first_name
        , last_name

    FROM "practice"."dbo"."jaffle_shop_customers"

),

datatype_conversion AS (

    SELECT 

        CAST(customer_id AS INT)    AS customer_id
        , first_name
        , last_name

    FROM required_fields

),

add_aggregate_field AS (

    SELECT 

        *
        , CONCAT(last_name, first_name)     AS full_name
        , getdate()                         AS data_loaded_at

    FROM datatype_conversion

)

SELECT * FROM add_aggregate_field