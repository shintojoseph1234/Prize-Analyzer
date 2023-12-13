FROM  postgres:12
COPY prices_task.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
ENV POSTGRES_PASSWORD=prices_task
USER postgres
