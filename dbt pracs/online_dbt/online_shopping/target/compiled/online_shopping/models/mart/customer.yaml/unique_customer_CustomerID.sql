
    
    

select
    CustomerID as unique_field,
    count(*) as n_records

from "online"."dbt_mart"."customer"
where CustomerID is not null
group by CustomerID
having count(*) > 1


