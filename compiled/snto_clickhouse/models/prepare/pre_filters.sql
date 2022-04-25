

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

GROUP BY
  date,
  sessionId