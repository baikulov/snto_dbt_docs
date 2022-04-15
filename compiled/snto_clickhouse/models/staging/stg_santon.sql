

WITH cte as (
	SELECT
		date,
		sessionId,
		hits.page.hostname,
		'santon' as type
	FROM
        dwh_site.owoxbi_sessions
	LEFT ARRAY JOIN
	    hits
	where date = toDate(NOW()) - 10
)
SELECT
    date,
    sessionId,
    type
FROM cte
LEFT ARRAY JOIN hits.page.hostname
WHERE
	hits.page.hostname like '%sant-on%'
GROUP BY
	date,
    sessionId,
    type