{% macro get_payment_methods() %}
  {{ return(["bank_transfer", "credit_card", "paypal", "gift_card"]) }}
{% endmacro %}