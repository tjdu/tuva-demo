select
    cast( medical_claim_id   as {{ dbt.type_string() }} ) as medical_claim_id
    , cast( claim_id as {{ dbt.type_string() }} ) as claim_id
    , cast( claim_line_number as {{ dbt.type_int() }} ) as claim_line_number
    , cast( encounter_id as {{ dbt.type_string() }} ) as encounter_id
    , cast( encounter_type as {{ dbt.type_string() }} ) as encounter_type
    , cast( encounter_group as {{ dbt.type_string() }} ) as encounter_group
    , cast( claim_type as {{ dbt.type_string() }} ) as claim_type
    , cast( person_id as {{ dbt.type_string() }} ) as person_id
    , cast( member_id as {{ dbt.type_string() }} ) as member_id
    , cast( payer as {{ dbt.type_string() }} ) as payer
    , cast( plan as {{ dbt.type_string() }} ) as plan
    , cast( claim_start_date as date ) as claim_start_date
    , cast( claim_end_date as date ) as claim_end_date
    , cast( claim_line_start_date as date ) as claim_line_start_date
    , cast( claim_line_end_date as date ) as claim_line_end_date
    , cast( admission_date as date ) as admission_date
    , cast( discharge_date as date ) as discharge_date
    , cast( service_category_1 as {{ dbt.type_string() }} ) as service_category_1
    , cast( service_category_2 as {{ dbt.type_string() }} ) as service_category_2
    , cast( service_category_3 as {{ dbt.type_string() }} ) as service_category_3
    , cast( admit_source_code as {{ dbt.type_string() }} ) as admit_source_code
    , cast( admit_source_description as {{ dbt.type_string() }} ) as admit_source_description
    , cast( admit_type_code as {{ dbt.type_string() }} ) as admit_type_code
    , cast( admit_type_description as {{ dbt.type_string() }} ) as admit_type_description
    , cast( discharge_disposition_code as {{ dbt.type_string() }} ) as discharge_disposition_code
    , cast( discharge_disposition_description as {{ dbt.type_string() }} ) as discharge_disposition_description
    , cast( place_of_service_code as {{ dbt.type_string() }} ) as place_of_service_code
    , cast( place_of_service_description as {{ dbt.type_string() }} ) as place_of_service_description
    , cast( bill_type_code as {{ dbt.type_string() }} ) as bill_type_code
    , cast( bill_type_description as {{ dbt.type_string() }} ) as bill_type_description
    , cast( drg_code_type as {{ dbt.type_string() }} ) as drg_code_type
    , cast( drg_code as {{ dbt.type_string() }} ) as drg_code
    , cast( drg_description as {{ dbt.type_string() }} ) as drg_description
    , cast( rendering_id as {{ dbt.type_string() }} ) as rendering_id
    , cast( rendering_name as {{ dbt.type_string() }} ) as rendering_name
    , cast( facility_id as {{ dbt.type_string() }} ) as facility_id
    , cast( facility_name as {{ dbt.type_string() }} ) as facility_name
    , cast( paid_amount as {{ dbt.type_float() }} ) as paid_amount
    , cast( allowed_amount as {{ dbt.type_float() }} ) as allowed_amount
    , cast( charge_amount as {{ dbt.type_float() }} ) as charge_amount
    , cast( in_network_flag as {{ dbt.type_int() }} ) as in_network_flag
    , cast( enrollment_flag as {{ dbt.type_int() }} ) as enrollment_flag
    , cast( member_month_key as {{ dbt.type_string() }} ) as member_month_key
    , cast( data_source as {{ dbt.type_string() }} ) as data_source
    , cast( file_date as {{ dbt.type_string() }} ) as file_date
    , cast( file_name as {{ dbt.type_string() }} ) as file_name
    , cast( {{ dbt.current_timestamp() }}   as {{ dbt.type_timestamp() }} ) as ingest_datetime
    , cast( tuva_last_run as {{ dbt.type_string() }} ) as tuva_last_run
from {{ source('core','medical_claim') }}