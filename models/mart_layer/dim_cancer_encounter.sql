/* Encounters enriched with cancer categorization */

select
      encounter_id
    , person_id
    , patient_id
    , encounter_type
    , encounter_start_date
    , encounter_end_date

    -- location
    , a.facility_id
    , a.facility_name
    , c.city as facility_city
    , c.state as facility_state

    -- diagnosis
    , primary_diagnosis_code_type
    , primary_diagnosis_code
    , primary_diagnosis_description
    
    -- cancer_categorization
    , icd_10_code
    , icd_10_description
    , icd_10_code_start
    , icd_10_code_end
    , cancer_type
    , cancer_type_description

    -- billing
    , paid_amount
    , allowed_amount
from {{ ref('stg_encounter') }} a 
join {{ ref('dim_cancer_condition') }} b
    on a.primary_diagnosis_code_type = 'icd-10-cm'
    and a.primary_diagnosis_code = b.icd_10_code
join {{ ref('stg_location') }} c
    on a.facility_id = c.location_id