select {% if target.type == 'fabric' %} top 0 {% else %}{% endif %}
      cast(person_id                   as {{ dbt.type_string() }} ) as person_id
    , cast(null                        as {{ dbt.type_string() }} ) as patient_id
    , cast(name_suffix                 as {{ dbt.type_string() }} ) as name_suffix
    , cast(first_name                  as {{ dbt.type_string() }} ) as first_name
    , cast(middle_name                 as {{ dbt.type_string() }} ) as middle_name
    , cast(last_name                   as {{ dbt.type_string() }} ) as last_name
    , cast(sex                         as {{ dbt.type_string() }} ) as sex
    , cast(race                        as {{ dbt.type_string() }} ) as race
    , cast(birth_date                  as date) as birth_date
    , cast(death_date                  as date) as death_date
    , cast(death_flag                  as {{ dbt.type_int() }} ) as death_flag
    , cast(social_security_number      as {{ dbt.type_string() }} ) as social_security_number
    , cast(address                     as {{ dbt.type_string() }} ) as address
    , cast(city                        as {{ dbt.type_string() }} ) as city
    , cast(state                       as {{ dbt.type_string() }} ) as state
    , cast(zip_code                    as {{ dbt.type_string() }} ) as zip_code
    , cast(county                      as {{ dbt.type_string() }} ) as county
    , cast(latitude                    as {{ dbt.type_float() }} ) as latitude
    , cast(longitude                   as {{ dbt.type_float() }} ) as longitude
    , cast(phone                       as {{ dbt.type_string() }} ) as phone
    , cast(email                       as {{ dbt.type_string() }} ) as email
    , cast(ethnicity                   as {{ dbt.type_string() }} ) as ethnicity
    , cast(data_source                 as {{ dbt.type_string() }} ) as data_source
    , cast(null                        as {{ dbt.type_string() }} ) as file_name
    , cast({{ dbt.current_timestamp() }}  as {{ dbt.type_timestamp() }} ) as ingest_datetime
    , cast(tuva_last_run as {{ dbt.type_timestamp() }} ) as tuva_last_run
from {{ source('input_layer','patient') }}