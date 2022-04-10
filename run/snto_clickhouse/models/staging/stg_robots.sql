

  
    create table analytics_dev.stg_robots__dbt_tmp
    
  
    
    engine = MergeTree()
    
    order by (tuple())
    
  as (
    

SELECT
  date,
  sessionId,
  'robots' as type
FROM
  dwh_site.owoxbi_sessions
LEFT ARRAY JOIN
    device
  
	where date >= toDate(NOW()) - 3
	
AND
 device.deviceCategory like '%robot%'
GROUP BY
  date,
  sessionId,
  type
  )