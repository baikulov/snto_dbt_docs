

  
    create table analytics_dev.stg_bots__dbt_tmp
    
  
    
    engine = MergeTree()
    
    order by (tuple())
    
  as (
    

SELECT
  date,
  sessionId,
  'bots' as type
FROM
  dwh_site.owoxbi_sessions
LEFT ARRAY JOIN
    device

	where date >= toDate(NOW()) - 3
	
AND
 device.isBot = 1
GROUP BY
  date,
  sessionId,
  type
  )