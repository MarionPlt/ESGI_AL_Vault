FROM mcr.microsoft.com/mssql/server:latest

ARG A_SA_PASSWORD
ARG A_ACCEPT_EULA

ENV SA_PASSWORD ${A_SA_PASSWORD}
ENV ACCEPT_EULA ${A_SA_PASSWORD}

ENV MSSQL_PID Developer
ENV MSSQL_TCP_PORT 1433

WORKDIR /var/tmp

COPY vault_library_create_database.sql ./vault_library_create_database.sql
COPY vault_library_create_tables.sql ./vault_library_create_tables.sql

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" && /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P ${A_SA_PASSWORD} -i vault_library_create_database.sql && /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P ${A_SA_PASSWORD} -i vault_library_create_tables.sql