

  
    create table analytics_dev.stg_owox_hits__dbt_tmp
    
  
    
    engine = MergeTree()
    order by (hitType,pagePath)
    partition by (date)
  as (
    
WITH cte as (
-- нумеруем все строки в рамках сессии, чтобы найти первую строчку в каждой сессии
-- разворачиваем основной массив hits
    Select
        date,
        clientId,
        sessionId,
        hits.hitId,
        hits.timestamp,
        hits.type,
        hits.isInteraction,
        hits.referer,
        hits.referralPath,
        hits.eventInfo. eventCategory,
        hits.eventInfo. eventAction,
        hits.eventInfo. eventLabel,
        hits.eventInfo. eventValue,
        hits.page.hostname,
        hits.pagePath,
        hits.page.pageTitle
    FROM dwh_site.owoxbi_sessions
    LEFT ARRAY JOIN hits
	where date = toDate(NOW()) - 10
    AND hits.type in ('pageview', 'event')
),
df as (
-- разворачиваем вложенные массивы
	Select
        date,
        clientId,
        sessionId,
        hits.hitId as hitId,
        hits.timestamp as hitTimestamp,
        hits.type as hitType,
        hits.isInteraction as isInteraction,
        hits.referer as referer,
        hits.referralPath as referralPath,
        hits.eventInfo. eventCategory as eventCategory,
        hits.eventInfo. eventAction as eventAction,
        hits.eventInfo. eventLabel as eventLabel,
        hits.eventInfo. eventValue as eventValue,
        hits.page.hostname as hostname,
        hits.pagePath as pageUrl,
        replaceRegexpAll(hits.pagePath, '\?.*', '') as pagePath,
        hits.page.pageTitle as pageTitle
    FROM cte
    LEFT ARRAY JOIN hits.eventInfo.eventCategory, hits.eventInfo.eventAction, hits.eventInfo.eventLabel, hits.eventInfo.eventValue, hits.page.hostname, hits.page.pageTitle
)
SELECT
   date,
    ifNull(clientId, '') as clientId,
    ifNull(sessionId, '') as sessionId,
    ifNull(hitId, '') as hitId,
    ifNull(hitTimestamp, 0) as hitTimestamp,
    ifNull(hitType, '') as hitType,
    isInteraction,
    ifNull(referer, '') as referer,
    ifNull(referralPath, '') as referralPath,
    ifNull(eventCategory, '') as eventCategory,
    ifNull(eventAction, '') as eventAction,
    ifNull(eventLabel, '') as eventLabel, 
    ifNull(eventValue, '') as eventValue,
    ifNull(hostname, '') as hostname,
    ifNull(pageUrl, '') as pageUrl,
    ifNull(pagePath, '') as pagePath,
    ifNull(pageTitle, '') as pageTitle
FROM df
GROUP BY
    date,
    clientId,
    sessionId,
    hitId,
    hitTimestamp,
    hitType,
    isInteraction,
    referer,
    referralPath,
    eventCategory,
    eventAction,
    eventLabel,
    eventValue,
    hostname,
    pageUrl,
    pagePath,
    pageTitle
  )