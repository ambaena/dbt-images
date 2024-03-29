FROM python:3.9-slim-buster

# Install available upgrades
RUN apt-get update -yqq 

# Install app dependencies
RUN apt-get install -y --no-install-recommends python curl unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
RUN pip install dbt-core==1.0.3 && \
    pip install dbt-redshift==1.0.0 && \
    pip install sqlfluff-templater-dbt==0.11.2 \
    pip install pytz

# Check version installed
CMD ["dbt", "--version"]
