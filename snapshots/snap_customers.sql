{% snapshot snap_customers %}

{{
    config(
        target_schema='PUBLIC',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_name', 'email']
    )
}}

SELECT
    customer_id,
    customer_name,
    email,
    created_at
FROM {{ ref('stg_customers') }}

{% endsnapshot %}