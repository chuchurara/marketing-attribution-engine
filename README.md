Multi-Touch Marketing Attribution Engine (SQL + Power BI)

📌 Executive Summary
This project builds an enterprise marketing attribution engine that compares "First-Touch" (top-of-funnel discovery) and "Last-Touch" (bottom-of-funnel conversion) models. 

By analyzing touchpoint data across channels, this dashboard identifies misallocated ad spend, channel performance skew, and optimization opportunities to improve Blended Customer Acquisition Cost (CAC) and Return on Ad Spend (ROAS).

---

🛠️ Tech Stack & Architecture
- Data Warehouse: Google BigQuery (SQL CTEs, Window Functions)
- BI & Data Visualization: Power BI Desktop (Star Schema Data Model, DAX Measures)
- Version Control: GitHub

```text
[Raw Ad Clicks & Purchases] 
       │
       ▼ (BigQuery SQL Window Functions)
[First-Touch & Last-Touch Attribution Models] 
       │
       ▼ (Star Schema & DAX Measures)
[Power BI Executive Dashboard]
```

---

💡 Business Insights & Attribution Logic

Key Model Comparison
- First-Touch Attribution (FT): Assigns 100% of revenue credit to the channel that introduced the user to the brand.
- Last-Touch Attribution (LT): Assigns 100% of revenue credit to the channel immediately preceding purchase.
- Attribution Model Variance %: Measures channel behavior using the formula:
  $$\text{Variance \%} = \frac{\text{Last Touch Revenue} - \text{First Touch Revenue}}{\text{First Touch Revenue}}$$

Strategic Findings
1. The Initiators (Negative Variance): Top-of-funnel channels (e.g., TikTok/Paid Social) drive initial awareness but yield lower immediate conversion credit under Last-Touch. "Cutting budget here collapses the pipeline."
2. The Closers (Positive Variance): Bottom-of-funnel channels (e.g., Branded Search / Retargeting) capture conversion credit but rely entirely on earlier awareness channels to feed lead volume.

---

📊 Dashboard Visual Layout
The Power BI dashboard is structured into four primary reporting zones on a single 16:9 canvas:
1. Header Zone: Dynamic Channel and Date range filtering controls.
2. KPI Scorecard Row: High-level metrics for Spend, First-Touch Revenue, Last-Touch Revenue, and Blended CAC.
3. Channel Performance Matrix & Bar Chart: Comparative analysis of financial metrics and model variance across all active channels.
4. Time Series Trend Line: Timeline tracking of revenue realization under both attribution models.

---

📂 Key DAX Measures

```dax
// True Total Spend
True Total Spend = SUM(fact_ad_spend[spend_amount])

// First Touch Revenue
First Touch Revenue = CALCULATE(SUM(fact_purchases[purchase_amount]), view_first_touch)

// Last Touch Revenue
Last Touch Revenue = CALCULATE(SUM(fact_purchases[purchase_amount]), view_last_touch)

// Attribution Model Variance %
Attribution Variance % = 
DIVIDE(
    [Last Touch Revenue] - [First Touch Revenue],
    [First Touch Revenue],
    0
)
```
