

SELECT
  date,
  sessionId,
  'bots' as type
FROM
  dwh_site.owoxbi_sessions
LEFT ARRAY JOIN
    device
where date = toDate(NOW()) - 10
AND
 device.isBot = 1
GROUP BY
  date,
  sessionId,
  type