#!/usr/bin/env bash

set -e

# Define the name of the additional database
ADDITIONAL_DB_NAME="test_${MYSQL_DATABASE}"


# Perform the initialization of the additional database
echo "Creating additional database: $ADDITIONAL_DB_NAME"
docker_process_sql -uroot -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`$ADDITIONAL_DB_NAME\`;
    CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON \`$ADDITIONAL_DB_NAME\`.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
EOSQL