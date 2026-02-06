select
      normalized_code as icd_10_code
    , normalized_description as icd_10_description
    , code_starting_from as icd_10_code_start
    , code_ending_at as icd_10_code_end
    , cancer_group as cancer_type
    , cancer_group_description as cancer_type_description
from {{ ref('int_cancer_conditions') }} 