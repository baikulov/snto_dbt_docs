

  
    create table analytics_dev.pre_filters__dbt_tmp
    
  
    
    engine = MergeTree()
    
    order by (tuple())
    
  as (
    

SELECT
    *
FROM
  analytics_dev.stg_bots
UNION ALL
SELECT
    *
FROM
  analytics_dev.stg_robots
UNION ALL
SELECT
    *
FROM
  analytics_dev.stg_santon
  )