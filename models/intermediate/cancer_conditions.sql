/* Extracting cancerous condition codes C00-D49 from the database with descriptions */

select distinct normalized_code, normalized_description 
from {{ ref('condition') }} 
where REGEXP_MATCHES(normalized_code,'^C.*|^D[0-4][0-9].*') order by 1
