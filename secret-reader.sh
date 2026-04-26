#!/bin/bash

# 1. check location is exist or not
# 2. if location exist , read and export , then call mysql enterypoint
# 3. if does not exist through error and exit 

if [ -f /secrets/mysql-secrets-reader.txt ]; then
    PASSWORD=$(cat /secrets/mysql-secrets-reader.txt)
    echo "Paswword accessed successfully"
else
    echo "can't find the secret file"
    exit 1
fi

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm /secrets/mysql-secrets-reader.txt

exec /usr/local/bin/docker-enterypoint.sh mysqld 