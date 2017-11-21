# Phabricator docker build script

## Specifications

- Base System - Ubuntu 14.04
- Packages installed: apache2, sendmail, mysql-client, git-core ...
- Phabricator maintenance scripts location: /opt/code_review/phabricator/bin/
- You'll need to run mysql server before running this container

## Usage

```
docker run --name phabricator -id -e MYSQL_HOST="localhost" -e MYSQL_USER="root" -e MYSQL_PASS="password" -e PHABRICATOR_URL="http://127.0.0.1" -p 80:80 lukaasp/phabricator
```