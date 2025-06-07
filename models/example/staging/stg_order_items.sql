{{ config(materialized='view') }}

SELECT
    CAST(order_item_id AS INT) AS order_item_id,
    CAST(order_id AS INT) AS order_id,
    CAST(product_id AS INT) AS product_id,
    CAST(quantity AS INT) AS quantity,
    CAST(unit_price AS FLOAT) AS unit_price
FROM {{ source('public', 'order_items') }}
