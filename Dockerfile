# Imagen base de PostgreSQL
FROM postgres:13

# Copiar el script SQL de inicializacion
COPY init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto de PostgreSQL
EXPOSE 5432
