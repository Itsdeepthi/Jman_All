
      
  
    

   

    USE [practice];
    
    

    EXEC('create view "snapshots"."orders_snapshot_temp_view" as 

    select *,
        
    CONVERT(VARCHAR(32), HashBytes(''MD5'', 
        coalesce(cast(id as varchar(8000)), '''')  + ''|'' + 
    
        coalesce(cast(
    SYSDATETIME()
 as varchar(8000)), '''') 
    ), 2)
 as dbt_scd_id,
        
    SYSDATETIME()
 as dbt_updated_at,
        
    SYSDATETIME()
 as dbt_valid_from,
        nullif(
    SYSDATETIME()
, 
    SYSDATETIME()
) as dbt_valid_to
    from (
        



select * from "practice"."dbo"."jaffle_shop_orders"

    ) sbq


;');



    
      EXEC('SELECT * INTO [practice].[snapshots].[orders_snapshot] FROM [practice].[snapshots].[orders_snapshot_temp_view];');
    

    
      
      
    
    USE [practice];
    EXEC('DROP view IF EXISTS "snapshots"."orders_snapshot_temp_view";');



  
  