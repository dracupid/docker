#!/bin/bash
set -xm

# start mongo
/entrypoint.sh mongod

# start tomcat
$CATALINA_HOME/bin/catalina.sh start

# start nodejs
(cd $WEB_NODEJS && test -f package.json && npm run start)

# start nginx
nginx -g "daemon off;"


