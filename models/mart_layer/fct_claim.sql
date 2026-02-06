/* Aggregate claim lines into single claim */

select
    -- grain
    claim_id,

    -- foreign_keys
    encounter_id,
    person_id,
    member_id,

    -- dims
    encounter_type,
    encounter_group,
    plan,
    claim_start_date,
    claim_end_date,

    -- services rendered
    service_category_1,
    service_category_2,
    service_category_3,

    -- eligibility
    enrollment_flag,

    -- billing
    sum(paid_amount) as total_paid_amount,
    sum(allowed_amount) as total_allowed_amount,
    sum(charge_amount) as total_charge_amount

from {{ ref('stg_medical_claim') }}
where claim_type = 'professional'
group by 
    claim_id,
    encounter_id,
    person_id,
    member_id,
    encounter_type,
    encounter_group,
    plan,
    claim_start_date,
    claim_end_date,
    service_category_1,
    service_category_2,
    service_category_3,
    enrollment_flag

UNION ALL

select
    -- grain
    claim_id,

    -- foreign_keys
    encounter_id,
    person_id,
    member_id,

    -- dims
    encounter_type,
    encounter_group,
    plan,
    claim_start_date,
    claim_end_date,

    service_category_1,
    service_category_2,
    service_category_3,

    -- eligibility
    enrollment_flag,

    -- billing
    paid_amount,
    allowed_amount,
    charge_amount

from {{ ref('stg_medical_claim') }}
where claim_type = 'institutional'
AND claim_line_number = 1 -- institutional claim stores totals in claim line 1