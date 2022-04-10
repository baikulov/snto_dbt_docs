select
      count(*) as failures,
      case when count(*) != 0
        then 'true' else 'false' end as should_warn,
      case when count(*) != 0
        then 'true' else 'false' end as should_error
    from (
      
    
    

select
    hitId as unique_field,
    count(*) as n_records

from analytics_dev.stg_owox_hits
where hitId is not null
group by hitId
having count(*) > 1



      
    ) as dbt_internal_test