USE [master];
    
    

    EXEC('create view "dbt"."customer" as /*

WITH

stg_customer AS (

    SELECT

        *

    FROM "master"."dbt"."stg_customer" where region != "NUNAVUT"

),

order_info AS (

    SELECT

        cust_id
        , COUNT(*)  AS total_orders

    FROM stg_order

    GROUP BY 
        cust_id

)

-- final AS (

--     SELECT 

--         sc.*
--         , oi.total_orders

--     FROM stg_customer sc

--     LEFT JOIN order_info oi
--         ON sc.customer_id = oi.customer_id
-- )

-- SELECT * FROM final

*/;');


