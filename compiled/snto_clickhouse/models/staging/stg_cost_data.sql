

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

	where date >= toDate(NOW()) - 3

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