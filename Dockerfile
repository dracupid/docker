FROM registry.aliyuncs.com/dracupid/mongodb

MAINTAINER Zhao Jingchen "dracupid@gmail.com"

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.32
ENV TOMCAT_TGZ_URL http://mirrors.aliyun.com/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV NODE_VERSION 5.6.0
ENV NODE_HOST http://npm.taobao.org/mirrors/node
ENV NODE_DIR /usr/local
ENV NPM_DIR $NODE_DIR/lib/node_modules/npm


ENV WEB_HOME /var/www
ENV WEB_JAVA $WEB_HOME/java
ENV WEB_JAVA_LIB $WEB_HOME/java/lib
ENV WEB_NODEJS $WEB_HOME/nodejs
ENV MONDODB_DATA /data/db


COPY pip.conf /root/.pip/
COPY node/.npmrc /root/
COPY init.sh /

RUN chmod a+x /init.sh

# java & nginx & pip & mongodb-kerberos
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ wily nginx" >> /etc/apt/sources.list.d/nginx.list \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated nginx openjdk-8-jre-headless libkrb5-dev python-pip \
    && rm -rf /var/lib/apt/lists/*

# tomcat
RUN mkdir -p "$CATALINA_HOME" \
    && cd $CATALINA_HOME \
    && curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
    && tar -zxf tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm tomcat.tar.gz* \
    && sed -i "s%common.loader=%common.loader=\"$(echo $WEB_JAVA_LIB)\",\"$(echo $WEB_JAVA_LIB)\/*.jar\",%" $CATALINA_HOME/conf/catalina.properties \
    && sed -i "s%appBase=\"webapps\"%appBase=\"$(echo $WEB_JAVA)\"%" $CATALINA_HOME/conf/server.xml

# nodejs
RUN curl -SLO "$NODE_HOST/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && tar -zxf "node-v$NODE_VERSION-linux-x64.tar.gz" -C $NODE_DIR --strip-components=1 \
    && rm "node-v$NODE_VERSION-linux-x64.tar.gz" \
    && cd $NODE_DIR && rm *.md LICENSE \
    && cd $NPM_DIR && rm -rf *.md *.bat .mailmap .npmignore .travis.yml AUTHORS LICENSE Makefile changelogs configure man html doc

# python pip
RUN pip install setuptools \
    && pip install shortuuid beautifulsoup4 pymongo jieba

# pm2
RUN npm i pm2 -gd && rm -rf /root/.npm

CMD /start.sh

EXPOSE 80 27017

