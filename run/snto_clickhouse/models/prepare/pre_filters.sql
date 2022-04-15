
      insert into analytics_dev.pre_filters ("date", "sessionId", "type")
  select "date", "sessionId", "type"
  from pre_filters__dbt_tmp
  