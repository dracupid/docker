#!/bin/bash

docker run --restart=on-failure --name i-mongo -d \
    -v /var/log/mongodb_d/:/var/log/mongodb/ \
    -v /data/db/:/data/db/ \
    registry.aliyuncs.com/dracupid/mongodb

docker run --restart=on-failure --name i-node --link i-mongo:mongo -d \
    -v /var/www/:/var/www/ \
    -w /var/www/nodejs \
    registry.aliyuncs.com/dracupid/node node /var/www/nodejs/keystone.js

