

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