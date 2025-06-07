{{ config(materialized='view') }}

SELECT
    CAST(product_id AS INT) AS product_id,
    INITCAP(name) AS product_name,
    INITCAP(category) AS category,
    CAST(price AS FLOAT) AS price
FROM {{ source('public', 'products') }}

