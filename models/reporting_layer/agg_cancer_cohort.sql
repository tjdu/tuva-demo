/* Grain: encounter_type
            , cancer_type
            , diagnosis
*/

select  
    b.encounter_group
  , b.encounter_type as care_setting

  , a.primary_diagnosis_code_type
  , a.primary_diagnosis_code
  , a.primary_diagnosis_description
  
  , cancer_type
  , cancer_type_description

  , count(distinct a.encounter_id) as num_encounters
  , count(*) as num_claims
  , sum(total_paid_amount) as total_paid_amount
  , sum(total_allowed_amount) as total_allowed_amount
  , sum(total_charge_amount) as total_charge_amount 
from {{ ref('dim_cancer_encounter') }} a 
join {{ ref('fct_claim') }} b 
on a.encounter_id = b.encounter_id
group by 
    b.encounter_group
  , b.encounter_type

  , a.primary_diagnosis_code_type
  , a.primary_diagnosis_code
  , a.primary_diagnosis_description

  , cancer_type
  , cancer_type_description


