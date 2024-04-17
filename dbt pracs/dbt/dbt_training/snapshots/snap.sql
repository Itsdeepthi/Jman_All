{% snapshot orders_snapshot %}

{{
    config(
      target_database='practice',
      target_schema='snapshots',
 

      strategy='check',
      unique_key='id',
      check_cols=['status', 'completed'],
    )
}}

select * from {{ source('jaffle_shop', 'jaffle_shop_orders') }}

{% endsnapshot %}