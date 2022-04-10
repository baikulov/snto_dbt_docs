
    
    

select
    hitId as unique_field,
    count(*) as n_records

from analytics_dev.stg_owox_hits
where hitId is not null
group by hitId
having count(*) > 1


