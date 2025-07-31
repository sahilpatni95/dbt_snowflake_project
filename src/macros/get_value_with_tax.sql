{% macro get_value_with_tax(amount, tax_percent=18) %}
    round(({{ amount }} + ({{ amount }} * {{ tax_percent }} / 100)))
{% endmacro %}
