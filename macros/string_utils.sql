{% macro capitalize_name(name_column) %}
    upper(left({{ name_column }}, 1)) || lower(substr({{ name_column }}, 2))
{% endmacro %}
