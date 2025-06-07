{{ config(materialized='view') }}

SELECT
    CAST(order_id AS INT) AS order_id,
    CAST(customer_id AS INT) AS customer_id,
    TO_DATE(order_date) AS order_date
FROM {{ source('public', 'orders') }}
