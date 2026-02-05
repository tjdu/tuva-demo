select {% if target.type == 'fabric' %} top 0 {% else %}{% endif %}
      cast(encounter_id                      as {{ dbt.type_string() }} ) as encounter_id
    , cast(person_id                         as {{ dbt.type_string() }} ) as person_id
    , cast(null                              as {{ dbt.type_string() }} ) as patient_id
    , cast(encounter_type                    as {{ dbt.type_string() }} ) as encounter_type
    , cast(encounter_start_date              as date) as encounter_start_date
    , cast(encounter_end_date                as date) as encounter_end_date
    , cast(length_of_stay                    as {{ dbt.type_int() }} ) as length_of_stay
    , cast(admit_source_code                 as {{ dbt.type_string() }} ) as admit_source_code
    , cast(admit_source_description          as {{ dbt.type_string() }} ) as admit_source_description
    , cast(admit_type_code                   as {{ dbt.type_string() }} ) as admit_type_code
    , cast(admit_type_description            as {{ dbt.type_string() }} ) as admit_type_description
    , cast(discharge_disposition_code        as {{ dbt.type_string() }} ) as discharge_disposition_code
    , cast(discharge_disposition_description as {{ dbt.type_string() }} ) as discharge_disposition_description
    , cast(attending_provider_id             as {{ dbt.type_string() }} ) as attending_provider_id
    , cast(attending_provider_name           as {{ dbt.type_string() }} ) as attending_provider_name
    , cast(facility_id                       as {{ dbt.type_string() }} ) as facility_id
    , cast(facility_name                     as {{ dbt.type_string() }} ) as facility_name
    , cast(primary_diagnosis_code_type       as {{ dbt.type_string() }} ) as primary_diagnosis_code_type
    , cast(primary_diagnosis_code            as {{ dbt.type_string() }} ) as primary_diagnosis_code
    , cast(primary_diagnosis_description     as {{ dbt.type_string() }} ) as primary_diagnosis_description
    , cast(drg_code_type                     as {{ dbt.type_string() }} ) as drg_code_type
    , cast(drg_code                          as {{ dbt.type_string() }} ) as drg_code
    , cast(drg_description                   as {{ dbt.type_string() }} ) as drg_description
    , cast(paid_amount                       as {{ dbt.type_float() }} ) as paid_amount
    , cast(allowed_amount                    as {{ dbt.type_float() }} ) as allowed_amount
    , cast(charge_amount                     as {{ dbt.type_float() }} ) as charge_amount
    , cast(data_source                       as {{ dbt.type_string() }} ) as data_source
    , cast(null                              as {{ dbt.type_string() }} ) as file_name
    , cast({{ dbt.current_timestamp() }}     as {{ dbt.type_timestamp() }} ) as ingest_datetime
    , cast(tuva_last_run                     as {{ dbt.type_timestamp() }} ) as tuva_last_run
from {{ source('input_layer','encounter') }}