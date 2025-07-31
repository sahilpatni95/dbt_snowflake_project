{{ 
  config(
    materialized='incremental',
    unique_key='id',
    merge_update_columns=['position', 'department'],
    ) 
}}

WITH ranked_updates AS (
select
 *,
 ROW_NUMBER() OVER (PARTITION BY id ORDER BY received_at DESC) AS rn
from {{ source('employee_source', 'employee_details') }}


{% if is_incremental() %}
  where received_at > (select max(received_at) from {{ this }})
{% endif %}
)
SELECT *
FROM ranked_updates
WHERE rn = 1