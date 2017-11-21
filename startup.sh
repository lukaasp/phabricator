#!/usr/bin/env bash
cd /opt/code_review/phabricator && ./bin/config set mysql.host $MYSQL_HOST
cd /opt/code_review/phabricator && ./bin/config set mysql.user $MYSQL_USER
cd /opt/code_review/phabricator && ./bin/config set mysql.pass $MYSQL_PASS
cd /opt/code_review/phabricator && ./bin/config set phabricator.base-uri $PHABRICATOR_URL
cd /opt/code_review/phabricator && ./bin/config set storage.local-disk.path /opt/code_review/files
cd /opt/code_review/phabricator && ./bin/storage upgrade --force
cd /opt/code_review/phabricator && ./bin/phd restart
source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND
