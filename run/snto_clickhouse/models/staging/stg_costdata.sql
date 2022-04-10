

  
    create table analytics_dev.stg_costdata__dbt_tmp
    
  
    
    engine = MergeTree()
    
    order by (tuple())
    
  as (
    

SELECT
  source,
  medium,
  campaign,
  keyword,
  adContent,
  adGroup,
  date,
  adCost,
  impressions,
  adClicks,
  adAccount,
  dataSource,
  campaignType,
  campaignId,
  campaignName,
  adGroupId,
  adGroupName,
  adSource
FROM dwh_site.CostData
where `date` >= toDate(NOW()) - 60

GROUP BY
  source,
  medium,
  campaign,
  keyword,
  adContent,
  adGroup,
  date,
  adCost,
  impressions,
  adClicks,
  adAccount,
  dataSource,
  campaignType,
  campaignId,
  campaignName,
  adGroupId,
  adGroupName,
  adSource
  )