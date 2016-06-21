FROM registry.aliyuncs.com/dracupid/ubuntu

ENV MONGO_VERSION stable

RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

RUN echo "deb http://mirrors.aliyun.com/mongodb/apt/ubuntu xenial/mongodb-org/$MONGO_VERSION multiverse" > /etc/apt/sources.list.d/mongodb-org.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends numactl \
    && apt-get install -y --allow-unauthenticated mongodb-org \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mongodb

RUN mkdir -p /data/db /data/configdb \
    && chown -R mongodb:mongodb /data/db /data/configdb \
    && mv /etc/mongod.conf /etc/mongod.conf.orig

VOLUME /data/db /data/configdb

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]
