

WITH cte as (
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

SELECT
  date,
  sessionId,
  max(type) as type
FROM cte


  -- this filter will only be applied on an incremental run
  where date not in (select distinct date from analytics_dev.pre_filters)


GROUP BY
  date,
  sessionId