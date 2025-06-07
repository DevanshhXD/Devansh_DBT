{{ config(materialized='view') }}

SELECT
    customer_id,
    {{ capitalize_name('name') }} as customer_name,
    email,
    created_at
FROM {{ ref('customers') }}
