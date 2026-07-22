
CREATE SCHEMA IF NOT EXISTS marketing_analytics;


CREATE TABLE marketing_analytics.sales_transactions (
    order_id INT PRIMARY KEY,
    cookie_id VARCHAR(50),
    revenue_usd DECIMAL(10,2),
    purchase_timestamp TIMESTAMP
);


CREATE TABLE marketing_analytics.ad_clicks (
    click_id INT PRIMARY KEY,
    cookie_id VARCHAR(50),
    channel VARCHAR(50),
    campaign_id VARCHAR(50),
    click_cost DECIMAL(10,2),
    click_timestamp TIMESTAMP
);


INSERT INTO marketing_analytics.ad_clicks (click_id, cookie_id, channel, campaign_id, click_cost, click_timestamp) VALUES
(101, 'cookie_A', 'Facebook Ads', 'FB_CAMP_01', 1.50, '2025-01-10 08:00:00'),
(102, 'cookie_A', 'Google Search', 'GOOG_CAMP_02', 2.00, '2025-01-12 14:30:00'),
(103, 'cookie_A', 'Email Campaign', 'EMAIL_CAMP_03', 0.20, '2025-01-14 09:15:00'),
(104, 'cookie_B', 'Google Search', 'GOOG_CAMP_01', 3.00, '2025-01-11 11:00:00'),
(105, 'cookie_B', 'Facebook Ads', 'FB_CAMP_02', 1.80, '2025-01-15 16:45:00');


INSERT INTO marketing_analytics.sales_transactions (order_id, cookie_id, revenue_usd, purchase_timestamp) VALUES
(5001, 'cookie_A', 150.00, '2025-01-14 10:00:00'),
(5002, 'cookie_B', 220.00, '2025-01-15 18:00:00');
