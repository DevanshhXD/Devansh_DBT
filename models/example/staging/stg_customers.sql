{{ config(materialized='view') }}

SELECT
    CAST(customer_id AS INT) AS customer_id,
    INITCAP(name) AS customer_name,
    LOWER(email) AS email,
    TO_DATE(created_at) AS created_at
FROM {{ source('public', 'customers') }}

