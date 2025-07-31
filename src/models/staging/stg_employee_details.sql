
{{ 
  config(
    materialized='incremental'
    ) 
}}

select
 *
from {{ source('employee_source', 'employee_details') }}


{% if is_incremental() %}
  where received_at > (select max(received_at) from {{ this }})
{% endif %}
