#!/usr/bin/env bash
docker run -id -e MYSQL_HOST="localhost" -e MYSQL_USER="root" -e MYSQL_PASS="password" -e PHABRICATOR_URL="http://127.0.0.1" -p 80:80 lukaasp/phabricator
