```sql
WITH matched_customer_journeys AS (
  SELECT 
    t.order_id,
    t.cookie_id,
    t.revenue_usd,
    t.purchase_timestamp,
    c.channel,
    c.campaign_id,
    c.click_cost,
    c.click_timestamp,
    ROW_NUMBER() OVER (
      PARTITION BY t.order_id 
      ORDER BY c.click_timestamp DESC
    ) AS touch_sequence_descending
  FROM 
    marketing_analytics.sales_transactions t
  INNER JOIN 
    marketing_analytics.ad_clicks c 
    ON t.cookie_id = c.cookie_id
  WHERE 
    c.click_timestamp <= t.purchase_timestamp
)
SELECT 
  order_id,
  cookie_id,
  revenue_usd,
  purchase_timestamp,
  channel,
  campaign_id,
  click_cost,
  click_timestamp
FROM 
  matched_customer_journeys
WHERE 
  touch_sequence_descending = 1
