{{ config(materialized='view') }}

WITH orders AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        oi.quantity * oi.unit_price AS order_amount
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_order_items') }} oi
      ON o.order_id = oi.order_id
),

customer_summary AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(o.order_amount) AS total_spent,
        AVG(o.order_amount) AS avg_order_value,
        MIN(o.order_date) AS first_order_date,
        MAX(o.order_date) AS last_order_date
    FROM {{ ref('stg_customers') }} c
    LEFT JOIN orders o
      ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)

SELECT * FROM customer_summary
