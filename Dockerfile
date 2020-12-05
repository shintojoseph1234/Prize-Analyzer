FROM  postgres:12
COPY my-rates.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
ENV POSTGRES_PASSWORD=xeneta-my-rates
USER postgres
