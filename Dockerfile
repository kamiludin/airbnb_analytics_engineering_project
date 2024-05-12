FROM quay.io/astronomer/astro-runtime:11.3.0

RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-snowflake && deactivate



# AIRFLOW__CORE__TEST_CONNECTION
ENV AIRFLOW__CORE__TEST_CONNECTION="Enabled"



