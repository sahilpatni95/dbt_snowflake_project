-- {% set payment_method = ["bank_transfer", "credit_card", "paypal", "gift_card"] %}

select
 order_id,
 {% for payment_method in get_payment_methods() %}
 sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount
 {% if not loop.last %},{% endif %}
 {% endfor %}
from {{ ref('raw_payments')}}
group by order_id