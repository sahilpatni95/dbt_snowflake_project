SELECT
  *,
  {{ get_value_with_tax('amount', 18) }} AS amount_with_tax
FROM {{ ref('raw_payments') }}
