/* Extracting cancerous condition codes and classifying from the database with descriptions.
    - Note: configure icd_10 cancer classifications in upstream seeds and YAML, not here.
 */
select
    staging.normalized_code,
    staging.normalized_description,
    reference.code_starting_from,
    reference.code_ending_at,
    reference.cancer_group,
    reference.cancer_group_description
from (
    select
        distinct
        normalized_code,
        normalized_description
    from {{ ref('stg_condition') }} 
) staging 
left outer join {{ ref('cancer_group') }} reference 
on staging.normalized_code 
between reference.code_starting_from and reference.code_ending_at
or regexp_matches(staging.normalized_code,'^' || code_ending_at || '.*') -- inclusive