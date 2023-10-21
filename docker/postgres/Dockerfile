ARG POSTGTES_VERSION=13.1

FROM postgres:${POSTGTES_VERSION}

# Install pgAdmin4. See https://www.pgadmin.org/download/pgadmin-4-apt/

RUN apt-get update && apt-get install -y --no-install-recommends wget=1.20.* python3=3.* python3-pip=20.* libpq-dev=13.* && \
  pip3 install --no-cache-dir pgadmin4==5.2 && \
  rm -rf /var/lib/apt/lists/*

ARG POSTGRES_USER
ENV POSTGRES_USER=${POSTGRES_USER}

ARG POSTGRES_PASSWORD
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

ARG POSTGRES_DB
ENV POSTGRES_DB=${POSTGRES_DB}

VOLUME ["/var/lib/postgresql/data"]

EXPOSE 5432

CMD ["service", "postgresql", "start", "&&", "pgadmin4"]
